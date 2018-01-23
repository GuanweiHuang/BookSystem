package com.book.web;

import com.book.entity.Readers;
import com.book.service.ReaderService;
import com.opensymphony.xwork2.ActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by hgw on 2018/1/19.
 */
@Controller("readerAction")
@Scope("prototype")
public class ReaderAction {

    @Resource(name = "readerService")
    private ReaderService readerService;

    private Readers readers;
    private int msg;
    private int rno;
    private int[] id;
    private List readersList;


    //查询全部读者
    public String findReadersList(){
        ActionContext.getContext().put("readersList",readerService.findReadersList());
        return "findReadersList";
    }

    //模糊查询全部读者
    public String findReaderVague(){
        ActionContext.getContext().put("readersList",readerService.findReaderVague(readers));
        return "findReadersList";
    }

    //模糊查询全部读者
    public String findReaderVagueDate(){
        ActionContext.getContext().put("readersList",readerService.findReaderVagueDate(readers));
        return "findReadersList";
    }


    //增
    public String addReader(){
        if (readerService.addReader(readers)){
            msg=1;
        }else {
            msg=2;
        }
        return "addReader";
    }

    //删
    public String deleteReader(){
        if (readers.getRno()!=0){
            if (readerService.deleteReader(readers)){
                msg=1;
            }else {
                msg=-1;
            }
        }else {
            msg=0;
        }
        return "deleteReader";
    }

    //删除勾选中的读者信息
    public String deleteAllReader(){
        if (readerService.deleteAllReaders(id)){
            msg=1;
        }else {
            msg=-1;
        }
        return "deleteReader";
    }

    //超级管理员去到修改页面
    public String toUpdateReader(){
        readers=readerService.getReadersById(readers);
        return "toUpdateReader";
    }

    //超级管理员执行修改
    public String updateReader(){
        if (readerService.updateReader(readers)){
            rno=readers.getRno();
            msg=2;
        }else {
            rno=readers.getRno();
            msg=-2;
        }
        return "updateReader";
    }

    //查询
    public String findReadersDo(){
        ActionContext.getContext().put("readersList",readerService.findReadersList());
        return "findReadersDo";
    }

    //模糊查询
    public String findReaderDoVague(){
        ActionContext.getContext().put("readersList",readerService.findReaderVague(readers));
        return "findReadersDo";
    }

    //模糊查询
    public String findReaderDoVagueDate(){
        ActionContext.getContext().put("readersList",readerService.findReaderVagueDate(readers));
        return "findReadersDo";
    }

    //异步查询
    public String findReadersDo2(){
        readersList=readerService.findReadersList();
        return "findReadersDo2";
    }

    //模糊查询
    public String findReaderDoVague2(){
        readersList=readerService.findReaderVague(readers);
        return "findReaderDoVague2";
    }

    //模糊查询
    public String findReaderDoVagueDate2(){
        readersList=readerService.findReaderVagueDate(readers);
        return "findReaderDoVague2";
    }

    //管理员或普通员工去到修改页面
    public String toUpdateReader2(){
        readers=readerService.getReadersById(readers);
        return "toUpdateReader2";
    }

    //管理员或普通员工执行修改
    public String updateReader2(){
        if (readerService.updateReader(readers)){
            rno=readers.getRno();
            msg=2;
        }else {
            rno=readers.getRno();
            msg=-2;
        }
        return "updateReader2";
    }

    public void setReaderService(ReaderService readerService) {
        this.readerService = readerService;
    }

    public Readers getReaders() {
        return readers;
    }

    public void setReaders(Readers readers) {
        this.readers = readers;
    }

    public int getMsg() {
        return msg;
    }

    public void setMsg(int msg) {
        this.msg = msg;
    }

    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public int[] getId() {
        return id;
    }

    public void setId(int[] id) {
        this.id = id;
    }

    public List getReadersList() {
        return readersList;
    }

    public void setReadersList(List readersList) {
        this.readersList = readersList;
    }
}
