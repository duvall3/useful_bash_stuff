#!/bin/bash
# heat_mon.sh -- very simple script to track proc temperature via acpi
#	-- runs until terminated via <C-c>
#
# usage: heat_mon.sh [INTERVAL]
# - INTERVAL is assumed to be in seconds; defaults to 5 if not specified
# - format for INTERVAL is same as "date" command -- e.g., "20m" = "twenty minutes", etc.
# - the 'acpi' package is required, but if you don't already have it, you really should get it anyway


# Copyright (C) 2015 Mark Duvall
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
	sleep=5
fi

while true; do
	time=$(date +%H:%M:%S)
	temp=$(acpi -t | grep -Eo "[[:digit:]]+\.[[:digit:]]")
	printf "%s C    %s\n" $temp $time
	sleep $sleep
done
