package com.project.p6.service;

import com.project.p6.persistance.Professor;
import com.project.p6.persistance.ProfessorRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProfessorService {

    ProfessorRepository professorRepository;

    public ProfessorService(ProfessorRepository professorRepository) {
        this.professorRepository = professorRepository;
    }

    public List<Professor> getAll() {
        return professorRepository.findAll();
    }

    public Professor getById(long id) {
        return this.professorRepository.findById(id).get();
    }

    public Professor getByProfessorName(String name) {
        return this.professorRepository.findByName(name);
    }

    public Professor add(Professor professor) {
        return this.professorRepository.save(professor);
    }

    public Professor update(long id, Professor professor) {
        Optional<Professor> professorOptional = this.professorRepository.findById(id);
        if (professorOptional.isPresent()) {
            professorOptional.get().setContact(professor.getContact());
            return this.professorRepository.save(professorOptional.get());
        }
        throw new RuntimeException();
    }

    public void delete(long id) {
        this.professorRepository.deleteById(id);
    }
}
