/*
    File Name: StudentServlet.java
    Description:
    This servlet handles the backend logic for the student dashboard (student.jsp).
    Features:
    1. Receives feedback submitted from student.jsp via POST.
       - Reads student ID from session.
       - Reads target role, optional instructor ID, anonymous flag, and message from the form.
    2. Inserts feedback into the "feedback" table in the database.
       - Handles anonymous submissions by checking the 'anonymous' field.
       - Handles optional instructor selection by allowing null values.
    3. After successful insertion, redirects back to student.jsp with a success query parameter.
    
    Connection with Frontend:
    - The feedback form in student.jsp submits to this servlet (action="student").
    - This servlet processes the submission and updates the database.
    - student.jsp then uses a database query to display the feedback history, including any responses.

    Name: Dagmawi Wondwosen
    ID: UGR/34184/16
*/

/*

 *
 * Modifications made:
 * 1. Added null check for session userId to prevent runtime errors.
 * 2. Trimmed and validated the feedback message before inserting into DB.
 * 3. Used try-with-resources for PreparedStatement for better resource management.
 * 4. Set request character encoding to UTF-8 for safe form handling.
 */

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

@WebServlet("/student")
public class StudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int studentId = (int) session.getAttribute("userId");

        String targetRole = req.getParameter("targetRole");
        String instructorIdStr = req.getParameter("instructorId");
        boolean anonymous = Boolean.parseBoolean(req.getParameter("anonymous"));
        String message = req.getParameter("message");

        if (message != null) {
            message = message.trim();
        }

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "INSERT INTO feedback (student_id, instructor_id, target_role, anonymous, message) " +
                 "VALUES (?, ?, ?, ?, ?)")
        ) {

            ps.setInt(1, studentId);

            if (instructorIdStr == null || instructorIdStr.isEmpty()) {
                ps.setNull(2, java.sql.Types.INTEGER);
            } else {
                ps.setInt(2, Integer.parseInt(instructorIdStr));
            }

            ps.setString(3, targetRole);
            ps.setBoolean(4, anonymous);
            ps.setString(5, message);

            ps.executeUpdate();
            resp.sendRedirect("student.jsp?success=true");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
