<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes: Note Taker</title>
<%@include file="all_js_css.jsp"%>

</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes</h1>




		<div class="row">
			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("From Note");

				List<Note> list = q.list();
				for (Note note : list) {
				%>

				<div class="card">
					<img class="card-img-top p-4" style="max-width: 100px;"
						src="img/pencil.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%>
						</h5>
						<p class="card-text"><%=note.getContent()%></p>
						<a href="#" class="btn btn-danger">Delete</a>
					</div>
				</div>

				<%
				}

				s.close();
				%>

			</div>
		</div>




	</div>
</body>
</html>