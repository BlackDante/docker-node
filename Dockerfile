FROM ubuntu:latest
MAINTAINER kamil.m.kielbasa@gmail.com

# Installation:
RUN apt-get update
RUN apt-get install -y nodejs npm git git-core
RUN apt-get clean

# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update
RUN apt-get install -y mongodb-org

# Create the MongoDB data directory
RUN mkdir -p /data/db

COPY ./package.json src/

RUN cd src && npm install

COPY . /src

WORKDIR src/

EXPOSE 8080 27017
CMD [ "mongod", '--fork', '--logpath', '/var/log/mongod.log' ]
CMD [ "npm", "start" ]
