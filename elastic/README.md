sudo sysctl -w vm.max_map_count=262144
docker-compose -f elastic-cluster.yaml up