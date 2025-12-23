// package servlets;

// import java.io.IOException;
// import jakarta.servlet.ServletException;
// import jakarta.servlet.annotation.WebServlet;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.HttpSession;

// @WebServlet("/login")
// public class LoginServlet extends HttpServlet {

//     @Override
//     protected void doPost(HttpServletRequest request, HttpServletResponse response)
//             throws ServletException, IOException {

//         String username = request.getParameter("username");
//         String password = request.getParameter("password");

//         // simple test login
//         if ("admin".equals(username) && "admin".equals(password)) {
//             HttpSession session = request.getSession();
//             session.setAttribute("user", username);
//             response.sendRedirect("dashboard.jsp");
//         } else {
//             response.sendRedirect("login.jsp?error=true");
//         }
//     }
// }


package com.example.feedbacksystem.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.HashMap;
import com.example.feedbacksystem.models.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    public static HashMap<String, User> users = new HashMap<>();

    @Override
    public void init() {
        users.put("admin", new User("admin","admin","admin"));
        users.put("instructor", new User("instructor","inst123","instructor"));
        users.put("student", new User("student","stud123","student"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = users.get(username);
        if(user != null && user.getPassword().equals(password)){
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            switch(user.getRole()){
                case "admin" -> response.sendRedirect("admin.jsp");
                case "instructor" -> response.sendRedirect("instructor.jsp");
                default -> response.sendRedirect("feedback.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
