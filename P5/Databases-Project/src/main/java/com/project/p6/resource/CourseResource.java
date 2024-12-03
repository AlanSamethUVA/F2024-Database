package com.project.p6.resource;

import com.project.p6.persistance.Course;
import com.project.p6.service.CourseService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping(value = "/database")
public class CourseResource {

    CourseService courseService;

    public CourseResource(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping(value = "/courses")
    public List<Course> getAllCourses() {
        return this.courseService.getAll();
    }

    @GetMapping(value = "/courses/semester/{semester}")
    public List<Course> getCoursesBySemester(@PathVariable String semester) { return this.courseService.getBySemester(semester);}

    @GetMapping(value = "/courses/id/{id}")
    public Course getById(@PathVariable long id){
        return this.courseService.getById(id);
    }

    @PostMapping(value = "/courses")
    public Course addStudent(Course course) {
        return this.courseService.add(course);
    }

    @PostMapping(value = "/courses/{id}/{department}/{name}/{semester}/{professor}")
    public Course addCourse(@PathVariable String semester, @PathVariable long id, @PathVariable long department, @PathVariable String name, @PathVariable long professor) {
        Course course = new Course();
        course.setSemester(semester);
        course.setId(id);
        course.setDepartment(department);
        course.setName(name);
        course.setProfessor(professor);
        return this.courseService.add(course);
    }

    @PutMapping(value = "/courses/{id}/{professor}")
    public Course updateCourse(@PathVariable long id, @PathVariable long professor) {
        Course course = this.courseService.getById(id);
        course.setProfessor(professor);
        return this.courseService.update(course, id);
    }

    @DeleteMapping(value = "/courses/{course_id}")
    public void deleteCourse(@PathVariable long course_id) {
        this.courseService.delete(course_id);
    }

}
