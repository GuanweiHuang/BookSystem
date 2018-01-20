package com.book.dao;

import com.book.entity.Book;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hgw on 2018/1/17.
 */
@Repository("bookDao")
public class BookDao extends BaseDao {

    //添加书籍
    public boolean addBook(Book book){
        try {
            getSession().save(book);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //删除书籍
    public boolean deleteBook(Book book){
        try {
            getSession().delete(book);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //用于根据ID删除勾选的书籍
    public boolean setAllBooks(String hql){
        try{
            getSession().createQuery(hql).executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //更改书籍
    public boolean updateBook(Book book){
        try {
            getSession().update(book);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //查询书籍
    public List<Book> findBookList(String hql){
        return getSession().createQuery(hql).list();
    }

    //查询单个用户
    public Book getBookById(Book book){
        return getSession().get(Book.class, book.getBid());
    }

    public Book getBookId(int id){
        return getSession().get(Book.class,id);
    }
}
