package com.project.p6.service;


import com.project.p6.persistance.CourseRepository;
import com.project.p6.persistance.Course;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CourseService {

    CourseRepository courseRepository;

    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public List<Course> getAll() {
        return courseRepository.findAll();
    }

    public Course getById(long id) {
        return this.courseRepository.findById(id).get();
    }

    public List<Course> getBySemester(String semester) {
        return this.courseRepository.findAllBySemester(semester);
    }

    public Course add(Course course) {
        return this.courseRepository.save(course);
    }

    public Course update(Course course, long id) {
        Optional<Course> cour = this.courseRepository.findById(id);
        if (cour.isPresent()) {
            cour.get().setSemester(course.getSemester());
            return this.courseRepository.save(cour.get());
        }
        throw new RuntimeException();
    }

    public void delete(long id) {
        this.courseRepository.deleteById(id);
    }


}
