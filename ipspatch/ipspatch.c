/*
   This program is hereby released to the public domain.
   ~aaaaaa123456789, 2016-05-01
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#define BLOCK_SIZE 4096
#define MINIMUM_RUN 8
// you cannot write a patch block with an offset of 4,542,278 (0x454F46) because it is the end of file marker
#define EOF_MARKER 4542278

struct patch_block {
  unsigned offset;
  unsigned short length;
  char payload[];
};

int main(int, char **);
void usage(const char *);
void patch(const char *, const char *, const char *);
void copy_contents(FILE *, FILE *, unsigned);
struct patch_block * read_patch_block(FILE *);
void apply_patch_block(FILE *, struct patch_block *);
unsigned convert_buffer_to_number(const char *, unsigned char);
void create_patch(const char *, const char *, const char *);
FILE * open_file_checked(const char *, unsigned *);
char get_special_value(FILE *, unsigned);
void create_patch_for_data(const char *, const char *, unsigned, unsigned, FILE *, char);
void write_patch_block_for_data(const char *, unsigned, unsigned, FILE *, char);
void write_value(unsigned, unsigned char, FILE *);

int main (int argc, char ** argv) {
  if (argc != 5) usage(*argv);
  if (!strcmp(argv[1], "patch"))
    patch(argv[2], argv[3], argv[4]);
  else if (!strcmp(argv[1], "create"))
    create_patch(argv[2], argv[3], argv[4]);
  else
    usage(*argv);
  return 0;
}

void usage (const char * program_name) {
  fprintf(stderr, "usage:\n  creating a patch: %s create <file1> <file2> <output.ips>\n  applying a patch: %s patch <file> <patch.ips> <result>\n",
          program_name, program_name);
  exit(1);
}

void error_and_exit (const char * error, ...) {
  va_list ap;
  va_start(ap, error);
  vfprintf(stderr, error, ap);
  exit(1);
}

void patch (const char * source, const char * patch_file, const char * output) {
  unsigned file_length;
  FILE * source_file = open_file_checked(source, &file_length);
  FILE * patch_fp = fopen(patch_file, "rb");
  if (!patch_fp) error_and_exit("error: cannot open %s for reading\n", patch_file);
  char buf[5];
  if ((fread(buf, 1, 5, patch_fp) != 5) || memcmp(buf, "PATCH", 5)) error_and_exit("error: %s is not a valid patch file\n", patch_file);
  FILE * target_file = fopen(output, "wb+");
  copy_contents(target_file, source_file, file_length);
  fclose(source_file);
  struct patch_block * block;
  while (!feof(patch_fp)) {
    block = read_patch_block(patch_fp);
    if (!block) break;
    apply_patch_block(target_file, block);
    free(block);
  }
  fclose(patch_fp);
  fclose(target_file);
}

void copy_contents (FILE * destination, FILE * source, unsigned length) {
  char buf[BLOCK_SIZE];
  unsigned next;
  while (length) {
    next = (length > BLOCK_SIZE) ? BLOCK_SIZE : length;
    fread(buf, 1, next, source);
    fwrite(buf, 1, next, destination);
    length -= next;
  }
}

struct patch_block * read_patch_block (FILE * fp) {
  char buf[5];
  unsigned offset, length;
  if (fread(buf, 1, 5, fp) < 5) return NULL;
  offset = convert_buffer_to_number(buf, 3);
  if (offset == EOF_MARKER) return NULL;
  length = convert_buffer_to_number(buf + 3, 2);
  struct patch_block * result = malloc(sizeof(struct patch_block) + (length ? length : 3));
  result -> offset = offset;
  result -> length = length;
  if (!length) length = 3;
  if (fread(result -> payload, 1, length, fp) < length) {
    free(result);
    return NULL;
  }
  return result;
}

void apply_patch_block (FILE * file, struct patch_block * block) {
  fseek(file, block -> offset, 0);
  if (block -> length) {
    fwrite(block -> payload, 1, block -> length, file);
    return;
  }
  unsigned length = convert_buffer_to_number(block -> payload, 2);
  char fill = block -> payload[2];
  void * buffer = malloc(length);
  memset(buffer, fill, length);
  fwrite(buffer, 1, length, file);
  free(buffer);
}

unsigned convert_buffer_to_number (const char * buffer, unsigned char length) {
  unsigned result;
  unsigned char p;
  for (p = result = 0; p < length; p ++) result = (result << 8) | ((unsigned char) buffer[p]);
  return result;
}

void create_patch (const char * from, const char * to, const char * output) {
  unsigned first_length, second_length;
  FILE * first_file = open_file_checked(from, &first_length);
  FILE * second_file = open_file_checked(to, &second_length);
  if (first_length > second_length) error_and_exit("error: first file %s is larger than second file %s\n", from, to);
  FILE * patch_file = fopen(output, "wb");
  if (!patch_file) error_and_exit("error: cannot open %s for writing\n", output);
  fwrite("PATCH", 1, 5, patch_file);
  char buffer1[BLOCK_SIZE];
  char buffer2[BLOCK_SIZE];
  unsigned p, next;
  char special = get_special_value(first_file, first_length);
  for (p = 0; p < first_length; p += BLOCK_SIZE) {
    next = first_length - p;
    if (next > BLOCK_SIZE) next = BLOCK_SIZE;
    fread(buffer1, 1, next, first_file);
    fread(buffer2, 1, next, second_file);
    create_patch_for_data(buffer1, buffer2, next, p, patch_file, special);
  }
  fclose(first_file);
  if (first_length < second_length) {
    next = second_length - first_length;
    void * data = malloc(next);
    fread(data, 1, next, second_file);
    write_patch_block_for_data(data, next, first_length, patch_file, special);
    free(data);
  }
  fclose(second_file);
  fwrite("EOF", 1, 3, patch_file);
  fclose(patch_file);
}

FILE * open_file_checked (const char * file, unsigned * file_length) {
  FILE * fp = fopen(file, "rb");
  if (!fp) error_and_exit("error: cannot open %s for reading\n", file);
  if (fseek(fp, 0, 2)) error_and_exit("error: cannot seek on %s\n", file);
  long length = ftell(fp);
  if (length < 0)
    error_and_exit("error: cannot determine length of %s\n", file);
  else if (length > 16777216)
    error_and_exit("error: %s is larger than 16 MB\n", file);
  if (file_length) *file_length = length;
  rewind(fp);
  return fp;
}

char get_special_value (FILE * fp, unsigned length) {
  if (length < EOF_MARKER) return 0;
  long pos = ftell(fp);
  fseek(fp, EOF_MARKER - 1, 0);
  char result;
  fread(&result, 1, 1, fp);
  fseek(fp, pos, 0);
  return result;
}

void create_patch_for_data (const char * first_buffer, const char * second_buffer, unsigned length, unsigned offset, FILE * output, char special) {
  unsigned pos = 0;
  unsigned block;
  while (pos < length) {
    if (first_buffer[pos] == second_buffer[pos]) {
      for (; (pos < length) && (first_buffer[pos] == second_buffer[pos]); pos ++);
      continue;
    }
    for (block = 0; ((pos + block) < length) && (first_buffer[pos + block] != second_buffer[pos + block]); block ++);
    write_patch_block_for_data(second_buffer + pos, block, offset + pos, output, special);
    pos += block;
  }
}

void write_patch_block_for_data (const char * data, unsigned length, unsigned offset, FILE * output, char special) {
  if (!length) return;
  if (offset == EOF_MARKER) {
    char * buf = malloc(length + 1);
    *buf = special;
    memcpy(buf + 1, data, length);
    write_patch_block_for_data(buf, length + 1, EOF_MARKER - 1, output, special);
    free(buf);
    return;
  }
  unsigned run;
  for (run = 1; (run < length) && (data[run] == *data); run ++);
  if ((offset != EOF_MARKER) && (run >= MINIMUM_RUN)) {
    if (run > 32767) run = 32767;
    write_value(offset, 3, output);
    write_value(0, 2, output);
    write_value(run, 2, output);
    write_value(*data, 1, output);
    write_patch_block_for_data(data + run, length - run, offset + run, output, special);
    return;
  }
  unsigned current, remainder;
  if (length < 32768) {
    current = length;
    remainder = 0;
  } else {
    current = 32767;
    remainder = length - 32767;
  }
  write_value(offset, 3, output);
  write_value(current, 2, output);
  fwrite(data, 1, current, output);
  if (remainder) write_patch_block_for_data(data + current, remainder, offset + current, output, special);
}

void write_value (unsigned value, unsigned char length, FILE * file) {
  char buf[16];
  unsigned char p;
  for (p = 0; p < length; p ++) buf[p] = (value >> (8 * (length - p - 1))) & 255;
  fwrite(buf, 1, length, file);
}