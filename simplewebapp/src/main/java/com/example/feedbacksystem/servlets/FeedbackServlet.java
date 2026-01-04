package com.example.feedbacksystem.servlets;  // Package declaration


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.ArrayList;
import com.example.feedbacksystem.models.Feedback;
import com.example.feedbacksystem.models.User;


@WebServlet("/submitFeedback")
public class FeedbackServlet extends HttpServlet {  
    private static final ArrayList<Feedback> feedbackList = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("user")==null){
            response.sendRedirect("login.jsp"); 
            return;  
        }
        String message = request.getParameter("message");
        User user = (User) session.getAttribute("user");
        feedbackList.add(new Feedback(user.getUsername(), message));
        response.sendRedirect("feedback.jsp?success=true");
    }
    public static ArrayList<Feedback> getFeedbackList(){ 
        return feedbackList; 
    }
}
