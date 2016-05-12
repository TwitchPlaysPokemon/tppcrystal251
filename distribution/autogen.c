#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <ctype.h>
#include <time.h>

const char * pokemon[256] = {
  "-", "Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard", "Squirtle", "Wartortle", "Blastoise", "Caterpie", "Metapod", "Butterfree",
  "Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto", "Pidgeot", "Rattata", "Raticate", "Spearow", "Fearow", "Ekans", "Arbok", "Pikachu", "Raichu", "Sandshrew",
  "Sandslash", "Nidoran (F)", "Nidorina", "Nidoqueen", "Nidoran (M)", "Nidorino", "Nidoking", "Clefairy", "Clefable", "Vulpix", "Ninetales", "Jigglypuff",
  "Wigglytuff", "Zubat", "Golbat", "Oddish", "Gloom", "Vileplume", "Paras", "Parasect", "Venonat", "Venomoth", "Diglett", "Dugtrio", "Meowth", "Persian", "Psyduck",
  "Golduck", "Mankey", "Primeape", "Growlithe", "Arcanine", "Poliwag", "Poliwhirl", "Poliwrath", "Abra", "Kadabra", "Alakazam", "Machop", "Machoke", "Machamp",
  "Bellsprout", "Weepinbell", "Victreebel", "Tentacool", "Tentacruel", "Geodude", "Graveler", "Golem", "Ponyta", "Rapidash", "Slowpoke", "Slowbro", "Magnemite",
  "Magneton", "Farfetch'd", "Doduo", "Dodrio", "Seel", "Dewgong", "Grimer", "Muk", "Shellder", "Cloyster", "Gastly", "Haunter", "Gengar", "Onix", "Drowzee",
  "Hypno", "Krabby", "Kingler", "Voltorb", "Electrode", "Exeggcute", "Exeggutor", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan", "Lickitung", "Koffing", "Weezing",
  "Rhyhorn", "Rhydon", "Chansey", "Tangela", "Kangaskhan", "Horsea", "Seadra", "Goldeen", "Seaking", "Staryu", "Starmie", "Mr. Mime", "Scyther", "Jynx",
  "Electabuzz", "Magmar", "Pinsir", "Tauros", "Magikarp", "Gyarados", "Lapras", "Ditto", "Eevee", "Vaporeon", "Jolteon", "Flareon", "Porygon", "Omanyte", "Omastar",
  "Kabuto", "Kabutops", "Aerodactyl", "Snorlax", "Articuno", "Zapdos", "Moltres", "Dratini", "Dragonair", "Dragonite", "Mewtwo", "Mew", "Chikorita", "Bayleef",
  "Meganium", "Cyndaquil", "Quilava", "Typhlosion", "Totodile", "Croconaw", "Feraligatr", "Sentret", "Furret", "Hoothoot", "Noctowl", "Ledyba", "Ledian",
  "Spinarak", "Ariados", "Crobat", "Chinchou", "Lanturn", "Pichu", "Cleffa", "Igglybuff", "Togepi", "Togetic", "Natu", "Xatu", "Mareep", "Flaaffy", "Ampharos",
  "Bellossom", "Marill", "Azumarill", "Sudowoodo", "Politoed", "Hoppip", "Skiploom", "Jumpluff", "Aipom", "Sunkern", "Sunflora", "Yanma", "Wooper", "Quagsire",
  "Espeon", "Umbreon", "Murkrow", "Slowking", "Misdreavus", "Unown", "Wobbuffet", "Girafarig", "Pineco", "Forretress", "Dunsparce", "Gligar", "Steelix",
  "Snubbull", "Granbull", "Qwilfish", "Scizor", "Shuckle", "Heracross", "Sneasel", "Teddiursa", "Ursaring", "Slugma", "Magcargo", "Swinub", "Piloswine", "Corsola",
  "Remoraid", "Octillery", "Delibird", "Mantine", "Skarmory", "Houndour", "Houndoom", "Kingdra", "Phanpy", "Donphan", "Porygon2", "Stantler", "Smeargle",
  "Tyrogue", "Hitmontop", "Smoochum", "Elekid", "Magby", "Miltank", "Blissey", "Raikou", "Entei", "Suicune", "Larvitar", "Pupitar", "Tyranitar", "Lugia", "Ho-oh",
  "Celebi", "Phancero", "Egg", NULL, NULL
};

