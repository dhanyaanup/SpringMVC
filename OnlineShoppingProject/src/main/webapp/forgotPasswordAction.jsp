<%@page import="com.shopping.project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String mobileNumber=request.getParameter("mobileNumber");
String SecurityQuestion=request.getParameter("SecurityQuestion");
String answer=request.getParameter("answer");
String newPassword=request.getParameter("newPassword");
int check=0;
try
{
Connection con=ConnectionProvider.getcon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityQuestion='"+ SecurityQuestion+"' and answer='"+answer+"'");
while(rs.next()){
	check=1;
	st.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
	response.sendRedirect("forgotPassword.jsp?msg=done");
}	
if(check==0)
{
  response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
}
catch(Exception e){
	System.out.print(e);
}
%>