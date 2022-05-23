# Useful BASH Stuff -- Tips, Tricks, & Other Delights
# ==================================================================

### Note: This is simply a copy of main.txt, renamed for easier syntax highlighting

# Favorites
# ~~~~~~~~~


# #0: tab completion & command history: if you're reading this document, you hopefully already know about these

# #1: <Alt+.> -- argument history: paste recent arguments
#   -- example: starting work on a new shell script: "touch reallylongfilename.sh; chmod 755 <Alt+.>; vim <Alt+.>"

# #2: arrow-key command history search -- <up/down> : search/scroll command history *by matching string*
#   -- waaay better than default behavior
#   -- short instructions: use the .inputrc given in the "newhome" directory of this repository
#   -- e.g., get the last command you used beginning with the letter "f":   user@host:~$ f<UPARROW>

# #3: <Ctrl+/> -- "undo" for your command line -- works on typing, pasting, history search, pretty much everything!

# -- It's worth noting that all my top favorites listed so far are part of the GNU Readline library. Thanks, readline!!!


# In no particular order:

# quickly & easily add current folder to path:
PATH=$(pwd):$PATH

# find broken symlinks: use option '-xtype l'
#   -- example: find all broken symlinks under the current user's $HOME directory:
'find ~ -xtype l'

# ssh escape control: terminate frozen ssh connection via "<Return>~."

# terminate other login (e.g., frozen shell session):
pkill -9 -t <tty>

# "target" option for copy & move: "cp -t <target_directory> <file1> [file2 file3 ...]" (same for "mv")
#   -- this helps prevent mixups when copying/moving multiple files (or directories)
#   -- especially useful when piping multiple files into cp/mv, since some piping syntaxes will screw up the order

# find | xargs -- find files matching given criteria & operate on them; basic syntax is "find [path] [expression] -print0 | xargs -0 <command>"
#   -- books have been written on this, but as a very basic example, to find all files in your home folder
#     that have been accessed/modified in the last 15 minutes and print their stats:
find ~ -cmin -15 -print0 | xargs -0 stat 

# rename tool for multiple files: rename s/<pattern1>/<pattern2>/[flags] <files>
#   -- example: rename all .png files in current directory to have any spaces in their names replaced with underscores:
rename s/" "/_/g *.png

# BASH parameter expansion -- suffixes via ${%}:
#   -- similar to "basename" command, but in param-expansion implementation
#   -- example: make OGG Vorbis versions of all MP3 files in a directory:
for FILE in *.mp3; do
  ffmpeg -i $FILE ${FILE%mp3}ogg
done

