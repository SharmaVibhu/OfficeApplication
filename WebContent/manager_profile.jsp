<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body style="background-color:powderblue;">
<br><br><br>
<center><h1>Welcome to Manager Home</h1></center>
<a href="manager_home.html"><h2>HOME<h2></a>
<a href="manager_profile.jsp">PROFILE</a>
<a href="manager_login.html">MANAGER_LOGIN</a>
<%@ page import="java.sql.*" %>
<table border="2" align="center" width="600" height="200" cellpadding="10">
<tr>
    <td>Id</td>
    <td>Name</td>
    <td>Email</td>
    <td>Phone</td>
    <td>department</td>
    <td>gender</td>
    <td>age</td>
    <td>salary</td>
    <td>Action</td>
</tr>
<%@include file="connect.jsp" %>
<%
Integer id=(Integer)session.getAttribute("sid");
ps=con.prepareStatement("select * from manager where id=?");
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%>
<tr>
<td><%=rs.getInt("id") %></td>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getString("phone") %></td>
<td><%=rs.getString("department") %></td>
<td><%=rs.getString("gender") %></td>
<td><%=rs.getString("age") %></td>
<td><%=rs.getString("salary") %></td>
<td><a href="update_manager_profile.jsp?id=<%=rs.getInt(1)%>">Update</a></td>
</tr>
<%}%>
</table>
</body>
</html>