FROM ubuntu:25.10

WORKDIR /home/ubuntu

COPY boot.sh boot.sh
RUN chmod +x boot.sh

RUN apt-get update && apt-get install -y sudo 
RUN usermod -aG sudo ubuntu && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN apt-get update && apt-get install -y bc

USER ubuntu
ENTRYPOINT ["./boot.sh"]
