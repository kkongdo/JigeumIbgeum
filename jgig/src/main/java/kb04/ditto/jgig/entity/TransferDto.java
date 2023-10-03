package kb04.ditto.jgig.entity;

import java.util.Date;

public class TransferDto {
	private int trans_seq;
	private String depo_bank;
	private long depo_num;
	private String receive_nm, send_nm;
	private int depo_mon, withdr_mon;
	private Date trans_date;
	private String mem_id;
	private long account;
	
	public TransferDto() {
		// TODO Auto-generated constructor stub
	}

	public TransferDto(int trans_seq, String depo_bank, long depo_num, String receive_nm, String send_nm, int depo_mon,
			int withdr_mon, Date trans_date, String mem_id, long account) {
		super();
		this.trans_seq = trans_seq;
		this.depo_bank = depo_bank;
		this.depo_num = depo_num;
		this.receive_nm = receive_nm;
		this.send_nm = send_nm;
		this.depo_mon = depo_mon;
		this.withdr_mon = withdr_mon;
		this.trans_date = trans_date;
		this.mem_id = mem_id;
		this.account = account;
	}

	public int getTrans_seq() {
		return trans_seq;
	}

	public void setTrans_seq(int trans_seq) {
		this.trans_seq = trans_seq;
	}

	public String getDepo_bank() {
		return depo_bank;
	}

	public void setDepo_bank(String depo_bank) {
		this.depo_bank = depo_bank;
	}

	public long getDepo_num() {
		return depo_num;
	}

	public void setDepo_num(long depo_num) {
		this.depo_num = depo_num;
	}

	public String getReceive_nm() {
		return receive_nm;
	}

	public void setReceive_nm(String receive_nm) {
		this.receive_nm = receive_nm;
	}

	public String getSend_nm() {
		return send_nm;
	}

	public void setSend_nm(String send_nm) {
		this.send_nm = send_nm;
	}

	public int getDepo_mon() {
		return depo_mon;
	}

	public void setDepo_mon(int depo_mon) {
		this.depo_mon = depo_mon;
	}

	public int getWithdr_mon() {
		return withdr_mon;
	}

	public void setWithdr_mon(int withdr_mon) {
		this.withdr_mon = withdr_mon;
	}

	public Date getTrans_date() {
		return trans_date;
	}

	public void setTrans_date(Date trans_date) {
		this.trans_date = trans_date;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public long getAccount() {
		return account;
	}

	public void setAccount(long account) {
		this.account = account;
	}

	@Override
	public String toString() {
		return "trans_seq=" + trans_seq + ", depo_bank=" + depo_bank + ", depo_num=" + depo_num
				+ ", receive_nm=" + receive_nm + ", send_nm=" + send_nm + ", depo_mon=" + depo_mon + ", withdr_mon="
				+ withdr_mon + ", trans_date=" + trans_date + ", mem_id=" + mem_id + ", account=" + account;
	}
}
