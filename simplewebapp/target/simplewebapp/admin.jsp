<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.feedbacksystem.util.DBUtil" %>
<%@ include file="header.jsp" %>

<style>
.dashboard {
    display: grid;
    grid-template-columns: repeat(auto-fit,minmax(250px,1fr));
    gap: 20px;
}

.stat-card {
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0,0,0,.1);
}

.stat-card h3 {
    color: #003366;
    margin-bottom: 10px;
}

.stat-number {
    font-size: 32px;
    font-weight: bold;
    color: #0055aa;
}

.section {
    margin-top: 40px;
}

.section h2 {
    border-bottom: 3px solid #003366;
    padding-bottom: 5px;
    margin-bottom: 20px;
}
</style>

<div class="container">
<h1>Admin Control Board</h1>
<p class="subtitle">System analytics & monitoring dashboard</p>

<div class="section">
<h2>User Overview</h2>

<div class="dashboard">
<div class="stat-card">
<h3>Total Users</h3>
<div class="stat-number" style="color: blue;">${totalUsers}</div>
</div>

<div class="stat-card">
<h3>Students</h3>
<div class="stat-number">${students}</div>
</div>

<div class="stat-card">
<h3>Instructors</h3>
<div class="stat-number">${instructors}</div>
</div>

<div class="stat-card">
<h3>Departments</h3>
<div class="stat-number">${departments}</div>
</div>

<div class="stat-card">
<h3>Student Affairs</h3>
<div class="stat-number">${affairs}</div>
</div>
</div>
</div>

<div class="section">
<h2>Feedback Analytics</h2>

<div class="dashboard">
<div class="stat-card">
<h3>Total Feedback</h3>
<div class="stat-number">${totalFeedback}</div>
</div>

<div class="stat-card">
<h3>Pending</h3>
<div class="stat-number">${pending}</div>
</div>

<div class="stat-card">
<h3>Responded</h3>
<div class="stat-number">${responded}</div>
</div>

<div class="stat-card">
<h3>Escalated</h3>
<div class="stat-number">${escalated}</div>
</div>

<div class="stat-card">
<h3>Closed</h3>
<div class="stat-number">${closed}</div>
</div>
</div>
</div>

    <div class="section">
        <h2>Admin Actions</h2>
        <ul>
            <li>✔ Monitor response timelines</li>
            <li>✔ Identify departments with high complaints</li>
            <li>✔ Ensure confidentiality compliance</li>
            <li>✔ Generate institutional reports</li>
            <li>✔ Maintain system health</li>
        </ul>
    </div>

</div>
