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

tmux send-keys -t monitors 'sudo intel_gpu_top' C-m

tmux split-window -t monitors
tmux send-keys -t monitors 'top' C-m

tmux last-pane -t monitors
tmux split-window -h -t monitors
tmux send-keys -t monitors '/home/mark/useful_bash_stuff/bin/heat_mon.sh 10s 20' C-m
tmux resize-pane -t monitors -R 15

tmux last-pane -t monitors
tmux split-window -t monitors
tmux send-keys -t monitors 'sudo nethogs' C-m
tmux resize-pane -t monitors -U 5

tmux select-pane -t 2
tmux split-window -t monitors
tmux send-keys -t monitors 'watch pgrr' C-m
tmux resize-pane -t monitors -D 1

tmux split-window -h -t monitors
tmux send-keys -t monitors 'watch pcpu' C-m
tmux resize-pane -t monitors -L 12

tmux select-pane -t 5

tmux attach -t monitors

# all pau!   )
