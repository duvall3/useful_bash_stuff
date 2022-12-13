#!/bin/bash
# svnadd -- run 'svn add' on the *untracked* files in a directory
# Usage: svnadd [DIRECTORY]

# help check
USAGE="svnadd [DIRECTORY]"
if [[ $1 =~ "-h" ]]; then
  echo $USAGE
  exit 10
fi

# init
SVN=$(which svn)
AWK=$(which awk)
AWK=${AWK:-$(which gawk)}
AWK=${AWK:-$(which mawk)}

# program check
if ! type $SVN 2>&1 > /dev/null; then
  echo "Error: Subversion (svn) not found."
  exit 5
fi
if ! type $AWK 2>&1 > /dev/null; then
  echo "Error: AWK interpreter not found."
  exit 5
fi

# main
ORIG_DIR=$(pwd)
TARGET_DIR=${1:-$(pwd)}
TARGET_DIR=$(echo $TARGET_DIR | sed 's_/$__')
if ! [ -d $TARGET_DIR ]; then
  echo "Error: Directory '$TARGET_DIR' not found."
  exit 3
fi
cd $TARGET_DIR
FILES=($($SVN st | $AWK '$1 ~ /?/ {print $2}'))
svn add ${FILES[*]}
# echo "svn add ${FILES[*]}" #debug
EXIT_CODE=$?
cd $ORIG_DIR


# all pau!   )
exit $EXIT_CODE
