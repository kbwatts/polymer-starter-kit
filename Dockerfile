FROM ubuntu:14.04

MAINTAINER Donald Trump

RUN apt-get update

RUN apt-get install --yes wget

# INSTALL GIT
RUN apt-get install git=1:1.9.1-1ubuntu0.2 --yes

# INSTALL NODE - http://askubuntu.com/questions/672994/how-to-install-nodejs-4-on-ubuntu-15-04-64-bit-edition
RUN wget -qO- https://deb.nodesource.com/setup_4.x | sudo bash
RUN apt-get install --yes nodejs

# INSTALL BOWER
RUN sudo npm install -g bower@1.7.7

# INSTALL GULP
RUN npm install -g gulp@3.9.1

# COPY POLYMER
COPY . /src

WORKDIR /src

EXPOSE 5000

CMD gulp serve
