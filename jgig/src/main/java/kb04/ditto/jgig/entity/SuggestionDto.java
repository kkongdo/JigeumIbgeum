package kb04.ditto.jgig.entity;

public class SuggestionDto {
	int brd_id;
	String mem_id;
	
	public SuggestionDto() {
	}

	public SuggestionDto(int brd_id, String mem_id) {
		super();
		this.mem_id = mem_id;
		this.brd_id = brd_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getBrd_id() {
		return brd_id;
	}

	public void setBrd_id(int brd_id) {
		this.brd_id = brd_id;
	}

	@Override
	public String toString() {
		return "mem_id=" + mem_id + ", brd_id=" + brd_id;
	}
}
