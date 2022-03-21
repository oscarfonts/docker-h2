#!/usr/bin/env bash
docker run -v $PWD/h2-data:/opt/h2-data -d -p 1521:1521 -p 81:81 --name=h2 h2
docker logs -f h2 2>&1
#xdg-open http://localhost:81/