const char * moves[256] = {
  "-", "Pound", "Karate Chop", "DoubleSlap", "Gunk Shot", "Zen Headbutt", "Pay Day", "Fire Punch", "Ice Punch", "ThunderPunch", "Scratch", "Fairy Wind",
  "Focus Blast", "Iron Defense", "Swords Dance", "Cut", "Gust", "Wing Attack", "Whirlwind", "Fly", "Bug Buzz", "Slam", "Vine Whip", "Stomp", "Double Kick",
  "Mega Kick", "Flare Blitz", "Rolling Kick", "Sand Attack", "Headbutt", "Horn Attack", "Fury Attack", "Horn Drill", "Tackle", "Body Slam", "Wrap", "Take Down",
  "Thrash", "Double Edge", "Tail Whip", "Poison Sting", "Twineedle", "Pin Missile", "Leer", "Bite", "Growl", "Roar", "Sing", "Supersonic", "SonicBoom", "Disable",
  "Acid", "Ember", "Flamethrower", "Mist", "Water Gun", "Hydro Pump", "Surf", "Ice Beam", "Blizzard", "Psybeam", "BubbleBeam", "Aurora Beam", "Hyper Beam", "Peck",
  "Drill Peck", "Submission", "Heat Wave", "Counter", "Seismic Toss", "Strength", "Absorb", "Mega Drain", "Leech Seed", "Growth", "Razor Leaf", "SolarBeam",
  "PoisonPowder", "Stun Spore", "Sleep Powder", "Petal Dance", "String Shot", "Dragon Rage", "Fire Spin", "ThunderShock", "Thunderbolt", "Thunder Wave", "Thunder",
  "Rock Throw", "Earthquake", "Fissure", "Dig", "Toxic", "Confusion", "Psychic", "Hypnosis", "Meditate", "Agility", "Quick Attack", "Rage", "Teleport",
  "Night Shade", "Mimic", "Screech", "Double Team", "Recover", "Harden", "Minimize", "Smokescreen", "Confuse Ray", "Withdraw", "Defense Curl", "Barrier",
  "Light Screen", "Haze", "Reflect", "Focus Energy", "Bide", "Metronome", "Mirror Move", "Selfdestruct", "Metal Sound", "Lick", "Dragon Pulse", "Sludge",
  "Bone Club", "Fire Blast", "Waterfall", "Clamp", "Swift", "Aqua Jet", "Spike Cannon", "Flash Cannon", "Amnesia", "Will-o-Wisp", "Softboiled", "Hi Jump Kick",
  "Glare", "Dream Eater", "Rock Polish", "Seed Bomb", "Leech Life", "Lovely Kiss", "Sky Attack", "Transform", "Bubble", "Dizzy Punch", "Spore", "Flash", "Psywave",
  "Splash", "Acid Armor", "Crabhammer", "Explosion", "Poison Jab", "Bonemerang", "Rest", "Rock Slide", "Hyper Fang", "Sharpen", "Conversion", "Tri Attack",
  "Super Fang", "Slash", "Substitute", "Struggle", "Sketch", "Wild Charge", "Thief", "X Scissor", "Mind Reader", "Nightmare", "Flame Wheel", "Iron Head", "Curse",
  "Flail", "Conversion2", "Aeroblast", "Cotton Spore", "Reversal", "Spite", "Powder Snow", "Protect", "Mach Punch", "Scary Face", "Faint Attack", "Sweet Kiss",
  "Belly Drum", "Sludge Bomb", "Mud Slap", "Octazooka", "Spikes", "Zap Cannon", "Foresight", "Destiny Bond", "Perish Song", "Icy Wind", "Air Slash", "Dark Pulse",
  "Earth Power", "Outrage", "Sandstorm", "Giga Drain", "Endure", "Charm", "Rollout", "False Swipe", "Swagger", "Milk Drink", "Spark", "Fury Cutter", "Steel Wing",
  "Mean Look", "Attract", "Sleep Talk", "Heal Bell", "Return", "Present", "DazzlinGleam", "Safeguard", "Pain Split", "Sacred Fire", "Magnitude", "DynamicPunch",
  "Megahorn", "DragonBreath", "Baton Pass", "Encore", "Pursuit", "Rapid Spin", "Nasty Plot", "Iron Tail", "Metal Claw", "Vital Throw", "Morning Sun", "Synthesis",
  "Moonlight", "Hidden Power", "Cross Chop", "Twister", "Rain Dance", "Sunny Day", "Crunch", "Mirror Coat", "Shadow Claw", "ExtremeSpeed", "AncientPower",
  "Shadow Ball", "Future Sight", "Rock Smash", "Whirlpool", "Drill Run", "Moonblast", "Play Rough", "Sheer Cold", NULL
};

