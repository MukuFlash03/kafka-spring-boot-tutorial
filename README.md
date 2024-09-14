# Simple Spring Boot + Apache Kafka RESTful web application 
[Tutorial link](https://www.youtube.com/watch?v=SqVfCyfCJqw)

### Screenshots

#### Spring Boot, Kafka, Kafka Consumer, Zookeeper terminal processes
<img width="1440" alt="Screenshot 2024-09-14 at 1 00 54 AM" src="https://github.com/user-attachments/assets/1fa3893c-843b-4c5e-9ed2-1a7e59f52215">

#### Postman API HTTP Request

<img width="1440" alt="Screenshot 2024-09-14 at 1 00 37 AM" src="https://github.com/user-attachments/assets/40114077-449e-40a5-adbb-2e1a9bca650f">





### Steps to build and run the application:

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
$ cd /opt/kafka_2.13-3.8.0 && bin/kafka-console-consumer.sh --topic MukuFlash --from-beginning --bootstrap-server localhost:9092
```

-----

Run this in the docker container once the Kafka and Zookeeper services are up and running. 
Use this to re-run the application everytime you make a change to the code:

```
$ mvn spring-boot:run
```

