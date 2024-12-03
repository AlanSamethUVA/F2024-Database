package com.project.p6.resource;

import com.project.p6.persistance.Student;
import com.project.p6.service.StudentService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping(value = "/database")
public class StudentResource {

    StudentService studentService;

    public StudentResource(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping(value = "/student")
    public List<Student> getAllStudents() {
        return this.studentService.getAll();
    }

    @GetMapping(value = "/students/{year}")
    public List<Student> getStudentsByYear(@PathVariable int year) { return this.studentService.getByYear(year);}

    @GetMapping(value = "/student/{id}")
    public Student getById(@PathVariable long id){
        return this.studentService.getById(id);
    }

    @PostMapping(value = "/student")
    public Student addStudent(Student student) {
        return this.studentService.add(student);
    }

    @PostMapping(value = "/student/{year}")
    public Student addStudent(@PathVariable long year) {
        Student student = new Student();
        student.setYear(year);
        return this.studentService.add(student);
    }

    @PutMapping(value = "/student/{id}/{year}")
    public Student updateStudent(@PathVariable long id, @PathVariable long year) {
        Student student = this.studentService.getById(id);
        student.setYear(year);
        return this.studentService.update(student, id);
    }

    @DeleteMapping(value = "/student/{id}")
    public void deleteStudent(@PathVariable long id) {
        this.studentService.delete(id);
    }
}
