package com.book.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by hgw on 2018/1/19.
 */
@Entity
@Table(name = "tb_readers")
public class Readers implements Serializable {
    private int rno;
    private String rname;
    private String idcard; //身份证
    private String rtel;  //读者电话
    private String remarks; //备注
    private String rbehavior; //买书，租书
    private Date rdotime;  //操作日期

    public Readers() {
    }

    public Readers(int rno, String rname, String idcard, String rtel, String remarks, String rbehavior, Date rdotime) {
        this.rno = rno;
        this.rname = rname;
        this.idcard = idcard;
        this.rtel = rtel;
        this.remarks = remarks;
        this.rbehavior = rbehavior;
        this.rdotime = rdotime;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getRtel() {
        return rtel;
    }

    public void setRtel(String rtel) {
        this.rtel = rtel;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getRbehavior() {
        return rbehavior;
    }

    public void setRbehavior(String rbehavior) {
        this.rbehavior = rbehavior;
    }

    @Column(columnDefinition = "date")
    public Date getRdotime() {
        return rdotime;
    }

    public void setRdotime(Date rdotime) {
        this.rdotime = rdotime;
    }
}
