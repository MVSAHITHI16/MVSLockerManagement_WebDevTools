package com.lockermanagement.config;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

@Component
public class HibernateConfig {

    @Bean
    @Primary
    public SessionFactory sessionFactory() {
        // Create the SessionFactory from hibernate.cfg.xml
        return new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    }
}