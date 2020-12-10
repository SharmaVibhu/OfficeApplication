<%@ include file="connect.jsp"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
Long phone=Long.parseLong(request.getParameter("phone"));
String department=request.getParameter("department");
int no_of_holidays=Integer.parseInt(request.getParameter("no_of_holidays"));
ps = con.prepareStatement("insert into holidays(employee_name,email,phone,department,no_of_holidays) values(?,?,?,?,?)");
ps.setString(1,name);
ps.setString(2,email);
ps.setLong(3,phone);
ps.setString(4,department);
ps.setInt(5,no_of_holidays);
int x=ps.executeUpdate();
if(x!=0)
	response.sendRedirect("holiday.jsp?msg=applied_Holidays");
%>