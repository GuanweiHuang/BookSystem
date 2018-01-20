package com.book.web;

import com.book.entity.Users;
import com.book.service.UsersService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hgw on 2017/12/24.
 */
@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport {

    private Users user;
    private int msg;
    private int uno;
    private String newPwd;

    @Resource(name = "usersService")
    private UsersService usersService;

    //用户登录
    public String doLogin(){
        //调用服务层方法处理用户登录操作
        user=usersService.doLogin(user);
        if(user==null){
            addActionError("用户名或密码错误!");
            return "input";
        }else{
            //登录成功，记录登录状态
            ActionContext.getContext().getSession().put("LoginUser", user);
        }
        return "doLogin";
    }

    //用户添加
    public String addUserTwo(){
        //调用服务层方法执行添加用户操作
        user=usersService.addUserTwo(user);
        ActionContext.getContext().getSession().put("addUsers", user);
        return "addUserTwo";
    }

    public String addUser(){
        Users users = usersService.checkUname(user);
        if (users==null){
            if (usersService.addUser(user)){
                msg=1;
            }else {
                msg=-1;
            }
        }else {
            msg=0;
        }
        return "addUser";
    }

    //超级管理员查询所有用户
    public String findUsersList(){
        List usersList=usersService.findUsersList();
        ActionContext.getContext().put("usersList",usersList);
        return "findUsersList";
    }

    //超级管理员查询所有已销户用户
    public String findInvalidUsersList(){
        List usersList=usersService.findInvalidUsersList();
        ActionContext.getContext().put("usersList",usersList);
        return "findInvalidUsersList";
    }

    //超级管理员重置密码
    public String updatePwd1(){
        if (usersService.updatePwd(user)){
            msg=2;
        }else {
            msg=-2;
        }
        return "updatePwd1";
    }

    //超级管理员去到修改页面
    public String toUpdateUser(){
        user = usersService.getUserById(user);
        return "toUpdateUser";
    }

    //超级管理员执行修改用户
    public String doUpdateUser(){
        Users userstwo = usersService.checkUnameTwo(user);
        Users users = usersService.checkUname(user);
        if (userstwo==null){
            if (users==null){
                if (usersService.updateUser(user)){
                    uno=user.getUno();
                    msg=1;
                }else {
                    uno=user.getUno();
                    msg=-1;
                }
            }else {
                uno=user.getUno();
                msg=0;
            }
        }else {
            if (usersService.updateUser(user)){
                uno=user.getUno();
                msg=1;
            }else {
                uno=user.getUno();
                msg=-1;
            }
        }
        return "doUpdateUser";
    }

    //超级管理员去到详情页面
    public String toUserPage(){
        user = usersService.getUserById(user);
        return "toUserPage";
    }

    //超级管理员注销用户
    public String deleteUser1(){
        if (usersService.deleteUser(user)){
            msg=3;
        }else {
            msg=-3;
        }
        return "deleteUser1";
    }

    //管理员查询可查用户
    public String findUsersList2(){
        List usersList=usersService.findUsersList2();
        ActionContext.getContext().put("usersList",usersList);
        return "findUsersList2";
    }

    //管理员去到修改页面
    public String toUpdateUser2(){
        user = usersService.getUserById(user);
        return "toUpdateUser2";
    }

    //管理员执行修改用户
    public String doUpdateUser2(){
        Users userstwo = usersService.checkUnameTwo(user);
        Users users = usersService.checkUname(user);
        if (userstwo==null){
            if (users==null){
                if (usersService.updateUser(user)){
                    uno=user.getUno();
                    msg=1;
                }else {
                    uno=user.getUno();
                    msg=-1;
                }
            }else {
                uno=user.getUno();
                msg=0;
            }
        }else {
            if (usersService.updateUser(user)){
                uno=user.getUno();
                msg=1;
            }else {
                uno=user.getUno();
                msg=-1;
            }
        }
        return "doUpdateUser2";
    }

    //管理员重置密码
    public String updatePwd2(){
        if (usersService.updatePwd(user)){
            msg=2;
        }else {
            msg=-2;
        }
        return "updatePwd2";
    }

    //超级管理员去到详情页面
    public String toUserPage2(){
        user = usersService.getUserById(user);
        return "toUserPage2";
    }

    //管理员注销用户
    public String deleteUser2(){
        if (usersService.deleteUser(user)){
            msg=3;
        }else {
            msg=-3;
        }
        return "deleteUser2";
    }



    //去到修改个人信息页面
    public String toUpdateUserPer(){
        user = usersService.getUserById(user);
        return "toUpdateUserPer";
    }

    //执行修改个人信息
    public String doUpdateUserPer(){
        if (usersService.updateUser(user)){
            uno=user.getUno();
            msg=1;
        }else {
            uno=user.getUno();
            msg=-1;
        }
        return "doUpdateUserPer";
    }

    //去到修改个人密码页面
    public String toUpdateUserPwd(){
        user = usersService.getUserById(user);
        return "toUpdateUserPwd";
    }

    //执行修改个人密码
    public String doUpdateUserPwd(){
        Users checkPwd = usersService.doLogin(user);
        newPwd=newPwd;
//        System.out.println(newPwd);
        user.setUpwd(newPwd);
        if (checkPwd!=null){
            if (usersService.updateUser(user)){
                uno=user.getUno();
                msg=1;
            }else {
                uno=user.getUno();
                msg=-1;
            }
        }else {
            uno=user.getUno();
            msg=0;
        }
        return "doUpdateUserPwd";
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public UsersService getUsersService() {
        return usersService;
    }

    public void setUsersService(UsersService usersService) {
        this.usersService = usersService;
    }

    public int getMsg() {
        return msg;
    }

    public void setMsg(int msg) {
        this.msg = msg;
    }

    public int getUno() {
        return uno;
    }

    public void setUno(int uno) {
        this.uno = uno;
    }

    public String getNewPwd() {
        return newPwd;
    }

    public void setNewPwd(String newPwd) {
        this.newPwd = newPwd;
    }
}
