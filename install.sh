#! /bin/bash

cp ./ClamAV.service /etc/systemd/system/
cp ./ClamAV.timer /etc/systemd/system/

if [[! -d /opt/scripts/]];then
	mkdir --parents /opt/scripts/
fi

cp ./periodic-clamscan.sh /opt/scripts/

