####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 07.06.2021 22:40 | #202106072240                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

FROM ubuntu:latest
LABEL org.opencontainers.image.authors="ZombyMediaIC"

RUN apt-get update
RUN apt-get upgrade -y

RUN echo "You can change this later"
ENV RAM="4G"

RUN apt-get install -y wget screen nano mysql-client dpkg tar net-tools

## Installing java16 as openjdk from java.net
RUN mkdir /usr/lib/jvm
RUN wget https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz
RUN tar -xvf openjdk-17.0.2_linux-x64_bin.tar.gz -C /usr/lib/jvm/
RUN ln -s /usr/lib/jvm/jdk-17 /usr/lib/jvm/jdk-17.0.2
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-17.0.2/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-17.0.2/bin/javac 100

RUN update-alternatives --display java
RUN update-alternatives --display javac

## Creating folderstructure for the server
RUN mkdir /temp
RUN mkdir /serverfiles

## Creating server directory for server creation process
WORKDIR /server

## Creating server
COPY forge-installer.jar /temp/
RUN chmod +x /temp/forge-installer.jar
RUN java -jar /temp/forge-installer.jar --installServer /serverfiles

## Copying all nesessary files to temp directory
COPY eula.txt /temp
COPY ./start.sh /temp/start.sh
COPY ./init.sh /temp/init.sh

# Installing ssh-server into image
# RUN apt update && apt install  openssh-server -y
# RUN echo 'root:ultimatePassword' | chpasswd
# RUN echo "PermitRootLogin yes" > /etc/ssh/sshd_config
# RUN service ssh start
# EXPOSE 22

RUN chmod -R 777 /serverfiles
EXPOSE 25565

# CMD "/serverfiles/init.sh"
# CMD [ "/server/start.sh" ]
CMD [ "/bin/bash", "/temp/init.sh" ]