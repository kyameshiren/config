#!/usr/bin/env bash
set -euo pipefail

shopt -s nullglob
files=( ./*.mp3 ./*.flac ./*.m4a ./*.wav ./*.ogg ./*.opus ./*.aac )

rows=()

for f in "${files[@]}"; do
  ms="$(mediainfo --Inform="General;%Duration/String3%" "$f")"
  rows+=( "${ms%.*} | ${f#./}" )
done

printf '%s\n' "${rows[@]}" | sort -n 
