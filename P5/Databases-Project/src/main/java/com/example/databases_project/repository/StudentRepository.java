package com.example.hospital_cs4750.repository;

import com.example.hospital_cs4750.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student,Long> {
    List<Student> findByFirstNameContaining(String first_name);
}
