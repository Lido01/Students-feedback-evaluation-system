package com.example.feedbacksystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;

import com.example.feedbacksystem.models.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    /*
     * In-memory user store.
     * NOTE: This is for learning/testing only.
     * Data will reset when the server restarts.
     */
    public static HashMap<String, User> users = new HashMap<>();

    @Override
    public void init() {

        // Predefined system users
        users.put("admin", new User("admin", "admin", "admin"));
        users.put("instructor", new User("instructor", "inst123", "instructor"));
        users.put("student", new User("student", "stud123", "student"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Read form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Basic validation to avoid null or empty values
        if (username == null || password == null ||
            username.isEmpty() || password.isEmpty()) {

            response.sendRedirect("login.jsp?error=invalid");
            return;
        }

        // Look up user
        User user = users.get(username);

        // Authenticate user
        if (user != null && user.getPassword().equals(password)) {

            // Create session and store logged-in user
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);

            // Role-based redirection
            switch (user.getRole()) {
                case "admin":
                    response.sendRedirect("admin.jsp");
                    break;

                case "instructor":
                    response.sendRedirect("instructor.jsp");
                    break;

                default:
                    response.sendRedirect("feedback.jsp");
                    break;
            }

        } else {
            // Authentication failed
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}
