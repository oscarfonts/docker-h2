#!/usr/bin/env bash
docker run -v $PWD/h2-data:/opt/h2-data -e H2_OPTIONS=-ifNotExists -d -p 1521:1521 -p 81:81 --name=h2-2.2.224 h2-2.2.224
docker logs -f h2-2.2.224 2>&1
#xdg-open http://localhost:81/
