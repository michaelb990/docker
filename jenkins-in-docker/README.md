jenkins in docker
==================

To start, set up [docker](https://docs.docker.com/engine/installation/) and [docker-compose](https://docs.docker.com/compose/install/).

From the `jenkins-in-docker` directory, run the following command to build and run the Jenkins master and workers.

```sh
$ docker-compose up
```

Navigate to the docker host, port 8080, and you should see the Jenkins UI. On Ubuntu, this should be localhost. On a Mac, you can run `docker-machine ip` to find the IP of the docker host.

### Troubleshooting
* [Mac OS] Is docker setup correctly?
```sh
$ eval "$(docker-machine env <env_name>)"
```
