#!/bin/bash
# screenshot_mv.sh -- simply move screenshots from ~/Pictures
#   to ~/Pictures/screenshots, and replace spaces
#   with underscores for all filenames in that directory
# -- Usage suggestion: To fully automate this process,
#      place a line like the following in your crontab:
#          */10 * * * * ~/bin/screenshot_mv.sh
#    -- This line runs the script every 10 minutes
#    -- Replace "~/bin/" with the relevant path
#         on your system if needed
# ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 02/2022 ~ #
# Updated 06/2022

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

TARGET_DIR=~/Pictures/screenshots
find ~/Pictures/ -maxdepth 1 -name "Screenshot\ from\ *" -print0 | xargs -0 mv -t $TARGET_DIR
rename 's/\ /_/g' $TARGET_DIR/Screenshot\ from\ *.png

# all pau!   )
exit 0

