FROM ubuntu:14.04

# ubuntu-scala
RUN apt-get update && apt-get install -y unzip

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ENV SBT_VERSION		0.13.8
ENV SBT_HOME		/usr/local/sbt
ENV SCALA_VERSION	2.10.4
ENV SCALA_HOME		/usr/local/scala
ENV PATH		$SCALA_HOME/bin:$SBT_HOME/bin:$PATH

RUN apt-get install -y openjdk-7-jdk

RUN apt-get install -y wget  && rm -rf /var/lib/apt/lists/*

RUN wget http://www.scala-lang.org/files/archive/scala-$SCALA_VERSION.tgz && \
    tar -xzf /scala-$SCALA_VERSION.tgz -C /usr/local/ && \
    ln -s /usr/local/scala-$SCALA_VERSION $SCALA_HOME && \
    rm scala-$SCALA_VERSION.tgz 
    
RUN wget https://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz && \
    tar -xzf sbt-$SBT_VERSION.tgz -C /usr/local/ && \
    rm sbt-$SBT_VERSION.tgz && \
    echo "Show SBT version" && \
    sbt about
