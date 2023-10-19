package woo.edu.c.utill;

public class Pager {	
	private Long num;
	private String kind;
	private String search;
	
	private Long perPage;
	private Long perBlock;
	private Long totalPage;
	private Long page;

	private Long startRow;
	private Long lastRow;
	//private Long totalCount;
	
	private Long startNum;
	private Long lastNum;
	
	private boolean before;
	private boolean after;

	public Long getNum() {
		return num;
	}

	public void setNum(Long num) {
		this.num = num;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}

	public Pager() {
		this.perPage=10L;
	}
	
	public void makeRow() {
		this.startRow = (this.getPage()-1)*this.getPerPage()+1;
		this.lastRow = this.getPage()*this.getPerPage();
	}
	
	//startNum, lastNum
	public void makeNum(Long totalCount) {
		
		this.totalPage = totalCount/this.getPerPage();
		if(totalCount%this.getPerPage() != 0 ) {
			//totalPage=totalPage+1;
			//totalPage+=1;
			totalPage++;		
		}
		if(this.getPage()>totalPage) {
			this.setPage(totalPage);
		}
		
		
		Long totalBlock = totalPage / this.getPerBlock();
		if(totalPage % this.getPerBlock() != 0) {
			totalBlock++;
		}
		// page 1-5 curBlock 1
		// page 6-10 curBlock 2
		// page 11-15 curBlock 3
		 Long curBlock=this.getPage() / this.getPerBlock();
		 
		 if(this.getPage() % this.getPerBlock() != 0) {
			 curBlock++;
		 }
		 
		 /**	curBlock	startNum	lastNum
		  * 	1			1			5
		  * 	2			6			10
		  * 	3			11			15
		  */
		 
		 this.startNum=(curBlock-1)*this.getPerBlock()+1;
		 this.lastNum=curBlock*this.getPerBlock();
		 
		 this.after=true;
		 if(curBlock==totalBlock) {
			 lastNum=totalPage;
			 this.after=false;
		 }
		 
		 if(curBlock==1) {
			 this.before=true;
		 }
		 
	}
	
	
//	public Long getTotalCount() {
//		return totalCount;
//	}
//
//	public void setTotalCount(Long totalCount) {
//		this.totalCount = totalCount;
//	}
	
	
	
	

	public Long getPerPage() {
		if(this.perPage==null || this.perPage==0) {
			this.perPage=10L;
		}
		return perPage;
	}

	public Long getTotalPage() {
		return totalPage;
	}

	public Long getPerBlock() {
		if(this.perBlock == null || this.perBlock<1) {
			this.perBlock=5L;
		}
		
		return perBlock;
	}

	public void setPerBlock(Long perBlock) {
		this.perBlock = perBlock;
	}

	public boolean isBefore() {
		return before;
	}

	public void setBefore(boolean before) {
		this.before = before;
	}

	public boolean isAfter() {
		return after;
	}

	public void setAfter(boolean after) {
		this.after = after;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	public Long getPage() {
		if(this.page == null || this.page<1) {
			this.page=1L;
		}
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
	}
	public Long getStartRow() {
		return startRow;
	}
	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}
	public Long getLastRow() {
		return lastRow;
	}
	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}

	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}	

}