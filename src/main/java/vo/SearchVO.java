package vo;

public class SearchVO {
	private String bname, reginum, author, pdate, page, division_detail;
	private int division;

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getReginum() {
		return reginum;
	}

	public void setReginum(String reginum) {
		this.reginum = reginum;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getDivision_detail() {
		return division_detail;
	}

	public void setDivision_detail(String division_detail) {
		this.division_detail = division_detail;
	}

	public int getDivision() {
		return division;
	}

	public void setDivision(int division) {
		this.division = division;
	}

}
