#!/bin/bash
# gpu_mon.sh -- very simple script to track temperature of an NVIDIA GPU via nvidia-smi
#	-- runs until terminated via <C-c>
#
# usage: gpu_mon.sh [INTERVAL]
# - INTERVAL is assumed to be in seconds; defaults to 15 if not specified
# - format for INTERVAL is same as "date" command -- e.g., "20m" = "twenty minutes", etc.


# Copyright (C) 2019 Mark Duvall
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.


if [ $1 ]; then
	sleep=$1
else
	sleep=15
fi

while true; do
	time=$(date +%H:%M:%S)
	util=$(nvidia-smi -q -d UTILIZATION | awk '$0 ~ /[Gg][Pp][Uu].*%/ {print $3}')
	temp=$(nvidia-smi -q -d TEMPERATURE | awk '$0 ~ /[Gg][Pp][Uu]\ [Cc]urrent/ {print $5}')
	printf "%2.f%c  %2.fC  %s\n" $util '%' $temp $time
	sleep $sleep
done
