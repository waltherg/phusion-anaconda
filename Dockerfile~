
FROM phusion/baseimage:latest
MAINTAINER phusion "info@phusion.nl"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive  apt-get upgrade -y

ADD .profile /root/.profile
ADD .prompt /root/.prompt
ADD .bashrc /root/.bashrc
ADD .aliases /root/.aliases

RUN DEBIAN_FRONTEND=noninteractive  apt-get install -y aria2
RUN aria2c -s 16 -x 16 -k 30M http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-1.9.1-Linux-x86_64.sh -o Anaconda.sh
RUN bash Anaconda.sh -b
RUN rm -rf Anaconda.sh
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/code"]

EXPOSE 8888

CMD ["/sbin/my_init" , "--","bash", "-l"]

