package com.loginregister.and.todoapp.demo.repositories;


import com.loginregister.and.todoapp.demo.entities.LoginEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LoginRepository extends JpaRepository<LoginEntity, Long> {

    @Query(value = "SELECT * FROM users WHERE email = :email", nativeQuery = true)
    public LoginEntity findByEmail(String email);
}
