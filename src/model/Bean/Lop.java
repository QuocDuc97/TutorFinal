package model.Bean;

public class Lop {
	private String idL;
	private String tenL;
	private MonHoc monHoc;
	private Level capDo;
	private String trangThai;
	private String moTa;
	private String diaChi;
	private String hocPhi;
	private String yeuCau;

	public Lop() {
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public Lop(String idL, String tenL, MonHoc monHoc, Level capDo, String trangThai, String moTa, String diaChi,
			String hocPhi, String yeuCau) {
		super();
		this.idL = idL;
		this.tenL = tenL;
		this.monHoc = monHoc;
		this.capDo = capDo;
		this.trangThai = trangThai;
		this.moTa = moTa;
		this.diaChi = diaChi;
		this.hocPhi = hocPhi;
		this.yeuCau = yeuCau;
	}

	public String getIdL() {
		return idL;
	}

	public void setIdL(String idL) {
		this.idL = idL;
	}

	public String getTenL() {
		return tenL;
	}

	public void setTenL(String tenL) {
		this.tenL = tenL;
	}

	public MonHoc getMonHoc() {
		return monHoc;
	}

	public void setMonHoc(MonHoc monHoc) {
		this.monHoc = monHoc;
	}

	public Level getCapDo() {
		return capDo;
	}

	public void setCapDo(Level capDo) {
		this.capDo = capDo;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	@Override
	public String toString() {
		return "Lop [idL=" + idL + ", tenL=" + tenL + ", monHoc=" + monHoc + ", capDo=" + capDo + ", trangThai="
				+ trangThai + ", moTa=" + moTa + ", diaChi=" + diaChi + "]";
	}

	public String getHocPhi() {
		return hocPhi;
	}

	public void setHocPhi(String hocPhi) {
		this.hocPhi = hocPhi;
	}

	public String getYeuCau() {
		return yeuCau;
	}

	public void setYeuCau(String yeuCau) {
		this.yeuCau = yeuCau;
	}

}
