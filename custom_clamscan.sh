#!/bin/bash

# This script runs a complete anti-malware scan using the well-known anti-malware scanner ClamAV.
# Signature updates are configured to be done on a daily base, so there's no need to update them here.
# Infected files are copied into a quarantine folder, a list with infected files is available (including their first discovery date)

SCAN_DIR="/"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="/var/log/clamav/clamscan_scheduled_$DATE.log"
QUARANTINE="/var/clamav/quarantine/"
INFECTED="/var/log/clamav/infected_files.log"

if [ ! -d $QUARANTINE ]; then
	mkdir --parents $QUARANTINE
fi

clamdscan --reload
clamdscan $SCAN_DIR --copy=$QUARANTINE --log=$LOG_FILE --multiscan --fdpass


FINDINGS=$(grep -P " FOUND" $LOGFILE | awk '{ printf "%s\t%s\n",$2,$1 }' | sed 's/://')
for FINDING in $FINDINGS;do
	echo -e "$DATE\t$FINDING" >> $INFECTED
done
