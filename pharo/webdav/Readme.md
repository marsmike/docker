# pharo-webdav
A simple WebDAV Server based on Apache, configured to work with Pharo
Useful as Monticello Server
```
docker run -d \
  --name webdav \
  -h host.domain.com \
  -e VIRTUAL_HOST=host.domain.com \
  -e VIRTUAL_PORT=8082 \
  -e USERNAME=webdav_user \
  -e PASSWORD=webdav_password \
  -p 8082:80 \
  -v /srv/webdav:/var/webdav \
  marsmike/webdav
```
