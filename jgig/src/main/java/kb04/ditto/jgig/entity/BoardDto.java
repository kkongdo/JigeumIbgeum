package kb04.ditto.jgig.entity;

public class BoardDto {
	private int brd_id, brd_view, brd_declaration, brd_suggestion;
	private String brd_category, title, brd_content, mem_id, brd_date_created;

	public BoardDto() {
	}

	public BoardDto(int brd_id, int brd_view, int brd_declaration, int brd_suggestion, String brd_category,
			String title, String brd_content, String mem_id, String brd_date_created) {
		super();
		this.brd_id = brd_id;
		this.brd_view = brd_view;
		this.brd_declaration = brd_declaration;
		this.brd_suggestion = brd_suggestion;
		this.brd_category = brd_category;
		this.title = title;
		this.brd_content = brd_content;
		this.mem_id = mem_id;
		this.brd_date_created = brd_date_created;
	}

	public int getBrd_id() {
		return brd_id;
	}

	public void setBrd_id(int brd_id) {
		this.brd_id = brd_id;
	}

	public int getBrd_view() {
		return brd_view;
	}

	public void setBrd_view(int brd_view) {
		this.brd_view = brd_view;
	}

	public int getBrd_declaration() {
		return brd_declaration;
	}

	public void setBrd_declaration(int brd_declaration) {
		this.brd_declaration = brd_declaration;
	}

	public int getBrd_suggestion() {
		return brd_suggestion;
	}

	public void setBrd_suggestion(int brd_suggestion) {
		this.brd_suggestion = brd_suggestion;
	}

	public String getBrd_category() {
		return brd_category;
	}

	public void setBrd_category(String brd_category) {
		this.brd_category = brd_category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBrd_content() {
		return brd_content;
	}

	public void setBrd_content(String brd_content) {
		this.brd_content = brd_content;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getBrd_date_created() {
		return brd_date_created;
	}

	public void setBrd_date_created(String brd_date_created) {
		this.brd_date_created = brd_date_created;
	}

	@Override
	public String toString() {
		return "brd_id=" + brd_id + ", brd_view=" + brd_view + ", brd_declaration=" + brd_declaration
				+ ", brd_suggestion=" + brd_suggestion + ", brd_category=" + brd_category + ", title=" + title
				+ ", brd_content=" + brd_content + ", mem_id=" + mem_id + ", brd_date_created=" + brd_date_created;
	}

}
