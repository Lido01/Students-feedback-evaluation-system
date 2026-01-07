package com.example.feedbacksystem.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
        int affairsId = (int) session.getAttribute("userId");

        try (Connection con = DBUtil.getConnection()) {

            // Insert the response
            try (PreparedStatement psInsert = con.prepareStatement(
                    "INSERT INTO feedback_responses (feedback_id, responder_id, responder_role, response) VALUES (?, ?, 'AFFAIRS', ?)"
            )) {
                psInsert.setInt(1, feedbackId);
                psInsert.setInt(2, affairsId);
                psInsert.setString(3, responseText);
                psInsert.executeUpdate();
            }

            // Update feedback status
            try (PreparedStatement psUpdate = con.prepareStatement(
                    "UPDATE feedback SET status='CLOSED' WHERE id=?"
            )) {
                psUpdate.setInt(1, feedbackId);
                psUpdate.executeUpdate();
            }

            resp.sendRedirect("affair.jsp");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
