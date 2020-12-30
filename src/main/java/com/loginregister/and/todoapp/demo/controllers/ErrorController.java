package com.loginregister.and.todoapp.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {

    @GetMapping(value = "/error/{status}")
    public ModelAndView error(@PathVariable(value = "status") String status){
        ModelAndView view = new ModelAndView("errors/error");
        view.addObject("status", status);
        view.addObject("message", "Oops, The Page you are looking for can't be found!");
        return view;
    }
}
