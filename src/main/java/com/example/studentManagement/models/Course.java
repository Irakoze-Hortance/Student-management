package com.example.studentManagement.models;
import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "course")
public class Course implements Serializable {
    private static  final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;
    private String Title;
    private Long numHours;
    @OneToMany(mappedBy = "course",fetch=FetchType.LAZY)
    //@Cache(usage= CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    private Set<CourseAssignment> students=new HashSet<>();
    public Course(){}


    public Course(int id, String title, Long numHours) {
        this.id = id;
        Title = title;
        this.numHours = numHours;
    }

    public Set<CourseAssignment> getStudents() {
        return students;
    }

    public void setStudents(Set<CourseAssignment> students) {
        this.students = students;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTitle() {
        return Title;
    }
    public void setTitle(String title) {
        Title = title;
    }
    public Long getNumHours() {
        return numHours;
    }
    public void setNumHours(Long numHours) {
        this.numHours = numHours;
    }
}
