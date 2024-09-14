Simple Spring Boot + Apache Kafka RESTful web application ([tutorial](https://www.youtube.com/watch?v=SqVfCyfCJqw))

Follow these steps to build and run the application:

```
$ docker-compose up --build

$ docker build -t kafka-springboot-mvn .
$ docker run -p 8080:8080 -itd kafka-springboot-mvn /bin/bash
```

-----

Run the following commands in separate terminal sesions in order to start all services in the correct order:

```
# Start the ZooKeeper service
$ cd /opt/kafka_2.13-3.8.0 && bin/zookeeper-server-start.sh config/zookeeper.properties

# Start the Kafka broker service
$ cd /opt/kafka_2.13-3.8.0 && bin/kafka-server-start.sh config/server.properties

Read messages from the Kafka topic:
```
$ cd /opt/kafka_2.13-3.8.0 && bin/kafka-console-consumer.sh --topic MukuFlash --from-beginning --bootstrap-server localhost:9092
```

-----

Run this in the docker container once the Kafka and Zookeeper services are up and running. 
Use this to re-run the application everytime you make a change to the code:

```
$ mvn spring-boot:run
```

