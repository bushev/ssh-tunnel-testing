FROM ubuntu:24.10

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository ppa:yubico/stable

RUN apt-get update && apt-get install -y openssh-server libpam-google-authenticator libpam-yubico

RUN echo 'root:my_password' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
