<%@ include file="connect.jsp" %>
<%
 int id=Integer.parseInt(request.getParameter("id"));
 String name=request.getParameter("name");
 String email=request.getParameter("email");
 Long phone=Long.parseLong(request.getParameter("phone"));
 String department=request.getParameter("department");
 String gender=request.getParameter("gender");
 int age=Integer.parseInt(request.getParameter("age"));
 String salary=request.getParameter("salary");
 String doj=request.getParameter("doj");
 
 ps=con.prepareStatement("update employee set name=?,email=?,phone=?,department=?,gender=?,age=?,salary=?,doj=? where id=?");
 ps.setString(1,name);
 ps.setString(2,email);
 ps.setLong(3,phone);
 ps.setString(4,department);
 ps.setString(5,gender);
 ps.setInt(6,age);
 ps.setString(7,salary);
 ps.setString(8,doj);
 ps.setInt(9,id);
 int x=ps.executeUpdate();
 if(x!=0){
	 response.sendRedirect("employee_profile.jsp?msg=updated");
 }
%>