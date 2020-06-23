package model.Bean;

public class KhachHang {

	private String idKH;
	private String hoTen;
	private String email;
	private String gioiTinh;
	private String soDienThoai;
	private String diaChi;

	public KhachHang() {
	}

	public KhachHang(String idKH, String hoTen, String email, String gioiTinh, String soDienThoai, String diaChi) {
		super();
		this.idKH = idKH;
		this.hoTen = hoTen;
		this.email = email;
		this.gioiTinh = gioiTinh;
		this.soDienThoai = soDienThoai;
		this.diaChi = diaChi;
	}

	public String getIdKH() {
		return idKH;
	}

	public void setIdKH(String idKH) {
		this.idKH = idKH;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	@Override
	public String toString() {
		return "KhachHang [idKH=" + idKH + ", hoTen=" + hoTen + ", email=" + email + ", gioiTinh=" + gioiTinh
				+ ", soDienThoai=" + soDienThoai + ", diaChi=" + diaChi + "]";
	}
	

}