const char * items[256] = {
  "-", "Master Ball", "Ultra Ball", "BrightPowder", "Great Ball", "Poke Ball", "Premier Ball", "Bicycle", "Moon Stone", "Antidote", "Burn Heal", "Ice Heal",
  "Awakening", "Parlyz Heal", "Full Restore", "Max Potion", "Hyper Potion", "Super Potion", "Potion", "Escape Rope", "Repel", "Max Elixer", "Fire Stone",
  "ThunderStone", "Water Stone", "Poison Guard", "HP Up", "Protein", "Iron", "Carbos", "Lucky Punch", "Calcium", "Rare Candy", "X Accuracy", "Leaf Stone",
  "Metal Powder", "Nugget", "Poke Doll", "Full Heal", "Revive", "Max Revive", "Guard Spec.", "Super Repel", "Max Repel", "Dire Hit", "Burn Guard", "Fresh Water",
  "Soda Pop", "Lemonade", "X Attack", "Freeze Guard", "X Defend", "X Speed", "X Special", "Coin Case", "Itemfinder", "Poke Flute", "Exp.Share", "Old Rod",
  "Good Rod", "Silver Leaf", "Super Rod", "PP Up", "Ether", "Max Ether", "Elixer", "Red Scale", "SecretPotion", "S.S.Ticket", "Mystery Egg", "Clear Bell",
  "Silver Wing", "MooMoo Milk", "Quick Claw", "Pecha Berry", "Gold Leaf", "Soft Sand", "Sharp Beak", "Cheri Berry", "Aspear Berry", "Rawst Berry", "Poison Barb",
  "King's Rock", "Persim Berry", "Chesto Berry", "Red Apricorn", "TinyMushroom", "Big Mushroom", "SilverPowder", "Blu Apricorn", "Sleep Guard", "Amulet Coin",
  "Ylw Apricorn", "Grn Apricorn", "Cleanse Tag", "Mystic Water", "TwistedSpoon", "Wht Apricorn", "Blackbelt", "Blk Apricorn", "Parlyz Guard", "Pnk Apricorn",
  "BlackGlasses", "SlowpokeTail", "Pink Bow", "Stick", "Smoke Ball", "NeverMeltIce", "Magnet", "Lum Berry", "Pearl", "Big Pearl", "Everstone", "Spell Tag",
  "RageCandyBar", "GS Ball", "Blue Card", "Miracle Seed", "Thick Club", "Focus Band", "ConfuseGuard", "EnergyPowder", "Energy Root", "Heal Powder", "Revival Herb",
  "Hard Stone", "Lucky Egg", "Card Key", "Machine Part", "Egg Ticket", "Lost Item", "Stardust", "Star Piece", "Basement Key", "Pass", "Helix Fossil", "Dome Fossil",
  "Old Amber", "Charcoal", "Berry Juice", "Scope Lens", "Oak's Parcel", "Power Herb", "Metal Coat", "Dragon Fang", "Friend Charm", "Leftovers", "ResearchNote",
  NULL, NULL, "Leppa Berry", "Dragon Scale", "Berserk Gene", NULL, "X Sp. Def", NULL, "Sacred Ash", "Heavy Ball", "Flower Mail", "Level Ball", "Lure Ball",
  "Fast Ball", NULL, "Light Ball", "Friend Ball", "Moon Ball", "Love Ball", "Normal Box", "Gorgeous Box", "Sun Stone", "Polkadot Bow", NULL, "Up-Grade",
  "Oran Berry", "Sitrus Berry", "SquirtBottle", NULL, "Park Ball", "Rainbow Wing", NULL, "Brick Piece", "Surf Mail", "LiteBlueMail", "PortraitMail", "Lovely Mail",
  "Eon Mail", "Morph Mail", "BlueSky Mail", "Music Mail", "Mirage Mail", NULL, "TM01", "TM02", "TM03", "TM04", NULL, "TM05", "TM06", "TM07", "TM08", "TM09", "TM10",
  "TM11", "TM12", "TM13", "TM14", "TM15", "TM16", "TM17", "TM18", "TM19", "TM20", "TM21", "TM22", "TM23", "TM24", "TM25", "TM26", "TM27", "TM28", NULL, "TM29",
  "TM30", "TM31", "TM32", "TM33", "TM34", "TM35", "TM36", "TM37", "TM38", "TM39", "TM40", "TM41", "TM42", "TM43", "TM44", "TM45", "TM46", "TM47", "TM48", "TM49",
  "TM50", "HM01", "HM02", "HM03", "HM04", "HM05", "HM06", "HM07", NULL, NULL, NULL, NULL, NULL, NULL
};

