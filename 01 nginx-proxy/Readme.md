# Installation ngix-proxy und lets-encrypt-proxy-companion

Basiert auf folgender Anleitung: <https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion>


## nginx-proxy

docker run --detach --name nginx-proxy --publish 80:80 --publish 443:443 \
  --volume certs:/etc/nginx/certs \
  --volume vhost.d:/etc/nginx/vhost.d \
  --volume html:/usr/share/nginx/html \
  --volume /var/run/docker.sock:/tmp/docker.sock:ro \
  jwilder/nginx-proxy

### nginx-proxy mit weiteren Netzwerken verbinden

network connect nextcloud nginx-proxy
network connect nextcloud-test nginx-proxy

Damit hat der Proxy Container neben dem Default-Network "bridge" auch noch Zugriff auf die weiteren Netzwerke

## letsencrypt-nginx-proxy-companion

docker run --detach --name nginx-proxy-letsencrypt \
  --volumes-from nginx-proxy \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  jrcs/letsencrypt-nginx-proxy-companion

## Test Web Server

docker run --detach --name web \
  --env "VIRTUAL_HOST=sgstern-kiten.de" \
  --env "LETSENCRYPT_HOST=sgstern-kiten.de" \
  --env "LETSENCRYPT_EMAIL=stefan.hoenes@gmx.de" \
  --volume /root/web/:/usr/share/nginx/html \
  nginx
