# NextCloud

## Zusätzliche Module

 * OnlyOffice
 * Draw.io
 * MindMap
 * Camera RAW Previews
 * GpxMotion
 * Maps
 * External Storage support

## Benutzerverwaltung

Admins:

  a_stefan
  
  a_sgstern

Benutzer:
  - stefan
  

## Anpassungen

### Einbinden externen WebDAV Shares für Bilder Archiv

 - Im NextCloud Admin-Bereich die App "External Storage Support" aktivieren
 - Dann unter NextCloud Einstellungen --> Verwaltung --> "Externe Speicher" einen Eintrag erstellen
   * Name: Bilder_Archiv
   * Typ WebDAV
   * Benutzername: <siehe KeePass>
   * Zugangspukt: https://sd2dav.1und1.de und / als Subdir
   * Passwort: <siehe KeePass>
   * Bei erweitere Parameter: Schreibgeschützt anklicken
   
   

## Kopieren von Dateien in den Container

z.B. den Ordner../ELO mit allen Subdirs in das Verzeichnis .../Interpreten/ELO/...

docker cp /tmp/Musik/Interpreten/ELO nextcloud:/var/www/html/data/Musik/files/Musik/Interpreten


## Rescan der Dateien

z.B. für den Benutzer "Musik"

docker exec -u www-data nextcloud php occ files:scan Musik
