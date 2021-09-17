#!/bin/bash
# push_thesis.sh -- script for crontab to rsync THESIS
#   and THESIS_repo to backup locations


## init

# local
THESIS_DIR=/home/mark/THESIS
THESIS_REPO_DIR=/home/mark/THESIS_repo
MOUNTPOINT_LOCAL=/media/mark/mTC_duvall2
THESIS_LOCAL_BACKUP_DIR=$MOUNTPOINT_LOCAL/THESIS
THESIS_REPO_LOCAL_BACKUP_DIR=$MOUNTPOINT_LOCAL/THESIS_repo
LOGFILE=~/push_thesis_log

# networking
SSID_HOME_REGEX="MySpectrumWiFi20-[25]G"
ACCESS_POINT_HOME_REGEX="28:9E:FC:A1:45:2[67]"
ESSID=$(iwconfig wlp0s20f3 | grep -o "ESSID:.*" | grep -o "\".*\"" | tr -d \")
ACCESS_POINT=$(iwconfig wlp0s20f3 | grep -o "Access Point: *.*" | awk '{print $3}')
if [[ $ESSID =~ $ESSID_HOME_REGEX && $ACCESS_POINT =~ $ACCESS_POINT_HOME_REGEX ]]; then
  REMOTE_HOST=vegh
else
  REMOTE_HOST=vegr
fi

# remote
#MOUNTPOINT_REMOTE=/media/mark/veggie_storage
MOUNTPOINT_REMOTE=/home/mark
THESIS_REMOTE_BACKUP_DIR="mark@$REMOTE_HOST:$MOUNTPOINT_REMOTE/THESIS"
THESIS_REPO_REMOTE_BACKUP_DIR=$REMOTE_HOST:$MOUNTPOINT_REMOTE/THESIS_repo


## main

# logging
echo -en "$(date -R)\t\t" >> $LOGFILE

# local backup
echo "Attempting local backup..."
if mountpoint -q $MOUNTPOINT_LOCAL; then
  rsync -a $THESIS_DIR/ $THESIS_LOCAL_BACKUP_DIR
# echo "rsync -a $THESIS_DIR/ $THESIS_LOCAL_BACKUP_DIR" #debug
  echo -en "$?\t" >> $LOGFILE
  rsync -a $THESIS_REPO_DIR/ $THESIS_REPO_LOCAL_BACKUP_DIR
# echo "rsync -a $THESIS_REPO_DIR/ $THESIS_REPO_LOCAL_BACKUP_DIR" #debug
  echo -en "$?\t" >> $LOGFILE
else # drive not mounted
  echo -en "9\t9\t" >> $LOGFILE
fi

# remote backup
#echo "ssh $REMOTE_HOST \"mountpoint -q $MOUNTPOINT_REMOTE\" 2 > /dev/null" #debug
#echo "if ssh $REMOTE_HOST true; then" #debug
#if ssh $REMOTE_HOST "mountpoint -q $MOUNTPOINT_REMOTE"; then ## for when target is external drive
echo "Attempting remote backup..."
if ssh $REMOTE_HOST true; then
# echo "rsync -a $THESIS_DIR/ $THESIS_REMOTE_BACKUP_DIR" #debug
  rsync -a $THESIS_DIR/ $THESIS_REMOTE_BACKUP_DIR
# rsync -anv $THESIS_DIR/ $THESIS_REMOTE_BACKUP_DIR
  echo -en "$?\t" >> $LOGFILE
# echo "rsync -a $THESIS_REPO_DIR/ $THESIS_REPO_REMOTE_BACKUP_DIR" #debug
# rsync -a $THESIS_REPO_DIR/ $THESIS_REPO_REMOTE_BACKUP_DIR	##FIXME: HAD TO DISABLE BACKUP OF THESIS_REPO_DIR BECAUSE REMOTE DRIVE RAN OUT OF STORAGE##
# rsync -anv $THESIS_REPO_DIR/ $THESIS_REPO_REMOTE_BACKUP_DIR
# echo -en "$?\t" >> $LOGFILE	##FIXME: HAD TO DISABLE BACKUP OF THESIS_REPO_DIR BECAUSE REMOTE DRIVE RAN OUT OF STORAGE##
  echo -en "8\t" >> $LOGFILE
else # remote access failed
  echo -en "9\t9\t\n" >> $LOGFILE
  exit 3
fi

# ending newline
echo "" >> $LOGFILE

# report finished
echo "Done. Exit status report:"

# show recent log entries
tail -5 ~/push_thesis_log

## all pau!   )
exit 0
