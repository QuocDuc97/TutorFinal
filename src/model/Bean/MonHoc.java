package model.Bean;

public class MonHoc {
	private String idMH;
	private String tenMH;
	private NhomMH nhomMH;

	public MonHoc() {

	}

	public MonHoc(String idMH, String tenMH, NhomMH nhomMH) {
		super();
		this.idMH = idMH;
		this.tenMH = tenMH;
		this.nhomMH = nhomMH;
	}

	public String getIdMH() {
		return idMH;
	}

	public void setIdMH(String idMH) {
		this.idMH = idMH;
	}

	public String getTenMH() {
		return tenMH;
	}

	public void setTenMH(String tenMH) {
		this.tenMH = tenMH;
	}

	public NhomMH getNhomMH() {
		return nhomMH;
	}

	public void setNhomMH(NhomMH nhomMH) {
		this.nhomMH = nhomMH;
	}

	@Override
	public String toString() {
		return "MonHoc [idMH=" + idMH + ", tenMH=" + tenMH + ", nhomMH=" + nhomMH + "]";
	}
	

}
