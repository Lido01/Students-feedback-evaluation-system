package com.example.feedbacksystem.models;

public class Feedback {
    private String studentName;
    private String message;

    public Feedback(String studentName, String message){
        this.studentName = studentName;
        this.message = message;
    }

    public String getStudentName(){ return studentName; }
    public String getMessage(){ return message; }
}
