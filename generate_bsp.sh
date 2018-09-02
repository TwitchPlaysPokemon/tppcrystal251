#!/bin/bash

if [ $# -ge 1 ]; then output=$1; else output=annicrystal.bsp; fi
if [ $# -ge 2 ]; then bspbuild=$2; else bspbuild=bspbuild; fi

function check_exists {
	if [[ ! ( -f $1) ]]; then
		echo "error:" $1 "not found"
		exit 2
	fi
}

function check_hash {
	check_exists $1
	[ `sha1sum -b $1 | cut -c 1-40` = $2 ]
	if [ $? -ne 0 ]; then
		echo "error:" $1 "has an invalid hash"
		exit 1
	fi
}

check_hash baserom.gbc f4cd194bdee0d04ca4eac29e09b8e4e9d818c133
check_hash baserom11.gbc f2f52230b536214ef7c9924f483392993e226cfb
check_exists pokecrystal.gbc
check_exists pokecrystal_ai.gbc
check_exists pokecrystal_nortc.gbc

# long ass command line, but if we break it down it might fail for Windows users due to newline conversions
$bspbuild -m ips -s baserom.gbc baserom11.gbc -m xor-rle -st pokecrystal.gbc -ts pokecrystal_ai.gbc pokecrystal_nortc.gbc -f 0x4000 -pb 0 --check-fragment-swap --titles-from-stdin -o $output <<-END_TITLE_DATA
// base ROMs
baserom.gbc=Pokémon Crystal v1.0
baserom11.gbc=Pokémon Crystal v1.1

// give the "basic" output file a distinctive name since it can also be shown as a detected input
pokecrystal.gbc=TPP Anniversary Crystal (regular ROM)

// the rest of the options can have simpler names
pokecrystal_ai.gbc=Standalone AI version
pokecrystal_nortc.gbc=No RTC version
END_TITLE_DATA

exit $?
