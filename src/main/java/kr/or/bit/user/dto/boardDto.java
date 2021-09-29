package kr.or.bit.user.dto;

import java.util.Date;

/*
 
 */
public class boardDto{
    private int no;
    private int bno;
    private String id;
    private String title;
    private String cont;
    private int hit;
    private Date writeDate;
    private int good;
    private int removedOk;
    private int scrapNum;
    
    
    @Override
    public String toString(){
        return "boardDto{" +
                "no=" + no +
                ", bno=" + bno +
                ", id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", cont='" + cont + '\'' +
                ", hit=" + hit +
                ", writeDate=" + writeDate +
                ", good=" + good +
                ", removedOk=" + removedOk +
                ", scrapNum=" + scrapNum +
                '}';
    }
    
    public int getNo(){
        return no;
    }
    
    public void setNo(int no){
        this.no = no;
    }
    
    public int getBno(){
        return bno;
    }
    
    public void setBno(int bno){
        this.bno = bno;
    }
    
    public String getId(){
        return id;
    }
    
    public void setId(String id){
        this.id = id;
    }
    
    public String getTitle(){
        return title;
    }
    
    public void setTitle(String title){
        this.title = title;
    }
    
    public String getCont(){
        return cont;
    }
    
    public void setCont(String cont){
        this.cont = cont;
    }
    
    public int getHit(){
        return hit;
    }
    
    public void setHit(int hit){
        this.hit = hit;
    }
    
    public Date getWriteDate(){
        return writeDate;
    }
    
    public void setWriteDate(Date writeDate){
        this.writeDate = writeDate;
    }
    
    public int getGood(){
        return good;
    }
    
    public void setGood(int good){
        this.good = good;
    }
    
    public int getRemovedOk(){
        return removedOk;
    }
    
    public void setRemovedOk(int removedOk){
        this.removedOk = removedOk;
    }
    
    public int getScrapNum(){
        return scrapNum;
    }
    
    public void setScrapNum(int scrapNum){
        this.scrapNum = scrapNum;
    }
    
}

























