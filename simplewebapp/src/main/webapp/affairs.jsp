<%@ page import="java.sql.*" %>
<%@ page import="com.example.feedbacksystem.util.DBUtil" %>
<%@ include file="header.jsp" %>

<div class="container">
    <h2>Student Affairs – Confidential Cases</h2>

    <%
        try (Connection con = DBUtil.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM feedback WHERE target_role='AFFAIRS'")) {

            while (rs.next()) {
    %>
    
    <div class="card warning">
        <p><strong>Status:</strong> <%= rs.getString("status") %></p>
        <p><strong>Message:</strong> <%= rs.getString("message") %></p>

        <form action="affairs" method="post">
            <textarea name="response" placeholder="Write your response..." required></textarea>
            <input type="hidden" name="feedbackId" value="<%= rs.getInt("id") %>">
            <button type="submit">Close Case</button>
        </form>
    </div>

    <% 
            }
        } catch (SQLException e) {
            out.println("<p style='color:red;'>Error loading feedback: " + e.getMessage() + "</p>");
        } 
    %>
</div>

<style>
.container {
    max-width: 800px;
    margin: 40px auto;
    font-family: 'Segoe UI', Tahoma, Geneva, sans-serif;
    line-height: 1.5;
}

h2 {
    color: #003366;
    margin-bottom: 25px;
}

.card {
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 25px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.card.warning {
    border-left: 6px solid #ff4d4d;
    background-color: #fff8e1;
}

textarea, select, button {
    width: 100%;
    margin-top: 12px;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 14px;
    box-sizing: border-box;
}

button {
    margin-top: 15px;
    background-color: #003366;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background 0.3s ease;
}

button:hover {
    background-color: #002244;
}
</style>
