package com.book.web;

import com.book.entity.BookType;
import com.book.service.BookService;
import com.book.service.BtypeService;
import com.opensymphony.xwork2.ActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hgw on 2018/1/17.
 */
@Controller("btypeAction")
@Scope("prototype")
public class BtypeAction {

    @Resource(name = "btypeService")
    private BtypeService btypeService;
    @Resource(name = "bookService")
    private BookService bookService;

    private int btno;
    private int msg;
    private BookType btype;

    //增
    public String addBtype(){
        BookType bookType =btypeService.checkBtname(btype);
        if (bookType!=null){
            msg=0;
        }else {
            if (btypeService.addBtype(btype)){
                msg=1;
            }else {
                msg=-1;
            }
        }
        return "addBtype";
    }

    //删
    public String deleteBtype(){
        List list = bookService.findAllBookList(btype);
        if (list.size()==0){
            if (btypeService.deleteBtype(btype)){
                msg=1;
            }else {
                msg=-1;
            }
        }else {
            msg=0;
        }
        return "deleteBtype";
    }

    //去到修改页面
    public String toUpdateBtype(){
        btype=btypeService.getBtypeById(btype);
        return "toUpdateBtype";
    }

    //执行修改操作
    public String doUpdateBtype(){
        BookType bookType =btypeService.checkBtname(btype);
        String btname;
        btname=btype.getBtname();
        if (bookType!=null){
            btno=btype.getBtno();
            msg=-21;
            //System.out.println(btname);
        }else {
            if (btname.length()>0){
                if (btypeService.updateBtype(btype)){
                    //System.out.println(btname);
                    btno=btype.getBtno();
                    msg=2;
                }else {
                    btno=btype.getBtno();
                    //System.out.println(btname);
                    msg=-2;
                }
            }else {
                btno=btype.getBtno();
                //System.out.println(btname);
                msg=-22;
            }
        }
        return "doUpdateBtype";
    }

    //查
    public String findBtypeList(){
        ActionContext.getContext().put("btypeList",btypeService.findBtypeListInfo());
        return "findBtypeList";
    }

    public void setBtypeService(BtypeService btypeService) {
        this.btypeService = btypeService;
    }

    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    public int getMsg() {
        return msg;
    }

    public void setMsg(int msg) {
        this.msg = msg;
    }

    public BookType getBtype() {
        return btype;
    }

    public void setBtype(BookType btype) {
        this.btype = btype;
    }

    public int getBtno() {
        return btno;
    }

    public void setBtno(int btno) {
        this.btno = btno;
    }
}
