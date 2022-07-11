#!/bin/bash

mkdir -p out

w=3840;
h=2160;
s=490;
x="$(((w/2) - (s/2)))";y="$(((h/2) - (s/2)))";
echo "${s}x${s}+${x}+${y}";
while read -r file
do
	out="out/$file"
	crop="${s}x${s}+${x}+${y}"
	echo "'$file' > '$out'  $crop"
	convert -crop "$crop" "$file" "$out"
done < <(find . -name "*png")

