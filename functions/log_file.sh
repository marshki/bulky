#!/bin/bash
# Custom log file

LOGFILE=bulky.sh.log
RETAIN_NUM_LINES=10

# log_setup: output num of lines from "RETAIN" and send to /dev/null
#          : print output of variable to "LOGFILE" 
#          : within process append output to file (do not overwrite) 
#          : within process redirect standard error to standard out 

log_setup () {
  TMP=$(tail -n $RETAIN_NUM_LINES $LOGFILE 2>/dev/null) && printf "%s\n" "${TMP}" > $LOGFILE
  exec > >(tee -a $LOGFILE)
  exec 2>&1
}

log () {
    printf "%s\n" "[$(date)]: $*"
}

log_setup

log larry 
log moe 
log curly
log shemp
log curly joe

#log bleh
#log hello this is a log
#log hello this is a log, too
#log hello this is a log, three
#log hello this is a log, four
#log hello this is a log, five
#log bleh, bleh
#log hello this is a log, six
#log hello this is a log, seven
#log hello this is a log, eight
#log hello this is a log, nine
#log hello this is a log, ten
