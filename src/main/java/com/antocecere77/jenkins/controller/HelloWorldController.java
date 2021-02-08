package com.antocecere77.jenkins.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController {

    @GetMapping("/hello-world")
    public ResponseEntity<?> helloWorld() {
        System.out.println("Hello world called");
        return ResponseEntity.ok("Hello World!!!");
    }

    @GetMapping("/hello-world2")
    public ResponseEntity<?> helloWorld2() {
        System.out.println("Hello world called");
        return ResponseEntity.ok("Hello World!!!");
    }
}
