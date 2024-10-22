package org.Employee;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@Autowired
	EntityManager em;


	@RequestMapping("/login")
    public ModelAndView login(@RequestParam String email, @RequestParam String password) {
    	ModelAndView mv = new ModelAndView();
    	Query q = em.createQuery("FROM Employee u WHERE u.email = :email AND u.password = :password");
    	q.setParameter("email",email);
    	q.setParameter("password", password);
        List<Employee> empl = q.getResultList();
        if(empl!=null) {
        	Query query = em.createQuery("from Employee");
    		List<Employee> emp = query.getResultList();
        	  mv.addObject("emp", emp);
        	mv.setViewName("home.jsp");
        }
        else
        	mv.setViewName("index.jsp");
       
    	
    	return mv;
    }

	@RequestMapping("/save")
	public ModelAndView save( 
			@RequestParam String name, @RequestParam String email, @RequestParam String password,      
			@RequestParam double salary, @RequestParam String status, HttpServletRequest req) {

		Employee e = new Employee();

		String d = req.getParameter("dob");
		LocalDate dob = LocalDate.of(Integer.parseInt(d.substring(0, 4)), 
								     Integer.parseInt(d.substring(5, 7)),
				                     Integer.parseInt(d.substring(8, 10)));
		
		e.setName(name);
		e.setEmail(email);
		e.setPassword(password);
		e.setDob(dob);

		int age = calculateAge(dob);
		e.setAge(age);

		e.setSalary(salary);

		boolean stat=status.equalsIgnoreCase("Active");
		e.setStatus(stat);

		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(e);
		et.commit();

		Query q = em.createQuery("from Employee");
		List<Employee> emp = q.getResultList();

		ModelAndView mv = new ModelAndView();
		mv.setViewName("home.jsp");
		mv.addObject("emp", emp);

		return mv;
	}

	@RequestMapping("/delete")
	public ModelAndView Delete(@RequestParam Long id) {

		Employee e = em.find(Employee.class, id);
		if (e != null) {
			EntityTransaction et = em.getTransaction();
			et.begin();
			em.remove(e);
			et.commit();
		}
		Query q = em.createQuery("from Employee");
		List<Employee> emp = q.getResultList();

		ModelAndView mv = new ModelAndView();
		mv.setViewName("home.jsp");
		mv.addObject("emp", emp);

		return mv;
	}

	@RequestMapping("/updatePage")
	public ModelAndView updatePage(@RequestParam Long id) {

		ModelAndView mv = new ModelAndView();
		Employee e = em.find(Employee.class, id);
		if (e != null) {
			mv.addObject("e", e);
			mv.setViewName("update.jsp");
			return mv;
		} else {
			Query q = em.createQuery("FROM User");
			List<Employee> emp = q.getResultList();

			mv.setViewName("home.jsp");
			mv.addObject("emp", emp);

			return mv;
		}
	}

	@RequestMapping(value = "/update")
	public ModelAndView update(@RequestParam Long id,@RequestParam String name, @RequestParam String email, @RequestParam String password,      
			@RequestParam double salary, @RequestParam boolean status, HttpServletRequest req) {

	Employee e=em.find(Employee.class, id);

	String d = req.getParameter("dob");
	LocalDate dob = LocalDate.of(Integer.parseInt(d.substring(0, 4)), 
							     Integer.parseInt(d.substring(5, 7)),
			                     Integer.parseInt(d.substring(8, 10)));
	
	    e.setName(name);
	    e.setEmail(email);
	    e.setPassword(password);
	    e.setSalary(salary);
		e.setStatus(status);
		
		e.setDob(dob);
	
		EntityTransaction et = em.getTransaction();

		et.begin();
		em.merge(e);
		et.commit();

		Query q = em.createQuery("from Employee");
		List<Employee> emp = q.getResultList();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home.jsp");
		mv.addObject("emp", emp);

		return mv;

	}

	public int calculateAge(LocalDate dob) {
		LocalDate currentDate = LocalDate.now(); 
		if (dob != null && !dob.isAfter(currentDate)) {
			return Period.between(dob, currentDate).getYears(); 
		} else {
			throw new IllegalArgumentException("Date of birth must be in the past or present.");
		}
	}

}
