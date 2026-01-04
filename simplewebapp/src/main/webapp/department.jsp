<%@ page import="java.sql.*" %>
<%@ page import="com.example.feedbacksystem.util.DBUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>

<div class="container">
<h2>Department Dashboard</h2>

<%
    String sql =
        "SELECT * FROM feedback WHERE target_role='DEPARTMENT'";

    try (
        Connection con = DBUtil.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
    ) {

        boolean hasResults = false;

        while (rs.next()) {
            hasResults = true;

            int feedbackId = rs.getInt("id");
            request.setAttribute("message", rs.getString("message"));
            request.setAttribute("status", rs.getString("status"));
%>

<div class="card">
    <p>
        <b>Message:</b>
        <c:out value="${message}" />
    </p>

    <p>
        <b>Status:</b>
        <c:out value="${status}" />
    </p>

    <form action="department" method="post">
        <label for="response-<%= feedbackId %>">Response</label>
        <textarea
            id="response-<%= feedbackId %>"
            name="response"
            required>
        </textarea>

        <input type="hidden" name="feedbackId" value="<%= feedbackId %>">

        <button type="submit">Close Case</button>
        <button type="submit" name="action" value="FORWARD">
            Forward to Affairs
        </button>
    </form>
</div>

<%
        }

        if (!hasResults) {
%>
    <p class="subtitle">No feedback available for the department.</p>
<%
        }
    }
%>
</div>

<style>
.container { max-width:800px; margin:30px auto; font-family:Arial, sans-serif; }
h2 { color:#003366; }
h3 { margin-bottom:15px; }
.subtitle { color:#666; margin-bottom:25px; }
.section-title { margin-top:30px; border-bottom:2px solid #003366; }
.card { background:#fff; padding:20px; margin-bottom:15px; border-radius:6px; }
.badge { padding:4px 8px; border-radius:4px; color:#fff; }
.PENDING { background:#f0ad4e; }
.COMPLETED { background:#5cb85c; }
.DECLINED { background:#d9534f; }
form label { display:block; margin-top:10px; }
form select, form textarea { width:100%; padding:8px; margin-top:5px; border:1px solid #ccc; border-radius:4px; }
.btn { margin-top:15px; padding:10px 15px; background:#003366; color:#fff; border:none; border-radius:4px; cursor:pointer; }
.btn:hover { background:#002244; }
</style>
