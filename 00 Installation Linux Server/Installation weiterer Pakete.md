# Grundinstallation des Linux Server

## Konfiguration der Zeitzone

timedatectl set-timezone Europe/Berlin

## Upgrade und Installationer weiterer Pakete

yum upgrade -y

yum install -y epel-release

yum -y install net-tools bind-utils telnet git yum-cron tcpdump davfs2 \
  mc unzip bzip2 mailx
