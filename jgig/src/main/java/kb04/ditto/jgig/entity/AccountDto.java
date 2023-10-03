package kb04.ditto.jgig.entity;

import java.util.Date;

public class AccountDto {
	private long account;
	private String act_name;
	private int act_password, balance;
	private Date regdate;
	private String mem_nm, ssn, phone_num, job, pur_trans, sor_fund, mem_id;
	
	public AccountDto() {
		// TODO Auto-generated constructor stub
	}

	public AccountDto(long account, String act_name, int act_password, int balance, Date regdate, String mem_nm,
			String ssn, String phone_num, String job, String pur_trans, String sor_fund, String mem_id) {
		super();
		this.account = account;
		this.act_name = act_name;
		this.act_password = act_password;
		this.balance = balance;
		this.regdate = regdate;
		this.mem_nm = mem_nm;
		this.ssn = ssn;
		this.phone_num = phone_num;
		this.job = job;
		this.pur_trans = pur_trans;
		this.sor_fund = sor_fund;
		this.mem_id = mem_id;
	}

	public long getAccount() {
		return account;
	}

	public void setAccount(long account) {
		this.account = account;
	}

	public String getAct_name() {
		return act_name;
	}

	public void setAct_name(String act_name) {
		this.act_name = act_name;
	}

	public int getAct_password() {
		return act_password;
	}

	public void setAct_password(int act_password) {
		this.act_password = act_password;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getMem_nm() {
		return mem_nm;
	}

	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getPur_trans() {
		return pur_trans;
	}

	public void setPur_trans(String pur_trans) {
		this.pur_trans = pur_trans;
	}

	public String getSor_fund() {
		return sor_fund;
	}

	public void setSor_fund(String sor_fund) {
		this.sor_fund = sor_fund;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "account=" + account + ", act_name=" + act_name + ", act_password=" + act_password
				+ ", balance=" + balance + ", regdate=" + regdate + ", mem_nm=" + mem_nm + ", ssn=" + ssn
				+ ", phone_num=" + phone_num + ", job=" + job + ", pur_trans=" + pur_trans + ", sor_fund=" + sor_fund
				+ ", mem_id=" + mem_id;
	}
}
