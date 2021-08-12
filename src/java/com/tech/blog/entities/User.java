/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author kajay002
 */
public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String confirm_password;
    private String gender;
    private String about;
    private String profile;
    private Timestamp dateTime;

    public User(int id, String name, String email, String password, String confirm_password, String gender, String about) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.confirm_password = confirm_password;
        this.gender = gender;
//        this.dateTime = dateTime;
        this.about = about;
    }

    public User() {
    }

    public User(String name, String email, String password, String confirm_password, String gender, String about) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.confirm_password = confirm_password;
        this.gender = gender;
//        this.dateTime = dateTime;
        this.about = about;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm_password() {
        return confirm_password;
    }

    public void setConfirm_password(String confirm_password) {
        this.confirm_password = confirm_password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
 
}
