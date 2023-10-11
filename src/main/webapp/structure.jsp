<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff; /* Set the background color of the entire page to white */
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #000; /* Set the background color of the navigation bar to black */
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding: 10px 0;
        }

        .nav-link {
            text-decoration: none;
            color: #fff;
            font-size: 16px;
            margin: 0 20px;
        }

        .nav-link.active {
            background-color: #333; /* Darker background for the active link */
            border-radius: 3px;
            padding: 5px 10px;
        }
    </style>
</head>

<body>

<div class="navbar">
    <a class="nav-link" href="home.jsp">Profile</a>
    <a class="nav-link" href="service_registration.jsp">Add Reservation</a>
    <a class="nav-link" href="delete_registration.jsp">Upcoming Reservations</a>
    <a class="nav-link" href="view_registration.jsp">View All</a>
    <a class="nav-link" href="https://api.asgardeo.io/t/birunthaban/oidc/logout">Logout</a>
</div>

<!-- Rest of your content here -->
</body>

</html>
