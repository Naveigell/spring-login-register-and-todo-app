package com.loginregister.and.todoapp.demo.config;


import com.loginregister.and.todoapp.demo.exception.AccessDeniedHandlerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.stereotype.Component;

@Component
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    AccessDeniedHandlerException accessDeniedHandlerException;

    @Override
    @Bean
    protected AuthenticationManager authenticationManager() throws Exception {
        return super.authenticationManager();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/login")
                .not()
                .hasRole("USER");

        http.authorizeRequests()
                .antMatchers(
                        "/",
                        "/todo/**/edit",
                        "/todo/**/update",
                        "/todo/**/delete",
                        "/todo/create"
                )
                .hasRole("USER");

        http.authorizeRequests()
                .antMatchers("/logout")
                .hasRole("USER");

        http.exceptionHandling().authenticationEntryPoint(accessDeniedHandlerException);
    }
}
