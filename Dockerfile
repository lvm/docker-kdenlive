FROM debian:unstable
MAINTAINER Mauro <mauro@sdf.org>
MAINTAINER Luis Guzman <ark@switnet.net>

RUN apt-get update \
    && apt-get install -yq kdenlive wget unzip \
	libavformat57 libavdevice57 \
	libavcodec-extra57 \
	libavcodec-extra libpostproc54 \
	libswscale4 libmp3lame0 \
    libxvidcore4 libx264-148 \
	frei0r-plugins \
	breeze-icon-theme \
	dvdauthor \
	vlc \
	genisoimage \
	libgl1-mesa-dri \
--no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /videos

RUN apt update -qq \
	&& apt install -qy libgl1-mesa-dri

RUN apt-get update \
	&& apt-get -qyy install dbus \
	dbus-x11 \
	libapparmor1 \
	libbsd0 \
	libdbus-1-3 \
	libexpat1 \
	libx11-6 \
	libx11-data \
	libxau6 \
	libxcb1 \
	libxdmcp6

RUN rm -f /var/lib/dbus/machine-id
RUN mkdir -p /var/run/dbus
RUN service dbus restart \
	&& service dbus status \
	&& export $(dbus-launch) \
	&& export NSS_USE_SHARED_DB=ENABLED \
	&& echo "-- INFO: DBUS_SESSION_BUS_ADDRESS=${DBUS_SESSION_BUS_ADDRESS}" \
	&&  echo "-- INFO: DBUS_SESSION_BUS_PID=${DBUS_SESSION_BUS_PID}"

ENTRYPOINT ["kdenlive"]
