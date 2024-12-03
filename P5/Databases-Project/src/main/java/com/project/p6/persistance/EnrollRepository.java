package com.project.p6.persistance;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EnrollRepository extends JpaRepository<Enroll, Long> {

    List<Enroll> findByStudentId(long studentId);
    List<Enroll> findByCourseId(long courseId);

    List<Enroll> findBySemester(String semester);

}