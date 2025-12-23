# Student Feedback Evaluation System

## Overview
The Student Feedback Evaluation System is a Java web application built using **Servlets, JSP, and Maven**.  
It allows students to register, log in, and submit feedback for instructors, while administrators can view and evaluate feedback results.

This project is developed as a **group project** for academic purposes.

---

## Project Structure

StudentFeedbackSystem/
├─ pom.xml
├─ src/
│  └─ main/
│     ├─ java/
│     │  └─ com/example/feedbacksystem/
│     │      ├─ servlets/
│     │      │   ├─ LoginServlet.java
│     │      │   ├─ RegisterServlet.java
│     │      │   ├─ LogoutServlet.java
│     │      │   ├─ FeedbackServlet.java
│     │      │   ├─ InstructorServlet.java
│     │      │   └─ AdminServlet.java
│     │      └─ models/
│     │          ├─ User.java
│     │          └─ Feedback.java
│     └─ webapp/
│        ├─ css/
│        │    └─ style.css
│        ├─ index.jsp
│        ├─ login.jsp
│        ├─ register.jsp
│        ├─ feedback.jsp
│        ├─ instructor.jsp
│        ├─ admin.jsp
│        └─ header.jsp





---

## Objectives
- Allow students to submit feedback securely
- Manage users through login and registration
- Store and process feedback data
- Provide evaluation results for instructors and admins
- Practice Java web development using MVC principles

---

## Features
- User registration and login
- Session-based authentication
- Feedback submission with ratings and comments
- Instructor-specific feedback viewing
- Admin dashboard for evaluation
- Clean UI using JSP and CSS
- Modular servlet-based backend

---

## Technologies Used
- Java
- Jakarta Servlet API
- JSP
- Maven
- Apache Tomcat
- HTML / CSS

---

## Application Modules
- **Authentication Module** (Login, Register, Logout)
- **Feedback Module** (Submit and store feedback)
- **Instructor Module** (View instructor-related feedback)
- **Admin Module** (View and evaluate all feedback)
- **Model Layer** (User, Feedback)

---

## How to Run the Project
1. Install **JDK** and **Apache Tomcat**
2. Open the project in an IDE (IntelliJ IDEA / Eclipse)
3. Ensure Maven dependencies are downloaded
4. Configure the project on Tomcat server
5. Run the application
6. Open a browser and go to:
