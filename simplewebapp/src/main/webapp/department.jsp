<%@ page import="java.sql.*" %>
<%@ page import="com.example.feedbacksystem.util.DBUtil" %>
<%@ include file="header.jsp" %>

<div class="container">
    <h2>Department Dashboard</h2>
    <p class="subtitle">Feedback cases assigned to the department</p>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = DBUtil.getConnection();
        String sql = "SELECT * FROM feedback WHERE target_role='DEPARTMENT'";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            String status = rs.getString("status");
%>

    <div class="card">
        <div class="card-header">
            <span class="badge <%= status %>"><%= status %></span>
        </div>

        <p class="message">
            <strong>Message:</strong><br>
            <%= rs.getString("message") %>
        </p>

        <form action="department" method="post">
            <label for="response-<%= rs.getInt("id") %>">Response</label>
            <textarea
                id="response-<%= rs.getInt("id") %>"
                name="response"
                placeholder="Write your response here..."
                required></textarea>

            <input type="hidden" name="feedbackId" value="<%= rs.getInt("id") %>">

            <div class="actions">
                <button type="submit" class="btn primary">
                    Close Case
                </button>

                <button
                    type="submit"
                    name="action"
                    value="FORWARD"
                    class="btn secondary">
                    Forward to Affairs
                </button>
            </div>
        </form>
    </div>

<%
        }
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
</div>

<style>
/* Layout */
.container {
    max-width: 800px;
    margin: 30px auto;
    font-family: Arial, sans-serif;
}

h2 {
    color: #003366;
}

.subtitle {
    color: #666;
    margin-bottom: 25px;
}

/* Cards */
.card {
    background: #fff;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 6px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.08);
}

.card-header {
    display: flex;
    justify-content: flex-end;
    margin-bottom: 10px;
}

.message {
    margin-bottom: 15px;
    line-height: 1.5;
}

/* Status badges */
.badge {
    padding: 5px 10px;
    border-radius: 4px;
    color: #fff;
    font-size: 12px;
    font-weight: bold;
}

.PENDING { background: #f0ad4e; }
.COMPLETED { background: #5cb85c; }
.DECLINED { background: #d9534f; }

/* Form */
form label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

form textarea {
    width: 100%;
    min-height: 90px;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

/* Buttons */
.actions {
    margin-top: 15px;
    display: flex;
    gap: 10px;
}

.btn {
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-weight: bold;
}

.btn.primary {
    background: #003366;
    color: #fff;
}

.btn.primary:hover {
    background: #002244;
}

.btn.secondary {
    background: #6c757d;
    color: #fff;
}

.btn.secondary:hover {
    background: #5a6268;
}
</style>
