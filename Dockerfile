FROM debian:unstable
MAINTAINER Mauro <mauro@sdf.org>

RUN apt-get update \
	&& apt-get install -yq kdenlive wget unzip \
	libavformat57 libavdevice57 \
	libavcodec-extra57 \
	libavcodec-extra libpostproc54 \
	libswscale4 libmp3lame0 \
	libxvidcore4 libx264-148 \
	--no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /videos

ENTRYPOINT ["kdenlive"]