#define ALPHA_OFFSET 63
#define DIGIT_OFFSET 198

const char printable_valid[] = " ():;[]'-?!.&_/,";
const unsigned char printable_values[] = {0x7f, 0x9a, 0x9b, 0x9c, 0x9d, 0x9e, 0x9f, 0xe0, 0xe3, 0xe6, 0xe7, 0xe8, 0xe9, 0xf2, 0xf3, 0xf4};
const char * special_valid[] = {"A", "O", "U", "a", "o", "u", "'d", "'l", "'m", "'r", "'s", "'t", "'v", "PK", "MN", "e", "m", "$", "x", "f", NULL};
const unsigned char special_values[] = {0xc0, 0xc1, 0xc2, 0xc3, 0xc4, 0xc5, 0xd0, 0xd1, 0xd2, 0xd3, 0xd4, 0xd5, 0xd6, 0xe1, 0xe2, 0xea, 0xef, 0xf0, 0xf1, 0xf5};

struct line_data {
  unsigned short OTID;
  unsigned short DVs;
  unsigned char species;
  unsigned char item;
  unsigned char flags;
  unsigned char level;
  unsigned char code[8];
  unsigned char moves[4];
  unsigned char OT[11];
  unsigned char nickname[11];
};

char * read_line(FILE *);
long long convert_string_to_number(const char *);
char * get_next_parameter(char **, unsigned);
long long get_next_number(char **, unsigned);
unsigned char encode_character(char);
unsigned char encode_special(const char *);
void get_next_encoded_string(char **, unsigned, unsigned char *, unsigned, int);
unsigned char get_next_by_lookup(char **, unsigned, const char **);
void get_field_lengths(FILE *, unsigned, unsigned *, unsigned *);
struct line_data * get_data_from_file(FILE *, unsigned *);
struct line_data parse_line_into_data(char *, const unsigned *, const unsigned *);
int main(int, char **);
void generate_data_for_encryption(struct line_data, char *, char *);
void encrypt(const unsigned char *, const unsigned char *, unsigned char *);

char * read_line (FILE * file) {
  int character;
  char * result = NULL;
  unsigned length = 0;
  while (1) {
    character = getc(file);
    if ((character == EOF) || (character == '\n')) break;
    result = realloc(result, length + 1);
    result[length ++] = character;
  }
  result = realloc(result, length + 1);
  result[length] = 0;
  if (length && (result[length - 1] == '\r')) result[length - 1] = 0;
  return result;
}

long long convert_string_to_number (const char * string) {
  char * errp;
  errno = 0;
  int base;
  if (*string == '$') {
    base = 16;
    string ++;
  } else
    base = 0;
  long long result = strtoll(string, &errp, base);
  if (*errp || (errno == ERANGE)) {
    fprintf(stderr, "error: could not make number from %s\n", string);
    exit(1);
  }
  return result;
}

char * get_next_parameter (char ** string, unsigned length) {
  if (strlen(*string) < length) length = strlen(*string);
  char * result = malloc(length + 1);
  memcpy(result, *string, length);
  result[length] = 0;
  *string += length;
  while (length && isspace(result[length - 1])) result[-- length] = 0;
  return result;
}

long long get_next_number (char ** string, unsigned length) {
  char * param = get_next_parameter(string, length);
  long long number = convert_string_to_number(param);
  free(param);
  return number;
}

unsigned char encode_character (char character) {
  const char * pos = strchr(printable_valid, character);
  if (isalpha(character)) return (unsigned char) character + ALPHA_OFFSET;
  if (isdigit(character)) return (unsigned char) character + DIGIT_OFFSET;
  if (!pos) {
    fprintf(stderr, "error: could not encode character: %c\n", character);
    exit(1);
  }
  return printable_values[pos - printable_valid];
}

