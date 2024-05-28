package com.lockermanagement.controller;

import com.lockermanagement.Dao.LockerDAO;
import com.lockermanagement.Dao.LockerLendingDAO;
import com.lockermanagement.Dao.UserDAO;
import com.lockermanagement.model.Locker;
import com.lockermanagement.model.LockerLending;
import com.lockermanagement.model.Student;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class LockerLendingController {

    @Autowired
    private LockerDAO lockerDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private LockerLendingDAO lockerLendingDAO;


    @GetMapping("/student/myLockers")
    public String myLockers(HttpSession session, Model model) {
        Student student = (Student) session.getAttribute("student");
        if (student != null) {
            model.addAttribute("lockerLendings", lockerLendingDAO.findAllByStudentId(student.getId()));
            return "myLockers";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping("/returnLocker")
    public String returnLocker(@RequestParam("lendingId") Long lendingId) {
        lockerLendingDAO.updateLendingStatus(lendingId);
        return "redirect:/student/myLockers";
    }


    @PostMapping("/lendLocker")
    public String lendLocker(@RequestParam("lockerId") Long lockerId, HttpSession session, RedirectAttributes redirectAttributes) {
        Student student = (Student) session.getAttribute("student"); // Ensure the student is stored in session upon login
        boolean lockerStatusLessThanTwo = chkWhetherUserLendsTwoLocker(lockerId, student.getId());
        if (student != null && lockerStatusLessThanTwo) {
            createLending(lockerId, student.getId());
            redirectAttributes.addFlashAttribute("Locker booked successfully!");
            return "redirect:/student/myLockers";
        } else if(!lockerStatusLessThanTwo){
            redirectAttributes.addFlashAttribute( "lockerErrorIfbookedMoreThanTwo","You cannot book more than 2 lockers at a time");
            return "redirect:/availableLockers";
        }else {
            redirectAttributes.addFlashAttribute( "Please log in to book lockers.");
            return "redirect:/login";
        }
    }

    public boolean chkWhetherUserLendsTwoLocker(long lockerId, long studentId){
        int lockerCount = lockerLendingDAO.findCountOfLockerByStudentId(lockerId, studentId);

        if(lockerCount < 2){
            return true;
        }
        return false;
    }

    // Update the method in AdminController.java
    @GetMapping("/searchLockersByBuilding")
    public String searchLockersByBuilding(@RequestParam(value = "building", required = false) String building, Model model) {
        List<Locker> lockers;
        if (building != null && !building.isEmpty()) {
            lockers = lockerDAO.getLockersByBuilding(building);
        } else {
            lockers = lockerDAO.getAllLockers();
        }
        model.addAttribute("lockers", lockers);
        return "availableLockers";
    }



    public void createLending(Long lockerId, Long studentId) {
        Locker locker = lockerDAO.getLockerById(lockerId);
        Student student = userDAO.findById(studentId);
        if (locker != null && student != null && "Available".equals(locker.getAvailability())) {
            LockerLending lending = new LockerLending();
            lending.setLocker(locker);
            lending.setStudent(student);
            lending.setStartDate(new Date()); // Set the start date as the current date
            lending.setDueDate(new Date(System.currentTimeMillis() + 2592000000L)); // Set the due date to one month from now
            lending.setStatus("Active");
            locker.setAvailability("Booked"); // Set locker availability to "Booked"
            lockerDAO.updateLocker(locker);
            lockerLendingDAO.save(lending);
        }
    }

}