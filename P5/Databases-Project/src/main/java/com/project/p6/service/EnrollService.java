package com.project.p6.service;


import com.project.p6.persistance.Enroll;
import com.project.p6.persistance.EnrollRepository;
import com.project.p6.persistance.Student;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EnrollService {
    private final EnrollRepository enrollRepository;

    public EnrollService(EnrollRepository enrollRepository) {
        this.enrollRepository = enrollRepository;
    }

    public List<Enroll> getAll() {
        return enrollRepository.findAll();
    }

    public Enroll getById(long id) { return this.enrollRepository.findById(id).get();}

    public List<Enroll> getByStudentId(long studentId) {
        return enrollRepository.findByStudentId(studentId);
    }

    public List<Enroll> getByCourseId(long courseId) {
        return enrollRepository.findByCourseId(courseId);
    }

    public List<Enroll> getBySemester(String semester) {
        return enrollRepository.findBySemester(semester);
    }

    public Enroll add(Enroll enroll) {
        return enrollRepository.save(enroll);
    }

    public Enroll updateCourse(Enroll enroll, long id) {
        Optional<Enroll> en = this.enrollRepository.findById(id);
        if (en.isPresent()) {
            en.get().setCourseId(enroll.getCourseId());
            return this.enrollRepository.save(en.get());
        }
        throw new RuntimeException();
    }

    public void delete(long id) {
        enrollRepository.deleteById(id);
    }
}
