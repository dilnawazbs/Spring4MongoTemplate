<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MongoDB example</title>

<script type="text/javascript">
function showForm(obj) {
	document.getElementById('insert-form').style.visibility='hidden'; 
	document.getElementById('view-selected-form').style.visibility='hidden'; 
	document.getElementById('update-form').style.visibility='hidden'; 
	document.getElementById('delete-form').style.visibility='hidden'; 
	document.getElementById(obj).style.visibility='visible';
}

window.onload = function() {
document.getElementById('insert-form').style.visibility='hidden'; 
document.getElementById('view-selected-form').style.visibility='hidden'; 
document.getElementById('update-form').style.visibility='hidden'; 
document.getElementById('delete-form').style.visibility='hidden'; 
}
</script>
</head>
<body>
<h3>Click on Below Buttons to performs the CRUD operations</h3>
<button type="button" onclick="showForm('insert-form')">Add Employee</button>
<button type="button" onclick="showForm('view-selected-form')">View Employee</button>
<!-- button type="button" onclick="showForm()">View All Employees</button-->
<button type="button" onclick="showForm('update-form')">Update Employee</button>
<button type="button" onclick="showForm('delete-form')">Delete Employee</button>

<!-- To add employee details -->
<form:form id="insert-form" method="POST" action="addEmployee" >
<h1>Please enter employee details for insert operation</h1></br>
Employee Name: <form:input type="text" id="name" placeholder="Enter name" required="required" path="name"/></br>
Employee Id: <form:input type="text" id="employeeId" placeholder="Enter employeeId" required="required" path="employeeId"/></br>
Gender: <form:select type="text" id="gender" placeholder="Enter gender" required="required" path="gender" >
			<option value="male">Male</option>
			<option value="female">Female</option>
		</form:select></br>
Age: <form:input type="text" id="age" placeholder="Specify age" path="age"/></br>
Company Name: <form:input type="text" id="companyName" placeholder="Enter Company Name" required="required" path="company"/></br>
<button type="submit" id="btnContactUs">Add Details</button>
</form:form>

<!-- To view selected employee details -->
<form:form id="view-selected-form" method="POST" action="viewSelectedEmployees">
<h1>Enter Employee details you need to retrieve</h1></br>
Gender: <form:select type="text" id="gender" placeholder="Enter gender" required="required" path="gender" >
			<option value="male">Male</option>
			<option value="female">Female</option>
		</form:select></br>
From Age(Mention Range): <form:input type="text" id="age" required="required" placeholder="Specify age" path="age"/></br>
<button type="submit" id="btnContactUs">View Details</button>
</form:form>

<!-- To update employee details -->
<form:form id="update-form" method="POST" action="updateEmployees">
<h1>Enter Details to update employee details</h1></br>
Employee Name: <form:input type="text" id="name" placeholder="Enter name" required="required" path="name"/></br>
Employee Id: <form:input type="text" id="employeeId" placeholder="Enter employeeId" required="required" path="employeeId"/></br>
Gender: <form:select type="text" id="gender" placeholder="Enter gender" required="required" path="gender" >
			<option value="male">Male</option>
			<option value="female">Female</option>
		</form:select></br>
Age: <form:input type="text" id="age" placeholder="Specify age" path="age" required="required"/></br>
Company Name: <form:input type="text" id="companyName" placeholder="Enter Company Name" required="required" path="company"/></br>
<button type="submit" id="btnContactUs">Update Details</button>
</form:form>

<!-- To delete selected employee details -->
<form:form id="delete-form" method="POST" action="deleteEmployees">
<h1>Enter Employee Id to remove from the list</h1></br>
Employee Id: <form:input type="text" id="employeeId" placeholder="Enter employeeId" required="required" path="employeeId"/></br>
	<button type="submit" id="btnContactUs">Delete Employee</button>
</form:form>

</body>
</html>