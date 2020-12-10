<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="wheat">
<br>
<center><h1>Welcome to Employee Home</h1></center>
<a href="employee_home.html"><h2>HOME<h2></a>
<a href="employee_profile.jsp">PROFILE</a>
<a href="index.html">LOGOUT</a>
<br>
<%@ include file="connect.jsp" %>
<%
  int id=Integer.parseInt(request.getParameter("id"));
  ps=con.prepareStatement("select * from employee where id=?");
  ps.setInt(1,id);
  ResultSet rs=ps.executeQuery();
  while(rs.next()){
%>
<form action="employee_profile_update.jsp" align ="center">
<br>
<input type="hidden" name="id" value="<%=rs.getString("id")%>">
<label>Name : </label>
<input type="text" name="name" value="<%=rs.getString("name")%>"><br>
<label>email : </label>
<input type="email" name="email" value="<%=rs.getString("email")%>"><br>
<label>Phone : </label>
<input type="number" name="phone" value="<%=rs.getString("phone")%>"><br>
<label>Select Department : </label>
<select name="department">
<option value="<%=rs.getString("department")%>"><%=rs.getString("department")%></option>
<option value="Development">Development</option>
<option value="Testing">Testing</option>
<option value="Architecture">Architecture</option>
<option value="Management">Management</option>
</select><br>
<label>Select Gender : </label>
<input type="radio" name="gender" value="Male">Male
<input type="radio" name="gender" value="Female">Female
<br><br>
<label>Age : </label>
<input type="number" name="age" value="<%=rs.getString("age")%>"><br><br>
<label>Enter Salary :</label>
<input type="number" name="salary" value="<%=rs.getString("salary")%>"><br><br>
<label>Date_of_joining :</label>
<input type="text" name="doj" value="<%=rs.getString("doj")%>"><br><br>
<input type="submit" value="Update">
<br>
</form>
<%}%>