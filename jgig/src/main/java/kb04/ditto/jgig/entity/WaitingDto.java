package kb04.ditto.jgig.entity;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class WaitingDto {
	private int wt_seq;
	private int wt_no;
	private int wt_list;
	private Date wt_date;
	private String wt_store;
	private String mem_id;
	private List<Map<String, String>> wt_table;

	public WaitingDto() {
	}

	public WaitingDto(int wt_seq, int wt_no, int wt_list, Date wt_date, String wt_store, String mem_id,
			List<Map<String, String>> wt_table) {
		super();
		this.wt_seq = wt_seq;
		this.wt_no = wt_no;
		this.wt_list = wt_list;
		this.wt_date = wt_date;
		this.wt_store = wt_store;
		this.mem_id = mem_id;
		this.wt_table = wt_table;
	}

	public int getWt_seq() {
		return wt_seq;
	}

	public void setWt_seq(int wt_seq) {
		this.wt_seq = wt_seq;
	}

	public int getWt_no() {
		return wt_no;
	}

	public void setWt_no(int wt_no) {
		this.wt_no = wt_no;
	}

	public int getWt_list() {
		return wt_list;
	}

	public void setWt_list(int wt_list) {
		this.wt_list = wt_list;
	}

	public Date getWt_date() {
		return wt_date;
	}

	public void setWt_date(Date wt_date) {
		this.wt_date = wt_date;
	}

	public String getWt_store() {
		return wt_store;
	}

	public void setWt_store(String wt_store) {
		this.wt_store = wt_store;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public List<Map<String, String>> getWt_table() {
		return wt_table;
	}

	public void setWt_table(List<Map<String, String>> wt_table) {
		this.wt_table = wt_table;
	}

	@Override
	public String toString() {
		return "WaitingDto [wt_seq=" + wt_seq + ", wt_no=" + wt_no + ", wt_list=" + wt_list + ", wt_date=" + wt_date
				+ ", wt_store=" + wt_store + ", mem_id=" + mem_id + ", wt_table=" + wt_table + "]";
	}

}
