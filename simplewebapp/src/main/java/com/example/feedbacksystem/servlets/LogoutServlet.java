package com.example.feedbacksystem.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try (PrintWriter out = response.getWriter()) {
			request.getRequestDispatcher("link.html").include(request, response);
			HttpSession session = request.getSession(false);
			if (session == null) {
				out.print("No active session to log out.");
				return;
			}
			session.invalidate();
			out.print("You are successfully logged out!");
		}
	}

}




// package servlets;

// import java.io.IOException;

// import jakarta.servlet.ServletException;
// import jakarta.servlet.annotation.WebServlet;
// import jakarta.servlet.http.HttpServlet;
// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;
// import jakarta.servlet.http.HttpSession;

// @WebServlet("/logout")
// public class LogoutServlet extends HttpServlet {

//     protected void doGet(HttpServletRequest request, HttpServletResponse response)
//             throws ServletException, IOException {

//         HttpSession session = request.getSession(false);
//         if (session != null) {
//             session.invalidate();
//         }

//         response.sendRedirect("login.jsp");
//     }
// }
