package StudentCurd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentDelete")
public class StudentRemove extends GenericServlet {
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {

		String id = req.getParameter("id");

		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Ajay");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();

		int number = Integer.parseInt(id);

		Query q = em.createQuery("Select a from Student a where a.id=?1");
		q.setParameter(1, number);

		List<Student> pr = q.getResultList();
		System.out.println(pr);
		et.begin();
		em.remove(pr.get(0));
		et.commit();
		RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
		rd.include(req, res);
	}

}
