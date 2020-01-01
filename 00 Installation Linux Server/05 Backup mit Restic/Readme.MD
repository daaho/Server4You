# Backup mir Restic

## Installation

### Installation Restic

Von Webseite   https://github.com/restic/restic/releases/tag/v0.9.5   die Version
restic_0.9.5_linux_amd64.bz2 herunterladen

wget https://github.com/restic/restic/releases/download/v0.9.6/restic_0.9.6_linux_amd64.bz2

Datei auspacken:   bunzip2 restic_0.9.6_linux_amd64.bz2

Datei kopieren und umbenennen:   cp restic_0.9.6_linux_amd64 /usr/bin/restic
Ausführbar machen:   chmod 755 /usr/bin/restic
restic version

### Installation fuse

yum install -y fuse


## Backup

### Initialisieren des Repo's

restic -r b2:Datensicherung-Daten:/ init
restic -r b2:Datensicherung-Bilder:/ init
restic -r b2:Datensicherung-Musik:/ init


### Backup-Skript

~~~
#!/bin/bash

# Timestamp festlegen
TimeStamp=`date +%Y%m%d_%H%M%S`
LogFileTimeStamp=`date +%Y%m%d_%H%M%S`
export B2_ACCOUNT_ID='siehe KeePass'
export B2_ACCOUNT_KEY='siehe KeePass'
export RESTIC_PASSWORD='siehe KeePass'


#------------------------------------------------------------------------------
#
# Backup WordPress
#
#------------------------------------------------------------------------------
TimeStamp=`date +%Y%m%d_%H%M%S`
Start_Backup=$SECONDS

echo "#------------------------------------------------------------------------------" >> /var/log/restic_backup.log
echo "Start Backup WordPress um $TimeStamp" >> /var/log/restic_backup.log
echo "#------------------------------------------------------------------------------" >> /var/log/restic_backup.log

# Backup WordPress Volume
echo "docker pause wordpress" >> /var/log/restic_backup.log
export RESTIC_REPOSITORY='b2:Datensicherung-Bilder'
docker pause wordpress >> /var/log/restic_backup.log
echo "docker pause wordpress wurde mit ReturnCode $? beendet" >> /var/log/restic_backup.log

echo " " >> /var/log/restic_backup.log
echo "Restic Backup WordPress Volume" >> /var/log/restic_backup.log
restic -r $RESTIC_REPOSITORY --verbose backup /var/lib/docker/volumes/wordpress >> /var/log/restic_backup.log
echo "Ende Restic Backup WordPress Volume wurde mit ReturnCode $? beendet" >> /var/log/restic_backup.log


# Backup der Datenbank
echo " " >> /var/log/restic_backup.log
echo " " >> /var/log/restic_backup.log
echo "#------------------------------------------------------" >> /var/log/restic_backup.log
echo "Backup MariaDB" >> /var/log/restic_backup.log

echo "Erzeugen eines MySQL Dumps" >> /var/log/restic_backup.log
docker exec wordpress-db mysqldump -uroot -pTheologos2019! --all-databases --single-transaction --quick --lock-tables=false  > /opt/Restic_Backup/WordPress-DB/MariaDB-Backup_$LogFileTimeStamp.sql
echo "MySQLDump wurde mit dem ReturnCode $? beendet" >> /var/log/restic_backup.log


echo "Komprimieren des Dumps" >> /var/log/restic_backup.log
bzip2 /opt/Restic_Backup/WordPress-DB/MariaDB-Backup_$LogFileTimeStamp.sql
echo "bzip2 wurde mit dem ReturnCode $? beendet" >> /var/log/restic_backup.log

echo "Backup mit Restic" >> /var/log/restic_backup.log
export RESTIC_REPOSITORY='b2:SGStern-Backup-WordPress-DB'
restic -r $RESTIC_REPOSITORY --verbose backup /opt/Restic_Backup/WordPress-DB >> /var/log/restic_backup.log
echo "Restic Backup wurde mit dem ReturnCode $? beendet" >> /var/log/restic_backup.log

# Backup Directory aufraeumen
# alle Dateien, die aelter als 30 Tage sind, loeschen
echo " " >> /var/log/restic_backup.log
echo "Backup Directory aufraeumen" >> /var/log/restic_backup.log
find /opt/Restic_Backup/WordPress-DB -name "*.bz2" -type f -mtime +30 -exec rm -f {} \;

echo "docker unpause wordpress" >> /var/log/restic_backup.log
docker unpause wordpress >> /var/log/restic_backup.log
echo "docker unpause wordpress wurde mit ReturnCode $? beendet" >> /var/log/restic_backup.log

Backup_Dauer=$(($SECONDS - $Start_Backup))
TimeStamp=`date +%Y%m%d_%H%M%S`
echo " " >> /var/log/restic_backup.log
echo "Ende  Backup WordPress Dauer $Backup_Dauer Sekunden" >> /var/log/restic_backup.log
echo "Ende  Backup WordPress um $TimeStamp" >> /var/log/restic_backup.log
echo " " >> /var/log/restic_backup.log
echo " " >> /var/log/restic_backup.log

tail -100 /var/log/restic_backup.log | mailx -s "SG Stern Backup Log" -r admin@sgstern-kiten.de stefan.hoenes@web.de
~~~

### Aufruf mit cron

Das Backup-Skript wird jeden Dienstag um 4:04 Uhr aufgerufen:

~~~
4 4 * * 2 /usr/local/sbin/backup_wordpress.sh
~~~

### Log-Datei mit logrotate verwalten

Im Verzeichnis /etc/logrotate.d die Datei restic_backup anlegen:

~~~
/var/log/restic_backup.log {
    size 200K
    rotate 10
    missingok
    notifempty
}
~~~

### Zugriff auf die gesicherten Daten

export B2_ACCOUNT_ID='siehe KeePass'
export B2_ACCOUNT_KEY='siehe KeePass'
export RESTIC_PASSWORD='siehe KeePass'

#### WordPress
restic -r b2:SGStern-Backup-WordPress mount /mnt/SGStern-Backup-WordPress &

#### WordPress Datenbank
restic -r b2:SGStern-Backup-WordPress-DB mount /mnt/SGStern-Backup-WordPress-DB &

Wieder freigeben mit:
  umount /mnt/SGStern-Backup-WordPress
  umount /mnt/SGStern-Backup-WordPress-DB
  
