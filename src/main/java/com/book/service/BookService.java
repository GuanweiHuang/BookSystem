package com.book.service;

import com.book.dao.BookDao;
import com.book.entity.Book;
import com.book.entity.BookType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hgw on 2018/1/17.
 */
@Service("bookService")
@Transactional(propagation= Propagation.REQUIRED)
public class BookService {

    @Resource(name = "bookDao")
    private BookDao bookDao;

    //用于验证书籍编号是否存在
    public Book checkBno(Book book) {
        String hql="from Book b where b.bno='"+book.getBno()+"'";
        //取出同名的所有书籍类型名字
        List<Book> list=bookDao.findBookList(hql);
        if(list!=null&&list.size()>0){
            for (Book books : list) {
                if (books.getBno().equals(book.getBno())){
                    return books;
                }
            }
        }
        return null;
    }

    //用于验证书籍编号是否进行更改
    public Book checkBnoTwo(Book book) {
        String hql="from Book b where b.bno='"+book.getBno()+"'";
        //取出同名的所有书籍类型名字
        List<Book> list=bookDao.findBookList(hql);
        if(list!=null&&list.size()>0){
            for (Book bookstwo : list) {
                if (bookstwo.getBno().equals(book.getBno())&&bookstwo.getBid()==book.getBid()){
                    return bookstwo;
                }
            }
        }
        return null;
    }

    //增
    public boolean addBook(Book book){
        return bookDao.addBook(book);
    }

    //删
    public boolean deleteBook(Book book){
        return bookDao.deleteBook(book);
    }

    //删除选择的书籍
    public boolean deleteAllBooks(int[] ids){
        String hql = "delete from Book where bid="+ids[0];
        for (int i = 1; i < ids.length; i++){
            hql += "or bid="+ids[i];
        }
        return bookDao.setAllBooks(hql);
    }

    //改
    public boolean updateBook(Book book){
        return bookDao.updateBook(book);
    }

    //查
    public List<Book> findBookList(){
        String hql = "from Book b inner join b.btype bt order by b.bname asc";
        return bookDao.findBookList(hql);
    }

    //查询单个
    public Book getBookById(Book book){
        return bookDao.getBookById(book);
    }

    public Book getBookId(int id){
        return bookDao.getBookId(id);
    }

    //用于验证删除某类型书籍本数是否为0
    public List findAllBookList(BookType btype){
        String hql = "from Book b where b.btype.btno="+btype.getBtno();
        return bookDao.findBookList(hql);
    }

    //根据书籍编号或书籍名称模糊查询(借阅图书页面)
    public List bookByBno(Book book){
        String hql = "from Book where bno like '%"+book.getBno()+"%' or " +
                " bname like '%"+book.getBno()+"%'";
        return bookDao.findBookList(hql);
    }

    //根据书籍编号或书籍名称模糊查询(查询状态为正常的书籍)
    public List bookByBno1(Book book){
        String hql = "from Book where bstatus = 1 and ( bno like '%"+book.getBno()+"%' or " +
                " bname like '%"+book.getBname()+"%') order by bname";
        return bookDao.findBookList(hql);
    }

    //根据书籍编号或书籍名称模糊查询(查询状态为已出租的书籍)
    public List bookByBno2(Book book){
        String hql = "from Book where bstatus = 2 and ( bno like '%"+book.getBno()+"%' or " +
                " bname like '%"+book.getBname()+"%') order by bname";
        return bookDao.findBookList(hql);
    }

    //根据书籍编号或书籍名称模糊查询(查询状态为已出租的书籍)
    public List bookByBno3(Book book){
        String hql = "from Book where bstatus = 3 and ( bno like '%"+book.getBno()+"%' or " +
                " bname like '%"+book.getBname()+"%') order by bname";
        return bookDao.findBookList(hql);
    }

    //查询所有状态为正常的书籍
    public List findBookStatus1(){
        String hql = "from Book where bstatus = 1 order by bname asc";
        return bookDao.findBookList(hql);
    }

    //查询所有状态为出租的书籍
    public List findBookStatus2(){
        String hql = "from Book where bstatus = 2 order by bname asc";
        return bookDao.findBookList(hql);
    }

    //查询所有状态为出售的书籍
    public List findBookStatus3(){
        String hql = "from Book where bstatus = 3 order by bname asc";
        return bookDao.findBookList(hql);
    }

    //    归还书籍
    public boolean returnBook(Book book){
        book=bookDao.getBookId(book.getBid());
        book.setBstatus(1);
        return bookDao.updateBook(book);
    }

    //归还选择的书籍
    public boolean returnAllBooks(int[] ids){
        String hql = "update Book b set b.bstatus=1 where bid="+ids[0];
        for (int i = 1; i < ids.length; i++){
            hql += "or bid="+ids[i];
        }
        return bookDao.setAllBooks(hql);
    }

//    出租书籍
    public boolean loadBook(Book book){
        book=bookDao.getBookId(book.getBid());
        book.setBstatus(2);
        return bookDao.updateBook(book);
    }

    //出租选择的书籍
    public boolean loadAllBooks(int[] ids){
        String hql = "update Book b set b.bstatus=2 where bid="+ids[0];
        for (int i = 1; i < ids.length; i++){
            hql += "or bid="+ids[i];
        }
        return bookDao.setAllBooks(hql);
    }

    //    出售书籍
    public boolean buyBook(Book book){
        book=bookDao.getBookId(book.getBid());
        book.setBstatus(3);
        return bookDao.updateBook(book);
    }

    //出售选择的书籍
    public boolean buyAllBooks(int[] ids){
        String hql = "update Book b set b.bstatus=3 where bid="+ids[0];
        for (int i = 1; i < ids.length; i++){
            hql += "or bid="+ids[i];
        }
        return bookDao.setAllBooks(hql);
    }


    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }
}
