package kb04.ditto.jgig.entity;

import java.util.Date;

public class PopularWordDto {
	private String pw_word;
	private Date pw_date;
	private int pw_age;
	private String mem_id;

	public PopularWordDto() {
	}

	public PopularWordDto(String pw_word, Date pw_date, int pw_age, String mem_id) {
		super();
		this.pw_word = pw_word;
		this.pw_date = pw_date;
		this.pw_age = pw_age;
		this.mem_id = mem_id;
	}

	public String getPw_word() {
		return pw_word;
	}

	public void setPw_word(String pw_word) {
		this.pw_word = pw_word;
	}

	public Date getPw_date() {
		return pw_date;
	}

	public void setPw_date(Date pw_date) {
		this.pw_date = pw_date;
	}

	public int getPw_age() {
		return pw_age;
	}

	public void setPw_age(int pw_age) {
		this.pw_age = pw_age;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "PopularWordDto [pw_word=" + pw_word + ", pw_date=" + pw_date + ", pw_age=" + pw_age + ", mem_id="
				+ mem_id + "]";
	}

}
