package com.loginregister.and.todoapp.demo.controllers;

import com.loginregister.and.todoapp.demo.authentications.Auth;
import com.loginregister.and.todoapp.demo.authentications.UserDetail;
import com.loginregister.and.todoapp.demo.dto.RegisterPostDTO;
import com.loginregister.and.todoapp.demo.dto.TodoPostDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TransactionRequiredException;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Validator;
import java.util.HashMap;
import java.util.Set;
import java.util.function.Consumer;

@Controller
public class RegisterController {

    private EntityManager entityManager;
    private Validator validator;

    public RegisterController(EntityManager entityManager, Validator validator) {
        this.entityManager = entityManager;
        this.validator = validator;
    }

    @PostMapping(value = "/register", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    @Transactional
    public String register(RegisterPostDTO request, RedirectAttributes attributes){

        HashMap<String, String> errors = new HashMap<>();

        try {
            Set<ConstraintViolation<RegisterPostDTO>> constraintViolationSet = validator.validate(request);
            constraintViolationSet.forEach(new Consumer<ConstraintViolation<RegisterPostDTO>>() {
                @Override
                public void accept(ConstraintViolation<RegisterPostDTO> constraintViolation) {
                    String key = constraintViolation.getPropertyPath().toString();
                    errors.put(key.substring(0, 1).toUpperCase() + key.substring(1), constraintViolation.getMessage());
                }
            });

            if (errors.size() > 0) {
                attributes.addFlashAttribute("errors", errors);
            } else {
                Query query = entityManager.createNativeQuery("INSERT INTO users(username, email, password) VALUES(:username, :email, :password)");
                query.setParameter("username", request.getUsername());
                query.setParameter("email", request.getEmail());
                query.setParameter("password", request.getPassword());

                int rowInserted = query.executeUpdate();
                if (rowInserted > 0) {
                    UserDetail user = new UserDetail(
                            request.getEmail(), null, request.getPassword(),
                            request.getUsername(), true, true,
                            true, true, AuthorityUtils.createAuthorityList("ROLE_USER"));

                    Auth.save(user);

                    return "redirect:/";
                }
            }
        } catch (ConstraintViolationException | TransactionRequiredException exception) {
            System.err.println(exception.getMessage());
        }

        return "redirect:/login-register";
    }
}
