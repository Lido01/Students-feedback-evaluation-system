package com.example.feedbacksystem.servlets;

import com.example.feedbacksystem.util.DBUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.sql.*;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try (Connection con = DBUtil.getConnection()) {

            req.setAttribute("totalUsers", getCount(con, "users"));
            req.setAttribute("students", getCount(con, "users WHERE role='STUDENT'"));
            req.setAttribute("instructors", getCount(con, "users WHERE role='INSTRUCTOR'"));
            req.setAttribute("departments", getCount(con, "users WHERE role='DEPARTMENT'"));
            req.setAttribute("affairs", getCount(con, "users WHERE role='AFFAIRS'"));

            req.setAttribute("totalFeedback", getCount(con, "feedback"));
            req.setAttribute("pending", getCount(con, "feedback WHERE status='PENDING'"));
            req.setAttribute("responded", getCount(con, "feedback WHERE status='RESPONDED'"));
            req.setAttribute("escalated", getCount(con, "feedback WHERE status='ESCALATED'"));
            req.setAttribute("closed", getCount(con, "feedback WHERE status='CLOSED'"));

            RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private int getCount(Connection con, String table)
            throws SQLException {

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM " + table);
        rs.next();
        return rs.getInt(1);
    }
}
