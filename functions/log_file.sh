#!/bin/bash
# Custom log file

LOGFILE=bulky.sh.log
RETAIN_NUM_LINES=10

logsetup () {
  TMP=$(tail -n $RETAIN_NUM_LINES $LOGFILE 2>/dev/null) && printf "%s\n" "${TMP}" > $LOGFILE
  exec > >(tee -a $LOGFILE)
  exec 2>&1
}

log () {
    printf "%s\n" "[$(date)]: $*"
}

logsetup

log bleh
log hello this is a log
log hello this is a log, too
log hello this is a log, three
log hello this is a log, four
log hello this is a log, five
log bleh, bleh
log hello this is a log, six
log hello this is a log, seven
log hello this is a log, eight
log hello this is a log, nine
log hello this is a log, ten
