<!DOCTYPE html>
<html>
<body bgcolor="powderblue">
<br>
<center><h1>WELCOME TO MANAGER HOLIDAY APPOINTMENT PAGE</h1></center>
<br>
<a href="Manager_Home.html">Home</a> |
<a href="manager_profile.jsp">Profile</a> |
<a href="index.html">Logout</a> 
<br><br><br>
<%@include file="connect.jsp" %>
<table border="2" width="700" height="200" cellpadding="20" align ="center">
<tr><td>Employee Name</td><td>Email</td><td>Phone Number</td><td>Department</td><td>no_of_holidays</td><td>Status</td>
<td>Manager Name</td><td>Action</td></tr>
<%
String department=(String)session.getAttribute("department");
ps=con.prepareStatement("select * from holidays where department=?");
ps.setString(1,department);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%> 
<tr>
<td><%=rs.getString("employee_name") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getLong("phone") %></td>
<td><%=rs.getString("department") %></td>
<td><%=rs.getInt("no_of_holidays") %></td>
<td><%=rs.getString("status") %></td>
<td><%=rs.getString("manager_name") %></td>
<% if(rs.getString("status").equalsIgnoreCase("Accepted")) {%>
<td>Accepted</td>
<%} else {%>
<td><a href="accept.jsp?id=<%=rs.getInt(1) %>">Accept</a></td>
<%} %>
</tr>
<%} %>
</table>
</body>
</html>