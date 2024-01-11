<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.site.LoginDao, com.site.User"%>
<%@ page import="java.util.List"%>

<%@ page isErrorPage="true" %>

<%
    List<User> userList = null;
    try {
        userList = new LoginDao().getAllUsers();
        System.out.println("User List Size: " + (userList != null ? userList.size() : "null"));
    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }

    request.setAttribute("userList", userList);
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Users</title>
    <link rel="stylesheet" type="text/css" href="css/ViewUsers.css">
    <!-- Add your existing CSS link here -->
   <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

    <header>
        <div class="main">
            <div class="logo">
                <img src="logo.png" alt="Logo">
            </div>

            <ul>
                <li class="active"><a href="Admin.jsp"><i class="fa fa-home"></i>Home</a></li>
                <li><a href="About.jsp">About</a></li>
               
                <li><a href="#"><i class="fa fa-caret-down"></i> View <i class="fa fa-caret-down"></i></a>
                    <div class="sub-menu">
                        <ul>	 
                            <li><a href="#">View Papers</a></li>
                            <li><a href="#">View Conferences</a></li>
                        </ul>
                    </div>
                </li>

                <li><a href="#"><i class="fa fa-caret-down"></i> Search <i class="fa fa-caret-down"></i></a>
                    <div class="sub-menu">
                        <ul>	 
                            <li><a href="#">Search Papers</a></li>
                            <li><a href="#">Search Conferences</a></li>
                        </ul>
                    </div>
                </li>

                <li><a href="login.jsp">Exit</a></li>
            </ul>
            
            
          <div>
        <h2>User List</h2>
        <% if (userList != null && !userList.isEmpty()) { %>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Contact</th>
                        <th>Activate</th>
                        <th>Deactivate</th>
                        <!-- Add more columns as needed -->
                    </tr>
                </thead>
                <tbody>
                   <% for (User user : userList) { %>
    <tr>
        <td><%= user.getId() %></td>
        <td><%= user.getName() %></td>
        <td><%= user.getEmail() %></td>
        <td><%= user.getStatus() %></td>
        <td><%= user.getContact() %></td>
        <td><button class="activate-btn" onclick="activateUser('<%= user.getName() %>')">Activate</button></td>
		<td><button class="deactivate-btn" onclick="deactivateUser('<%= user.getName() %>')">Deactivate</button></td>
        <!-- Add more columns as needed -->
    </tr>
<% } %>

                </tbody>
            </table>
        <% } else { %>
            <p>No users found or an error occurred.</p>
        <% } %>
        </div>
            
           
            
        </div>
    </header>

    
<script>
    function activateUser(username) {
        console.log("Activating user with username: " + username);
        window.location.href = 'activateUser.jsp?username=' + username;
    }

    function deactivateUser(username) {
        console.log("Deactivating user with username: " + username);
        window.location.href = 'deactivateUser.jsp?username=' + username;
    }
</script>

   
</body>
</html>
