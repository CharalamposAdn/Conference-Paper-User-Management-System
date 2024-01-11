<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.site.LoginDao"%>

<%
    String username = request.getParameter("username");
    if (username != null && !username.isEmpty()) {
        try {
            new LoginDao().activateAccount(username);
            response.sendRedirect("ViewUsers.jsp"); // Redirect to the user list page
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    } else {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
    }
%>
