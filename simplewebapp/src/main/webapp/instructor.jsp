<%@ page import="java.sql.*" %>
<%@ page import="com.example.feedbacksystem.util.DBUtil" %>
<%@ include file="header.jsp" %>

<div class="container">
    <h2>Instructor Dashboard</h2>

<%
    // Get the logged-in instructor's userId from session
    Integer instructorIdObj = (Integer) session.getAttribute("userId");

    if (instructorIdObj == null) {
%>
        <p class="error">Session expired. Please login again.</p>
<%
    } else {
        int instructorId = instructorIdObj;
        boolean hasFeedback = false;

        try (
            Connection con = DBUtil.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT f.id, f.student_id, f.message, f.status, f.created_at, u.full_name AS student_name " +
                "FROM feedback f " +
                "JOIN users u ON f.student_id = u.id " +
                "WHERE f.instructor_id = ? " +
                "AND f.target_role = 'INSTRUCTOR' " +
                "AND f.visible_to_teacher = TRUE " +
                "ORDER BY f.created_at DESC"
            )
        ) {

            ps.setInt(1, instructorId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                hasFeedback = true;
                String status = rs.getString("status");
                String studentName = rs.getString("student_name");
                int feedbackId = rs.getInt("id");
%>

    <div class="card">
        <h4>From: <%= studentName %></h4>
        <p><b>Message:</b> <%= rs.getString("message") %></p>
        <p><b>Status:</b> 
            <span class="badge <%= status %>">
                <%= status %>
            </span>
        </p>

        <%-- Show response form only if status is pending or in_review --%>
        <%
            if ("PENDING".equals(status) || "IN_REVIEW".equals(status)) {
        %>
            <form action="instructor" method="post">
                <label>Your Response:</label><br>
                <textarea name="response" rows="3" required></textarea>

                <input type="hidden" name="feedbackId" value="<%= feedbackId %>">

                <br><br>
                <button type="submit" name="action" value="RESPOND" class="btn">
                    Respond
                </button>
                <button type="submit" name="action" value="ESCALATE" class="btn warn">
                    Escalate to Department
                </button>
            </form>
        <%
            } else {
        %>
            <p><i>Feedback already handled.</i></p>
        <%
            }
        %>
    </div>

<%
            } // end while

            if (!hasFeedback) {
%>
    <div class="card empty">
        <p>No feedback has been submitted for you yet.</p>
    </div>
<%
            }

        } catch (Exception e) {
%>
    <p class="error">Error loading feedback.</p>
<%
            e.printStackTrace();
        }
    }
%>

</div>

<style>
.container {
    max-width: 800px;
    margin: 30px auto;
    font-family: Arial, sans-serif;
}

h2 {
    color: #003366;
}

.card {
    background: #fff;
    padding: 20px;
    margin-bottom: 15px;
    border-radius: 6px;
    box-shadow: 0 2px 6px rgba(0,0,0,.1);
}

.empty {
    text-align: center;
    color: #999;
}

.badge {
    padding: 4px 8px;
    border-radius: 4px;
    color: #fff;
    font-size: 12px;
}

/* Status colors – MATCH DATABASE ENUM */
.PENDING {
    background: #f0ad4e;
}

.IN_REVIEW {
    background: #5bc0de;
}

.RESPONDED {
    background: #5cb85c;
}

.ESCALATED {
    background: #d9534f;
}

.CLOSED {
    background: #777;
}

.btn {
    padding: 6px 12px;
    background: #003366;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.btn.warn {
    background: #d9534f;
}

.error {
    color: red;
}
</style>
