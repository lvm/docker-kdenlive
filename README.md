# docker-kdenlive (unstable Branch)

A container for [kdenlive](https://kdenlive.org/), a free and open-source video editor for GNU/Linux.

# how to 

## install

```bash
$ docker pull lvm23/kdenlive
```

or 

```bash
$ git clone https://github.com/lvm/docker-kdenlive && \
  cd docker-kdenlive && \
  docker build -t kdenlive .
```

## run

```bash
$ docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/Videos:/videos -e DISPLAY=unix$DISPLAY --name knl kdenlive
```
  

`-v $HOME/videos:/videos` is used to mount the container's `/videos` directory to the host `$HOME/kdenlive` directory, you can choose other directory.    
Note: probably you *might* also need to execute `xhost local:root` or `xhost +my-computer-hostname.local`.
