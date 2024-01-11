<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean class="com.site.User" id="user" scope="session"></jsp:useBean>


   <jsp:setProperty property="*" name="user"/>


<h3> Data has been set</h3>
<a href = 'Registration.jsp' >Display Data</a>