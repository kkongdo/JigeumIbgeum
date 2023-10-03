package kb04.ditto.jgig.entity;

import java.util.Date;

public class PointDto {
	private int point;
	private Date point_date;
	private String division;
	private String mem_id;

	public PointDto() {
		// TODO Auto-generated constructor stub
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getPoint_date() {
		return point_date;
	}

	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "PointDto [point=" + point + ", point_date=" + point_date + ", division=" + division + ", mem_id="
				+ mem_id + "]";
	}

}
