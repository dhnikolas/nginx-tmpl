FROM nginx:1.15

MAINTAINER Nikolay Naau <dhnikolas@gmail.com>

ADD exec.sh /usr/local/bin/

CMD ["/usr/local/bin/exec.sh"]