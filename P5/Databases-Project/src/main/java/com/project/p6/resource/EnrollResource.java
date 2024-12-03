package com.project.p6.resource;

import com.project.p6.persistance.Enroll;
import com.project.p6.service.EnrollService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping(value = "/database")
public class EnrollResource {
    private final EnrollService enrollService;

    public EnrollResource(EnrollService enrollService) {
        this.enrollService = enrollService;
    }

    @GetMapping(value = "/enroll")
    public List<Enroll> getAllEnrollments() {
        return this.enrollService.getAll();
    }

    @GetMapping(value = "/enroll/student/{studentId}")
    public List<Enroll> getByStudentId(@PathVariable long studentId) {
        return this.enrollService.getByStudentId(studentId);
    }

    @GetMapping(value = "/enroll/course/{courseId}")
    public List<Enroll> getByCourseId(@PathVariable long courseId) {
        return this.enrollService.getByCourseId(courseId);
    }

    @GetMapping(value = "/enroll/semester/{semester}")
    public List<Enroll> getBySemester(@PathVariable String semester) {
        return this.enrollService.getBySemester(semester);
    }

    @PostMapping(value = "/enroll/{studId}/{courseId}/{semester}")
    public Enroll addEnrollment(@PathVariable long studId, @PathVariable long courseId, @PathVariable String semester) {
        Enroll enroll = new Enroll();
        enroll.setStudentId(studId);
        enroll.setCourseId(courseId);
        enroll.setSemester(semester);
        return this.enrollService.add(enroll);
    }

    @PutMapping(value ="enroll/{id}/{course}")
    public Enroll updateEnrollment(@PathVariable long id, @PathVariable long course) {
        Enroll enroll = this.enrollService.getById(id);
        enroll.setId(id);
        return this.enrollService.updateCourse(enroll, id);
    }

    @DeleteMapping(value = "/enroll/{id}")
    public void deleteEnrollment(@PathVariable long id) {
        this.enrollService.delete(id);
    }
}