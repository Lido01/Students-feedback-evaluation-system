<!--
    Name : Dagmawi Wondwosen
    ID   : UGR/34184/16

    Welcome Page (Modified Version)
    --------------------------------
    I modified this page by:
    1. Adding simple styling using internal CSS
    2. Improving layout and readability
    3. Adding a short description for users
    4. Styling login and logout links as buttons
-->

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Welcome To Sample Web Application</title>

    <!-- Simple student-style CSS -->
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            padding-top: 100px;
        }

        .container {
            background: white;
            width: 400px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        h1 {
            color: #333;
        }

        p {
            color: #666;
            font-size: 14px;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            text-decoration: none;
            margin: 10px;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
        }

        .login {
            background-color: #3498db;
            color: white;
        }

        .logout {
            background-color: #e74c3c;
            color: white;
        }

        a:hover {
            opacity: 0.85;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Welcome</h1>
    <p>Login to access the Sample Web Application dashboard.</p>

    <!-- Navigation links -->
    <a href="login.html" class="login">Login</a>
    <a href="LogoutServlet" class="logout">Logout</a>

    <!-- Simple note -->
    <p style="font-size:12px; margin-top:20px;">
        Please logout after completing your work.
    </p>
</div>

</body>
</html>
