<!DOCTYPE html>
<html>
<body bgcolor="powderblue">
<br>
<center><h1>WELCOME TO HOLIDAY STATUS PAGE</h1></center>
<br>
<a href="Employee_Home.html">Home</a> |
<a href="employee_profile.jsp">Profile</a> |
<a href="index.html">Logout</a> 
<br><br><br>
<%@include file="connect.jsp" %>
<table border="2" width="700" height="200" cellpadding="20" align ="center">
<tr><td>Employee Name</td><td>Email</td><td>Phone Number</td><td>Department</td><td>no_of_holidays</td><td> holiday_begin_date</td><td>Status</td>
<td>Manager Name</td></tr>
<% 
String department=(String)session.getAttribute("department");
ps=con.prepareStatement("select * from holidays where department=?");
ps.setString(1,department);
ResultSet rs=ps.executeQuery();
while(rs.next()){
%> 
<tr>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getString("phone") %></td>
<td><%=rs.getString("department") %></td>
<td><%=rs.getInt("no_of_holidays") %></td>
<td><%=rs.getString("status") %></td>
<td><%=rs.getString("manager_name") %></td>
</tr>
<%} %>
</table>
</body>
</html>