unsigned char encode_special (const char * special) {
  const char ** current;
  for (current = special_valid; *current; current ++) if (!strcmp(*current, special)) break;
  if (!*current) {
    fprintf(stderr, "error: could not encode special: <%s>\n", special);
    exit(1);
  }
  return special_values[current - special_valid];
}

void get_next_encoded_string (char ** string, unsigned length, unsigned char * buffer, unsigned buffer_length, int code_mode) {
  char * name = get_next_parameter(string, length);
  char * p;
  char * closing;
  unsigned buffer_pos = 0;
  for (p = name; *p; p ++) {
    if (buffer_pos >= buffer_length) {
      fprintf(stderr, "error: name too long\n");
      exit(1);
    }
    if (*p == '<') {
      p ++;
      closing = strchr(p, '>');
      if (!closing) {
        fprintf(stderr, "error: mismatched <\n");
        exit(1);
      }
      *closing = 0;
      buffer[buffer_pos ++] = encode_special(p);
      p = closing;
    } else
      buffer[buffer_pos ++] = encode_character(*p);
  }
  free(name);
  if (code_mode) {
    unsigned pos;
    for (pos = 0; pos < buffer_pos; pos ++) if (buffer[pos] == 0x7f) buffer[pos] = 0xbf;
    if (buffer_pos < buffer_length) memset(buffer + buffer_pos, 0xcf, buffer_length - buffer_pos);
  } else if (buffer_pos < buffer_length) {
    buffer[buffer_pos ++] = 0x50;
    while (buffer_pos < buffer_length) buffer[buffer_pos ++] = rand();
  }
}

unsigned char get_next_by_lookup (char ** string, unsigned length, const char ** lookup) {
  char * param = get_next_parameter(string, length);
  unsigned p;
  for (p = 0; p < 256; p ++) {
    if (!lookup[p]) continue;
    if (!strcmp(param, lookup[p])) {
      free(param);
      return p;
    }
  }
  fprintf(stderr, "error: invalid value \"%s\"\n", param);
  exit(1);
}

void get_field_lengths (FILE * file, unsigned field_count, unsigned * lengths, unsigned * spacings) {
  char * line;
  unsigned field;
  char * pos;
  while (!feof(file)) {
    line = read_line(file);
    if ((strlen(line) != strspn(line, "- \t")) || !strchr(line, '-')) {
      free(line);
      continue;
    }
    pos = line + (*spacings = strcspn(line, "-"));
    for (field = 0; field < field_count; field ++) {
      if (!*pos) {
        fprintf(stderr, "error: input defines %u columns, expected %u\n", field, field_count);
        exit(1);
      }
      pos += (lengths[field] = strspn(pos, "-"));
      pos += (spacings[field + 1] = strcspn(pos, "-"));
    }
    free(line);
    return;
  }
  fprintf(stderr, "error: input does not contain column definitions\n");
  exit(1);
}

struct line_data * get_data_from_file (FILE * file, unsigned * count) {
  unsigned field_lengths[16];
  unsigned field_spacings[16];
  get_field_lengths(file, 16, field_lengths, field_spacings);
  *count = 0;
  char * line;
  struct line_data * data = NULL;
  while (!feof(file)) {
    line = read_line(file);
    if (!*line) {
      free(line);
      continue;
    }
    data = realloc(data, sizeof(struct line_data) * (1 + *count));
    data[(*count) ++] = parse_line_into_data(line, field_lengths, field_spacings);
    free(line);
  }
  return data;
}

struct line_data parse_line_into_data (char * line, const unsigned * field_lengths, const unsigned * field_spacings) {
  struct line_data result;
  line += *field_spacings;
  get_next_encoded_string(&line, *field_lengths, result.code, 8, 1);
  line += field_spacings[1];
  get_next_encoded_string(&line, field_lengths[1], result.nickname, 11, 0);
  line += field_spacings[2];
  result.species = get_next_by_lookup(&line, field_lengths[2], pokemon);
  line += field_spacings[3];
  result.level = get_next_number(&line, field_lengths[3]);
  line += field_spacings[4];
  result.item = get_next_by_lookup(&line, field_lengths[4], items);
  line += field_spacings[5];
  unsigned char id;
  for (id = 0; id < 4; id ++) {
    result.moves[id] = get_next_by_lookup(&line, field_lengths[5 + id], moves);
    line += field_spacings[6 + id];
  }
  result.DVs = 0;
  for (id = 0; id < 4; id ++) {
    result.DVs |= get_next_number(&line, field_lengths[9 + id]) << ((id ^ 3) << 2);
    line += field_spacings[10 + id];
  }
  result.OTID = get_next_number(&line, field_lengths[13]);
  line += field_spacings[14];
  get_next_encoded_string(&line, field_lengths[14], result.OT, 11, 0);
  line += field_spacings[15];
  result.flags = get_next_number(&line, field_lengths[15]);
  return result;
}

