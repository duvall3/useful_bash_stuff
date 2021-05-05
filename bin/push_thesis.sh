#!/bin/bash
# push_thesis.sh -- script for crontab to rsync THESIS
#   and THESIS_repo to backup locations

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


## init

# local
# set by user:
THESIS_DIR=
THESIS_REPO_DIR=
MOUNTPOINT_LOCAL= # just use "/" if not external drive
# fixed:
THESIS_LOCAL_BACKUP_DIR=$MOUNTPOINT_LOCAL/THESIS
THESIS_REPO_LOCAL_BACKUP_DIR=$MOUNTPOINT_LOCAL/THESIS_repo
LOGFILE=~/push_thesis_log

# networking
# set by user:
SSID_HOME_REGEX="" # e.g., "MyWiFiNetwork-[25]G"
ACCESS_POINT_HOME_REGEX="" # MAC address(es) of the user's home router [2G/5G]
# fixed:
NMCLI=$(which nmcli)
if [ $NMCLI ]; then
  INTERFACE=$($NMCLI device status | awk '$3 ~ /^connected/ {print $1}')
else
  ROUTE=$(which route)
  INTERFACE=$($ROUTE | awk '$1 ~ /default/ {print $NF}')
fi
ESSID=$(iwconfig $INTERFACE | grep -o "ESSID:.*" | grep -o "\".*\"" | tr -d \")
ACCESS_POINT=$(iwconfig $INTERFACE | grep -o "Access Point: *.*" | awk '{print $3}')
if [[ $ESSID =~ $ESSID_HOME_REGEX && $ACCESS_POINT =~ $ACCESS_POINT_HOME_REGEX ]]; then
  REMOTE_HOST= # name of *home* entry from user's .ssh/config
else
  REMOTE_HOST= # name of *remote* entry from user's .ssh/config
fi

# remote
# set by user:
MOUNTPOINT_REMOTE= # just use "/" if not external drive
THESIS_REMOTE_BACKUP_DIR="$USER@$REMOTE_HOST:$MOUNTPOINT_REMOTE/THESIS"
THESIS_REPO_REMOTE_BACKUP_DIR=$REMOTE_HOST:$MOUNTPOINT_REMOTE/THESIS_repo


## main

# logging
echo -en "$(date -R)\t\t" >> $LOGFILE

# local backup
if mountpoint -q $MOUNTPOINT_LOCAL; then
  rsync -a $THESIS_DIR/ $THESIS_LOCAL_BACKUP_DIR
  echo -en "$?\t" >> $LOGFILE
  rsync -a $THESIS_REPO_DIR/ $THESIS_REPO_LOCAL_BACKUP_DIR
  echo -en "$?\t" >> $LOGFILE
else # drive not mounted
  echo -en "9\t9\t" >> $LOGFILE
fi

# remote backup
if ssh $REMOTE_HOST true; then
  rsync -a $THESIS_DIR/ $THESIS_REMOTE_BACKUP_DIR
  echo -en "$?\t" >> $LOGFILE
  rsync -a $THESIS_REPO_DIR/ $THESIS_REPO_REMOTE_BACKUP_DIR
  echo -en "$?\t" >> $LOGFILE
else # remote access failed
  echo -en "9\t9\t\n" >> $LOGFILE
  exit 3
fi

# ending newline
echo "" >> $LOGFILE


## all pau!   )
exit 0
