#!/bin/bash
# mons.sh -- simple script to establish a tmux session running nethogs and (h)top

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

## init

# usage
USAGE="Usage: mons.sh [-H] : activate system monitors; -H uses htop rather than top"
if [[ $1 && ( ! $1 =~ "-H" ) ]]; then
  echo $USAGE
  exit 10
fi

# htop option
if [[ $1 =~ "-H" ]]; then
  TOP='htop'
else
  TOP='top'
fi

## main

# establish tmux session
tmux new -s monitors -d
tmux rename-window -t monitors monitors

# gpu
tmux send-keys -t monitors 'sudo intel_gpu_top' C-m

# top
tmux split-window -t monitors
if which $TOP 2>&1 > /dev/null; then
  tmux send-keys -t monitors $TOP C-m
else # if 'htop'  is selected but not available
  tmux send-keys -t monitors 'top' C-m
fi

# thermal
tmux last-pane -t monitors
tmux split-window -h -t monitors
tmux send-keys -t monitors '/home/mark/useful_bash_stuff/bin/heat_mon.sh 30s 20' C-m
tmux resize-pane -t monitors -R 15

# network
tmux last-pane -t monitors
tmux split-window -t monitors
tmux send-keys -t monitors 'sudo nethogs' C-m
tmux resize-pane -t monitors -U 5

# RAT-PAC and ROOT
tmux select-pane -t 2
tmux split-window -t monitors
tmux send-keys -t monitors 'watch pgrr' C-m
tmux resize-pane -t monitors -D 1

# cpu
tmux split-window -h -t monitors
# tmux send-keys -t monitors 'watch pcpu true false' C-m
tmux send-keys -t monitors 'pcpu true true 5s' C-m
tmux resize-pane -t monitors -L 12

# make top active
tmux select-pane -t 5

# attach session
tmux attach -t monitors

# all pau!   )
