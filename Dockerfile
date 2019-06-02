FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server libpam-google-authenticator

RUN mkdir /var/run/sshd

RUN echo 'root:my_password' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
