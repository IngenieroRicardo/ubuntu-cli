FROM ubuntu:24.04

ENV ttyd_user="Admin"
ENV ttyd_password="123456"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y ttyd

EXPOSE 7681

RUN echo "#!/bin/bash\n" \
         "case \"\$1\" in\n" \
         "   start)\n" \
         "      echo \"$(date): $@\"\n" \
         "      /usr/bin/ttyd -c $ttyd_user:$ttyd_password -p 7681 -W /usr/bin/bash &\n" \
         "      ;; \n" \
         "   stop)\n" \
         "      echo \"$(date): $@\"\n" \
         "      kill -9 $(pgrep -f [ttyd])\n" \
         "      ;; \n" \
         "   restart)\n" \
         "      echo \"$(date): $@\"\n" \
         "      $0 stop\n" \
         "      $0 start\n" \
         "      ;; \n" \
         "   *)\n" \
         "      echo \"Usage: $0 {start|stop|restart}\"\n" \
         "esac\n" \
         "\n" \
         "exit 0\n" > /etc/init.d/ttyd

RUN chmod a+x /etc/init.d/ttyd

CMD /usr/bin/ttyd -c $ttyd_user:$ttyd_password -p 7681 -W /usr/bin/bash

#sudo docker build -t ubuntu-cli .
#sudo docker run -d -p 8006:7681 --name ubuntu-cli ubuntu-cli


