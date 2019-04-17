#!/bin/bash
# Custom log file

LOGFILE=bulky.sh.log
RETAIN_NUM_LINES=10

logsetup () {
  TMP=$(tail -n $RETAIN_NUM_LINES $LOGFILE 2>/dev/null) && printf "%s" "${TMP}" > $LOGFILE
  exec > >(tee -a $LOGFILE)
  exec 2>&1
}

log () {
    printf "%s\n" "[$(date)]: $*"
}

logsetup

log hello this is a log 
