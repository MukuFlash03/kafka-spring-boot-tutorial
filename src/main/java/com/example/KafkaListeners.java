package com.example;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
public class KafkaListeners {

    @KafkaListener(
        topics = "MukuFlash",
        groupId = "mf-03"
    )
    void listener(String data) {
        System.out.println("Listener received: " + data + " ⚡️ ");
    }
}
