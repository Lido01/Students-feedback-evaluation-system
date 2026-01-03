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

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || !"STUDENT".equals(session.getAttribute("role"))) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int studentId = (int) session.getAttribute("userId");
        String targetRole = req.getParameter("targetRole");
        String instructorId = req.getParameter("instructorId");
        boolean anonymous = Boolean.parseBoolean(req.getParameter("anonymous"));
        String message = req.getParameter("message");

        String sql = """
            INSERT INTO feedback
            (student_id, instructor_id, target_role, anonymous, message)
            VALUES (?, ?, ?, ?, ?)
        """;

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            if (instructorId == null || instructorId.isEmpty()) {
                ps.setNull(2, java.sql.Types.INTEGER);
            } else {
                ps.setInt(2, Integer.parseInt(instructorId));
            }

            ps.setString(3, targetRole);
            ps.setBoolean(4, anonymous);
            ps.setString(5, message);

            ps.executeUpdate();

            resp.sendRedirect("student.jsp?success=true");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("student.jsp?error=true");
        }
    }
}
