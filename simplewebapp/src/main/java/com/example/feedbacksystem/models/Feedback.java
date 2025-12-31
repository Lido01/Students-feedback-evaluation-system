package com.example.feedbacksystem.models;

public class Feedback {
   final private String studentName;
   final private String message;

    public Feedback(String studentName, String message){
        this.studentName = studentName;
        this.message = message;
    }

    public String getStudentName(){ return studentName; }
    public String getMessage(){ return message; }
}
