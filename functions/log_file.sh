#!/bin/bash
# Custom log file

# TIMESTAMP=$(date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S")
# printf "%s\n" "$TIMESTAMP"

LOGFILE=bulky.sh.log
RETAIN_NUM_LINES=10

logsetup () {
  TMP=$(tail -n $RETAIN_NUM_LINES $LOGFILE 2>/dev/null) && printf "%s" "${TMP}" > $LOGFILE
  exec > >(tee -a $LOGFILE)
  exec 2>&1
}

log () {
    printf "%s" "[$(date --rfc-3339=seconds)]: $*"
}

logsetup

log hello this is a log 