# BASH regular-expression-matching operator (a.k.a. "BASH_REMATCH"): "<STRING> =~ <REGEX>"
#   -- tests whether STRING matches to REGEX
#   -- allows user to utilize regular expressions without needing to invoke grep, awk, perl, etc.
#   -- example: test whether current WiFi network is either "MyHomeWiFi-2G" or "MyHomeWiFi-5G":
WIFI_NAME=$(iwconfig | grep -o "ESSID:.*" | grep -o "\".*\"" | tr -d \")
if [[ $WIFI_NAME =~ MyHomeWiFi-[25]G ]]; then
  echo "Connected to Home WiFi network."
else
  echo "Connected to non-Home WiFi network."
fi

# just for fun: regex that finds c++ function declarations / definitions:
#      ^\s*\([[:alnum:]]\+\**\s\+\)\+[[:alnum:]]\+(
 
 
 
# Aliases
# ~~~~~~~~~~
 
# Just a few of my favorites, including some originals of my own.
# Simply add the lines you like to your .bashrc or .bash_aliases file

# "eq" = "echo exit status"
alias eq='echo $?'

# "cdl" = "change directory -- last": cd into the most recently-changed directory
alias cdl='cd $(ls -dt1 */ | head -1)'

# "ifecho" = "echo test results": for use with BASH tests
# -- ex.: if [ -f main.txt ]; ifecho
alias ifecho='then echo yes; else echo no; fi'

# "dus" = "disk-usage sort": sort by disk usage
alias du="du -h"
alias dus="du -s * | sort -h"

# "lc" = "line count": count lines (especially useful with pipes)
alias lc="wc -l"

# "fh" = "find hidden"
alias fh='find . -maxdepth 1 -name "\.?*" | sed s_^\./__'

# "fhf" = "find hidden files"
alias fhf='find . -maxdepth 1 -name "\.?*" -type f | sed s_^\./__'

# "fhd" = "find hidden directories"
alias fhd='find . -maxdepth 1 -name "\.?*" -type d | sed s_^\./__'

# "lst" = "list text": list text files (requires "file" and "awk")
alias lst="file * | 'grep' text | awk -F : '{print \$1}'"

# "lse" = "list extensions": print an alphabetized count of all file extensions found in the current directory
#  -- bonus -- add the second line to sort the list by number of files with 'lses'
alias lse="ls | $(which grep) -E \".*\..*\" | $(which grep) -Eo \"\..*\" | sort | uniq -c | awk '{print \"\t\" \$1 \"\t\" \$2}'" # ls extensions
alias lses='lse | sort -nr'

# "ndw" = "network devices, wireless": scan available wireless networks and list by signal strength
alias ndw='nmcli device wifi'

# "netdev" = "network devices": show status of network interfaces
alias netdev='nmcli device status'



# Vim
# ~~~~~~~~~~

# jump to line N: in normal mode, ":N"

# jump to matching bracket / quotation mark: works for all ([{"' : in normal mode, "%"

# search forward / backward for word under cursor: in normal mode, "*" / "#"

# paragraph skip forward / backward by empty lines: in normal mode, "}" / "{"

# repeat input: in normal mode, "." will repeat everything you typed the last time you were in input mode
# -- can be prefixed with a number for repetition
# -- example: normal mode -> "i" -> type a template for some records you want to enter -> <Esc> -> "5."
#     --> now you have 5 copies of your template, and you can just go fill in the blanks

# autocomplete: in insert mode, "<Ctrl+N>" (next) to start at top of list or "<Ctrl+P>" (previous) to start at bottom of list

# count number of matches for <pattern>: in normal mode, ":%s/<pattern>//gn"

# ask for confirmation each time replacing <pattern1> with <pattern2>: in normal mode, ":%s/<pattern1>/<pattern2>/gc"

# special characters: in insert mode, <Ctrl+k> -> mod key -> letter
# -- example: <Ctrl+k>'e --> é

# Vim block insert/delete: use 
# block insert: in normal mode, <Ctrl+V> -> highlight block using arrow keys -> <Shift+I> -> type -> <Esc>
# block delete:          "         "                       "                 -> x (delete) or d (cut)

# quick command: while in insert mode, <Ctrl+O> -> "command"
# -- vim will execute a single command, then drop you back into insert mode
# -- example: this is great for saving while editing: <Ctrl+O>:w<Enter> will save your work, then you can resume instantly

# indent / de-indent: in both Normal AND Visual mode: ">>" or "<<"
# -- this works great with highlighting lines in Visual mode (Ctrl+V followed by up/down to highlight lines)
# -- in Normal mode, this can be preceeded by the number of lines -- i.e., "5>>" will indent 5 lines

# search for NOT matching a pattern:
# -- in Normal mode: /<pattern>\@!
# -- example: lines that aren't comments in, say, BASH -- i.e., lines NOT beginning with "#":
#    /^#\@!

# file/buffer management:
# - list open files: in Normal mode, ':ls', ':files', or ':buffers'
# - close current file/buffer: in Normal mode, ':bd'
# - edit last open file/buffer: in Normal mode, ':e #' or 'CTRL-^'
# - edit next (previous) file/buffer: in Normal mode, ':bn' (':bN')
# - edit Nth open file/buffer: in Normal mode, ':Nb' or 'NCTRL-^'
