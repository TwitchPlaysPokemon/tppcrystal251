/*
 *  This file contains an implementation of the default RNG contained in glibc, accessed via srand() and rand().
 *  The implementation is based on various descriptions and sample snippets found online, but it doesn't actually
 *  copy any code from glibc.
 *  This implementation is provided so anyone cloning this repository can get the same exact random numbers as we
 *  did, thus generating the same output.
 *  All credits go to the GCC project. This file may be under the scope of the GPL under some jurisdictions; if
 *  that is the case, the full text of the license can be found at https://www.gnu.org/licenses/gpl.html.
 */

#include <stdint.h>

uint32_t random_state[31];
unsigned char random_counter;

int32_t next_random_number (void) {
  uint32_t next = random_counter + 28;
  if (next >= 31) next -= 31;
  next = random_state[random_counter] + random_state[next];
  random_state[random_counter ++] = next;
  if (random_counter == 31) random_counter = 0;
  return next >> 1;
}

void initialize_random_state (int32_t seed) {
  if (!seed) seed = 1;
  *random_state = seed;
  random_state[1] = ((int64_t) seed * 16807) % 2147483647; // avoid overflows on negative seeds
  if (random_state[1] >= 2147483647) random_state[1] += 2147483647;
  unsigned p;
  for (p = 2; p < 31; p ++) random_state[p] = ((int64_t) random_state[p - 1] * 16807) % 2147483647;
  random_counter = 3;
  for (p = 0; p < 310; p ++) next_random_number();
}
