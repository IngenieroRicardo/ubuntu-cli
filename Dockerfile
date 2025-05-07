FROM ubuntu:20.04

ENV ttyd_user="Admin"
ENV ttyd_password="123456"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y wget
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.i686
RUN chmod a+x ttyd.i686

EXPOSE 7681

CMD ./ttyd.i686 -c $ttyd_user:$ttyd_password -p 7681 -W /usr/bin/bash

#sudo docker build -t ubuntu-cli .
#sudo docker run -d -p 8006:7681 --name ubuntu-cli ubuntu-cli
