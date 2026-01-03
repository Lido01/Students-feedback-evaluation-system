package com.example.feedbacksystem.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/student_feedback_system";
    private static final String USER = "root";
    private static final String PASS = "lidetu@sinafanis01";

    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
