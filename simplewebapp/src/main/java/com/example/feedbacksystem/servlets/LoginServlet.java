package com.example.feedbacksystem.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.feedbacksystem.util.DBUtil;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String schoolId = req.getParameter("schoolId");
        String password = req.getParameter("password");

        String sql = "SELECT * FROM users WHERE school_id=? AND password=?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, schoolId);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("fullName", rs.getString("full_name"));
                session.setAttribute("role", rs.getString("role"));

                switch (rs.getString("role")) {
                    case "STUDENT" -> resp.sendRedirect("student.jsp");
                    case "INSTRUCTOR" -> resp.sendRedirect("instructor.jsp");
                    case "DEPARTMENT" -> resp.sendRedirect("department.jsp");
                    case "AFFAIRS" -> resp.sendRedirect("affairs.jsp");
                    case "ADMIN" -> resp.sendRedirect("admin");
                }
            } else {
                resp.sendRedirect("login.jsp?error=true");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
