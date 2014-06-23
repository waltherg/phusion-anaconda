FROM phusion/baseimage:latest
MAINTAINER Danish Abdullah "dev@danishabdullah.com"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive  apt-get upgrade -y && DEBIAN_FRONTEND=noninteractive  apt-get install -y aria2 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD .profile /root/.profile
ADD .prompt /root/.prompt
ADD .bashrc /root/.bashrc
ADD .aliases /root/.aliases
ADD .locale /root/.locale
ADD .locale /etc/default/locale
ADD .inputrc /root/.inputrc

RUN aria2c -s 16 -x 16 -k 30M http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-2.0.1-Linux-x86_64.sh -o Anaconda.sh && bash Anaconda.sh -b && rm -rf Anaconda.sh

RUN PATH=/root/anaconda/bin:$PATH && DEBIAN_FRONTEND=noninteractive pip install -U ipython

VOLUME ["/code"]

EXPOSE 8888

CMD ["/sbin/my_init" , "--","bash", "-l"]

