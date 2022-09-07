#!/bin/bash
# isratloop -- temporary workaround for cron/zenity issue
# -- Cron is having trouble finding the display for Zenity;
#      so for now, just start this from any terminal
#      to run as a deteched background job
#      via "nohup isratloop.sh &"
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 09/2022 ~ #

#Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# init
SLEEPTIME_DEFAULT="15m"
SLEEPTIME=${1:-$SLEEPTIME_DEFAULT}
RUN_TF=true

# main
while $RUN_TF; do
  read RUN_TF < $RATCHECK_FILE
  is_rat
  sleep $SLEEPTIME
done

# all pau!   )
exit 0
