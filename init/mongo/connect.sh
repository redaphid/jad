#!/bin/bash

docker run -it --link $1:mongo --rm mongo sh -c 'exec mongo -host mongo'
