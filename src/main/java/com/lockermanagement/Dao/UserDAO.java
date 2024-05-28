package com.lockermanagement.Dao;

import com.lockermanagement.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;

@Repository
//@Transactional
public class UserDAO {

    @Autowired
    private SessionFactory sessionFactory;


    public void save(Student student) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.save(student);
        session.getTransaction().commit();
    }
    public void addUser(Student student) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.save(student);
        session.getTransaction().commit();
    }

    public void updateLocker(Student student) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.update(student);
        session.getTransaction().commit();
    }

    public void updateUser(Student student) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.update(student);
        session.getTransaction().commit();
    }


    public Student findByUsername(String username) {
    Session session = sessionFactory.getCurrentSession();
    session.beginTransaction();
    Query query = session.createQuery("FROM Student WHERE username = :username");
    query.setParameter("username", username);
        Student student = (Student) query.getSingleResult();
        session.getTransaction().commit();
        return student;
    }

    public Student findById(Long id) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();


        Student student = session.get(Student.class, id);
        session.getTransaction().commit();
        return student;
    }

//    public Student findByUsernamenPassword(String username,String password) {
//        Session session = sessionFactory.getCurrentSession();
//        session.beginTransaction();
//        Query query = session.createQuery("FROM Student WHERE username = :username AND password= :password");
//        query.setParameter("username", username);
//        query.setParameter("password",password);
//        Student user = (Student) query.getSingleResult();
//        session.getTransaction().commit();
//        return user;
//    }
public Student findByUsernamenPassword(String username, String password) {
    Session session = sessionFactory.getCurrentSession();
    session.beginTransaction();
    Query query = session.createQuery("FROM Student WHERE username = :username AND password = :password");
    query.setParameter("username", username);
    query.setParameter("password", password);
    Student student;
    try {
        student = (Student) query.getSingleResult();
        // Process the student object
    } catch (NoResultException e) {
        // Handle the case when no result is found
        student = null;
    }
    session.getTransaction().commit();
    return student;
}


    public List<Student> getAllUsers() {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        List<Student> students = session.createQuery("FROM Student WHERE username != :adminUsername", Student.class)
                .setParameter("adminUsername", "admin@northeastern.edu")
                .getResultList();
        session.getTransaction().commit();
        return students;
    }
    public void deleteUser(Long id) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        Student student = session.get(Student.class, id);
        session.delete(student);
        session.getTransaction().commit();
    }



}


