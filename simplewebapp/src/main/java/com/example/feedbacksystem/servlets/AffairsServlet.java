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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int feedbackId = Integer.parseInt(request.getParameter("feedbackId"));
        String responseText = request.getParameter("response");

        HttpSession session = request.getSession();
        int affairsId = (int) session.getAttribute("userId");

        String insertResponseSql =
                "INSERT INTO feedback_responses " +
                "(feedback_id, responder_id, responder_role, response) " +
                "VALUES (?, ?, 'AFFAIRS', ?)";

        String updateStatusSql =
                "UPDATE feedback SET status = 'CLOSED' WHERE id = ?";

        try (Connection connection = DBUtil.getConnection()) {

            try (PreparedStatement insertStmt =
                         connection.prepareStatement(insertResponseSql)) {

                insertStmt.setInt(1, feedbackId);
                insertStmt.setInt(2, affairsId);
                insertStmt.setString(3, responseText);
                insertStmt.executeUpdate();
            }

            try (PreparedStatement updateStmt =
                         connection.prepareStatement(updateStatusSql)) {

                updateStmt.setInt(1, feedbackId);
                updateStmt.executeUpdate();
            }

            response.sendRedirect("affairs.jsp");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
