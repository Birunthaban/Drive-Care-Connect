<%@ page import="java.io.*, java.util.*" %>

<%
Properties props = new Properties();
InputStream input = getServletContext().getResourceAsStream("/WEB-INF/authorization.properties");
props.load(input);
%>


<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .login-page {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .login-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-header h3 {
            color: #333;
        }

        .login-form {
            text-align: center; /* Center the button horizontally */
        }

        .login-form button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
        }

        .login-form button a {
            color: #fff;
            text-decoration: none;
        }

        .login-form button:hover {
            background-color: #0056b3;
        }

        .message {
            text-align: center;
            margin-top: 10px;
            color: #777;
        }
    </style>
    <title>Vehicle Service Reservation App</title>
</head>

<body>
    <div class="login-page">
        <div class="form">
            <div class="login">
                <div class="login-header">
                    <h3>DRIVE CARE CONNECT</h3>
                    <p>Please click the button to log in.</p>
                </div>
            </div>
            <form class="login-form">
                <button>
                    <a href="<%= props.getProperty("oauth.auth_endpoint") %>?scope=<%= props.getProperty("oauth.scope") %>&response_type=<%= props.getProperty("oauth.response_type") %>&redirect_uri=<%= props.getProperty("oauth.redirect_uri") %>&client_id=<%= props.getProperty("oauth.client_id") %>">
                        Login
                    </a>
                </button>
              
            </form>
        </div>
    </div>
</body>

</html>
