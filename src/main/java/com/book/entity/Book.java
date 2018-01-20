package com.book.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by hgw on 2017/11/9.
 */
@Entity
@Table(name = "tb_books")
public class Book implements Serializable {

    private int bid;  //书的id
    private String bno; //书的编号
    private String bname; //书的名字
    private double bprice; //租聘的价格
    private double price; //出售的价格
    private int bstatus=1; //书籍状态
                // 1：正常（可租聘或可出售）  2：已租聘  3：已售出
    private Date bindate; //书籍入手日期

    private BookType btype;

    public Book() {
    }

    public Book(int bid, String bno, String bname, double bprice, double price, int bstatus, Date bindate) {
        this.bid = bid;
        this.bno = bno;
        this.bname = bname;
        this.bprice = bprice;
        this.price = price;
        this.bstatus = bstatus;
        this.bindate = bindate;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getBno() {
        return bno;
    }

    public void setBno(String bno) {
        this.bno = bno;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public double getBprice() {
        return bprice;
    }

    public void setBprice(double bprice) {
        this.bprice = bprice;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getBstatus() {
        return bstatus;
    }

    public void setBstatus(int bstatus) {
        this.bstatus = bstatus;
    }

    @Column(columnDefinition = "date")
    public Date getBindate() {
        return bindate;
    }

    public void setBindate(Date bindate) {
        this.bindate = bindate;
    }

    @ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.MERGE},fetch = FetchType.EAGER)
    @JoinColumn(name = "btype")
    public BookType getBtype() {
        return btype;
    }

    public void setBtype(BookType btype) {
        this.btype = btype;
    }
}
