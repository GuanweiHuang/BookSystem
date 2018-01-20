package com.book.dao;

import com.book.entity.Readers;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hgw on 2018/1/19.
 */
@Repository("readerDao")
public class ReaderDao extends BaseDao {

    //增
    public boolean addReader(Readers readers){
        try {
            getSession().save(readers);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //删
    public boolean deleteReader(Readers readers){
        try {
            getSession().delete(readers);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //该
    public boolean updateReader(Readers readers){
        try {
            getSession().update(readers);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //根据ID删除勾选的读者信息
    public boolean deleteAllReaders(String hql){
        try{
            getSession().createQuery(hql).executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //查
    public List findReadersList(String hql){
        return getSession().createQuery(hql).list();
    }

    //查单个
    public Readers getReaderById(Readers readers){
        return getSession().get(Readers.class, readers.getRno());
    }
}
