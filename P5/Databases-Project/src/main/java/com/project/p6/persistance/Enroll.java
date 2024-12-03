package com.project.p6.persistance;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Enroll {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private long studentId;
    private long courseId;

    private String semester;

}
