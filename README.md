# docker_dev_env

## Repository to set docker environment for Ubuntu20.04.

Before install docker, create account for docker.

### Install docker

To install docker engine, use

```
bash install_docker.sh {USER_NAME}
```

where {USER_NAME} is your user name of docker account.

### Install nvidia-docker

If you want to use local GPU device from docker container, install nvidia-docker by

```
bash install_nvidia_toolkit.sh
```

and add an argument (--gpus) when you run the docker container 

```
docker run --gpus=all {IMAGE}
```

where {IMAGE} is the name of your docker image.
