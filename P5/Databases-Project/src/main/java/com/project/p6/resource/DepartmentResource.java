package com.project.p6.resource;


import com.project.p6.persistance.Department;
import com.project.p6.service.DepartmentService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping(value = "/database")
public class DepartmentResource {

    DepartmentService departmentService;

    public DepartmentResource(DepartmentService departmentService) { this.departmentService = departmentService; }

    @GetMapping(value= "/department")
    public List<Department> getAllDepartments() {
        return departmentService.getAllDepartments();
    }

    @GetMapping(value = "/department/{name}")
    public List<Department> getDepartment(@PathVariable String name) {
        return departmentService.getByName(name);
    }

    @PostMapping(value = "/department/{name}")
    public Department addDepartment(@PathVariable String name) {
        Department department = new Department();
        department.setName(name);
        return this.departmentService.addDepartment(department);
    }

    @PutMapping(value = "/department/{id}/{name}")
    public Department updateDepartment(@PathVariable long id, @PathVariable String name) {
        Department department = this.departmentService.findById(id);
        department.setName(name);
        return this.departmentService.updateDepartment(department, id);
    }

    @DeleteMapping(value = "/department/{id}")
    public void deleteDepartment(@PathVariable int id) {
        this.departmentService.delete(id);
    }

    @DeleteMapping(value = "department/name={name}")
    public void deleteDepartmentByName(@PathVariable String name) {
        this.departmentService.deleteByName(name);
    }
}
