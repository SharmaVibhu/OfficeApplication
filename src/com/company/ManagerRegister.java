package com.company;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerRegister extends HttpServlet{
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
	    String name=request.getParameter("name");
	    String email=request.getParameter("email");
	    String password=request.getParameter("password");	    
	    String phone=request.getParameter("phone");
	    long mobile=Long.parseLong(phone);
	    String department=request.getParameter("department");
	    String gender=request.getParameter("gender");
	    int age=Integer.parseInt(request.getParameter("age"));
	    String salary=request.getParameter("salary");
	    PrintWriter pw=response.getWriter();
	    
	    String sql="insert into manager(name,email,password,phone,department,gender,age,salary) values(?,?,?,?,?,?,?,?)";
	    try {
	    	ps=con.prepareStatement(sql);
	    	ps.setString(1, name);
	    	ps.setString(2,email);
	    	ps.setString(3,password);	    	
	    	ps.setLong(4,mobile);
	    	ps.setString(5,department);
	    	ps.setString(6,gender);
	    	ps.setInt(7,age);
	    	ps.setString(8,salary);
	    	pw.println("<html> <body bgcolor='powderblue'><center><h1>");
	    	int x=ps.executeUpdate();
	    	if(x!=0) 
	    		pw.println("Manager registered successfully");
	    	else
	    		pw.println("Manager registration failed");
	    	pw.println("</h1></center></body></html>");
	    }
	    catch(SQLException e) {
	    	e.printStackTrace();
	    }
	}
}