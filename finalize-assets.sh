#!/usr/bin/env bash

ASSETS=src/main/assets/defaults
ARCH=("armeabi-v7a" "arm64-v8a" "x86" "x86_64" )
OUTPUT=("libocgcorev7.so" "libocgcorev8.so" "libocgcorex86.so" "libocgcorex64.so")
mkdir -p $ASSETS
for i in {0..3}; do
	CORE="deps/ocgcore/libs/${ARCH[i]}/libocgcore.so"
	if [[ -f "$CORE" ]]; then
		cp $CORE "$ASSETS/${OUTPUT[i]}"
	fi
done
cd $ASSETS
# Finds all directories, excluding the current directory, and removes the ./ prefix
find -L . ! -path . -type d | sed -E "s|^\./||" > ../index.txt
# Finds all files and removes the ./ prefix
find -L . -type f | sed -E "s|^\./||" > ../filelist.txt