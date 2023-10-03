package kb04.ditto.jgig.entity;

import java.util.Date;

public class CardDto {

	private int cd_no, pay_date;
	private String cd_num, cd_pw, pay_account, cd_item, cd_name, cd_ssn, cd_phone, cd_status, pay_bank, mem_id;
	private Date end_date, start_date;

	public CardDto() {
		// TODO Auto-generated constructor stub
	}

	public CardDto(int cd_no, int pay_date, String cd_num, String cd_pw, String pay_account, String cd_item,
			String cd_name, String cd_ssn, String cd_phone, String cd_status, String pay_bank, String mem_id,
			Date end_date, Date start_date) {
		super();
		this.cd_no = cd_no;
		this.pay_date = pay_date;
		this.cd_num = cd_num;
		this.cd_pw = cd_pw;
		this.pay_account = pay_account;
		this.cd_item = cd_item;
		this.cd_name = cd_name;
		this.cd_ssn = cd_ssn;
		this.cd_phone = cd_phone;
		this.cd_status = cd_status;
		this.pay_bank = pay_bank;
		this.mem_id = mem_id;
		this.end_date = end_date;
		this.start_date = start_date;
	}

	public int getCd_no() {
		return cd_no;
	}

	public void setCd_no(int cd_no) {
		this.cd_no = cd_no;
	}

	public int getPay_date() {
		return pay_date;
	}

	public void setPay_date(int pay_date) {
		this.pay_date = pay_date;
	}

	public String getCd_num() {
		return cd_num;
	}

	public void setCd_num(String cd_num) {
		this.cd_num = cd_num;
	}

	public String getCd_pw() {
		return cd_pw;
	}

	public void setCd_pw(String cd_pw) {
		this.cd_pw = cd_pw;
	}

	public String getPay_account() {
		return pay_account;
	}

	public void setPay_account(String pay_account) {
		this.pay_account = pay_account;
	}

	public String getCd_item() {
		return cd_item;
	}

	public void setCd_item(String cd_item) {
		this.cd_item = cd_item;
	}

	public String getCd_name() {
		return cd_name;
	}

	public void setCd_name(String cd_name) {
		this.cd_name = cd_name;
	}

	public String getCd_ssn() {
		return cd_ssn;
	}

	public void setCd_ssn(String cd_ssn) {
		this.cd_ssn = cd_ssn;
	}

	public String getCd_phone() {
		return cd_phone;
	}

	public void setCd_phone(String cd_phone) {
		this.cd_phone = cd_phone;
	}

	public String getCd_status() {
		return cd_status;
	}

	public void setCd_status(String cd_status) {
		this.cd_status = cd_status;
	}

	public String getPay_bank() {
		return pay_bank;
	}

	public void setPay_bank(String pay_bank) {
		this.pay_bank = pay_bank;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	@Override
	public String toString() {
		return "cd_no=" + cd_no + ", pay_date=" + pay_date + ", cd_num=" + cd_num + ", cd_pw=" + cd_pw
				+ ", pay_account=" + pay_account + ", cd_item=" + cd_item + ", cd_name=" + cd_name + ", cd_ssn="
				+ cd_ssn + ", cd_phone=" + cd_phone + ", cd_status=" + cd_status + ", pay_bank=" + pay_bank
				+ ", mem_id=" + mem_id + ", end_date=" + end_date + ", start_date=" + start_date;
	}

}
