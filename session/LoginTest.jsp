<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java" import="java.sql.*" %>
    <%@page language="java"  import="java.util.*" %>
    <%@page language="java" import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String un=request.getParameter("txtfirstid"); 
String password=request.getParameter("txtpassword"); 
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/classicmodels", "root", "root");
    PreparedStatement s=con.prepareStatement("select * from customerregister where FirstName=? and password=? ");
    s.setString(1,un);
    s.setString(2,password);
    ResultSet rs=s.executeQuery();
    if(rs.next())
    {

    // out.println("<font color=red size=7>SHOP STOP</font><BR/><BR/>");
      //out.println("Welcome : " + rs.getString("FirstName") + "<BR/>");
      request.getSession(true);
       session.setAttribute("user", un);
       session.setMaxInactiveInterval(5); 
       response.sendRedirect("LoginTest1.jsp");
    }
    else
    {
       //out.println("<font color=red size=7>SHOP STOP</font><BR/><BR/>");
     	out.println("Please Enter Valid User Details");
    }
}
    catch(Exception e)
{
        out.println(e);
}
    
%>

</body>
</html>