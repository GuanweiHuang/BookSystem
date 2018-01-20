package com.book.web;

import com.book.entity.Book;
import com.book.service.BookService;
import com.book.service.BtypeService;
import com.opensymphony.xwork2.ActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hgw on 2018/1/17.
 */
@Controller("bookAction")
@Scope("prototype")
public class BookAction {

    @Resource(name = "bookService")
    private BookService bookService;
    @Resource(name = "btypeService")
    private BtypeService btypeService;

    private int msg;
    private Book book;
    private int[] id;
    private List btypeList;
    private int bid;

    //增
    public String addBook(){
        Book books = bookService.checkBno(book);
        if (books!=null){
            msg=0;
        }else {
            if (bookService.addBook(book)){
                msg=1;
            }else {
                msg=-1;
            }
        }
        return "addBook";
    }

    //删除
    public String deleteBook(){
        if (book.getBid()!=0) {
            if (bookService.deleteBook(book)){
                msg=1;
            }else {
                msg=-1;
            }
        }else {
            msg=0;
        }
        return "deleteBook";
    }

    //删除勾选中的书籍
    public String deleteAllBook(){
        if (bookService.deleteAllBooks(id)){
            msg=1;
        }else {
            msg=-1;
        }
        return "deleteBook";
    }

    //去到修改页面
    public String toUpdateBook(){
        book=bookService.getBookById(book);
        return "toUpdateBook";
    }

    //执行修改操作
    public String doUpdateBook(){
        Book booktwo=bookService.checkBnoTwo(book);
        Book books=bookService.checkBno(book);
        bid=book.getBid();

        if (booktwo!=null){
            if (bookService.updateBook(book)){
                bid=book.getBid();
                msg=2;
            }else {
                bid=book.getBid();
                msg=-2;
            }
        }else {
            if (books!=null){
                bid=book.getBid();
                System.out.print(bid);
                msg=-21;
            }else {
                if (bookService.updateBook(book)){
                    bid=book.getBid();
                    msg=2;
                }else {
                    bid=book.getBid();
                    msg=-2;
                }
            }
        }
        return "doUpdateBook";
    }

    //查询所有书籍
    public String findBookList(){
        ActionContext.getContext().put("bookList",bookService.findBookList());
        return "findBookList";
    }

    //查询所有类型
    public String findBtypeList(){
        btypeList=btypeService.findBtypeList();
        return "findBtypeList";
    }

    //根据书籍编号或名称模糊查询
    public String findBookByNo(){
        List list = bookService.bookByBno(book);
        List list1 = new ArrayList();
        for(int i = 0; i < list.size(); i++){
            List list2 = new ArrayList();
            Book book = (Book) list.get(i);
            list2.add(book);
            list2.add(book.getBtype());
            list1.add(list2);
        }
        ActionContext.getContext().put("bookList",list1);
        return "findBookList";
    }

    //查询所有状态为正常的书籍
    public String findBookStatus1(){
        ActionContext.getContext().put("bookList",bookService.findBookStatus1());
        return "findBookStatus1";
    }

    //根据书籍编号或名称模糊查询
    public String findBookByNoStatus1(){
//        List list = bookService.bookByBno(book);
//        List list1 = new ArrayList();
//        for(int i = 0; i < list.size(); i++){
//            List list2 = new ArrayList();
//            Book book = (Book) list.get(i);
//            list2.add(book);
//            list2.add(book.getBtype());
//            list1.add(list2);
//        }
//        ActionContext.getContext().put("bookList",list1);
        ActionContext.getContext().put("bookList",bookService.bookByBno1(book));
        return "findBookStatus1";
    }

    //出租书籍
    public String loadBook(){
        if (book.getBid()!=0) {
            if (bookService.loadBook(book)){
                msg=1;
            }else {
                msg=-1;
            }
        }else {
            msg=0;
        }
        return "load_and_buy_Book";
    }

    //出租勾选中的书籍
    public String loadAllBook(){
        if (bookService.loadAllBooks(id)){
            msg=1;
        }else {
            msg=-1;
        }
        return "load_and_buy_Book";
    }

    //出售书籍
    public String buyBook(){
        if (book.getBid()!=0) {
            if (bookService.buyBook(book)){
                msg=1;
            }else {
                msg=-1;
            }
        }else {
            msg=0;
        }
        return "load_and_buy_Book";
    }

    //出售勾选中的书籍
    public String buyAllBook(){
        if (bookService.buyAllBooks(id)){
            msg=1;
        }else {
            msg=-1;
        }
        return "load_and_buy_Book";
    }

    //查询所有状态为已出租的书籍
    public String findBookStatus2(){
        ActionContext.getContext().put("bookList",bookService.findBookStatus2());
        return "findBookStatus2";
    }

    //根据书籍编号或名称模糊查询
    public String findBookByNoStatus2(){
        ActionContext.getContext().put("bookList",bookService.bookByBno2(book));
        return "findBookStatus2";
    }

    //归还书籍
    public String returnBook(){
        if (book.getBid()!=0) {
            if (bookService.returnBook(book)){
                msg=1;
            }else {
                msg=-1;
            }
        }else {
            msg=0;
        }
        return "returnBook";
    }

    //归还勾选中的书籍
    public String returnAllBook(){
        if (bookService.returnAllBooks(id)){
            msg=1;
        }else {
            msg=-1;
        }
        return "returnBook";
    }

    //查询所有状态为已出售的书籍
    public String findBookStatus3(){
        ActionContext.getContext().put("bookList",bookService.findBookStatus3());
        return "findBookStatus3";
    }

    //根据书籍编号或名称模糊查询
    public String findBookByNoStatus3(){
        ActionContext.getContext().put("bookList",bookService.bookByBno3(book));
        return "findBookStatus3";
    }


    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    public void setBtypeService(BtypeService btypeService) {
        this.btypeService = btypeService;
    }

    public int getMsg() {
        return msg;
    }

    public void setMsg(int msg) {
        this.msg = msg;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int[] getId() {
        return id;
    }

    public void setId(int[] id) {
        this.id = id;
    }

    public List getBtypeList() {
        return btypeList;
    }

    public void setBtypeList(List btypeList) {
        this.btypeList = btypeList;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }
}
