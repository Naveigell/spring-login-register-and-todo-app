package com.loginregister.and.todoapp.demo.dto;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class TodoUpdateDTO {
    @Min(value = 1)
    @NotNull
    private int id;

    @Length(min = 1)
    @NotNull
    @NotEmpty
    private String title;

    @Length(min = 1)
    @NotNull
    @NotEmpty
    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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
}
