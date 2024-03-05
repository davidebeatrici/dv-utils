#!/usr/bin/env bash

script_dir=$(dirname $0)

for filename in *.dv; do
	srt_filename="$filename.srt"
	sub_filename="$filename.sub"

	if [ -f "$srt_filename" ]; then
		echo "$srt_filename already exists, skipping..."
		continue
	fi

	"$script_dir/MicroDVD2SRT/microdvd2srt.py" "$sub_filename" > "$srt_filename"
done
