FROM ubuntu:24.04

ENV ttyd_user="Admin"
ENV ttyd_password="123456"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y ttyd

EXPOSE 7681

CMD /usr/bin/ttyd -c $ttyd_user:$ttyd_password -p 7681 -W /usr/bin/bash

#sudo docker build -t ubuntu-cli .
#sudo docker run -d -p 8006:7681 --name ubuntu-cli ubuntu-cli


