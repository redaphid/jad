#!/bin/bash

docker run -it --link $1:redis --rm redis sh -c 'exec redis-cli -h redis'
