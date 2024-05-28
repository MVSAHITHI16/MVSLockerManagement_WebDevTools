package com.lockermanagement.Dao;

import com.lockermanagement.model.Locker;
import com.lockermanagement.model.LockerLending;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.Date;
import java.util.List;


@Repository
public class LockerLendingDAO {
    @Autowired
    private SessionFactory sessionFactory;

    public void save(LockerLending locker) {
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.save(locker);
        session.getTransaction().commit();
    }

    public List<LockerLending> findAllByStudentId(Long studentId) {
       Session session = sessionFactory.getCurrentSession() ;
       session.beginTransaction();
        // Corrected and optimized query to include join fetch for both locker and student
        Query<LockerLending> query = session.createQuery(
                "SELECT ll FROM LockerLending ll " +
                        "JOIN FETCH ll.locker " +  // Fetching the associated locker
                        "JOIN FETCH ll.student " + // Fetching the associated student
                        "WHERE ll.student.id = :studentId", LockerLending.class);
        query.setParameter("studentId", studentId);
        List<LockerLending> lockerLendingList =  query.list();
        session.getTransaction().commit();
        return lockerLendingList;
        }
    public void updateLendingStatus(Long lendingId) {
        Session session = sessionFactory.getCurrentSession();
            session.beginTransaction();
            LockerLending lending = session.get(LockerLending.class, lendingId);
        if (lending != null && "Active".equals(lending.getStatus())) {
            Date today = new Date();
            lending.setReturnDate(today);
            lending.setStatus("Returned");
            Locker locker   = lending.getLocker();
            locker.setAvailability("Available");
            session.update(locker);

            // Calculate fine if the return date is later than the due date
            if (today.after(lending.getDueDate())) {
                long diff = today.getTime() - lending.getDueDate().getTime();
                long daysLate = diff / (24 * 60 * 60 * 1000); // Convert milliseconds to days
                double fine = daysLate * 10.0; // $10 per day
                lending.setFine(fine);
            }
                session.update(lending);
            }
            session.getTransaction().commit();
        }

    public int findCountOfLockerByStudentId(long lockerId, long studentId) {
        int lockerCount = 0;
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        try{
        Query query = session.createQuery("SELECT COUNT(ll) FROM LockerLending ll " +
                "INNER JOIN ll.student s " +
                "WHERE s.id = :studentId AND ll.status = :status");
//        query.setParameter("lockerId", lockerId);
        query.setParameter("studentId", studentId);
        query.setParameter("status", "Active");
            lockerCount = ((Number) query.uniqueResult()).intValue();
            // Process the student object
        } catch (NoResultException e) {
            // Handle the case when no result is found
            lockerCount = 0;
        }
        session.getTransaction().commit();
        return lockerCount;
    }

    public List<LockerLending> getAllLentLockers() {
        Session session = sessionFactory.getCurrentSession();
        if(!session.getTransaction().isActive())
        {
            session.beginTransaction();
        }
        List<LockerLending> lockers = session.createQuery("FROM LockerLending ", LockerLending.class).getResultList();
        session.getTransaction().commit();
        return lockers;
    }

}
