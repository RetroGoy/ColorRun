package fr.esgi.color_run;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ColorRunApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(ColorRunApplication.class, args);
    }
}