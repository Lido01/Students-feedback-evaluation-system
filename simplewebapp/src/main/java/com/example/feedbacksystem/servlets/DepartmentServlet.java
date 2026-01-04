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

@WebServlet("/department")
public class DepartmentServlet extends HttpServlet {

    private static final String ROLE_DEPARTMENT = "DEPARTMENT";
    private static final String ROLE_AFFAIRS = "AFFAIRS";
    private static final String ACTION_FORWARD = "FORWARD";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        // --- Read parameters ---
        String feedbackIdParam = req.getParameter("feedbackId");
        String responseText = req.getParameter("response");
        String action = req.getParameter("action");

        if (feedbackIdParam == null || responseText == null) {
            resp.sendRedirect("department.jsp");
            return;
        }

        int feedbackId = Integer.parseInt(feedbackIdParam);

        HttpSession session = req.getSession(false);
        int departmentUserId = (int) session.getAttribute("userId");

        try (Connection con = DBUtil.getConnection()) {

            // 1️⃣ Save department response
            String insertResponseSql =
                "INSERT INTO feedback_responses " +
                "(feedback_id, responder_id, responder_role, response) " +
                "VALUES (?, ?, ?, ?)";

            try (PreparedStatement ps = con.prepareStatement(insertResponseSql)) {
                ps.setInt(1, feedbackId);
                ps.setInt(2, departmentUserId);
                ps.setString(3, ROLE_DEPARTMENT);
                ps.setString(4, responseText);
                ps.executeUpdate();
            }

            // 2️⃣ Update feedback status & routing
            String updateFeedbackSql;

            if (ACTION_FORWARD.equals(action)) {
                updateFeedbackSql =
                    "UPDATE feedback SET status='ESCALATED', target_role=? WHERE id=?";
            } else {
                updateFeedbackSql =
                    "UPDATE feedback SET status='CLOSED' WHERE id=?";
            }

            try (PreparedStatement ps = con.prepareStatement(updateFeedbackSql)) {
                if (ACTION_FORWARD.equals(action)) {
                    ps.setString(1, ROLE_AFFAIRS);
                    ps.setInt(2, feedbackId);
                } else {
                    ps.setInt(1, feedbackId);
                }
                ps.executeUpdate();
            }

            resp.sendRedirect("department.jsp");

        } catch (Exception e) {
            throw new RuntimeException("Error processing department feedback", e);
        }
    }
}
