package com.example.hospital_cs4750.model;

import jakarta.persistence.*;

@Entity
@Table(name = "point_of_contact")
public class PointOfContact {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pc_id")
    private long pcID;

    @Column(name = "patient_id")
    private long patientID;

    @Column(name = "pc_first_name")
    private String firstName;

    @Column(name = "pc_last_name")
    private String lastName;

    @Column(name = "pc_phone_no")
    private long phoneNo;

    @Column(name = "pc_email")
    private String emailAddress;

    public PointOfContact() {
    }

    public PointOfContact(long patientID, String firstName, String lastName, long phoneNo, String emailAddress) {
        this.patientID = patientID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNo = phoneNo;
        this.emailAddress = emailAddress;
    }

    public long getPcID() {
        return pcID;
    }

    public void setPcID(long pcID) {
        this.pcID = pcID;
    }

    public long getPatientID() {
        return patientID;
    }

    public void setPatientID(long patientID) {
        this.patientID = patientID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public long getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(long phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

}
