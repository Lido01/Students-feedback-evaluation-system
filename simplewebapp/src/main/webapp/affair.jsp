<%@ page import="java.sql.*" %>
<%@ page import="com.example.feedbacksystem.util.DBUtil" %>
<%@ include file="header.jsp" %>

<div class="container">
    <h2>Student Affairs – Confidential Cases</h2>

    <%
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtil.getConnection();
            ps = con.prepareStatement(
                "SELECT id, status, message, DATE(created_at) AS created_date FROM feedback WHERE target_role='AFFAIRS' ORDER BY created_at DESC"
            );
            rs = ps.executeQuery();

            while (rs.next()) {
    %>

    <div class="card warning">
        <p><b>Date:</b> <%= rs.getString("created_date") %></p>
        <p><b>Status:</b> <%= rs.getString("status") %></p>
        <p><b>Message:</b> <%= rs.getString("message") %></p>

        <form action="affairs" method="post">
            <textarea name="response" placeholder="Enter your response..." required></textarea>
            <input type="hidden" name="feedbackId" value="<%= rs.getInt("id") %>">
            <button type="submit">Close Case</button>
        </form>
    </div>

    <% 
            }
        } catch(Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(con != null) con.close();
        }
    %>
</div>

<style>
.container { max-width:800px; margin:30px auto; font-family:Arial,sans-serif; }
h2 { color:#003366; margin-bottom:20px; }
.card { background:#fff; padding:20px; border-radius:6px; margin-bottom:20px; box-shadow:0 2px 6px rgba(0,0,0,.1); }
.card.warning { background-color: #ffeb99; border-left:5px solid orange; }
textarea, button { width:100%; margin-top:10px; padding:8px; }
textarea { resize: vertical; }
button { margin-top:15px; padding:10px 15px; background:#003366; color:#fff; border:none; border-radius:4px; cursor:pointer; }
button:hover { background:#002244; }
</style>
