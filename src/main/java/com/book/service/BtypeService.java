package com.book.service;

import com.book.dao.BtypeDao;
import com.book.entity.BookType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hgw on 2018/1/17.
 */
@Service("btypeService")
@Transactional(propagation= Propagation.REQUIRED)
public class BtypeService  {

    @Resource(name = "btypeDao")
    private BtypeDao btypeDao;

    //用于验证某种书籍类型是否存在
    public BookType checkBtname(BookType btype) {
        String hql="from BookType bt where bt.btname='"+btype.getBtname()+"'";
        //取出同名的所有书籍类型名字
        List<BookType> list=btypeDao.findBtypeList(hql);
        if(list!=null&&list.size()>0){
            for (BookType bookType : list) {
                if (bookType.getBtname().equals(btype.getBtname())){
                    return bookType;
                }
            }
        }
        return null;
    }

    //增
    public boolean addBtype(BookType btype){
        return btypeDao.addBtype(btype);
    }

    //删
    public boolean deleteBtype(BookType btype){
        return btypeDao.deleteBtype(btype);
    }

    //改
    public boolean updateBtype(BookType btype){
        return btypeDao.updateBtype(btype);
    }

    //查
    public List findBtypeList(){
        String hql = "from BookType";
        return btypeDao.findBtypeList(hql);
    }

    //查询单个
    public BookType getBtypeById(BookType btype){
        return btypeDao.getBtypeById(btype);
    }

    public BookType getBtypeId(int id){
        return btypeDao.getBtypeId(id);
    }

    //查询出所有书籍类型并统计出该类型有多少本书
    public List findBtypeListInfo(){
        String hql = "select bt.btno,bt.btname,count(b.bname) from BookType bt left join " +
                " Book b on bt.btno=b.btype.btno " +
                " group by bt.btno,bt.btname " +
                " order by bt.btno";
        return btypeDao.findBtypeList(hql);
    }

    public void setBtypeDao(BtypeDao btypeDao) {
        this.btypeDao = btypeDao;
    }
}
