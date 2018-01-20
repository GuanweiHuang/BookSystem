package com.book.dao;

import com.book.entity.Users;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by hgw on 2017/12/18.
 */
@Repository("usersDao")
public class UsersDao extends BaseDao {

    //添加用户
    public boolean addUser(Users users){
        try {
            getSession().save(users);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    public Users addUserTwo(Users users){
        Integer id = (Integer) getSession().save(users);
        users.setUno(id);
        return users;
    }

    //修改用户
    public boolean updateUser(Users users){
        try {
            getSession().update(users);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //查询所有用户
    public List findUsersList(String hql){
        return getSession().createQuery(hql).list();
    }

    //查询单个用户
    public Users getUserById(Users users){
        return getSession().get(Users.class,users.getUno());
    }

    public Users getUserId(int id){
        return getSession().get(Users.class, id);
    }
}
