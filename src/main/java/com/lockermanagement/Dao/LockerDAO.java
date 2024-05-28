package com.lockermanagement.Dao;

import com.lockermanagement.model.Locker;
import com.lockermanagement.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.List;

@Repository
public class LockerDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public List<Locker> getAllLockers() {
        Session session = sessionFactory.getCurrentSession();
       if(!session.getTransaction().isActive())
        {
            session.beginTransaction();
        }
        List<Locker> lockers = session.createQuery("FROM Locker", Locker.class).getResultList();
        session.getTransaction().commit();
        return lockers;
    }

    public List<Locker> getLockersByBuilding(String building) {
        Session session = sessionFactory.getCurrentSession();
       if(!session.getTransaction().isActive())
        {
            session.beginTransaction();
        }
        Query query = session.createQuery("FROM Locker WHERE building = :building");
        query.setParameter("building", building);
        List<Locker> lockers = query.getResultList();
        session.getTransaction().commit();
        return lockers;
    }



    public List<Locker> getAvailableLockers() {
        Session session = sessionFactory.getCurrentSession();
       if(!session.getTransaction().isActive())
        {
            session.beginTransaction();
        }
        Query query = session.createQuery("FROM Locker WHERE availability = :available");
        query.setParameter("available","Available");
        List<Locker> availableLockers = query.getResultList();
        session.getTransaction().commit();
        return availableLockers;
    }

    public void bookLocker(Long lockerId, Long userId) {
        Session session = sessionFactory.getCurrentSession();
       if(!session.getTransaction().isActive())
        {
            session.beginTransaction();
        }

        // Retrieve the locker by ID
        Locker locker = session.get(Locker.class, lockerId);

        // Update the availability of the locker
        locker.setAvailability("Booked");

        // Associate the locker with the student who booked it
        Student student = session.get(Student.class, userId);
        locker.setBookedBy(student);

        session.getTransaction().commit();
    }

    public void addLocker(Locker locker) {
        Session session = sessionFactory.getCurrentSession();
       if(!session.getTransaction().isActive())
        {
            session.beginTransaction();
        }
        session.save(locker);
        session.getTransaction().commit();
    }
    public Locker getLockerById(Long id) {
        Session session = sessionFactory.getCurrentSession();
        if(!session.getTransaction().isActive())


        {
            session.beginTransaction();
        }



        // Retrieve the locker by ID
        Locker locker = session.get(Locker.class, id);

        session.getTransaction().commit();
        return locker;
    }


    public void updateLocker(Locker updatedLocker) {
        Session session = sessionFactory.getCurrentSession();
       if(!session.getTransaction().isActive())
        {
            session.beginTransaction();
        }
        session.update(updatedLocker);
        session.getTransaction().commit();
    }

    public void deleteLocker(Long id) {
        Session session = sessionFactory.getCurrentSession();
       if(!session.getTransaction().isActive())
        {
            session.beginTransaction();
        }
        Locker locker = session.load(Locker.class, id);
        session.delete(locker);
        session.getTransaction().commit();
    }
}
