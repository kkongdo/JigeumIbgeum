package kb04.ditto.jgig.entity;

public class CommentDto {
	int cmt_id, brd_id, cmt_declaration, cmt_suggestion;
	String cmt_regdate, cmt_content, mem_id;

	public CommentDto() {
	}

	public CommentDto(int cmt_id, int brd_id, int cmt_declaration, int cmt_suggestion, String cmt_regdate,
			String cmt_content, String mem_id) {
		super();
		this.cmt_id = cmt_id;
		this.brd_id = brd_id;
		this.cmt_declaration = cmt_declaration;
		this.cmt_suggestion = cmt_suggestion;
		this.cmt_regdate = cmt_regdate;
		this.cmt_content = cmt_content;
		this.mem_id = mem_id;
	}

	public int getCmt_id() {
		return cmt_id;
	}

	public void setCmt_id(int cmt_id) {
		this.cmt_id = cmt_id;
	}

	public int getBrd_id() {
		return brd_id;
	}

	public void setBrd_id(int brd_id) {
		this.brd_id = brd_id;
	}

	public int getCmt_declaration() {
		return cmt_declaration;
	}

	public void setCmt_declaration(int cmt_declaration) {
		this.cmt_declaration = cmt_declaration;
	}

	public int getCmt_suggestion() {
		return cmt_suggestion;
	}

	public void setCmt_suggestion(int cmt_suggestion) {
		this.cmt_suggestion = cmt_suggestion;
	}

	public String getCmt_regdate() {
		return cmt_regdate;
	}

	public void setCmt_regdate(String cmt_regdate) {
		this.cmt_regdate = cmt_regdate;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "cmt_id=" + cmt_id + ", brd_id=" + brd_id + ", cmt_declaration=" + cmt_declaration
				+ ", cmt_suggestion=" + cmt_suggestion + ", cmt_regdate=" + cmt_regdate + ", cmt_content=" + cmt_content
				+ ", mem_id=" + mem_id;
	}
	
	
}
