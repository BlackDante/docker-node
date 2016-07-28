FROM ubuntu:latest
MAINTAINER kamil.m.kielbasa@gmail.com

RUN apt-get update
RUN apt-get install -y nodejs npm git git-core
RUN apt-get clean

COPY ./package.json src/

RUN cd src && npm install

COPY . /src

WORKDIR src/

EXPOSE 8080
CMD [ "npm", "start" ]
