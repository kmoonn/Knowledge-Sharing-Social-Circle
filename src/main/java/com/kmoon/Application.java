package com.kmoon;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


/**
 * 代码千万行，
 * 注释第一行。
 * 代码没注释，
 * 维护两行泪。
 */

@MapperScan(basePackages = "com.kmoon.mapper")
@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
