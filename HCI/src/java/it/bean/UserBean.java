/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.bean;

import java.io.Serializable;

/**
 *
 * @author 1
 */
public class UserBean implements Serializable{
    private String username,pwd;
    private double bonuns;

    public double getBonuns() {
        return bonuns;
    }

    public void setBonuns(double bonuns) {
        this.bonuns = bonuns;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    
}
