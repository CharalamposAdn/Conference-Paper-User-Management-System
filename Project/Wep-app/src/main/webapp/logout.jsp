
<%@ page import="com.site.LoginDao" %>

<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
if(session.getAttribute("token")==null){
    response.sendRedirect(request.getContextPath() + "/login.jsp");

}

// Handle logout logic
String username = (String) session.getAttribute("name");
LoginDao loginDao = new LoginDao();
loginDao.resetConsecutiveFailures(username); // Add a method to reset consecutive failures

// Clear the session or perform other logout actions as needed
session.invalidate();


%>

