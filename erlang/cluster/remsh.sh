#!/bin/bash
docker exec -ti $1 erl -name maint -setcookie cookie -remsh $2
