PYTHON := python2
MD5 := md5sum -c --quiet

.SUFFIXES:
.SUFFIXES: .asm .o .gbc .png .2bpp .1bpp .lz .pal .bin .blk .tilemap
.PHONY: all clean crystal pngs crystal11 both beesafree patches ipspatch distribution
.SECONDEXPANSION:

poketools := extras/pokemontools
gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) $(poketools)/scan_includes.py


crystal11_obj := \
wram11.o \
main11.o \
mobile.o \
home.o \
audio.o \
maps.o \
events.o \
credits.o \
egg_moves.o \
evos_attacks.o \
pokedex.o \
crystal_misc.o \
pics.o

crystal_obj := \
wram.o \
main.o \
mobile.o \
home.o \
audio.o \
maps.o \
events.o \
credits.o \
egg_moves.o \
evos_attacks.o \
pokedex.o \
crystal_misc.o \
pics.o

beesafree_obj := $(crystal_obj:.o=_ai.o)

all_obj := $(sort $(crystal_obj) $(crystal11_obj) $(beesafree_obj))

# object dependencies
deps := $(crystal_obj:.o=)
$(foreach dep, $(deps), \
	$(eval $(dep)_dep := $(shell $(includes) $(dep).asm)) \
)


roms := pokecrystal.gbc

all: $(roms)
crystal: pokecrystal.gbc
crystal11: pokecrystal11.gbc
beesafree: pokecrystal_ai.gbc
patches: ipspatch pokecrystal11.ips pokecrystal_ai.ips
ipspatch:
	cd ipspatch; \
	gcc -O3 -Wno-unused-result ipspatch.c -o ipspatch; \
	cd ../..

distribution:
	cd distribution; gcc -O3 autogen.c -o autogen
	distribution/autogen distribution/distdata.txt data/distribution.bin

clean:
	rm -f $(roms) $(all_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) $(roms:.gbc=.ips) data/distribution.bin

%.asm: ;
%.o: %.asm $$(%_dep)
	rgbasm -o $@ $<
%_ai.o: %.asm $$(%_dep)
	rgbasm -D BEESAFREE -o $@ $<
%11.o: %.asm $$(%_dep)
	rgbasm -D CRYSTAL11 -o $@ $<
%.ips: %.gbc $$(%_dep)
	ipspatch/ipspatch create baserom.gbc $< $@

pokecrystal11.gbc: distribution $(crystal11_obj)
	rgblink -n $*.sym -m $*.map -o $@ $(wordlist 2, $(words $^), $^)
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t TPPCRYSTAL $@

pokecrystal.gbc: distribution $(crystal_obj)
	rgblink -n $*.sym -m $*.map -o $@ $(wordlist 2, $(words $^), $^)
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t TPPCRYSTAL $@

pokecrystal_ai.gbc: distribution $(beesafree_obj)
	rgblink -n $*.sym -m $*.map -o $@ $(wordlist 2, $(words $^), $^)
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t TPPCRYSTAL $@


%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
#%.lz:   %     ; $(gfx) lz $<


%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;

