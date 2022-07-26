package sh.hoon.model;

public class PageMaker {

	private Criteria criteria;
	private int startPage;
	private int endPage;
	private int totalCount;
	private boolean prev;
	private boolean next;
	private boolean first;
	private boolean end;
	private int tempEndPage;
	private int displayPageNum = 10;

	public PageMaker(Criteria criteria, int totalCount) {
		this.criteria = criteria;

		endPage = (int) (Math.ceil(criteria.getPage() / (double) displayPageNum) * displayPageNum);

		startPage = endPage - displayPageNum + 1;
		if (startPage <= 0)
			startPage = 1;

		tempEndPage = (int) Math.ceil(totalCount / (double) criteria.getPerPageNum());
		if (endPage > tempEndPage)
			endPage = tempEndPage;

		prev = startPage != 1;
		next = endPage < tempEndPage;

		first = prev != false;
		end = next != false;
	}

	public PageMaker() {
	}

	public PageMaker(Criteria criteria, int startPage, int endPage, int totalCount, boolean prev, boolean next,
			boolean first, boolean end, int tempEndPage, int displayPageNum) {
		super();
		this.criteria = criteria;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalCount = totalCount;
		this.prev = prev;
		this.next = next;
		this.first = first;
		this.end = end;
		this.tempEndPage = tempEndPage;
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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

	public boolean isFirst() {
		return first;
	}

	public void setFirst(boolean first) {
		this.first = first;
	}

	public boolean isEnd() {
		return end;
	}

	public void setEnd(boolean end) {
		this.end = end;
	}

	public int getTempEndPage() {
		return tempEndPage;
	}

	public void setTempEndPage(int tempEndPage) {
		this.tempEndPage = tempEndPage;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

}
