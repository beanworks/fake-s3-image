fake-s3
=======

Dockerfile for
[beanworks/fake-s3](https://registry.hub.docker.com/u/beanworks/fake-s3/).

Deploys Beanworks' fork of [fake-s3](https://github.com/beanworks/fake-s3) in a Docker container.

Service exposed on port 4569.  Credentials are ignored.

If you want fake-s3 to be exposed on your Docker host on port 4569, then:

```sh
docker run --name my_s3 -p 4569:4569 -d lphoward/fake-s3
```

If you want the container to use a volume, then:

```sh
docker run --name my_s3 -v /fakes3_root -d lphoward/fake-s3
```

The fake-s3 root directory will then be added as a volume on the Docker host.  To get the volume:

```sh
docker inspect --format "{{range .Mounts}}{{.Source}}{{end}}" my_s3
```
