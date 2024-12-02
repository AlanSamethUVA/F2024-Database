package com.example.hospital_cs4750.controller;


import com.example.hospital_cs4750.model.Patient;
import com.example.hospital_cs4750.model.PointOfContact;
import com.example.hospital_cs4750.repository.PointOfContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/api")
public class PointOfContactController {
    @Autowired
    PointOfContactRepository pointOfContactRepository;

    @GetMapping("/contacts")
    public ResponseEntity<List<PointOfContact>> getAllContacts(@RequestParam(required = false) String firstName) {
        try {
            List<PointOfContact> contacts = new ArrayList<PointOfContact>();

            if (firstName == null)
                pointOfContactRepository.findAll().forEach(contacts::add);
            else
                pointOfContactRepository.findByFirstNameContaining(firstName).forEach(contacts::add);

            if (contacts.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }

            return new ResponseEntity<>(contacts, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/contacts/{id}")
    public ResponseEntity<PointOfContact> getById(@PathVariable("id") long id) {
        Optional<PointOfContact> contactsData = pointOfContactRepository.findById(id);

        if (contactsData.isPresent()) {
            return new ResponseEntity<>(contactsData.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/contacts")
    public ResponseEntity<PointOfContact> createPointOfContact(@RequestBody PointOfContact poc) {
        try {
            PointOfContact _poc = pointOfContactRepository.save(new PointOfContact(poc.getPatientID(), poc.getFirstName(), poc.getLastName(), poc.getPhoneNo(), poc.getEmailAddress()));
            return new ResponseEntity<>(_poc, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/contacts/{id}")
    public ResponseEntity<PointOfContact> updatePointOfContact(@PathVariable("id") long id, @RequestBody PointOfContact poc) {
        Optional<PointOfContact> pocData = pointOfContactRepository.findById(id);

        if (pocData.isPresent()) {
            PointOfContact _poc= pocData.get();
            _poc.setFirstName(poc.getFirstName());
            _poc.setLastName(poc.getLastName());
            _poc.setPhoneNo(poc.getPhoneNo());
            _poc.setEmailAddress(poc.getEmailAddress());
            return new ResponseEntity<>(pointOfContactRepository.save(_poc), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/contacts/{id}")
    public ResponseEntity<HttpStatus> deletePointOfContact(@PathVariable("id") long id) {
        try {
            pointOfContactRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }



}
