# pharojenkins
Jenkins Docker Image loaded with Pharo 40 prerequisites

Example:

docker run -d \
  --name pharojenkins \
  -h hostname.domain.org \
  -e VIRTUAL_HOST=hostname.domain.org \
  -e VIRTUAL_PORT=8080 \
  -p 8080:8080 \
  -p 50000:50000 \
  -v /srv/jenkins_data:/var/jenkins_home \
  marsmike/pharojenkins
