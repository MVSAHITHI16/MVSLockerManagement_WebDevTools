package com.lockermanagement.controller;

import com.lockermanagement.Dao.LockerDAO;
import com.lockermanagement.Dao.LockerLendingDAO;
import com.lockermanagement.Dao.UserDAO;
import com.lockermanagement.model.Locker;
import com.lockermanagement.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private LockerDAO lockerDAO;

    @Autowired
    private LockerLendingDAO lockerLendingDAO;

    @GetMapping("/")
    public String welcomePage() {
        return "welcome";
    }


@GetMapping("/register")
public String getRegister(Model model) {
    // Adding an empty Student object to the model to be populated by the form
    model.addAttribute("student", new Student());
    return "register";
}

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("student") Student student,RedirectAttributes rd) {
        // Saving the student
        try {
            userDAO.save(student);
        } catch (Exception e) {
            rd.addFlashAttribute("error","Username already Exist");
            return "redirect:/register";
        }
        return "redirect:/registerSuccess";
    }
    @GetMapping("/registerSuccess")
    public String showRegisterSuccessPage() {
        return "registerSuccess";
    }

    @GetMapping("/login")
    public String showLoginForm(Model model,HttpSession session,RedirectAttributes redirectAttributes) {
        Student student = (Student) session.getAttribute("student");
        if(student != null ) {
            return getRespectivePageString(model, student, redirectAttributes);
        }
        else {
            model.addAttribute("student", new Student());
        }
        return "login";
    }

    @PostMapping("/login")// old working
    public String loginUser(@ModelAttribute("student") Student student, Model model, HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        Student std = userDAO.findByUsernamenPassword(student.getUsername(), student.getPassword());
        session = request.getSession();
        session.setAttribute("student", std);
        if (std != null) {
            return getRespectivePageString(model, std, redirectAttributes);
        } else {
            redirectAttributes.addFlashAttribute("msg","Invalid Username or Password");
            return "redirect:/login";
        }
    }


//    @GetMapping("/userProfile")
//    public String showProfileForm(HttpServletRequest request,Model model,HttpSession session) {
////        model.addAttribute("student", studentDAO.findById(student.getId()));
//        Student student = (Student) session.getAttribute("student");
//
////        model.getAttribute("student");
//            model.addAttribute("student", student);
//            return "userProfile";
//    }
    @GetMapping("/userProfile")
    public String showProfileForm(HttpServletRequest request, Model model, HttpSession session) {
        // Get the current student from session
        Student student = (Student) session.getAttribute("student");
        // Update student object with new data (if any)
        // For example, if you have a method to update student details, you can call it here
        model.addAttribute("student", userDAO.findById(student.getId()));
        return "userProfile";
    }



    // Update locker (submit form)
    @PostMapping("/updateProfile")
    public String updateUserProfile(@ModelAttribute("student") Student student, Model model,RedirectAttributes redirectAttributes) {
        userDAO.updateUser(student);
        model.addAttribute("student", userDAO.findById(student.getId()));

        return "loggedUser";
    }


    @GetMapping("/logout")
    public String logoutUser(HttpSession httpSession,HttpServletRequest req) {
        httpSession = req.getSession(false);
        httpSession.removeAttribute("student");
        httpSession.invalidate();
        return "redirect:/login";
    }



    private String getRespectivePageString(Model model, Student student, RedirectAttributes redirectAttributes) {
        model.addAttribute("student", student);
        if (isAdmin(student)) {
            model.addAttribute("lockers", lockerDAO.getAllLockers());
            model.addAttribute("students", userDAO.getAllUsers());
            model.addAttribute("lentLockers",lockerLendingDAO.getAllLentLockers());
            return "admin/loggedAdmin";
        } else if (isUserValid(student)) {
            return "loggedUser";
        } else {
            redirectAttributes.addFlashAttribute("msg", "Invalid Usernme or Password"); // Keep the original error message
            return "redirect:/login";
        }
    }

    private boolean isAdmin(Student std) {
        //Old Code
        //if(std.getUsername().equals("admin@gmail.com")){
        if (std.getUsername().equals("admin@northeastern.edu") && std.getPassword().equals("Admin@123")){
            return true;
        }
         return false;
    }

    private boolean isUserValid(Student std) {
        //Old Code
        //if(std.getUsername().equals("admin@gmail.com")){
        if (std.getUsername().endsWith("@northeastern.edu") && std.getPassword().matches("^(?=.*[A-Z])(?=.*\\d).+$")){
            return true;
        }
        return false;
    }


@GetMapping("/availableLockers")
public String getAllAvailableLockers(@RequestParam(value = "building", required = false) String building, Model model) {
    List<Locker> availableLockers;
    if (building != null && !building.isEmpty()) {
        availableLockers = lockerDAO.getLockersByBuilding(building);
    } else {
        availableLockers = lockerDAO.getAvailableLockers();
    }
    model.addAttribute("lockers", availableLockers);
    return "availableLockers"; // Assuming this is the name of your JSP page
}

//@GetMapping("admin/lendLockers")
//public String getAllLentLockers(Model model){
//
//
//       return  ""
//}

