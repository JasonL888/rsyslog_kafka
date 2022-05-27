FROM debian:buster-slim
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install vim net-tools telnet iputils-ping procps rsyslog rsyslog-kafka

CMD ["/usr/sbin/rsyslogd", "-n"]
