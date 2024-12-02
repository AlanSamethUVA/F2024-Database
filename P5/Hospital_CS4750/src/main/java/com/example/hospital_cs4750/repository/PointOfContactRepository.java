package com.example.hospital_cs4750.repository;

import com.example.hospital_cs4750.model.PointOfContact;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PointOfContactRepository extends JpaRepository<PointOfContact,Long> {
    List<PointOfContact> findByFirstNameContaining(String first_name);
}
