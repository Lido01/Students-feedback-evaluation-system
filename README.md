# 🎓 Student Feedback System

A **Java-based web application** designed to manage academic feedback in an educational institution.  
The system supports **role-based access control** for students, instructors, department heads, student affairs, and administrators.  
Built using **Jakarta Servlet API, JSP, MySQL, Maven, and Apache Tomcat**, following **MVC principles**.

---

## 📌 Project Objectives

- Enable students to submit academic feedback securely
- Provide structured workflows for handling feedback
- Implement role-based dashboards and permissions
- Store and manage feedback data persistently
- Practice Java web development using Servlets and JSP
- Apply MVC architecture and session management

---

## ✨ Key Features

### 🔐 Authentication & Authorization
- User registration with role-specific School ID formats
- Secure login and logout
- Session-based authentication
- Role-based access control and redirection

### 🧑‍💼 Role-Based Dashboards
- **Student**: Submit feedback (anonymous or named), view responses
- **Instructor**: View student feedback, respond, escalate to department
- **Department Head**: Handle escalated feedback
- **Student Affairs**: Manage sensitive and confidential cases
- **Admin**: Manage users, feedback, system configuration, and reports

### 📝 Feedback Management
- Submit feedback with comments and optional anonymity
- Feedback workflow with status tracking:
  - `PENDING`
  - `COMPLETED`
  - `DECLINED`
- Instructor and department responses
- Escalation mechanism for unresolved feedback

### 🎨 User Interface
- JSP-based views
- Central header with role-based navigation
- Clean and consistent CSS styling

### 💾 Persistence & Sessions
- MySQL database backend
- Stores users, roles, feedback, and responses
- Session invalidation on logout

---

## 🛠️ Technologies Used

- Java (JDK 21)
- Jakarta Servlet API
- JSP
- Maven
- Apache Tomcat 10.1
- MySQL
- HTML & CSS

---

## 👥 Roles & Permissions

| Role            | Dashboard Path                  | Permissions |
|-----------------|----------------------------------|------------|
| Student         | `student.jsp`         | Submit feedback, view responses |
| Instructor      | `instructor.jsp`      | View & respond to feedback, escalate |
| Department Head | `department.jsp`      | Handle forwarded feedback |
| Student Affairs | `affairs.jsp`         | Manage sensitive cases |
| Admin           | `admin.jsp`           | User & feedback management |

---

## 🆔 School ID Formats

| Role        | Format Example |
|------------|----------------|
| Student    | `UGR/00001/16` |
| Instructor | `INS/0004` |
| Department | `DEP/SCI` |
| Affairs    | `AFF/01` |
| Admin      | `ADM/001` |

## 📂 Folder Structure

StudentFeedbackSystem/
│── pom.xml
│
└── src/main/
    ├── java/com/example/feedbacksystem/
    │   ├── utils/
    │   │   └── DBUtil.java
    │   │
    │   ├── servlets/
    │   │   ├── LoginServlet.java
    │   │   ├── RegisterServlet.java
    │   │   ├── LogoutServlet.java
    │   │   ├── StudentServlet.java
    │   │   ├── InstructorServlet.java
    │   │   ├── DepartmentServlet.java
    │   │   ├── AffairsServlet.java
    │   │   └── AdminServlet.java
    │
    └── webapp/
        ├── css/
        │   └── style.css
        ├── login.jsp
        ├── register.jsp
        ├── header.jsp
        ├── student.jsp
        ├── instructor.jsp
        ├── department.jsp
        ├── affairs.jsp
        └── admin.jsp
        ├── link.jsp
        └── dashboard.jsp
        ├── feedback.jsp

## 🗄️ Database Design (MySQL)

### users Table

| Column | Type | Description |
|------|------|------------|
| id | INT (PK, AI) | User ID |
| school_id | VARCHAR(20) | Unique institutional ID |
| full_name | VARCHAR(100) | User full name |
| email | VARCHAR(100) | Unique email |
| mobile | VARCHAR(15) | Mobile number |
| role | ENUM | User role |
| password | VARCHAR(255) | Hashed password |

---

### feedback Table

| Column | Type | Description |
|------|------|------------|
| id | INT (PK, AI) | Feedback ID |
| student_id | INT (FK) | Student user ID |
| teacher_id | INT (FK) | Instructor user ID |
| target_role | ENUM | Feedback recipient |
| anonymous | BOOLEAN | Anonymous flag |
| message | TEXT | Feedback message |
| status | ENUM | Feedback status |
| response | TEXT | Response message |
| created_at | TIMESTAMP | Submission time |

---

## ⚙️ Installation & Setup

### Prerequisites
- Java 21
- Apache Tomcat 10.1
- MySQL Server
- Maven

### Steps

1. Clone or download the project
2. Create database and tables
3. Configure database credentials in `DBUtil.java`
4. Add JSTL libraries to `WEB-INF/lib`
5. Build the project:

mvn clean package

### Deploy the WAR file to Tomcat webapps/

Start Tomcat server

Access the application:

http://localhost:8080/StudentFeedbackSystem/login.jsp

🧩 Application Modules

Authentication Module (Login, Register, Logout)

Student Module (Feedback submission and tracking)

Instructor Module (Feedback review and response)

Department Module (Escalation handling)

Affairs Module (Sensitive case management)

Admin Module (User and system management)

Utility Layer (Database connectivity)

🚀 Future Improvements

Password hashing with BCrypt

Pagination and filtering

Email notifications

File attachments

REST API support

UI enhancement using Bootstrap

Analytics and reports
