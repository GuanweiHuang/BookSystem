package com.book.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by hgw on 2017/11/9.
 */
@Entity
@Table(name = "tb_users")
public class Users {

    private int uno;  //id
    private String uname;  //用于登录的用户名
    private String upwd;  //用户名的登录密码
    private int utype;  //1：超级管理员 2：普通管理员 3：普通员工
    private int ustatus=1;  //1：正常  0：锁定
    private String ename; //员工姓名
    private int usex;  //员工性别  1：男  0：女
    private int uage; //员工年龄
    private String utel;  //员工电话
    private String uaddress; //员工地址
    private Date uintime;  //员工入职时间

    public Users() {
    }

    public Users(int uno, String uname, String upwd, int utype, int ustatus, String ename, int usex, int uage, String utel, String uaddress, Date uintime) {
        this.uno = uno;
        this.uname = uname;
        this.upwd = upwd;
        this.utype = utype;
        this.ustatus = ustatus;
        this.ename = ename;
        this.usex = usex;
        this.uage = uage;
        this.utel = utel;
        this.uaddress = uaddress;
        this.uintime = uintime;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    public int getUno() {
        return uno;
    }

    public void setUno(int uno) {
        this.uno = uno;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public int getUtype() {
        return utype;
    }

    public void setUtype(int utype) {
        this.utype = utype;
    }

    public int getUstatus() {
        return ustatus;
    }

    public void setUstatus(int ustatus) {
        this.ustatus = ustatus;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public int getUsex() {
        return usex;
    }

    public void setUsex(int usex) {
        this.usex = usex;
    }

    public int getUage() {
        return uage;
    }

    public void setUage(int uage) {
        this.uage = uage;
    }

    public String getUtel() {
        return utel;
    }

    public void setUtel(String utel) {
        this.utel = utel;
    }

    public String getUaddress() {
        return uaddress;
    }

    public void setUaddress(String uaddress) {
        this.uaddress = uaddress;
    }

    @Column(columnDefinition = "date")
    public Date getUintime() {
        return uintime;
    }

    public void setUintime(Date uintime) {
        this.uintime = uintime;
    }
}
