package com.entity;
import java.util.Date;

public class User {
    public User() {

    }
    
    /*   */
    private Integer id;
    /* 用户名  */
    private String username;
    /* 密码  */
    private String password;
    /* 真是姓名（昵称）  */
    private String realname;
    /* 年龄  */
    private Integer age;
    /* 电话  */
    private String tel;

    /* 1管理员0普通用户  */
    private Integer type;
    
    public Integer getId() {
        return this.id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }
    public String getRealname() {
        return this.realname;
    }
    public Integer getAge() {
        return this.age;
    }
    public String getTel() {
        return this.tel;
    }
    public Integer getType() {
        return this.type;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setRealname(String realname) {
        this.realname = realname;
    }
    public void setAge(Integer age) {
        this.age = age;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }
    public void setType(Integer type) {
        this.type = type;
    }
}