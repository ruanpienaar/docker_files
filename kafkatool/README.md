Setting up linux

```
check sshd config and allow xforwarding
xhost +SI:localuser:root
```

```
docker run --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/run/docker.sock:/var/run/docker.sock kafkatool:latest
```