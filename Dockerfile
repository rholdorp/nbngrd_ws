FROM ubuntu:20.04

# VOLUME /home/weewx/weewx.conf

RUN apt update -y 
ENV TZ=Europe/Amsterdam
RUN apt-get install -y tzdata

RUN apt-get install -y rsyslog wget python python3-configobj python3-pil python3-serial python3-usb python3-pip
RUN apt install -y python3-cheetah 
RUN apt install -y mariadb-client 
RUN apt install -y python3-mysqldb 

RUN wget http://weewx.com/downloads/weewx-4.7.0.tar.gz 
RUN tar xvfz weewx-4.7.0.tar.gz
RUN cd weewx-4.7.0 && python3 ./setup.py build
RUN cd weewx-4.7.0 && python3 ./setup.py install --no-prompt

RUN wget -O weewx-interceptor.zip https://github.com/matthewwall/weewx-interceptor/archive/master.zip 

RUN wget -O neowx.zip https://neoground.com/projects/neowx-material/download/latest
RUN /home/weewx/bin/wee_extension --install neowx.zip

RUN /home/weewx/bin/wee_extension --install weewx-interceptor.zip 
RUN /home/weewx/bin/wee_config --reconfigure --driver=user.interceptor --no-prompt

CMD /usr/sbin/rsyslogd && /home/weewx/bin/weewxd && /home/weewx/weewx.conf


