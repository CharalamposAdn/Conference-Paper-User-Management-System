<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.site.LoginDao"%>

<%	// Get the username parameter from the request
    String username = request.getParameter("username");  // Check if the username is not null and not empty
    if (username != null && !username.isEmpty()) {
        try {
        	// Deactivate the admin account using the LoginDao
            new LoginDao().deactivateAccountAdmin(username);
            response.sendRedirect("ViewUsers.jsp"); // Redirect to the user list page
        } catch (Exception e) {
            e.printStackTrace();// Print the stack trace if an exception occurs during deactivation
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);// Set the response status to internal server error in case of an exception
        }
    } else {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Set the response status to bad request if the username is missing or empty
    }
%>
