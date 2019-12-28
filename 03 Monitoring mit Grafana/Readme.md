### Installation eines Grafana / Prometheus Monitoring Stack

1. Erzeugen der Umgebungsvariablen

export GRAFANA_USERNAME=<user>

export GRAFANA_PASSWORD=<geheimesPasswort>

2. Erzeugen der Docker Volumes

* docker volume create grafana
* docker volume create prometheus

3. Grafana: Prometheus datasource hinzufügen

http://prometheus:9090