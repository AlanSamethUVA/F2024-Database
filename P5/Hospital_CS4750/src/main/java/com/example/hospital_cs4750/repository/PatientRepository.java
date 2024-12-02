package com.example.hospital_cs4750.repository;

import com.example.hospital_cs4750.model.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PatientRepository extends JpaRepository<Patient,Long> {
    List<Patient> findByFirstNameContaining(String first_name);
}
