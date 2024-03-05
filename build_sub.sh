#!/usr/bin/env bash

script_dir=$(dirname $0)

for filename in *.dv; do
	sub_filename="$filename.sub"

	if [ -f "$sub_filename" ]; then
		echo "$sub_filename already exists, skipping..."
		continue
	fi

	dv2sub --verbose --subtitles-out "$sub_filename" "$filename"
	"$script_dir/increment_end_frame.py" "$sub_filename"
done
