package kb04.ditto.jgig.entity;


public class Criteria {
	
	private int pageNum=1; //현재 페이지 번호
	private int amount=10; //한 페이지당 데이터 개수
	
	private int displayPage=5; //페이징 바 개수
	
	private int beginPage; //바 시작 페이지
	private int endPage; //바 끝 페이지
	private int totalPage; //총 페이지
	boolean prev, next; //이전, 다음
	
	
	private String keyword; // 검색하는 문자열
	private String searchTag; //검색 카테고리
	
	// 변수 값을 세팅하는 방법 - 초기화 블럭 : {~~}, 생성자: 클래스명(){~~}, setter()
	//생성자를 이용한 기본 값 세팅
	public Criteria() {
		this.pageNum=1;
	}
	public Criteria(int pageNum, int totalCount) {
		this.pageNum=pageNum;
		endPage=(((pageNum+(displayPage-1))/displayPage)*displayPage);
		beginPage= endPage - (displayPage-1);
		totalPage = (int) Math.ceil((double)totalCount/10);
		
		
		if(beginPage==1)
			prev = false;
		else
			prev = true;

		if(totalPage<endPage){
			endPage = totalPage;
			next = false;
		}else{
			next = true;
		}
	}
	
	public Criteria(int pageNum, String searchTag, String keyword, int totalCount) {
		this.pageNum=pageNum;
		this.searchTag=searchTag;
		this.keyword=keyword;
		endPage=(((pageNum+(displayPage-1))/displayPage)*displayPage);
		beginPage= endPage - (displayPage-1);
		totalPage = (int) Math.ceil((double)totalCount/10);
		
		if(beginPage==1)
			prev = false;
		else
			prev = true;

		if(totalPage<endPage){
			endPage = totalPage;
			next = false;
		}else{
			next = true;
		}
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchTag() {
		return searchTag;
	}
	public void setSearchTag(String selectTag) {
		this.searchTag = selectTag;
	}
	@Override
	public String toString() {
		return "pageNum=" + pageNum + ", amount=" + amount + ", displayPage=" + displayPage + ", beginPage="
				+ beginPage + ", endPage=" + endPage + ", totalPage=" + totalPage + ", prev=" + prev + ", next=" + next
				+ ", keyword=" + keyword + ", searchTag=" + searchTag;
	}
}
