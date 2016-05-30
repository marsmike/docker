# pharojenkins
Jenkins Docker Image loaded with Pharo 40 prerequisites

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

Then run the Jenkins Server:
```
docker run -d \
  --name pharojenkins \
  -h hostname.domain.org \
  -e VIRTUAL_HOST=hostname.domain.org \
  -e VIRTUAL_PORT=8080 \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /srv/jenkins_data:/var/jenkins_home \
  marsmike/pharo-jenkins
```

And there you go, a nice jenkins server which can run Pharo 4.0 / 5.0 Jobs.
