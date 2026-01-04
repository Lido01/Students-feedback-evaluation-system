<%--
    File Name: student.jsp
    Description:
    This JSP page is the student dashboard in the feedback system.
    Features included:
    1. Feedback Submission Form:
       - Students can select a target role (Instructor, Department, Student Affairs).
       - Optionally select a specific Instructor to send feedback to.
       - Choose whether to send feedback anonymously or with their name.
       - Write and submit a feedback message.
       - Form sends data via POST to StudentServlet ("student").

    2. Feedback History:
       - Displays all feedback previously submitted by the logged-in student.
       - Shows status of each feedback (Pending, Completed, Declined).
       - Displays response from the responder (Instructor, Department, or Affairs) if available.
       - Queries database using student's ID from session to fetch all related feedback and responses.
    
    3. Styling:
       - Uses simple CSS for cards, form fields, and status badges for clear UI.

    Name: Dagmawi Wondwosen
    ID: UGR/34184/16
--%>

<%@ page import="java.sql.*" %>
<%@ page import="com.example.feedbacksystem.util.DBUtil" %>
<%@ include file="header.jsp" %>

<div class="container">
...


<div class="container">
<h2>Student Dashboard</h2>

<!-- FEEDBACK FORM -->
<div class="card">
<h3>Submit Feedback</h3>

<form action="student" method="post">

<label>Target</label>
<select name="targetRole" required>
    <option value="INSTRUCTOR">Instructor</option>
    <option value="DEPARTMENT">Department</option>
    <option value="AFFAIRS">Student Affairs</option>
</select>

<label>Instructor (optional)</label>
<select name="instructorId">
<option value="">-- Select --</option>

<%
    Connection con = DBUtil.getConnection();
    Statement st = con.createStatement();
    ResultSet inst = st.executeQuery(
        "SELECT id, full_name FROM users WHERE role='INSTRUCTOR'"
    );
    while (inst.next()) {
%>
<option value="<%= inst.getInt("id") %>">
    <%= inst.getString("full_name") %>
</option>
<% } %>
</select>

<label>Identity</label>
<select name="anonymous">
    <option value="false">Named</option>
    <option value="true">Anonymous</option>
</select>

<label>Message</label>
<textarea name="message" required></textarea>

<button type="submit">Submit</button>
</form>
</div>

<!-- FEEDBACK HISTORY -->
<h3>My Feedback History</h3>

<%
    int studentId = (int) session.getAttribute("userId");

    String sql =
        "SELECT f.*, r.response, r.responder_role " +
        "FROM feedback f " +
        "LEFT JOIN feedback_responses r ON f.id = r.feedback_id " +
        "WHERE f.student_id=? " +
        "ORDER BY f.created_at DESC";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, studentId);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
%>

<div class="card">
<p><b>Status:</b> <%= rs.getString("status") %></p>
<p><b>Message:</b> <%= rs.getString("message") %></p>

<% if (rs.getString("response") != null) { %>
<p><b>Response from <%= rs.getString("responder_role") %>:</b></p>
<p><%= rs.getString("response") %></p>
<% } else { %>
<p><i>No response yet</i></p>
<% } %>

</div>

<%
    }
    con.close();
%>
</div>
<style>
.container { max-width:800px; margin:30px auto; font-family:Arial, sans-serif; }
h2 { color:#003366; }
h3 { margin-bottom:15px; }
.card { background:#fff; padding:20px; border-radius:6px; margin-bottom
:20px; box-shadow:0 2px 6px rgba(0,0,0,.1); }
form label { display:block; margin-top:10px; }
form select, form textarea, form button { width:100%; margin-top:10px; padding:8px; }
form button { margin-top:15px; padding:10px 15px; background:#003366; color:#fff; border:none; border-radius:4px; cursor:pointer; }
form button:hover { background:#002244; }
.section-title { margin-top:30px; border-bottom:2px solid #003366; }
.badge { padding:4px 8px; border-radius:4px; color:#fff; }
.PENDING { background:#f0ad4e; }
.COMPLETED { background:#5cb85c; }
.DECLINED { background:#d9534f; }
</style>