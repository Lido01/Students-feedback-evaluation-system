package com.example.feedbacksystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.example.feedbacksystem.models.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if username already exists
        if (LoginServlet.users.containsKey(username)) {
            response.sendRedirect("register.jsp?error=exists");
            return;
        }

        // Create new user (default role = student)
        User user = new User(username, password, "student");
        user.setEmail(email);   // only if your User model has email

        LoginServlet.users.put(username, user);

        response.sendRedirect("login.jsp?success=registered");
    }
}
