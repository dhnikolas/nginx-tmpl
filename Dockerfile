FROM nginx:1.15

MAINTAINER Nikolay Naau <dhnikolas@gmail.com>

ADD exec.sh /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/exec.sh"]

CMD ["/usr/local/bin/exec.sh"]