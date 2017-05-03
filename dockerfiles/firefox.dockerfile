FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get install -y xpra pulseaudio gstreamer1.0-plugins-ugly gstreamer1.0-pulseaudio gstreamer1.0-plugins-base dbus
RUN apt-get install -y firefox

RUN useradd -m -d /home/user user

USER user

WORKDIR /home/user

EXPOSE 5050

CMD ["xpra", "start", ":0", "--pulseaudio=yes", "--bind-tcp=0.0.0.0:5050", "--start-child=/usr/bin/firefox", "--exit-with-children", "--daemon=off", "--mdns=off", "--dbus-proxy=yes"]
