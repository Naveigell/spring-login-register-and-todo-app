package com.loginregister.and.todoapp.demo.repositories;

import com.loginregister.and.todoapp.demo.entities.TodoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface TodoRepository extends JpaRepository<TodoEntity, Long> {
    public ArrayList<TodoEntity> findAll();

    @Query(value = "SELECT * FROM todo WHERE id = :id", nativeQuery = true)
    public TodoEntity findById(String id);

//    @Modifying
//    @Query(value = "INSERT INTO todo(title, description) VALUES(:title, :description)", nativeQuery = true)
//    public int insert(String title, String description);
}
