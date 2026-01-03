

School ID formats (enforced in UI / logic)
Role	Example
Student	UGR/00001/16
Instructor	INS/0004
Department	DEP/SCI
Affairs	AFF/01
Admin	ADM/001

# Student Feedback System

A **Java web application** for managing student academic feedback with role-based access for students, instructors, department heads, student affairs, and administrators. Built using **Jakarta Servlet API**, **JSP**, **MySQL**, and **CSS styling**.

---

## Table of Contents

- [Features](#features)  
- [Roles & Permissions](#roles--permissions)  
- [Folder Structure](#folder-structure)  
- [Database Design](#database-design)  
- [Installation & Setup](#installation--setup)  
- [Usage](#usage)  
- [Technologies Used](#technologies-used)  
- [Future Improvements](#future-improvements)

---

## Features

- **User Authentication**
  - Register with school ID, full name, email, mobile number, role, password, confirm password
  - Login using school ID and password
  - Logout functionality
  - Role-based redirection and navigation
- **Role-based Dashboards**
  - **Student**: Submit feedback (named or anonymous), view instructor responses
  - **Instructor**: View feedback from students, respond to feedback, forward feedback to departments
  - **Department Head**: View instructor or course feedback, manage internal actions
  - **Student Affairs**: Handle sensitive feedback (harassment, confidential cases)
  - **Admin**: Manage users, roles, feedback, generate reports, system settings, backup
- **Feedback Workflow**
  - Status: Pending, Completed, Declined
  - Responses from instructors or departments
- **Modern UI**
  - Styled JSP pages with CSS
  - Header shows logged-in user, role, and role-based navigation
- **Persistence**
  - MySQL backend
  - Stores users, feedback, roles, and responses
- **Session Management**
  - Role-based access
  - Logout invalidates session

---

## Roles & Permissions

| Role          | Dashboard Page     | Permissions |
|---------------|-----------------|-------------|
| Student       | `student.jsp`    | Submit feedback, view responses |
| Instructor    | `instructor.jsp` | View feedback, respond, forward |
| Department    | `department.jsp` | View forwarded feedback, internal actions |
| Student Affairs | `affairs.jsp` | Handle sensitive feedback, manage cases |
| Admin         | `admin.jsp`      | Manage users, feedback, reports, system settings |

---

## Folder Structure

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
        ├── css/style.css
        ├── login.jsp
        ├── register.jsp
        ├── header.jsp
        ├── student/
        │   └── dashboard.jsp
        ├── instructor/
        │   └── dashboard.jsp
        ├── department/
        │   └── dashboard.jsp
        ├── affairs/
        │   └── dashboard.jsp
        └── admin/
            └── dashboard.jsp



---

## Database Design (MySQL)

### Tables

#### users
| Column       | Type         | Description |
|-------------|-------------|------------|
| id          | INT PK AI    | Auto increment ID |
| school_id   | VARCHAR(20)  | School formatted ID (UGR/00001/16) |
| full_name   | VARCHAR(100) | Full name |
| email       | VARCHAR(100) | Email |
| mobile      | VARCHAR(15)  | Mobile number |
| role        | ENUM         | `STUDENT`, `INSTRUCTOR`, `DEPARTMENT`, `AFFAIRS`, `ADMIN` |
| password    | VARCHAR(255) | Hashed password |

#### feedback
| Column       | Type         | Description |
|-------------|-------------|------------|
| id          | INT PK AI    | Feedback ID |
| student_id  | INT FK users | Student who submitted |
| teacher_id  | INT FK users | Instructor related (nullable for admin) |
| target_role | ENUM         | Recipient role (`INSTRUCTOR`, `DEPARTMENT`, `AFFAIRS`) |
| anonymous   | BOOLEAN      | True if anonymous |
| message     | TEXT         | Feedback content |
| status      | ENUM         | `PENDING`, `COMPLETED`, `DECLINED` |
| response    | TEXT         | Response message by instructor or admin |
| created_at  | TIMESTAMP    | Submission time |

---

## Installation & Setup

1. **Install Java 21**  
2. **Install Apache Tomcat 10.1**  
3. **Install MySQL**  
4. **Create Database**
```sql
CREATE DATABASE feedback_system;

USE feedback_system;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    school_id VARCHAR(20) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mobile VARCHAR(15),
    role ENUM('STUDENT','INSTRUCTOR','DEPARTMENT','AFFAIRS','ADMIN') NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE feedback (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    teacher_id INT,
    target_role ENUM('INSTRUCTOR','DEPARTMENT','AFFAIRS'),
    anonymous BOOLEAN DEFAULT FALSE,
    message TEXT NOT NULL,
    status ENUM('PENDING','COMPLETED','DECLINED') DEFAULT 'PENDING',
    response TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES users(id),
    FOREIGN KEY (teacher_id) REFERENCES users(id)
);


Configure DBUtil.java with your MySQL credentials

Add JSTL JARs to WEB-INF/lib for Tomcat 10.1:

jakarta.servlet.jsp.jstl-api-3.0.0.jar

jakarta.servlet.jsp.jstl-3.0.1.jar

Build WAR file

mvn clean package


Deploy WAR to Tomcat webapps/ folder

Start Tomcat and access:

http://localhost:8080/StudentFeedbackSystem/login.jsp
