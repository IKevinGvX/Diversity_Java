package com.Pl_Advanced_project.Diversity.Controller;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.context.annotation.Bean;
// import org.springframework.security.authentication.AuthenticationManager;
// import
// org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
// import
// org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import
// org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.security.crypto.password.PasswordEncoder;
// import org.springframework.security.web.SecurityFilterChain;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.security.authentication.AuthenticationManager;
// import
// org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
// import
// org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import
// org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.security.crypto.password.PasswordEncoder;
// import org.springframework.security.web.SecurityFilterChain;

// import com.Pl_Advanced_project.Diversity.Service.UserDetailsServiceImpl;

// @Configuration
// public class WebSecurity extends WebSecurityConfiguration {

// @Autowired private UserDetailsServiceImpl userDetailsService;

// @SuppressWarnings({"removal","deprecation"})@Bean public SecurityFilterChain
// securityFilterChain(HttpSecurity http)throws
// Exception{http.authorizeRequests().requestMatchers("/login","/register").permitAll().anyRequest().authenticated().and().formLogin().loginPage("/login").loginProcessingUrl("/login").defaultSuccessUrl("/home",true).permitAll().and().logout().permitAll();

// return http.build();}

// @Bean public AuthenticationManager authenticationManager(HttpSecurity
// http)throws Exception{return
// http.getSharedObject(AuthenticationManagerBuilder.class).userDetailsService(userDetailsService).passwordEncoder(passwordEncoder()).and().build();}

// @Bean public PasswordEncoder passwordEncoder(){return new
// BCryptPasswordEncoder();}}