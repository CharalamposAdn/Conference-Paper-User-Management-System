<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean class="com.site.User" id="user" scope="session"></jsp:useBean>

<!-- Setting properties of the User bean from request parameters -->
 <jsp:setProperty property="*" name="user"/>

<!-- Displaying a message indicating that data has been set -->
<h3> Data has been set</h3>
<!-- Link to navigate to Registration.jsp to display the data -->
<a href = 'Registration.jsp' >Display Data</a>