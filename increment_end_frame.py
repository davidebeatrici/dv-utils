#!/usr/bin/env python3

# This script simply increments the end frame by 1, making it equal to the start frame of the next subtitle.
# By doing this, there is no more flicker between one subtitle and another.
# Ideally the script should ensure that the end frame actually matches the next start frame,
# but dv2sub's output has always been consistent for me even with different cameras.

import sys

with open(sys.argv[1], 'r') as f:
    lines = f.readlines()

with open(sys.argv[1], 'w') as f:
    for line in lines:
        start_frame, end_frame, text = line.split('}')
        end_frame = str(int(end_frame[1:]) + 1)
        f.write(start_frame + '}' + '{' + end_frame + '}' + text)
