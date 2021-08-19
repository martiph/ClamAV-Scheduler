#! /bin/bash

CLAM_DIR="/opt/custom_clamscan"
CLAM_QUARANTINE="/opt/custom_clamscan/quarantine"
CLAM_INFECTED="/var/log/clamav/infected_files.log"

if [! -d $CLAM_DIR ];then
	mkdir --parents $CLAM_DIR
	mkdir $CLAM_QUARANTINE
fi

if [ -d $CLAM_QUARANTINE ];then
	mkdir --parents $CLAM_QUARANTINE
fi

cp ./custom_clamscan.sh "$CLAM_DIR/"
cp ./infected.log $CLAM_INFECTED
cp ./ClamAV.service /etc/systemd/system/
cp ./ClamAV.timer /etc/systemd/system/

chmod 711 "$CLAM_DIR/custom_clamscan.sh"
