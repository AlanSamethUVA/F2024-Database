package com.project.p6.persistance;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

    List<Course> findAllBySemester(String semester);

    @Modifying
    @Query("delete from Course C where C.name = ?1")
    void deleteByName(String name);


}
