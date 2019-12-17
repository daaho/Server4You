# Anpassung des sshd-Service

Log in to the server as root using SSH.

## Abändern der sshd-Konfiguration

Open the /etc/ssh/sshd_config file in your preferred text editor (nano, vi, etc.).

### Kein Anmelden mit root erlaubt

Locate the following line:
PermitRootLogin yes
Modify the line as follows:

PermitRootLogin no

### Keine Anmeldung mit Passwort erlaubt

ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM yes

## Neustart des sshd-Service

systemctl restart sshd
