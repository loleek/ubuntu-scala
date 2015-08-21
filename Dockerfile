FROM ubuntu:14.04

# ubuntu-scala
RUN apt-get update && apt-get install -y unzip

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

RUN apt-get install -y openjdk-7-jdk

RUN apt-get install -y wget  && rm -rf /var/lib/apt/lists/*
