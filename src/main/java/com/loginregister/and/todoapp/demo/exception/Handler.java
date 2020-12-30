package com.loginregister.and.todoapp.demo.exception;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

@ControllerAdvice
@RestController
public class Handler {

    @ExceptionHandler(AccessDeniedException.class)
    public void handleException(AccessDeniedException ex) {
        System.out.println(ex.getMessage());
    }
}
