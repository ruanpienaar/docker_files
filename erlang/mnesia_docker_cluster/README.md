# Mnesia Cluster example with docker-compose

Start X containers to form a mnesia cluster inside containers.
Each container houses a erlang node running mnesia that's connected
to all the other database nodes.

## Getting started

1. generate the required files for the cluster.
- erlang app/sys.config file
- docker-compose.yml

```
$ ./generate_cluster_files.esh NUMBER_OF_NODES
```

2. deploy the docker stack
```
$ stack_deploy.sh
```

cluster.sys.config is used as the running config, and template.sys.config as the
template for generating the cluster.sys.config.

To See Mnesia Info:
docker logs CONTAINER_ID