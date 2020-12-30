package com.loginregister.and.todoapp.demo.controllers;

import com.loginregister.and.todoapp.demo.authentications.Auth;
import com.loginregister.and.todoapp.demo.authentications.UserDetail;
import com.loginregister.and.todoapp.demo.dto.LoginPostDTO;
import com.loginregister.and.todoapp.demo.entities.LoginEntity;
import com.loginregister.and.todoapp.demo.repositories.LoginRepository;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class LoginController {

    private final LoginRepository loginRepository;
    private AuthenticationManager authenticationManager;

    public LoginController(LoginRepository loginRepository, AuthenticationManager authenticationManager) {
        this.loginRepository = loginRepository;
        this.authenticationManager = authenticationManager;
    }

    @PostMapping(value = "/login", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public ModelAndView postLogin(LoginPostDTO request, RedirectAttributes redirectAttributes, HttpServletResponse response) throws IOException {
        LoginEntity entity = this.loginRepository.findByEmail(request.getEmail());

        if (entity == null) {
            redirectAttributes.addFlashAttribute("loginMessage", "User not found!");
        } else {
            String password = request.getPassword();
            if (!entity.getPassword().equals(password)) {
                redirectAttributes.addFlashAttribute("loginMessage", "Password wrong!");
            } else {
                UserDetail user = new UserDetail(
                        entity.getEmail(), null, entity.getPassword(),
                        entity.getUsername(), true, true,
                        true, true, AuthorityUtils.createAuthorityList("ROLE_USER"));

                Auth.save(user);

                redirectAttributes.addFlashAttribute("loginMessage", "Welcome ");
                return new ModelAndView("redirect:/");
            }
        }

        return new ModelAndView("redirect:/login-register");
    }

    @GetMapping(value = "/login-register")
    public String login(){
        return "login-register";
    }
}
