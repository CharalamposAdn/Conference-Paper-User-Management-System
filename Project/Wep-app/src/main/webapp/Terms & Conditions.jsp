<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Terms & Conditions</title>
<link rel="stylesheet" type="text/css" href="css/Terms & Conditions.css"> >
<style>
</style>
</head>
<body>

<div class="container">
    <div class="main-container">
        <h1>Terms & Conditions</h1>
        <div class="main">
            <%
                try {
                    // Get the absolute path to the file
                    String filePath = getServletContext().getRealPath("/Terms & Conditions.txt"); // Updated file name

                    // Log the file path for debugging
                    System.out.println("Absolute file path: " + filePath);

                    java.io.BufferedReader reader = new java.io.BufferedReader(
                        new java.io.FileReader(filePath)
                    );

                    String line = null;

                    // Read the file line by line and output it to the JSP page
                    while ((line = reader.readLine()) != null) {
                        out.println(line + "<br>");
                    }

                    reader.close();
                } catch (java.io.IOException e) {
                    // Log the exception for debugging
                    e.printStackTrace();
                    out.println("Error reading Terms & Conditions file: " + e.getMessage());
                }
            %>
        </div>
    </div>
</div>

</body>
</html>
>
