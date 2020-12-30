package com.loginregister.and.todoapp.demo.controllers;

import com.loginregister.and.todoapp.demo.authentications.Auth;
import com.loginregister.and.todoapp.demo.authentications.UserDetail;
import com.loginregister.and.todoapp.demo.entities.TodoEntity;
import com.loginregister.and.todoapp.demo.repositories.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

@Controller
public class HomeController {

    private final TodoRepository todoRepository;

    public HomeController(TodoRepository todoRepository) {
        this.todoRepository = todoRepository;
    }

    @GetMapping(value = "/")
    public String home(Model model){

        ArrayList<TodoEntity> todos = this.todoRepository.findAll();
        model.addAttribute("todos", todos);

        if (!Auth.isAnonymous()) {
            UserDetail user = (UserDetail) Auth.current().getPrincipal();

            return "home";
        }
//        return "home";
        return "redirect:/error/403";
    }
}
