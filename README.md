docker-h2
=========

Dockerized H2 database service.


## Features

* Based on [the `OpenJDK` official image](https://hub.docker.com/r/_/openjdk/)
* H2-DATA location on `/opt/h2-data`
* A mix of [zhilvis/docker-h2](https://github.com/zhilvis/docker-h2) and [zilvinasu/h2-dockerfile](https://github.com/zilvinasu/h2-dockerfile).

## 2.x.xxx

There are many changes in this major version, including changes in the
information schema tables. An option has been added to the `h2.server.properties`
for convenience to allow you to use the information schema from v1 since it is
difficult to find information about this online (`OLD_INFORMATION_SCHEMA=true`).

Note the use of this property in the constructor of https://github.com/h2database/h2database/blob/master/h2/src/main/org/h2/engine/SessionRemote.java


## Trusted builds

[Automated builds](https://hub.docker.com/r/oscarfonts/h2/) on [docker registry](https://registry.hub.docker.com/):

* [`latest`, `2.2.224` (*2.2.224/Dockerfile*)](https://github.com/oscarfonts/docker-h2/blob/master/2.2.224/Dockerfile)
* [`2.2.224` (*2.2.224/Dockerfile*)](https://github.com/oscarfonts/docker-h2/blob/master/2.2.224/Dockerfile)
* [`2.1.210` (*2.1.210/Dockerfile*)](https://github.com/oscarfonts/docker-h2/blob/master/2.1.210/Dockerfile)
* [`2.0.204` (*2.0.204/Dockerfile*)](https://github.com/oscarfonts/docker-h2/blob/master/2.0.204/Dockerfile)
* [`1.4.199` (*1.4.199/Dockerfile*)](https://github.com/oscarfonts/docker-h2/blob/master/1.4.199/Dockerfile)
* [`1.1.119` (*1.1.119/Dockerfile*)](https://github.com/oscarfonts/docker-h2/blob/master/1.1.119/Dockerfile)
* [`alpine` (*alpine/Dockerfile*)](https://github.com/oscarfonts/docker-h2/blob/master/alpine/Dockerfile)
* [`geodb` (*geodb/Dockerfile*)](https://github.com/oscarfonts/docker-h2/blob/master/geodb/Dockerfile)


## Running

Get the image:

```
docker pull oscarfonts/h2
```

Run as a service, exposing ports 1521 (TCP database server) and 81 (web interface) and mapping DATA_DIR to host:

```
docker run -d -p 1521:1521 -p 81:81 -v /path/to/local/data_dir:/opt/h2-data --name=MyH2Instance oscarfonts/h2
```

Or run as a service with an extra custom config set in the command line, like allowing to create database at connection:

```
docker run -d -p 1521:1521 -p 81:81 -v /path/to/local/data_dir:/opt/h2-data -e H2_OPTIONS=-ifNotExists --name=MyH2Instance oscarfonts/h2
```

By the way, please, be aware about the fact, that the option `-ifNotExists` is not available in docker image `1.1.119`, take a look
into [this issue](https://github.com/h2database/h2database/issues/1894).

The H2 web console will be available at: http://localhost:81

See the logs while running:

```
docker logs -f MyH2Instance
```

## Access H2 via CLI:

If you want to access the H2 database via CLI, there is a shell script, named `h2cli`, that launches H2 Shell. It is already in the `$PATH`, so you do not need to cd to anywhere. The connection details are specified by the means of options:

* `-u` or `--user` - the user under which to login into H2 db. Default: `sa`.
* `-d` or `--dbname` - the database which we want to connect to via CLI. Default: `test`.
* `-p` or `--port` - the connection port. Default: `1521`.

Note: h2 cli is available in all images except `alpine` based
