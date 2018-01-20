package com.book.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by hgw on 2018/1/17.
 */
@Entity
@Table(name = "tb_booktype")
public class BookType implements Serializable {

    private int btno;
    private String btname;

    public BookType() {
    }

    public BookType(int btno, String btname) {
        this.btno = btno;
        this.btname = btname;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    public int getBtno() {
        return btno;
    }

    public void setBtno(int btno) {
        this.btno = btno;
    }

    public String getBtname() {
        return btname;
    }

    public void setBtname(String btname) {
        this.btname = btname;
    }
}
