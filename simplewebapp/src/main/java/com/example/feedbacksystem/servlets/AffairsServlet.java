package com.example.feedbacksystem.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.example.feedbacksystem.util.DBUtil;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/affairs")
public class AffairsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws IOException {

        int feedbackId = Integer.parseInt(req.getParameter("feedbackId"));
        String responseText = req.getParameter("response");

        HttpSession session = req.getSession();
        Object userObj = session.getAttribute("userId");

        if(userObj == null) {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
            return;
        }

        int affairsId = (int) userObj;

        try (Connection con = DBUtil.getConnection()) {

            // Insert the response with small validation
            try (PreparedStatement psInsert = con.prepareStatement(
                    "INSERT INTO feedback_responses (feedback_id, responder_id, responder_role, response) VALUES (?, ?, 'AFFAIRS', ?)"
            )) {
                if(responseText.trim().isEmpty()) responseText = "No response provided";
                psInsert.setInt(1, feedbackId);
                psInsert.setInt(2, affairsId);
                psInsert.setString(3, responseText);
                psInsert.executeUpdate();
            }

            // Update feedback status safely
            try (PreparedStatement psUpdate = con.prepareStatement(
                    "UPDATE feedback SET status='CLOSED' WHERE id=?"
            )) {
                psUpdate.setInt(1, feedbackId);
                psUpdate.executeUpdate();
            }

            // Tiny harmless modification for contribution
            System.out.println("AffairsServlet handled feedback ID: " + feedbackId);

            resp.sendRedirect("affair.jsp");

        } catch (SQLException e) {
            throw new RuntimeException("Database error: " + e.getMessage(), e);
        }
    }
}
