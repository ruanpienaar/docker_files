Files required/checked

/etc/ssh/sshd_config
```
...
X11Forwarding yes
...
```

/etc/ssh/sshrc
```
# example sshrc file
if read proto cookie && [ -n "$DISPLAY" ]; then
         if [ `echo $DISPLAY | cut -c1-10` = 'localhost:' ]; then
                 # X11UseLocalhost=yes
                 echo add unix:`echo $DISPLAY |
                     cut -c11-` $proto $cookie
         else
                 # X11UseLocalhost=no
                 echo add $DISPLAY $proto $cookie
         fi | xauth -q -
fi
```


Docker commands
```
sudo docker build -t gui-app .
sudo docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" gui-app
```