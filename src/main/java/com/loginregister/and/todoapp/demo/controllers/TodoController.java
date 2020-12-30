package com.loginregister.and.todoapp.demo.controllers;

import com.loginregister.and.todoapp.demo.dto.TodoPostDTO;
import com.loginregister.and.todoapp.demo.dto.TodoUpdateDTO;
import com.loginregister.and.todoapp.demo.entities.TodoEntity;
import com.loginregister.and.todoapp.demo.repositories.TodoRepository;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TransactionRequiredException;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Validator;
import java.util.HashMap;
import java.util.Set;
import java.util.function.Consumer;

@Controller
//@Validated
//@Service
public class TodoController {

    private Validator validator;
    private TodoRepository todoRepository;

    @PersistenceContext
    private EntityManager entityManager;

    public TodoController(Validator validator, TodoRepository todoRepository, EntityManager entityManager) {
        this.validator = validator;
        this.todoRepository = todoRepository;
        this.entityManager = entityManager;
    }

    @GetMapping(value = "/todo/{id}/edit")
    public String edit(@PathVariable("id") String id, Model model){

        TodoEntity todo = this.todoRepository.findById(id);
        if (todo == null) {
            return "redirect:/";
        }

        model.addAttribute("id", todo.getId());
        model.addAttribute("title", todo.getTitle());
        model.addAttribute("description", todo.getDescription());

        return "edit";
    }

    @PostMapping(value = "/todo/update")
    @Transactional
    public String update(TodoUpdateDTO request, RedirectAttributes attributes){
        HashMap<String, String> errors = new HashMap<>();

        try {
            Set<ConstraintViolation<TodoUpdateDTO>> constraintViolationSet = validator.validate(request);
            constraintViolationSet.forEach(new Consumer<ConstraintViolation<TodoUpdateDTO>>() {
                @Override
                public void accept(ConstraintViolation<TodoUpdateDTO> constraintViolation) {
                    String key = constraintViolation.getPropertyPath().toString();
                    errors.put(key.substring(0, 1).toUpperCase() + key.substring(1), constraintViolation.getMessage());
                }
            });

            if (errors.size() > 0) {
                attributes.addFlashAttribute("errors", errors);
                return "redirect:/todo/" + request.getId() + "/edit";
            } else {
                Query query = entityManager.createNativeQuery("UPDATE todo SET title = :title, description = :description WHERE id = :id");
                query.setParameter("title", request.getTitle());
                query.setParameter("description", request.getDescription());
                query.setParameter("id", request.getId());

                int row = query.executeUpdate();
                if (row > 0) {
                    attributes.addFlashAttribute("successMessage", "Update todo success");
                } else {
                    attributes.addFlashAttribute("successMessage", "Update todo failed");
                }
            }
        } catch (ConstraintViolationException | TransactionRequiredException exception) {
            System.err.println(exception.getMessage());
        }
        return "redirect:/";
    }

    @GetMapping(value = "/todo/{id}/delete")
    @Transactional
    public String delete(@PathVariable("id") String id, RedirectAttributes attributes) {

        if (isDigit(id)) {
            Query query = entityManager.createNativeQuery("DELETE FROM todo WHERE id = :id");
            query.setParameter("id", id);

            int row = query.executeUpdate();
            if (row > 0) {
                attributes.addFlashAttribute("successMessage", "Delete Success");
            } else {
                attributes.addFlashAttribute("errorMessage", "Delete failed");
            }
        } else {
            attributes.addFlashAttribute("errorMessage", "Delete failed");
        }

        return "redirect:/";
    }

    @PostMapping(value = "/todo/create")
    @Transactional
    public String save(TodoPostDTO request, BindingResult result, RedirectAttributes attributes){

        HashMap<String, String> errors = new HashMap<>();

        try {
            Set<ConstraintViolation<TodoPostDTO>> constraintViolationSet = validator.validate(request);
            constraintViolationSet.forEach(new Consumer<ConstraintViolation<TodoPostDTO>>() {
                @Override
                public void accept(ConstraintViolation<TodoPostDTO> constraintViolation) {
                    String key = constraintViolation.getPropertyPath().toString();
                    errors.put(key.substring(0, 1).toUpperCase() + key.substring(1), constraintViolation.getMessage());
                }
            });

            if (errors.size() > 0) {
                attributes.addFlashAttribute("errors", errors);
            } else {
                Query query = entityManager.createNativeQuery("INSERT INTO todo(title, description) VALUES(:title, :description)");
                query.setParameter("title", request.getTitle());
                query.setParameter("description", request.getDescription());

                int row = query.executeUpdate();

                if (row > 0) {
                    attributes.addFlashAttribute("successMessage", "Insert todo success");
                } else {
                    attributes.addFlashAttribute("errorMessage", "Insert todo failed");
                }
            }
        } catch (ConstraintViolationException | TransactionRequiredException exception) {
            System.err.println(exception.getMessage());
        }

        return "redirect:/";
    }

    private boolean isDigit(String value) {
        try {
            Integer.parseInt(value);
        } catch (NumberFormatException exception) {
            return false;
        }
        return true;
    }
}
