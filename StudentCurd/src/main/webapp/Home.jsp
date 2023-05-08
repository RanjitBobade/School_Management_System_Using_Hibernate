<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="StudentCurd.Student"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div align="center"
		style="border: 10px solid black; padding: 5%; margin: 5% 25% 50px 25%; background-color:#CCCCFF;border-radius: 25px;">
		<h1>Student Details</h1>

		<table align="center" cellpadding="10px" border="10">
			<tr align="center" style="background-color: LightGray">
				<th>Id</th>
				<th>FirstName</th>
				<th>LastName</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
			<%
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("Ajay");
			EntityManager em = emf.createEntityManager();
			Student PM = new Student();
			Query q = em.createQuery("Select b from Student b");
			List<Student> L = q.getResultList();
			for (Student P : L) {
			%>
			<tr align="center" style="background-color: #FDFEFE ">
				<td><%=P.getId()%></td>
				<td><%=P.getFirstName()%></td>
				<td><%=P.getLastName()%></td>
				<td><%=P.getEmailId()%></td>
				<td><a href="UpdateStudent.jsp?id=<%=P.getId()%>"
					style="text-decoration: none;"><mark
							style="background-color: #5DADE2 ; border: 1px solid black; text-decoration: none; border-radius: 5px; padding: 3px">Update</mark></a>
					&nbsp;&nbsp;&nbsp; <a href="StudentDelete?id=<%=P.getId()%>"
					style="text-decoration: none;"><mark
							style="background-color: #E74C3C ; border: 1px solid black; text-decoration: none;border-radius: 5px; padding: 3px">Delete</mark></a>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<br><br>
		<form action="Add.Html">
			<input type="submit" value="Add Student" style="background-color: #D5DBDB ;border-radius: 25px;">
		</form>
	</div>
	<button></button>
</body>
</html>