//////////////////////

    // View all lockers
    @GetMapping("/viewLockers")
    public String viewAllLockers(Model model) {
        List<Locker> lockers = lockerDAO.getAllLockers();
        model.addAttribute("lockers", lockers);
        return "admin/viewLockers";
    }


    @GetMapping("/addLockerForm")
    public String showAddLockerForm(HttpServletRequest request, Model model, HttpSession session, RedirectAttributes rd) {
        Student std = (Student) session.getAttribute("student");
        if(std == null){
            return "redirect:/login";
        }else if(!isAdmin(std)) {
            rd.addFlashAttribute("errorMsg", "Inaccessible Page");
            return "redirect:/login";
        }
       model.addAttribute("locker",new Locker());
        return "admin/addLockerForm";
    }

    // Add a new locker (submit form)
    @PostMapping("/addLocker")
    public String addLocker(@ModelAttribute("locker") Locker locker,HttpSession session,Model model) {
        Student loggedUsr = (Student) session.getAttribute("student");
        if(loggedUsr!= null && isAdmin(loggedUsr)){
            lockerDAO.addLocker(locker);
        }
   else{ System.out.println("Student is not admin , Access denied to add a locker");}
        return "redirect:/login";
    }

    @GetMapping("/updateLockerForm")
    public String showUpdateLockerForm(HttpServletRequest request, Model model, HttpSession session) {
        Student std = (Student) session.getAttribute("student");
        if(std == null){
            return "redirect:/login";
        }
        Long id = Long.parseLong(request.getParameter("id"));
        Long adminid = Long.parseLong((request.getParameter("adminId")));
        Locker locker = lockerDAO.getLockerById(id);
        model.addAttribute("adminId",adminid);
        model.addAttribute("locker", locker);
        return "admin/updateLockerForm";
    }
//


    // Update locker (submit form)
    @PostMapping("/updateLocker")
    public String updateLocker(@ModelAttribute("locker") Locker locker, HttpServletRequest request,Model model) {
        Long adminid = Long.parseLong((request.getParameter("adminId")));
        Student std = userDAO.findById(adminid);
        lockerDAO.updateLocker(locker);
        model.addAttribute("student",std);
        model.addAttribute("lockers", lockerDAO.getAllLockers());
        model.addAttribute("students", userDAO.getAllUsers());
        model.addAttribute("lentLockers",lockerLendingDAO.getAllLentLockers());
        return "admin/loggedAdmin";
    }

    @GetMapping("/deleteLockerForm/{id}")
    public String showLockerForm(@PathVariable Long id,HttpServletRequest request, Model model) {
        Long adminid = Long.parseLong((request.getParameter("adminId")));
        model.addAttribute("adminId",adminid);
        try {
            lockerDAO.deleteLocker(id);
        } catch (Exception e) {
//            lockerDAO.updateLocker(locker);
           model.addAttribute("error","cannot del assigned to someone");
        }
        model.addAttribute("lockers", lockerDAO.getAllLockers());
        model.addAttribute("students", userDAO.getAllUsers());
        model.addAttribute("lentLockers",lockerLendingDAO.getAllLentLockers());
        return "redirect:/login";
    }






    // Add a new student (show form)
    @GetMapping("/addUserForm") // Changed the mapping to addUserForm
    public String showAddUserForm(HttpServletRequest request, Model model, HttpSession session, RedirectAttributes rd) {
       Student std = (Student) session.getAttribute("student");
       if(std == null){
          return "redirect:/login";
       } else if(!isAdmin(std)) {
           rd.addFlashAttribute("errorMsg", "Inaccessible Page");
           return "redirect:/login";
       }
        model.addAttribute("User", new Student());
        return "admin/addUserForm";
    }


    // Add a new student (submit form)

    @PostMapping("/addUser")
    public String addUser(@ModelAttribute("student") Student student, HttpServletRequest request, Model model, HttpSession session) {
        Student loggedUsr = (Student) session.getAttribute("student");
        if(loggedUsr!= null && isAdmin(loggedUsr)){
            userDAO.addUser(student);
        }
        else{ System.out.println("Student is not admin , Acess denied to add a student");}
        return "redirect:/login";
    }



    // View all students
    @GetMapping("/viewUsers")
    public String viewAllUsers(Model model) {
        List<Student> students = userDAO.getAllUsers();
        model.addAttribute("students", students);
        return "admin/viewUsers";
    }

    // Update student (show form)
    // Update student (show form)
    @GetMapping("/updateUserForm")
    public String showUpdateUserForm(HttpServletRequest request, Model model, HttpSession session) {
        Student std = (Student) session.getAttribute("student");
        if(std == null){
            return "redirect:/login";
        }
        Long id = Long.parseLong(request.getParameter("studentId"));
        Student student = userDAO.findById(id);
        Long adminid = Long.parseLong((request.getParameter("adminId")));
        model.addAttribute("student", student);
        model.addAttribute("adminId",adminid);
        return "admin/updateUserForm";
    }

    // Update student (submit form)
    @PostMapping("/updateUser")
    public String updateUser(@ModelAttribute("student") Student student, HttpServletRequest request, Model model) {
        Long adminid = Long.parseLong((request.getParameter("adminId")));
        model.addAttribute("adminId",adminid);
        userDAO.updateUser(student); // This will update the existing student
        model.addAttribute("lockers", lockerDAO.getAllLockers());
        model.addAttribute("students", userDAO.getAllUsers());
        model.addAttribute("lentLockers",lockerLendingDAO.getAllLentLockers());
        return "redirect:/login";
    }

    @GetMapping("/deleteUserForm/{id}")
    public String showDeleteUserForm(@PathVariable Long id,HttpServletRequest request, Model model) {
        Long adminid = Long.parseLong((request.getParameter("adminId")));
        model.addAttribute("adminId",adminid);
     userDAO.deleteUser(id);
        model.addAttribute("lockers", lockerDAO.getAllLockers());
        model.addAttribute("students", userDAO.getAllUsers());
        model.addAttribute("lentLockers",lockerLendingDAO.getAllLentLockers());
        return "redirect:/login";
    }




}

