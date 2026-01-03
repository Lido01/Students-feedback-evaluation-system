package com.example.feedbacksystem.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;

import com.example.feedbacksystem.models.User;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* 1. Session validation */
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        /* 2. Authorization check */
        User loggedUser = (User) session.getAttribute("loggedUser");
        if (!"admin".equalsIgnoreCase(loggedUser.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied");
            return;
        }

        /* 3. Safe user retrieval */
        Collection<User> users = Collections.emptyList();
        if (LoginServlet.users != null) {
            users = LoginServlet.users.values();
        }

        /* 4. Attach data to request scope */
        request.setAttribute("users", users);

        /* 5. Forward using absolute path */
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/admin.jsp");
        dispatcher.forward(request, response);
    }
}
