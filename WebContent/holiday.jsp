<!DOCTYPE html>
<html>
<body bgcolor="powderblue">
<br>
<center><h1>WELCOME TO HOLIDAY APPOINTMENT PAGE</h1></center>
<br>
<a href="employee_Home.html">Home</a> |
<a href="employee_profile.jsp">Profile</a> |
<a href="index.html">Logout</a> 

<form action="apply_holiday.jsp" align="center">
<label>Employee Name :</label>
<input type="text" name="name" placeholder="Enter name"><br><br>
<label>Email id :</label>
<input type="email" name="email" placeholder="Enter email"><br><br>
<label>Mobile Number :</label>
<input type="number" name="phone" placeholder="Enter phone number"><br><br>

<label>Select Department : </label>
<select name="department">
<option value="Development">Development</option>
<option value="Testing">Testing</option>
<option value="Architecture">Architecture</option>
<option value="Management">Management</option>
</select><br><br>
<label>Enter number of Holidays : </label>
<input type="number" name="no_of_holidays" value="Enter days"><br><br>
<br>
<input type="submit" value ="Apply">
</form>
</body>
</html>