package com.loginregister.and.todoapp.demo.dto;


import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class TodoPostDTO {

    @Length(min = 1)
    @NotNull
    @NotEmpty
    private String title;

    @Length(min = 1)
    @NotNull
    @NotEmpty
    private String description;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public TodoPostDTO(String title, String description) {
        this.title = title;
        this.description = description;
    }
}
