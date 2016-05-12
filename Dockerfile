FROM debian:jessie
MAINTAINER Mauro <mauro@sdf.org>

COPY ["etc/apt/sources.list.d/backports.list", "/etc/apt/sources.list.d/backports.list"]

RUN apt-get update \
    && apt-get install -yq kdenlive wget unzip \
	libavformat-ffmpeg56 libavdevice-ffmpeg56 \
	libavcodec-ffmpeg-extra56 \
	libavcodec-extra libpostproc-ffmpeg53 \
	libswscale-ffmpeg3 libmp3lame0 \
        libxvidcore4 libx264-142 \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /videos

ENTRYPOINT ["kdenlive"]