int main (int argc, char ** argv) {
  if ((argc < 2) || (argc > 3)) {
    fprintf(stderr, "usage:\n  %s <infile> <outfile>\n  %s <outfile> (takes input from stdin\n", *argv, *argv);
    return 2;
  }
  FILE * file;
  struct line_data * source_data;
  unsigned count;
  argv ++;
  if (argc == 3) {
    file = fopen(*argv, "r");
    if (!file) {
      fprintf(stderr, "error: could not open file %s for reading\n", *argv);
      return 1;
    }
    argv ++;
  } else
    file = stdin;
  srand(time(NULL) ^ clock());
  source_data = get_data_from_file(file, &count);
  fclose(file);
  file = fopen(*argv, "wb");
  if (!file) {
    fprintf(stderr, "error: could not open file %s for writing\n", *argv);
    return 1;
  }
  char encrypted[42];
  char plaintext[42];
  char key[7];
  unsigned line;
  for (line = 0; line < count; line ++) {
    generate_data_for_encryption(source_data[line], plaintext, key);
    encrypt(plaintext, key, encrypted);
    fwrite(encrypted, 1, 42, file);
  }
  fclose(file);
  free(source_data);
  return 0;
}

void generate_data_for_encryption (struct line_data source, char * data, char * key) {
  *data = rand();
  memset(data + 1, *data, 7);
  data[8] = source.species;
  data[9] = source.item;
  memcpy(data + 10, source.moves, 4);
  data[14] = source.OTID >> 8;
  data[15] = source.OTID & 255;
  data[16] = source.DVs >> 8;
  data[17] = source.DVs & 255;
  data[18] = source.level;
  memcpy(data + 19, source.OT, 11);
  memcpy(data + 30, source.nickname, 11);
  data[41] = source.flags;
  unsigned long long code = 0, packed = 0;
  unsigned char p;
  for (p = 0; p < 8; p ++) code = (code << 8) | source.code[p];
  for (p = 0; p < 8; p ++) packed |= ((code >> (8 * p)) & 127) << (7 * p);
  for (p = 0; p < 7; p ++) {
    key[6 - p] = packed & 255;
    packed >>= 8;
  }
}

// everything below this line is a rewrite in C of pigdevil2010's encryption function

void encrypt (const unsigned char * data, const unsigned char * key, unsigned char * encrypted) {
  unsigned char fixed_pos = 2, key_pos = 0;
  unsigned char i, j, k, tp;
  unsigned char width, shift;
  unsigned char temp_data[42];
  const unsigned char fixed_string[] = {0x8e, 0x8b, 0x83, 0x84, 0x8d};
  memcpy(encrypted, data, 42);
  for (i = 41; i < 42; i --) {
    fixed_pos = (fixed_pos + 4) % 5;
    key_pos = (key_pos + 6) % 7;
    encrypted[i] ^= encrypted[(i < 21) ? (41 - i) : (i - 21)] ^ key[key_pos] ^ fixed_string[fixed_pos];
  }
  for (i = 6; i < 7; i --) {
    width = (key[i] & 15) + 2;
    shift = (key[i] >> 4) + 1;
    k = 0;
    for (j = 0; j < width; j ++) for (tp = 0; (j + tp) < 42; tp += width) temp_data[j + tp] = encrypted[k ++];
    memcpy(encrypted, temp_data + (42 - shift), shift);
    memcpy(encrypted + shift, temp_data, 42 - shift);
  }
  memcpy(temp_data, key, 7);
  memcpy(temp_data + 7, fixed_string, 5);
  key_pos = 0;
  for (i = 41; i < 42; i --) {
    key_pos = (key_pos + 11) % 12;
    encrypted[i] += temp_data[key_pos];
  }
  for (i = 41; i < 42; i --) {
    key_pos = (key_pos + 11) % 12;
    encrypted[i] -= temp_data[key_pos];
  }
}
