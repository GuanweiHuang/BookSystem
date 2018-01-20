package com.book.service;

import com.book.dao.ReaderDao;
import com.book.entity.Readers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hgw on 2018/1/19.
 */
@Service("readerService")
@Transactional(propagation= Propagation.REQUIRED)
public class ReaderService {

    @Resource(name = "readerDao")
    private ReaderDao readerDao;

    //增
    public boolean addReader(Readers readers){
        return readerDao.addReader(readers);
    }

    //删
    public boolean deleteReader(Readers readers){
        return readerDao.deleteReader(readers);
    }

    //删除选择的读者
    public boolean deleteAllReaders(int[] ids){
        String hql = "delete from Readers where rno="+ids[0];
        for (int i = 1; i < ids.length; i++){
            hql += "or rno="+ids[i];
        }
        return readerDao.deleteAllReaders(hql);
    }

    //改
    public boolean updateReader(Readers readers){
        return readerDao.updateReader(readers);
    }

    //查
    public List findReadersList(){
        String hql = "from Readers order by rdotime asc";
        return readerDao.findReadersList(hql);
    }

    //查单个
    public Readers getReadersById(Readers readers){
        return readerDao.getReaderById(readers);
    }

    //模糊查询
    public List findReaderVague(Readers readers){
        String hql = "from Readers where " +
                " rname like '%"+readers.getRname()+"%' or " +
                " idcard like '%"+readers.getRname()+"%' or " +
                " rtel like '%"+readers.getRname()+"%' or " +
                " remarks like '%"+readers.getRname()+"%' or " +
                " rbehavior like '%"+readers.getRname()+"%' order by rdotime asc";
        return readerDao.findReadersList(hql);
    }

    //模糊查询
    public List findReaderVagueDate(Readers readers){
        String hql = "from Readers where " +
                " rname like '%"+readers.getRname()+"%' or " +
                " idcard like '%"+readers.getRname()+"%' or " +
                " rtel like '%"+readers.getRname()+"%' or " +
                " remarks like '%"+readers.getRname()+"%' or " +
                " rbehavior like '%"+readers.getRbehavior()+"%' or " +
                " rdotime like '%"+readers.getRname()+"%' order by rdotime asc";
        return readerDao.findReadersList(hql);
    }

    public void setReaderDao(ReaderDao readerDao) {
        this.readerDao = readerDao;
    }
}
