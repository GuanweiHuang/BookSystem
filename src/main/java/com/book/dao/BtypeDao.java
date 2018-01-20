package com.book.dao;

import com.book.entity.BookType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hgw on 2018/1/17.
 */
@Repository("btypeDao")
public class BtypeDao extends BookDao {

    //添加书籍类型
    public boolean addBtype(BookType btype){
        try {
            getSession().save(btype);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //删除书籍类型
    public boolean deleteBtype(BookType btype){
        try {
            getSession().delete(btype);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //修改书籍类型
    public boolean updateBtype(BookType btype){
        try {
            getSession().update(btype);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //查询所有书籍类型
    public List findBtypeList(String hql){
        return getSession().createQuery(hql).list();
    }

    //查询单个书籍类型信息
    public BookType getBtypeById(BookType btype){
        return getSession().get(BookType.class, btype.getBtno());
    }

    public BookType getBtypeId(int id){
        return getSession().get(BookType.class, id);
    }
}
