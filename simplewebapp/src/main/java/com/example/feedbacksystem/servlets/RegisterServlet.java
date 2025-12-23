package com.example.feedbacksystem.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import com.example.feedbacksystem.models.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if(LoginServlet.users.containsKey(username)){
            response.sendRedirect("register.jsp?error=exists");
        } else {
            LoginServlet.users.put(username, new User(username,password,"student"));
            response.sendRedirect("login.jsp?success=registered");
        }
    }
}
