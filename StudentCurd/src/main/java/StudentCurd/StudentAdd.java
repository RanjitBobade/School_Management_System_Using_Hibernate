package StudentCurd;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/StudentAdd")
public class StudentAdd extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String FirstName = req.getParameter("FirstName");
		String LastName = req.getParameter("LastName");
		String email = req.getParameter("email");
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Ajay");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		int number = Integer.parseInt(id);
		
		Student p = new Student();
		p.setId(number);
		p.setFirstName(FirstName);
		p.setLastName(LastName);
		p.setEmailId(email);
		
		et.begin();
		em.merge(p);
		et.commit();
		em.close();
		
		RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
		rd.include(req, resp);
	}
}
