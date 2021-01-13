#!/bin/bash

docker build -t joaorodrigues .

docker stop joaorodrigues

docker run -d --rm -p 8001:8000 \
       --env-file $HOME/joaorodrigues.env \
       --name joaorodrigues \
       -e DJANGO_STATIC_ROOT=/dkdata/static \
       -v $(pwd)/dkdata:/dkdata \
       joaorodrigues start.sh
