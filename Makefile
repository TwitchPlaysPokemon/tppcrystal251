PYTHON := python2
MD5 := md5sum -c --quiet

.SUFFIXES:
.SUFFIXES: .asm .o .gbc .png .2bpp .1bpp .lz .pal .bin .blk .tilemap
.PHONY: all clean crystal pngs crystal11 both beesafree
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


roms := pokecrystal.gbc pokecrystal_ai.gbc

all: $(roms)
crystal: pokecrystal.gbc
crystal11: pokecrystal11.gbc
beesafree: pokecrystal_ai.gbc

clean:
	rm -f $(roms) $(all_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)

%.asm: ;
%_ai.o: %.asm $$(%_dep)
	rgbasm -D BEESAFREE -o $@ $<
%11.o: %.asm $$(%_dep)
	rgbasm -D CRYSTAL11 -o $@ $<
%.o: %.asm $$(%_dep)
	rgbasm -o $@ $<

pokecrystal11.gbc: $(crystal11_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t TPPCRYSTAL $@

pokecrystal.gbc: $(crystal_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t TPPCRYSTAL $@

pokecrystal_ai.gbc: $(beesafree_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t TPPCRYSTAL $@



%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
#%.lz:   %     ; $(gfx) lz $<


%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;

