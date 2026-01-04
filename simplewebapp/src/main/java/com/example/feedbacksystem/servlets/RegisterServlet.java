/*
    Name: Dagmawi Wondwosen
    ID: Ugr/34184/16
    Modified version after initial push:
    - Added input trimming
    - Added check for empty username/password
    - Updated redirect messages for clarity
    - Added small notes about plain password
*/

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

        // get input and remove extra spaces (was missing before)
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

       
        if (username.isEmpty() || password.isEmpty()) {
            response.sendRedirect("register.jsp?error=empty");
            return; // stop processing if invalid
        }

        
        if (LoginServlet.users.containsKey(username)) {
            response.sendRedirect("register.jsp?error=exists");
        } else {
           
            LoginServlet.users.put(username, new User(username, password, "student"));

            
            response.sendRedirect("login.jsp?success=registered");
        }

        // form still points to this servlet, no changes here
    }
}
