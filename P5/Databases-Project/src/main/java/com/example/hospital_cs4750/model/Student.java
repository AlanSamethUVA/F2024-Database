package com.example.hospital_cs4750.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;

import java.util.Date;


@Entity
@Table(name = "Student")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_id")
    private long studentID;

    @Column(name = "student_id_encrypted")
    private byte[] studentEncrypted;

    @Column(name = "student_year")
    private long studentYear;

    public Student(){

    }

    public Student(long studentYear) {
            this.studentYear = studentYear;
    }
    public long getStudentID() {
        return studentID;
    }
    public void setStudentID(long studentID) {
        this.studentID = studentID;
    }
    public byte [] getStudentEncrypted() {
        return studentEncrypted;
    }

    public void setStudentEncrypted(byte [] studentEncrypted) {
        this.studentEncrypted = studentEncrypted;
    }

    public long getStudentYear() {
        return studentYear;
    }

    public void setStudentYear(long studentYear) {
        this.studentYear = studentYear;
    }
}
