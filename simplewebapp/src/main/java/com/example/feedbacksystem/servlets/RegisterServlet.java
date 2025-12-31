package com.example.feedbacksystem.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.feedbacksystem.util.DBUtil;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String sql = "INSERT INTO users (school_id, full_name, email, phone, role, password) VALUES (?,?,?,?,?,?)";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, req.getParameter("schoolId"));
            ps.setString(2, req.getParameter("fullName"));
            ps.setString(3, req.getParameter("email"));
            ps.setString(4, req.getParameter("phone"));
            ps.setString(5, req.getParameter("role"));
            ps.setString(6, req.getParameter("password"));

            ps.executeUpdate();
            resp.sendRedirect("login.jsp?registered=true");

        } catch (Exception e) {
            throw new RuntimeException("Registration failed", e);
        }
    }
}

