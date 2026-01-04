<%@ page session="true" %>

<header class="topbar">
    <div class="logo">Student Feedback System</div>

    <nav class="nav-links">
        <c:if test="${sessionScope.role == 'STUDENT'}">
            <a href="student.jsp">Student Panel</a>
            <a href="../student/feedback.jsp">My Feedback</a>
            <a href="viewResponses.jsp">Responses</a>
        </c:if>

        <c:if test="${sessionScope.role == 'INSTRUCTOR'}">
            <a href="instructor.jsp">Instructor Panel</a>
            <a href="instructor.jsp">Feedback</a>
            <a href="instructor.jsp">Responses</a>
            <a href="instructor.jsp">Student Details</a>
        </c:if>

        <c:if test="${sessionScope.role == 'ADMIN'}">
            <a href="admin.jsp">Admin Panel</a>
            <a href="admin.jsp">Manage Users</a>
            <a href="admin.jsp">Manage Feedback</a>
            <a href="admin.jsp">Generate Reports</a>
            <a href="admin.jsp">Configure Settings</a>
        </c:if>
        <c:if test="${sessionScope.role == 'DEPARTMENT'}">
            <a href="department.jsp">Department Panel</a>
            <a href="department.jsp">Feedback</a>
        </c:if>
        <c:if test="${sessionScope.role == 'AFFAIRS'}">
            <a href="affairs.jsp">Affairs Panel</a>
            <a href="affairs.jsp">Feedback</a>
            <a href="affairs.jsp">Manage Cases</a>
        </c:if>
    </nav>

    <div class="user-box">
        👤 ${sessionScope.fullName} (${sessionScope.role})
        <a href="<%=request.getContextPath()%>/logout">Logout</a>
    </div>
</header>
<!-- style for header -->
<style>
    .topbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: linear-gradient(90deg,#003366,#0055aa);
    padding: 15px 30px;
    color: white;
}

.logo {
    font-size: 20px;
    font-weight: bold;
}

.nav-links a {
    margin-right: 15px;
    color: #ffd700;
    text-decoration: none;
    font-weight: 500;
}

.nav-links a:hover {
    text-decoration: underline;
}

.user-box a {
    margin-left: 15px;
    color: #ffcccc;
}
.user-box a:hover {
    text-decoration: underline;
}
</style>
