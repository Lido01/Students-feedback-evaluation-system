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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String feedbackIdParam = req.getParameter("feedbackId");
        String responseText = req.getParameter("response");

        if (feedbackIdParam == null || responseText == null || responseText.isBlank()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request data");
            return;
        }

        int feedbackId;
        try {
            feedbackId = Integer.parseInt(feedbackIdParam);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid feedback ID");
            return;
        }

        String action = req.getParameter("action");

        HttpSession session = req.getSession(false);
        if (session == null
                || session.getAttribute("userId") == null
                || session.getAttribute("userRole") == null) {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Session expired");
            return;
        }

        // 🔒 Role-based authorization
        String userRole = session.getAttribute("userRole").toString();
        if (!"DEPARTMENT".equals(userRole)) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied");
            return;
        }

        int departmentUserId = (int) session.getAttribute("userId");

        Connection con = null;
        try {
            con = DBUtil.getConnection();
            con.setAutoCommit(false);

            // 1️⃣ Save department response
            String insertResponse =
                "INSERT INTO feedback_responses (feedback_id, responder_id, responder_role, response) " +
                "VALUES (?, ?, 'DEPARTMENT', ?)";

            try (PreparedStatement ps1 = con.prepareStatement(insertResponse)) {
                ps1.setInt(1, feedbackId);
                ps1.setInt(2, departmentUserId);
                ps1.setString(3, responseText);
                ps1.executeUpdate();
            }

            // 2️⃣ Update feedback routing
            String updateStatus;
            if ("FORWARD".equals(action)) {
                updateStatus =
                    "UPDATE feedback SET status='ESCALATED', target_role='AFFAIRS' WHERE id=?";
            } else {
                updateStatus =
                    "UPDATE feedback SET status='CLOSED' WHERE id=?";
            }

            try (PreparedStatement ps2 = con.prepareStatement(updateStatus)) {
                ps2.setInt(1, feedbackId);
                ps2.executeUpdate();
            }

            con.commit();
            resp.sendRedirect("department.jsp");

        } catch (Exception e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (Exception ignored) {}
            }
            throw new RuntimeException(e);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (Exception ignored) {}
            }
        }
    }
}
