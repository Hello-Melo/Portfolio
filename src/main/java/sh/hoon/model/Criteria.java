package sh.hoon.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class Criteria {
	
	private String type;
	private String keyword;
	
	private int page;
	private int perPageNum;
	
	private String category;
	
	public Criteria() {
		this.page= 1;
		this.perPageNum = 20;
	}
	
	public int getPageStart() {
		return (this.page-1)*perPageNum; 
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page =1;
		}else {
			this.page=page;
		}
	}

	public Criteria(int page, int perPageNum) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}
	
	public String[] getTypeCollection() {
		return this.type != null ? type.split("") : new String[] {};
	}
	
	
}

