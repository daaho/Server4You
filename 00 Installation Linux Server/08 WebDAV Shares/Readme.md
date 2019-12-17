# Einbinden weiterer Shares über WebDAV

Für ein Bilder-Archiv werden Shares von bestehenden WebDAV Servern mit eingebunden. Z.B.
ein 1 TB Share ka5411-273@online.de

 

mkdir /mnt/Bilder_Archiv

 

Datei /etc/davfs/secrets bearbeiten:

~~~
# Credential Line
# ---------------
# A credential line consists of the mount-point, the user-name and
# the password. The mount-point must be an absolute path, starting
# with /. The password may be omitted.
# For compatibility with older versions, instead of the mount-point
# the URL may be given. The URL must contain scheme, fully qualified
# domain name and path. If the path segment is missing, / is assumed.
/mnt/Bilder_Archiv              ka5411-273@online.de    SGSternKiten2019!
~~~

Unter /usr/local/sbin wird die Datei   mount_davfs.sh   mit folgendem Befehl angelegt:

~~~
#!/bin/bash
sleep 60
mount -t davfs -o noexec https://sd2dav.1und1.de/ /mnt/Bilder_Archiv/ > /tmp/mount_davfs.log
~~~

und mit chmod 755 /usr/local/sbin/mount_davfs.sh   ausführbar gemacht

mit crontab -e wird folgender Eintrag hinzugefügt:
	
@reboot   /usr/local/sbin/mount_davfs.sh
 

