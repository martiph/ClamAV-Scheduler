SCAN_PATH="/"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_PATH="/var/log/clamav/$TIMESTAMP-scheduled_scan.log"
QUARANTINE="/home/philip/quarantine"

clamdscan --fdpass $SCAN_PATH --log=$LOG_PATH --copy=$QUARANTINE
