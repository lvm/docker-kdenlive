# docker-kdenlive

A container for [kdenlive](https://kdenlive.org/), a free and open-source video editor for GNU/Linux.

# How to 

## Install

### Stable
```bash
$ docker pull lvm23/kdenlive
```
### Unstable
```bash
$ docker pull ark74/kdenlive
```
(this might change in the future)

or 
## Build

### Stable
```bash
$ git clone https://github.com/lvm/docker-kdenlive && \
  cd docker-kdenlive && \
  docker build -t kdenlive .
```

### Unstable
```bash
$ git clone https://github.com/Ark74/docker-kdenlive && \
  cd docker-kdenlive && \
  docker build -t kdenlive .
```

## Run


### Stable
```bash
$ docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/Videos:/videos -e DISPLAY=unix$DISPLAY --name knl kml2/kdenlive
```

### Unstable
```bash
$ docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/Videos:/videos -e DISPLAY=unix$DISPLAY --name knl ark74/kdenlive
```
  

`-v $HOME/videos:/videos` is used to mount the container's `/videos` directory to the host `$HOME/kdenlive` directory, you can choose other directory.    
Note: probably you *might* also need to execute `xhost local:root` or `xhost +my-computer-hostname.local`.

## Devices
You might wanna use the device options to enable sound and hw acceletarion on graphic cards (Intel only), since you'll be editing video on this software:

 `--device=/dev/dri`
 
Also sound is an option, for ALSA:

 `--device=/dev/snd`
 
note that sound might get disabled on your host machine until you close the container.
