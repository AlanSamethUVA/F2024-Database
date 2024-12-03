package com.project.p6.service;


import com.project.p6.persistance.Student;
import com.project.p6.persistance.StudentRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StudentService {

    StudentRepository studentRepository;

    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public List<Student> getAll() {

        return studentRepository.findAll();
    }

    public Student getById(long id) {

        return this.studentRepository.findById(id).get();
    }

    public List<Student> getByYear(long year) { return this.studentRepository.findAllByYear(year);}

    public Student add(Student student) {
        return this.studentRepository.save(student);
    }

    public Student update(Student student, long id) {
        Optional<Student> stud = this.studentRepository.findById(id);
        if (stud.isPresent()) {
            stud.get().setYear(student.getYear());
            return this.studentRepository.save(stud.get());
        }
        throw new RuntimeException();
    }

    public void delete(long id) {
        this.studentRepository.deleteById(id);
    }
}
