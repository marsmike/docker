# pharonvc
Run Pharo in a Docker Container with Display exported via VNC

1. Use / Download Pharo Installation on a docker data volume:

/srv/pharovnc:>  wget get.pharo.org/50+vm 

2. Then run the Pharo VNC Server:

```
docker run -d \
  --name pharonvc \
  -p 58901:5901 \
  -v /srv/pharovnc:/var/lib/pharo/
  marsmike/pharo-vnc
```

ToDo: SSH Tunneling and much more
