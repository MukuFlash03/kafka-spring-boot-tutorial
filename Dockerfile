FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

EXPOSE 8080

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    unzip \
    software-properties-common \
    && wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | apt-key add - \
    && add-apt-repository --yes https://packages.adoptium.net/artifactory/deb/ \
    && apt-get update && apt-get install -y temurin-17-jdk \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/temurin-17-jdk-arm64
ENV PATH=$JAVA_HOME/bin:$PATH

RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz \
    && tar xzvf apache-maven-3.9.9-bin.tar.gz \
    && mv apache-maven-3.9.9 /opt/ \
    && rm -rf apache-maven-3.9.9-bin.tar.gz

ENV PATH=$PATH:/opt/apache-maven-3.9.9/bin

RUN wget https://dlcdn.apache.org/kafka/3.8.0/kafka_2.13-3.8.0.tgz \
    && tar -xzf kafka_2.13-3.8.0.tgz \
    && mv kafka_2.13-3.8.0 /opt/ \
    && rm -rf kafka_2.13-3.8.0.tgz

WORKDIR /app/kafka-spring-boot-tutorial

COPY . .

RUN mvn clean install -DskipTests

CMD ["/bin/bash"]
