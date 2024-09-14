package com.example.config;

import org.apache.kafka.clients.admin.NewTopic;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.config.TopicBuilder;

@Configuration
public class KafkaTopicConfig {

    @Value("${spring.kafka.bootstrap-servers}")
    String bootstrap_url;

    @Value("${example.name}")
    String name;

    @Bean
    public NewTopic MukuFlashTopic() {
        System.out.println(bootstrap_url);
        System.out.println(name);
        return TopicBuilder.name("MukuFlash")
            .build();
    }
}
