<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.mongoexample.model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>Resulted Employee Details</h3>
<table>
<%
   List<Employee> employee =(List<Employee>) request.getAttribute("employeeDeatils");
							for (int i = 0; i < employee.size(); i++) {
								
%>
<tr><td>Name:</td><td> <h5><%=employee.get(i).getName()%></h5></td></tr>
<tr><td>EmployeeId:</td><td> <h5><%=employee.get(i).getEmployeeId()%></h5></td></tr>
<tr><td>Gender:</td><td> <h5><%=employee.get(i).getGender()%></h5></td></tr>
<tr><td>Company:</td><td> <h5><%=employee.get(i).getCompany()%></h5></td></tr>
<tr><td>Age:</td><td> <h5><%=employee.get(i).getAge()%></h5></td></tr>
<%} %>
</table>
</body>
</html>