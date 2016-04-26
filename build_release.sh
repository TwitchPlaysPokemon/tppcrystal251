filesdir=/cygdrive/d/tppcrystal251/files
vbasrcdir=/cygdrive/c/Users/Scott/Downloads/vba-rerecording-svn480-win32
version=1.1.2
tmpdir=/tmp/crystal251

# Do not modify anything below this line.
# ---------------------------------------

# Reset temp directory
if [ -d $tmpdir ]
then
	rm -rf $tmpdir/*
else
	mkdir $tmpdir
fi
mkdir $tmpdir/AI
mkdir $tmpdir/VBA-RR-243
mkdir $tmpdir/VBA-RR-243/lua

# Remove the old zip file
rm -f $filesdir/*

# Build the IPS files
make patches

# Copy the standalone patch to the webpage files directory
cp pokecrystal11.ips $filesdir/annicrystal_$version.ips
cp changelog.txt $filesdir/

# Copy the AI patch to the temporary directory
cp pokecrystal_ai.ips $tmpdir/annicrystal_aI_$version.ips

# Copy the AI scripts and data to the temp AI subdirectory
cp ai/AI.py ai/AIServer.py ai/AIServerStandalone.py ai/ai_data.py ai/AiMoves.txt $tmpdir/AI/

# Copy the emulator to the correct filename in the temp VBA-RR-243 subdirectory
cp $vbasrcdir/VBA_VS2015_V72XR.exe $tmpdir/VBA-RR-243/VBA-RR-243.exe

# Copy the lua DLLs to the temp VBA-RR-243 subdirectory
cp $vbasrcdir/lua5*1.dll $tmpdir/VBA-RR-243/

# Copy the lua scripts and dependencies to the temp VBA-RR-243/lua subdirectory
cp -r lua_scripts/mime lua_scripts/socket lua_scripts/battle_ram.lua lua_scripts/constants.lua lua_scripts/JSON.lua lua_scripts/ltn12.lua lua_scripts/mime.lua lua_scripts/pokecrystal_ai.lua lua_scripts/readstates.lua lua_scripts/socket.lua $tmpdir/VBA-RR-243/lua/

# Build the ZIP file to the webpage files directory (quiet mode, recursive)
zip -r -q $filesdir/annicrystal_ai.zip $tmpdir/AI $tmpdir/VBA-RR-243 $tmpdir/annicrystal_aI_$version.ips
