package com.nhom7.btupload;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

import com.nhom7.btupload.service.StorageProperties;

import com.nhom7.btupload.service.StorageService;

@SpringBootApplication()
@EnableConfigurationProperties(StorageProperties.class)
public class Nhom7Application {

	
	public static void main(String[] args) {
		SpringApplication.run(Nhom7Application.class, args);
	}
	@Bean
	CommandLineRunner init(StorageService storageService) {
		return (args) -> {
            storageService.deleteAll();
            storageService.init();
		};
	}
}
