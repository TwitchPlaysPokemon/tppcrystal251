PYTHON := python2
CC := gcc
MD5 := md5sum -c --quiet

.SUFFIXES:
.PHONY: all clean crystal beesafree patches ipspatch distribution autogen bspbuild rgbds
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp

gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) scan_includes.py
autogen   := distribution/autogen
ipspatch  := ipspatch/ipspatch
bspbuild  := bspbuild/bspbuild
rgbasm    := rgbds/rgbasm
rgblink   := rgbds/rgblink
rgbfix    := rgbds/rgbfix

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

all_obj := $(sort $(crystal_obj) $(beesafree_obj) $(nortc_obj))

roms := pokecrystal.gbc pokecrystal_nortc.gbc pokecrystal_ai.gbc

all: $(roms)
crystal: pokecrystal.gbc
nortc: pokecrystal_nortc.gbc
beesafree: pokecrystal_ai.gbc
distribution: data/distribution.bin
patches: ipspatch $(roms:.gbc=.ips) annicrystal.bsp

ipspatch:
	cd ipspatch && $(MAKE) CC=$(CC)

autogen: $(autogen).c
	$(CC) -O3 $(autogen).c -o $(autogen)

bspbuild:
	cd bspbuild && $(MAKE) CC=$(CC)

# ensure we pass the proper warning cancellation flags because this build of rgbds throws a lot of warnings otherwise
rgbds:
	cd rgbds && $(MAKE) CC=$(CC) CFLAGS="-O3 -Wno-unused-result -Wno-maybe-uninitialized" YFLAGS="-Wno-conflicts-rr -Wno-conflicts-sr"

data/distribution.bin: distribution/distdata.txt autogen
	$(autogen) $< $@

clean:
	rm -f $(roms) $(all_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) $(roms:.gbc=.ips) data/distribution.bin $(ipspatch) $(autogen) annicrystal.bsp
	cd rgbds && $(MAKE) clean
	cd bspbuild && $(MAKE) clean

%.asm: ;
%.txt: ;
%.c: ;

%_ai.o: dep = $(shell $(includes) $(@D)/$*.asm)
%_ai.o: %.asm $$(dep) rgbds
	$(rgbasm) -D BEESAFREE -o $@ $<

%_nrtc.o: dep = $(shell $(includes) $(@D)/$*.asm)
%_nrtc.o: %.asm $$(dep) rgbds
	$(rgbasm) -D NO_RTC -o $@ $<

%.o: dep = $(shell $(includes) $(@D)/$*.asm)
%.o: %.asm $$(dep) rgbds
	$(rgbasm) -o $@ $<

# we're building IPS patches for Crystal 1.0 for some reason
%.ips: %.gbc
	[ $(shell sha1sum -b baserom.gbc | cut -c 1-40) = f4cd194bdee0d04ca4eac29e09b8e4e9d818c133 ]
	ipspatch/ipspatch create baserom.gbc $< $@

%.bsp: $(roms) bspbuild
	chmod +x generate_bsp.sh
	./generate_bsp.sh $@ $(bspbuild)

%.gbc: rgbds

pokecrystal.gbc: $(crystal_obj)
	$(rgblink) -n pokecrystal.sym -m pokecrystal.map -o $@ $^
	$(rgbfix) -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t TPPCRYSTAL $@

pokecrystal_ai.gbc: $(beesafree_obj)
	$(rgblink) -n pokecrystal_ai.sym -m pokecrystal_ai.map -o $@ $^
	$(rgbfix) -Cjv -i BORT -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t TPPCRYSTAL $@

pokecrystal_nortc.gbc: $(nortc_obj)
	$(rgblink) -n pokecrystal_nortc.sym -m pokecrystal_nortc.map -o $@ $^
	$(rgbfix) -Cjv -i BORT -k 01 -l 0x33 -m 0x13 -n 1 -p 0 -r 3 -t TPPCRYSTAL $@

%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<

%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;

