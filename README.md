# h265ize

A [Docker](http://docker.com) image for [h265ize](https://github.com/FallingSnow/h265ize), to make it easy to convert videos to h.265.

[![](https://images.microbadger.com/badges/image/adriel/h265ize.svg)](https://microbadger.com/images/adriel/h265ize)

## Prerequisites

You must have the same NVIDIA drivers and CUDA installed on the host system as are installed in this container. 

```
Driver Version: 520.61.05
CUDA Version: 11.8 
```

You must also [install the NVIDIA container toolkit on the host system](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker), if not already done.

## Getting Started with Docker Compose

```sh
docker-compose up —-build -d
```

Modify the PUID and PGID in the `docker-compose.yml` file as needed.

This is to make sure the container can read/write your input and output directories.

#### How does it work?

Once your container is up and running move or copy a video to your input directory and h265ize will automatically start converting it to h.265 as per your settings. It **won't** convert any files already in the input folder when the docker container is started, only **new/added** files.

A file will appear straight away in the output directory while it's **still** being converted, please wait for it to finish converting before moving it out, or else you'll have a half converted file. In a [future update to h265ize](https://github.com/FallingSnow/h265ize/issues/77) it will append, `.h265tmp` to the end of a file while it's being converted. 

## Optional parameters

You can add your own parameters.

#### Set quality

For example, you may want to change the default quality from 19 to 25 (higher number = lower quality/smaller file)

```sh
(( TO DO ))
```

#### Paths in container

Directory where video files are you want to convert to h.265: `/input`

Directory where converted h.265 videos will be created: `/output`

## Production use

It's [recommended](https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md) to add the NODE_ENV environment variable and Node.js memory limits.

```sh
(( TO DO ))
```

### Info - program versions

[h265ize](https://github.com/FallingSnow/h265ize) - latest code on the master branch as the latest NPM version doesn't support the `--watch` option.

[Node.js ]([https://hub.docker.com/_/node/) - latest version, 7.8.0.

##### Shell access

```sh
docker exec -it nvidia265 /bin/bash
```

##### Logs

```sh
docker logs -f nvidia265
```

#### Versions

10/27/2022 - initial build.

----

Please feel free to leave a comment if you have any questions.