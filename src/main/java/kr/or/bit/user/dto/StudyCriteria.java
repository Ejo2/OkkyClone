package kr.or.bit.user.dto;

public class StudyCriteria {

    private Long totalPost; //게시글 총 갯수
    private int postPerPage; //한페이지내 최대 글 수(default:5)
    private int totalPage;// 페이지 총 갯수
    private int currentPage;//현재 페이지(default:1)
    private int pagePerBlock;//한번에 보여줄 페이지수(default:3)
    private int currentBlock;//현재 페이지 영역의 위치
    private int totalBlock; //페이지 영역의 총 갯수

    public StudyCriteria(){
        this.postPerPage=5;
        this.pagePerBlock=3;
        this.currentBlock=1;
    }

    public Long getTotalPost() {
        return totalPost;
    }

    public void setTotalPost(Long totalPost) {
        this.totalPost = totalPost;
    }

    public int getPostPerPage() {
        return postPerPage;
    }

    public void setPostPerPage(int postPerPage) {
        this.postPerPage = postPerPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPagePerBlock() {
        return pagePerBlock;
    }

    public void setPagePerBlock(int pagePerBlock) {
        this.pagePerBlock = pagePerBlock;
    }

    public int getCurrentBlock() {
        return currentBlock;
    }

    public void setCurrentBlock(int currentBlock) {
        this.currentBlock = currentBlock;
    }

    public int getTotalBlock() {
        return totalBlock;
    }

    public void setTotalBlock(int totalBlock) {
        this.totalBlock = totalBlock;
    }

}
