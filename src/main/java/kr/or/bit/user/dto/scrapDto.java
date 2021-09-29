package kr.or.bit.user.dto;

/*
 
 */
public class scrapDto{
    private String id;
    private int no;
    
    public String getId(){
        return id;
    }
    
    public void setId(String id){
        this.id = id;
    }
    
    public int getNo(){
        return no;
    }
    
    public void setNo(int no){
        this.no = no;
    }
    
    @Override
    public String toString(){
        return "scrap{" +
                "id='" + id + '\'' +
                ", no=" + no +
                '}';
    }
    
}

























