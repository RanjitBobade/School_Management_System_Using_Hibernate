<%@page import="StudentCurd.Student"%>
<%@page import="javax.persistence.EntityManager"%>
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
		style="border: 10px solid black; padding: 5%; margin: 10% 25% 50px 25%; background-color:#CCCCFF;border-radius: 25px;">
		<%
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Ajay");
		EntityManager em = emf.createEntityManager();
		Student t = em.find(Student.class, id1);
		%>
		<form action="StudentAdd" method="post">
			<table>
				<tr>
					<td>Id:</td>
					<td><input type="text" value="<%=t.getId()%>" name="id"></td>
				</tr>
				<tr>
					<td>FirstName:</td>
					<td><input type="text" value="<%=t.getFirstName()%>"
						name="FirstName"></td>
				</tr>
				<tr>
					<td>LastName :</td>
					<td><input type="text" value="<%=t.getLastName()%>"
						name="LastName"></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" value="<%=t.getEmailId()%>"
						name="email"></td>
				</tr>

				<tr>
				<td/>
					<td><br><br><input type="submit" value="Submit" style="background-color: #D5DBDB ;border-radius: 25px;"></td>
					
				</tr>
			</table>
		</form>

	</div>
</body>
</html>