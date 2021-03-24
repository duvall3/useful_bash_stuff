#!/bin/bash
# mons.sh -- simple script to establish a tmux session running nethogs and top


##Copyright (C) 2021 Mark J. Duvall
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <http://www.gnu.org/licenses/>.
##


tmux new -s monitors -d
tmux rename-window -t monitors monitors

tmux send-keys -t monitors 'sudo nethogs' C-m


tmux split-window -t monitors
tmux send-keys -t monitors 'top' C-m
tmux resize-pane -t monitors -U 8

tmux attach -t monitors

# all pau!   )
