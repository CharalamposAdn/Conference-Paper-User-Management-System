<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.site.LoginDao"%>

<%
    String username = request.getParameter("username");// Get the username parameter from the request
    if (username != null && !username.isEmpty()) { // Check if the username is not null and not empty
        try {
            new LoginDao().activateAccount(username);// Activate the account using the LoginDao
            response.sendRedirect("ViewUsers.jsp"); // Redirect to the user list page
        } catch (Exception e) {
            e.printStackTrace(); // Print the stack trace if an exception occurs during activation
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);// Set the response status to internal server error in case of an exception
        }
    } else {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);// Set the response status to bad request if the username is missing or empty
    }
%>
