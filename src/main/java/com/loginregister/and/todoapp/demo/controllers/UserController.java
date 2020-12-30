package com.loginregister.and.todoapp.demo.controllers;

import com.loginregister.and.todoapp.demo.authentications.Auth;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {

    @GetMapping(value = "/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        Auth.logout(request, response);
        return "redirect:/";
    }
}
