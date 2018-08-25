PYTHON := python2
MD5 := md5sum -c --quiet

.SUFFIXES:
.PHONY: all clean crystal beesafree patches ipspatch distribution
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp

gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) scan_includes.py
autogen := distribution/autogen


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

nortc_obj := $(crystal_obj:.o=_nrtc.o)

beesafree_obj := $(crystal_obj:.o=_ai.o)

all_obj := $(sort $(crystal_obj) $(beesafree_obj))

roms := pokecrystal.gbc pokecrystal_nortc.gbc pokecrystal_ai.gbc


all: $(roms)
crystal: pokecrystal.gbc
nortc: pokecrystal_nortc.gbc
beesafree: pokecrystal_ai.gbc
distribution: data/distribution.bin
patches: ipspatch pokecrystal.ips pokecrystal_ai.ips
ipspatch: ipspatch/ipspatch.exe
autogen: distribution/autogen.exe

data/distribution.bin: distribution/distdata.txt autogen
	$(autogen) $< $@

clean:
	rm -f $(roms) $(all_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) $(roms:.gbc=.ips) data/distribution.bin

%.asm: ;
%.txt: ;
%.c: ;

%.o: dep = $(shell $(includes) $(@D)/$*.asm)
%.o: %.asm $$(dep)
	rgbasm -o $@ $<

%_ai.o: dep = $(shell $(includes) $(@D)/$*.asm)
%_ai.o: %.asm $$(dep)
	rgbasm -D BEESAFREE -o $@ $<

%_nrtc.o: dep = $(shell $(includes) $(@D)/$*.asm)
%_nrtc.o: %.asm $$(dep)
	rgbasm -D NO_RTC -o $@ $<

%.ips: %.gbc
	ipspatch/ipspatch create baserom.gbc $< $@

pokecrystal.gbc: $(crystal_obj)
	rgblink -n pokecrystal.sym -m pokecrystal.map -o $@ $^
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t TPPCRYSTAL $@

pokecrystal_ai.gbc: $(beesafree_obj)
	rgblink -n pokecrystal_ai.sym -m pokecrystal_ai.map -o $@ $^
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t TPPCRYSTAL $@

pokecrystal_nortc.gbc: $(nortc_obj)
	rgblink -n pokecrystal_nortc.sym -m pokecrystal_nortc.map -o $@ $^
	rgbfix -Cjv -i BORT -k 01 -l 0x33 -m 0x13 -n 1 -p 0 -r 3 -t TPPCRYSTAL $@

%.exe: %.c
	gcc -O3 -Wno-unused-result $< -o $@

%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
#%.lz:   %     ; $(gfx) lz $<


%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;

