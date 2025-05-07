FROM ubuntu:20.04

ENV ttyd_user="Admin"
ENV ttyd_password="123456"

ENV DEBIAN_FRONTEND=noninteractive

RUN if ! [ -f /ttyd.i686 ]; then \
       apt-get update; \
       apt-get install -y wget; \
       wget https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.i686; \
       chmod a+x ttyd.i686; \
    fi

EXPOSE 7681

CMD ./ttyd.i686 -c $ttyd_user:$ttyd_password -p 7681 -W /usr/bin/bash

#sudo docker build -t ubuntu-cli .
#sudo docker run -d -p 8006:7681 --name ubuntu-cli ubuntu-cli
