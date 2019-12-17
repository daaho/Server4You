# Anlegen eines neuen Benutzers

## Anlegen des Benutzers

adduser stefan

## Passwort vergeben

passwd stefan

## ssh Key anlegen

 * Im Verzeichnis /home/stefan das Subdirectory /home/stefan/.ssh anlegen
 * hier eine Datei authorized_keys mit dem Public Key von stefan erzeugen
 * Rechte auf 600 und Owner auf stefan:stefan setzen
 
## Benutzer stefan in Gruppe wheel mit aufnehmen

(diese Gruppe wheel hat unter CentOS immer root-Rechte)
 
 usermod -aG wheel stefan