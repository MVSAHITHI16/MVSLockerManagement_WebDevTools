package com.lockermanagement.model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Locker {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String availability;
    private String size;
    private String building;

    @OneToMany(mappedBy = "locker" ,cascade = CascadeType.ALL) // The mappedBy should match the name of the Locker reference in LockerLending
    private List<LockerLending> lockerLendings; // Renamed to 'lockerLendings' for clarity and adherence to Java naming conventions

    public List<LockerLending> getLockerLendings() {
        return lockerLendings;
    }

    public void setLockerLendings(List<LockerLending> lockerLendings) {
        this.lockerLendings = lockerLendings;
    }

    public Locker() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public void setBookedBy(Student student) {
    }
}
