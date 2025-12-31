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

            String insert =
                "INSERT INTO feedback_responses (feedback_id, responder_id, responder_role, response) " +
                "VALUES (?, ?, 'AFFAIRS', ?)";

            PreparedStatement ps1 = con.prepareStatement(insert);
            ps1.setInt(1, feedbackId);
            ps1.setInt(2, affairsId);
            ps1.setString(3, responseText);
            ps1.executeUpdate();

            PreparedStatement ps2 =
                con.prepareStatement("UPDATE feedback SET status='CLOSED' WHERE id=?");
            ps2.setInt(1, feedbackId);
            ps2.executeUpdate();

            resp.sendRedirect("affairs.jsp");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
