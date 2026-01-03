package com.example.feedbacksystem.models;

public class User {
    final private String username;
    final private String password;
    final private String role;

    public User(String username, String password, String role){
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public String getUsername(){ return username; }
    public String getPassword(){ return password; }
    public String getRole(){ return role; }
}

