package kb04.ditto.jgig.entity;


public class MemberDto {

	private String mem_id;
	private String mem_pw;
	private String mem_nm;
	private String nickname;
	private String phone_num;
	private String ssn;
	private String mem_stat;
	private int score;
	private int authority;

	public MemberDto() {
		// TODO Auto-generated constructor stub
	}

	public MemberDto(String mem_id, String mem_pw, String mem_nm, String nickname, String phone_num, String ssn,
			String mem_stat, int score, int authority) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_nm = mem_nm;
		this.nickname = nickname;
		this.phone_num = phone_num;
		this.ssn = ssn;
		this.mem_stat = mem_stat;
		this.score = score;
		this.authority = authority;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_nm() {
		return mem_nm;
	}

	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}



	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getMem_stat() {
		return mem_stat;
	}

	public void setMem_stat(String mem_stat) {
		this.mem_stat = mem_stat;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}
	@Override
	public String toString() {
		return "MemberDto [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_nm=" + mem_nm + ", nickname=" + nickname
				+ ", phone_num=" + phone_num + ", ssn=" + ssn + ", mem_stat=" + mem_stat + ", score=" + score
				+ ", authority=" + authority + "]";
	}
}