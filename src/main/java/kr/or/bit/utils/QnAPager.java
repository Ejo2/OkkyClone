package kr.or.bit.utils;

public class QnAPager {
    private int pageSize;//한 페이지당 데이터 개수
    private int pagerSize;//번호로 보여주는 페이지 Link 개수
    private int dataCount;//총 데이터 수
    private int currentPage;//현재 페이지 번호
    private int pageCount;//총 페이지 수

    private String linkUrl;//페이저가 포함되는 페이지의 주소

    public QnAPager(int dataCount, int currentPage,
                    int pageSize, int pagerSize, String linkUrl) {

        this.linkUrl = linkUrl;

        this.dataCount = dataCount;
        this.pageSize = pageSize;
        this.pagerSize = pagerSize;
        this.currentPage = currentPage;
        pageCount =
                (dataCount / pageSize) + ((dataCount % pageSize) > 0 ? 1 : 0);
    }

    public String toString(){
        StringBuffer linkString = new StringBuffer(); //문자열을 이어 붙일수 있는 객체

        //1. 처음, 이전 항목 만들기
        if (currentPage == 1) {
            linkString.append(String.format("<li class='page-item disabled'>"));
        } else {
            linkString.append(String.format("<li class='page-item'>"));
        }
        linkString.append(String.format("<a class='page-link' href='%s?cp=1' aria-label='Previous'>",linkUrl));
        linkString.append(String.format("<span aria-hidden='true'>&laquo;</span>"));
        linkString.append(String.format("</a>"));
        linkString.append(String.format("</li>"));

        linkString.append("&nbsp;");
        linkString.append("&nbsp;");


        //2. 페이지 번호 Link 만들기
        int pagerBlock = (currentPage - 1) / pagerSize;  //(1-1/3) = 0  (4-1)/3 = 0
        int start = (pagerBlock * pagerSize) + 1;  //(0*3) = 0 +1 = 1
        int end = start + pagerSize;  //1+3 =4
        for (int i = start; i < end; i++) {
            if (i > pageCount) break; //i가 총 페이지수 보다 크면 멈추기(i가 3보다 크다면 멈추기)
            linkString.append("&nbsp;");
            if(i == currentPage) {
                linkString.append(String.format("<li class='page-item active'><a class='page-link' href='%s?cp=%d'>%d</a></li>",linkUrl, i  , i));
            } else {
                linkString.append(String.format(
                        "<li class='page-item'><a class='page-link' href='%s?cp=%d'>%d</a></li>",linkUrl, i  , i));

            }
            linkString.append("&nbsp;");
        }

        //3. 다음, 마지막 항목 만들기
            linkString.append("&nbsp;");
            linkString.append("&nbsp;");
            if (currentPage == pageCount) {
                linkString.append(String.format("<li class='page-item disabled'>"));
            } else {
                linkString.append(String.format("<li class='page-item'>"));
            }
            linkString.append(String.format("<a class='page-link' href='%s?cp=%d' aria-label='Next'>",linkUrl, pageCount));
            linkString.append(String.format("<span aria-hidden='true'>&raquo;</span>"));
            linkString.append(String.format("</a>"));
            linkString.append(String.format("</li>"));
//            linkString.append(String.format(
//                    "[<a href='%s?cp=%d'>마지막</a>]", linkUrl, pageCount));


        return linkString.toString();
    }
}