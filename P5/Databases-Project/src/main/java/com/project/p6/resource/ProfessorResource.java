package com.project.p6.resource;

import com.project.p6.persistance.Professor;
import com.project.p6.service.ProfessorService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping(value ="/database")
public class ProfessorResource {

    ProfessorService professorService;

    public ProfessorResource(ProfessorService professorService) {
        this.professorService = professorService;
    }

    @GetMapping(value = "/professor")
    public List<Professor> getAllProfessors() {
        return professorService.getAll();
    }

    @GetMapping(value ="/professor/{id}")
    public Professor getProfessorById(@PathVariable long id) {
        return this.professorService.getById(id);
    }

    @GetMapping(value ="/professors/{name}")
    public Professor getProfessorByName(@PathVariable String name) {
        return this.professorService.getByProfessorName(name);
    }

    @PostMapping(value = "/professor/{name}/{contact}/{hours}")
    public Professor createProfessor(@PathVariable String name, @PathVariable String contact, @PathVariable String hours) {
        Professor savedProfessor = new Professor();
        savedProfessor.setName(name);
        savedProfessor.setContact(contact);
        savedProfessor.setHours(hours);
        return this.professorService.add(savedProfessor);
    }

    @PutMapping(value ="/professor/{id}/{hours}")
    public Professor updateProfessorHours(@PathVariable long id, @PathVariable String hours) {
        Professor updatedProfessor = this.professorService.getById(id);
        updatedProfessor.setHours(hours);
        return this.professorService.update(id, updatedProfessor);

    }

    @DeleteMapping(value ="/professor/{id}")
    public void deleteProfessor(@PathVariable long id) {
        this.professorService.delete(id);
    }
}

