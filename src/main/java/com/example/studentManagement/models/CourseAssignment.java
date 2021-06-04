package com.example.studentManagement.models;

import com.example.studentManagement.enums.AssignmentStatus;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name="course_assignment")
public class CourseAssignment implements Serializable {
    private static  final long serialVersionUID=1789635095386L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;
    private String assignedOn;
    private String lastUpdatedBy;
    @Enumerated(EnumType.STRING)
    private AssignmentStatus status;
    private String lastStatusChangedOn;
    @ManyToOne
    private Student student;
    @ManyToOne
    private Course course;
    public CourseAssignment(){}

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public CourseAssignment(String lastUpdatedBy, AssignmentStatus status) {
        this.assignedOn = LocalDateTime.now().toString();
        this.lastUpdatedBy = lastUpdatedBy;
        this.status = status;
        this.lastStatusChangedOn = LocalDateTime.now().toString();
    }

    public CourseAssignment(Long id, String lastUpdatedBy, AssignmentStatus status) {
        this.id = id;
        this.lastUpdatedBy = lastUpdatedBy;
        this.status = status;
        this.lastStatusChangedOn=LocalDateTime.now().toString();
                
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAssignedOn() {
        return assignedOn;
    }

    public void setAssignedOn(String assignedOn) {
        this.assignedOn = assignedOn;
    }

    public String getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(String lastUpdatedBy) {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public AssignmentStatus getStatus() {
        return status;
    }

    public void setStatus(AssignmentStatus status) {
        this.status = status;
    }

    public String getLastStatusChangedOn() {
        return lastStatusChangedOn;
    }

    public void setLastStatusChangedOn(String lastStatusChangedOn) {
        this.lastStatusChangedOn = lastStatusChangedOn;
    }
}
