package com.example.feedbacksystem.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/instructor")
public class InstructorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("feedbacks", FeedbackServlet.getFeedbackList());
        RequestDispatcher dispatcher = request.getRequestDispatcher("instructor.jsp");
        dispatcher.forward(request,response);
    }
}
