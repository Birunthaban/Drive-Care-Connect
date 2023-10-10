<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.net.*, java.util.*" %>
<%@ page import="org.json.JSONObject" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<body >
 
    
        
          <a class="nav-link text-white active bg-gradient-primary" href="home.jsp">
            <span class="nav-link-text ms-1">Profile</span>
          </a>
      
       
          <a class="nav-link text-white " href="service_registration.jsp">
             
            <span class="nav-link-text ms-1">Add Reservation</span>
          </a>
       
          <a class="nav-link text-white " href="delete_registration.jsp">
            
            <span class="nav-link-text ms-1">Upcoming Reservations</span>
          </a>
        
          <a class="nav-link text-white " href="view_registration.jsp">
            
            <span class="nav-link-text ms-1">View All</span>
          </a>
    
    
        <a class="btn bg-gradient-primary mt-4 w-100" href="https://api.asgardeo.io/t/birunthaban/oidc/logout" type="button">
          Log out
         
        </a>
    

  
</body>

</html>
