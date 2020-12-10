<%@ include file="connect.jsp"%>
<% 
int id=Integer.parseInt(request.getParameter("id"));
String name=(String)session.getAttribute("name");
ps = con.prepareStatement("Update holidays set status=?,manager_name=? where hid=?");
ps.setString(1,"Accepted");
ps.setString(2,name);
ps.setInt(3,id);
int x=ps.executeUpdate();
if(x!=0)
	response.sendRedirect("view_holiday.jsp?msg=accepted");
%>