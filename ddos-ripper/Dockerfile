FROM debian:bullseye-backports

RUN apt update && apt upgrade
RUN apt-get install -y dialog python3-pip python3-setuptools git nano wget

WORKDIR /var/www/app

RUN git clone https://github.com/palahsu/DDoS-Ripper

COPY ddos.sh /var/www/app/ddos
RUN chmod +x /var/www/app/ddos

ENTRYPOINT ["/var/www/app/ddos"]
