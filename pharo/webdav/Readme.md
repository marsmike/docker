# pharo-webdav
A simple WebDAV Server based on Apache, configured to work with Pharo
Useful as Monticello Server, secured with username / password.

Works best with jwilder/nginx-proxy Image:

Run the nginx-proxy first:
```
docker run -d \
  --name="nginx-proxy" \
  --restart="always" \
  -p 80:80 \
  -v /srv/gitlab_push.conf:/etc/nginx/conf.d/gitlab_push.conf:ro \
  -v /var/run/docker.sock:/tmp/docker.sock \
  jwilder/nginx-proxy
```

Then run the WebDAV Image:
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

Now you have your own Pharo Monticello Repository on http://host.domain.com secured with webdav_user / webdav_password.
