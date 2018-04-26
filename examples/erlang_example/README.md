Docker erlang cluster example

this example starts 4 nodes as 4 docker services, in a stack named
"erlang_example".

Here's what the setup will look like:

Stack deploy
```
--- examples/erlang_example ‹master* M?› » ./stack_deploy.sh 
+ set -e
+ docker stack deploy -c docker-compose.yml erlang_example
Creating network erlang_example_erlangnet
Creating service erlang_example_node3
Creating service erlang_example_node4
Creating service erlang_example_node1
Creating service erlang_example_node2
+ docker stack ls
NAME                SERVICES
erlang_example      4
+ docker service ls
ID                  NAME                   MODE                REPLICAS            IMAGE                   PORTS
kz5pjq8cn5we        erlang_example_node1   replicated          0/1                 erlang_example:latest   
mmhhsrdlih6j        erlang_example_node2   replicated          0/1                 erlang_example:latest   
zozmm792f9ov        erlang_example_node3   replicated          1/1                 erlang_example:latest   
ew4hlfostn15        erlang_example_node4   replicated          1/1                 erlang_example:latest   
+ docker ps -a
+ grep erlang_example_node
1b9b59f94746        erlang_example:latest   "/bin/sh -c 'cd /roo…"   Less than a second ago   Created                                 erlang_example_node1.1.rf0hzg4kuzpekgm4euksx39yn
3328869972bb        erlang_example:latest   "/bin/sh -c 'cd /roo…"   Less than a second ago   Up 1 second                             erlang_example_node4.1.8ujcok7qsj4hqsv9qtuvywjnx
479a3bd915c3        erlang_example:latest   "/bin/sh -c 'cd /roo…"   Less than a second ago   Up 2 seconds                            erlang_example_node3.1.5j3wrkc7ookqkei3nwhtqapkb
--- examples/erlang_example ‹master* M?› » docker ps -a
CONTAINER ID        IMAGE                   COMMAND                  CREATED                  STATUS              PORTS               NAMES
c27ca9fa5ba9        erlang_example:latest   "/bin/sh -c 'cd /roo…"   Less than a second ago   Up 4 seconds                            erlang_example_node2.1.6ah9zqq9nbnpg1zb9kojha4hw
1b9b59f94746        erlang_example:latest   "/bin/sh -c 'cd /roo…"   Less than a second ago   Up 5 seconds                            erlang_example_node1.1.rf0hzg4kuzpekgm4euksx39yn
3328869972bb        erlang_example:latest   "/bin/sh -c 'cd /roo…"   Less than a second ago   Up 7 seconds                            erlang_example_node4.1.8ujcok7qsj4hqsv9qtuvywjnx
479a3bd915c3        erlang_example:latest   "/bin/sh -c 'cd /roo…"   Less than a second ago   Up 8 seconds                            erlang_example_node3.1.5j3wrkc7ookqkei3nwhtqapkb
--- examples/erlang_example ‹master* M?› » 
```

Going into a container and starting a remote shell onto a erlang node:
```
--- examples/erlang_example ‹master* M?› » docker exec -ti erlang_example_node1.1.rf0hzg4kuzpekgm4euksx39yn /bin/sh
/ #  erl -sname test -remsh node@node1 -setcookie cookie
Erlang/OTP 20 [erts-9.3] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:10] [hipe] [kernel-poll:false]

Eshell V9.3  (abort with ^G)
(node@node1)1> nodes().
[node@node3,node@node4,node@node2,test@1b9b59f94746]
(node@node1)2> 
```