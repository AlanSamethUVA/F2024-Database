package com.project.p6.service;

import com.project.p6.persistance.Department;
import com.project.p6.persistance.DepartmentRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DepartmentService {

    DepartmentRepository departmentRepository;

    public DepartmentService(DepartmentRepository departmentRepository) { this.departmentRepository = departmentRepository; }

    public List<Department> getAllDepartments() { return this.departmentRepository.findAll(); }

    public Department findById(long id){ return this.departmentRepository.findById(id).get();}

    public List<Department> getByName(String name) { return this.departmentRepository.findByName(name); }

    public Department addDepartment(Department department) {return this.departmentRepository.save(department);}

    public Department updateDepartment(Department department, long id) {
        Optional<Department> depart = this.departmentRepository.findById(id);
        if(depart.isPresent()) {
            depart.get().setName(department.getName());
            return this.departmentRepository.save(depart.get());
        }
        throw new RuntimeException("Department not found");
    }

    public void delete(long id) {this.departmentRepository.deleteById(id);}

    public void deleteByName(String name) {this.departmentRepository.deleteByName(name);}


}
