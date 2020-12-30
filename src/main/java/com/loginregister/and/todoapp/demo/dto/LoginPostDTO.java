package com.loginregister.and.todoapp.demo.dto;

import org.hibernate.validator.constraints.Length;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class LoginPostDTO {

    @NotEmpty(message = "Email cannot be empty")
    @NotNull(message = "Email not defined")
    @Length(min = 3, message = "Email character minimum is 3")
    @Valid
    private String email;

    @NotEmpty(message = "Password cannot be empty")
    @NotNull(message = "Password not defined")
    @Length(min = 3, message = "Password character minimum is 3")
    private String password;

    public LoginPostDTO(String email, String password) {
        this.email = email;
        this.password = password;
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
