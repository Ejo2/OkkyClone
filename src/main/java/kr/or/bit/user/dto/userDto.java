package kr.or.bit.user.dto;

/*
 
 */
public class userDto{//dto
    private String id;
    private String nickname;
    private String pw;
    private String email;
    private String photo;
    
    public String getNickname(){
        return nickname;
    }
    
    public void setNickname(String nickname){
        this.nickname = nickname;
    }
    
    public String getPhoto(){
        return photo;
    }
    
    public void setPhoto(String photo){
        this.photo = photo;
    }
    
    public String getId(){
        return id;
    }
    
    public void setId(String id){
        this.id = id;
    }
    
    public String getPw(){
        return pw;
    }
    
    public void setPw(String pw){
        this.pw = pw;
    }
    

    
    public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    
    @Override
    public String toString(){
        return "userDto{" +
                "id='" + id + '\'' +
                ", nickname='" + nickname + '\'' +
                ", pw='" + pw + '\'' +
                ", email='" + email + '\'' +
                ", photo='" + photo + '\'' +
                '}';
    }
    
}

























