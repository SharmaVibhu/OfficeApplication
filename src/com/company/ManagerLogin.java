package com.company;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerLogin extends HttpServlet{
	private static final long serialVersionUID = 1L;
	Connection con=null;
    PreparedStatement ps=null;
    public void init(ServletConfig config) throws ServletException {
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    	}
    	catch(ClassNotFoundException e) {
    		e.printStackTrace();
    	}
    	String url="jdbc:mysql://localhost:3306/company";
    	String username="root";
    	String password="root";
    	try {
    		con=DriverManager.getConnection(url,username,password);
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    	}
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String email=request.getParameter("email");
    	String password=request.getParameter("password");
    	
    	HttpSession hs=request.getSession();
    	PrintWriter pw=response.getWriter();
    	
    	String sql="select * from manager where email=? and password=?";
    	
    	try {
    		ps=con.prepareStatement(sql);
    		ps.setString(1, email);
    		ps.setString(2, password);
    		pw.println("<html> <body bgcolor='wheat'><center><h1>");
    		ResultSet rs=ps.executeQuery();
    		if(rs.next()) {
    			hs.setAttribute("sid",rs.getInt(1));
    			hs.setAttribute("semail",email);
		    	hs.setAttribute("name", rs.getString("name"));
    			response.sendRedirect("./manager_home.html?msg=loggedin");
    		}
    		else {
		    		response.sendRedirect("./manager_login.html?msg=failed");
		    }	
		    pw.println("</h1></center></body></html>");
		  }
		  catch(SQLException e) {
		    e.printStackTrace();
		  }
    }
}