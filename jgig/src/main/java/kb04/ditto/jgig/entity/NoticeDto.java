package kb04.ditto.jgig.entity;

public class NoticeDto {
	private int ntc_id, ntc_view;
	private String title, ntc_content, mem_id, ntc_date_created;
	
	

	public NoticeDto() {
	}

	public NoticeDto(int ntc_id, int ntc_view, String title, String ntc_content, String mem_id,
			String ntc_date_created) {
		super();
		this.ntc_id = ntc_id;
		this.ntc_view = ntc_view;
		this.title = title;
		this.ntc_content = ntc_content;
		this.mem_id = mem_id;
		this.ntc_date_created = ntc_date_created;
	}

	public int getNtc_id() {
		return ntc_id;
	}

	public void setNtc_id(int ntc_id) {
		this.ntc_id = ntc_id;
	}

	public int getNtc_view() {
		return ntc_view;
	}

	public void setNtc_view(int ntc_view) {
		this.ntc_view = ntc_view;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNtc_content() {
		return ntc_content;
	}

	public void setNtc_content(String ntc_content) {
		this.ntc_content = ntc_content;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getNtc_date_created() {
		return ntc_date_created;
	}

	public void setNtc_date_created(String ntc_date_created) {
		this.ntc_date_created = ntc_date_created;
	}

	@Override
	public String toString() {
		return "ntc_id=" + ntc_id + ", ntc_view=" + ntc_view + ", title=" + title + ", ntc_content=" + ntc_content
				+ ", mem_id=" + mem_id + ", ntc_date_created=" + ntc_date_created;
	}
}
