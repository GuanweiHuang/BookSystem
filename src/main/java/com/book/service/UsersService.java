package com.book.service;

import com.book.dao.UsersDao;
import com.book.entity.Users;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hgw on 2017/12/18.
 */
@Service("usersService")
@Transactional(propagation= Propagation.REQUIRED)
public class UsersService {

    @Resource(name = "usersDao")
    public UsersDao usersDao;

    public Users doLogin(Users user) {
        String hql="from Users u where u.uname='"+user.getUname()+"' and u.ustatus=1";
        //取出同名的所有用户
        List<Users> list=usersDao.findUsersList(hql);
        if(list!=null&&list.size()>0){
            for (Users users : list) {
                if(users.getUname().equals(user.getUname())&&users.getUpwd().equals(user.getUpwd())){
                    return users;
                }
            }
        }
        return null;
    }

    //查询用户名是否存在
    public Users checkUname(Users user){
        String hql="from Users u where u.uname='"+user.getUname()+"'";
        List<Users> list = usersDao.findUsersList(hql);
        if (list!=null&&list.size()>0){
            for (Users users : list){
                if (users.getUname().equals(user.getUname())){
                    return users;
                }
            }
        }
        return null;
    }

    //用于验证修改用户时，用户名是否有被修改
    public Users checkUnameTwo(Users user){
        String hql="from Users u where u.uname='"+user.getUname()+"'";
        List<Users> list = usersDao.findUsersList(hql);
        if (list!=null&&list.size()>0){
            for (Users userstwo : list){
                if (userstwo.getUname().equals(user.getUname())&&userstwo.getUno()==user.getUno()){
                    return userstwo;
                }
            }
        }
        return null;
    }

    //添加用户
    public boolean addUser(Users users){
        return usersDao.addUser(users);
    }

    public Users addUserTwo(Users users){
        return usersDao.addUserTwo(users);
    }

    //修改用户
    public boolean updateUser(Users users){
        return usersDao.updateUser(users);
    }

    //重置密码为123456
    public boolean updatePwd(Users users){
        //根据id查询出要重置的用户
        users=usersDao.getUserId(users.getUno());
        users.setUpwd("123456");
        return usersDao.updateUser(users);
    }

    //注销用户
    public boolean deleteUser(Users users){
        users=usersDao.getUserId(users.getUno());
        users.setUstatus(0);
        return usersDao.updateUser(users);
    }

    //超级管理员查询用户
    public List findUsersList(){
        String hql = "from Users where ustatus = 1 order by utype asc";
        return usersDao.findUsersList(hql);
    }

    //超级管理员查询已销户用户
    public List findInvalidUsersList(){
        String hql = "from Users where ustatus = 0 order by utype asc";
        return usersDao.findUsersList(hql);
    }

    //管理员查询用户
    public List findUsersList2(){
//        String hql = "from Users where utype = 2 or utype = 3 order by utype asc";
        String hql = "from Users where utype != 1 and ustatus = 1 order by utype asc";
        return usersDao.findUsersList(hql);
    }

    //根据id查询用户
     public Users getUserById(Users users){
        return usersDao.getUserById(users);
     }

    public void setUsersDao(UsersDao usersDao) {
        this.usersDao = usersDao;
    }
}
