FROM ubuntu:18.04

ENV SBT_VERSION 1.4.9
ENV SCALA_VERSION 2.12.12

ENV TZ=Europe/Warsaw

RUN apt-get update && apt-get upgrade -y

RUN apt install nodejs

RUN apt install npm

RUN apt-get install -y openjdk-8-jdk wget

WORKDIR /home

RUN apt-get remove scala-library scala

RUN wget https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.deb

RUN dpkg -i scala-$SCALA_VERSION.deb

RUN wget http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb

RUN dpkg -i sbt-$SBT_VERSION.deb

RUN sbt -version

RUN mkdir mounted

VOLUME mounted

EXPOSE 3000

EXPOSE 9000
