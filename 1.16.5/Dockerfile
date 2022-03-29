####################################################################
## ZOUPA - (ZombyMediaIC open source usage protection agreement)  ##
## License as of: 07.06.2021 22:40 | #202106072240                ##
## Niklas Vorberg (AsP3X)                                         ##
####################################################################

FROM alpine:latest
LABEL org.opencontainers.image.authors="ZombyMediaIC"

RUN apk update
RUN apk upgrade

RUN echo "You can change this later"
ENV RAM="4G"

RUN apk add wget openjdk11 screen nano mysql-client

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