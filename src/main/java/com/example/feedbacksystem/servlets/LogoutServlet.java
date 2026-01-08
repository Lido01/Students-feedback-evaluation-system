package com.example.feedbacksystem.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        // Invalidate session if it exists
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
            System.out.println("Session invalidated. User logged out.");
        }

        // Set content type and print a simple message before redirecting
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<html><body>");
        out.println("<p style='color:green;'>You have successfully logged out.</p>");
        out.println("<p>Redirecting to login page...</p>");
        out.println("</body></html>");

        // Redirect to login page after short delay (2 seconds)
        resp.setHeader("Refresh", "2; URL=login.jsp");
    }

    // Optional: handle POST same as GET
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        doGet(req, resp);
    }
}

