package com.loginregister.and.todoapp.demo.dto;

import org.hibernate.validator.constraints.Length;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class RegisterPostDTO {

    @NotEmpty(message = "Username cannot be empty")
    @NotNull(message = "Username not defined")
    @Length(min = 3, message = "Username character minimum is 3")
    private String username;

    @NotEmpty(message = "Email cannot be empty")
    @NotNull(message = "Email not defined")
    @Length(min = 3, message = "Email character minimum is 3")
    @Valid
    private String email;

    @NotEmpty(message = "Password cannot be empty")
    @NotNull(message = "Password not defined")
    @Length(min = 3, message = "Password character minimum is 3")
    private String password;

    public RegisterPostDTO(String username, String email, String password) {
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
