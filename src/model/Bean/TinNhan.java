package model.Bean;

public class TinNhan {
	private String idGui;
	private String idNhan;
	private String ngayGui;
	private String thoiGianGui;
	private String noiDung;
	private String trangThai;

	public String getIdGui() {
		return idGui;
	}

	public void setIdGui(String idGui) {
		this.idGui = idGui;
	}

	public String getIdNhan() {
		return idNhan;
	}

	public void setIdNhan(String idNhan) {
		this.idNhan = idNhan;
	}

	public String getNgayGui() {
		return ngayGui;
	}

	public void setNgayGui(String string) {
		this.ngayGui = string;
	}

	public String getThoiGianGui() {
		return thoiGianGui;
	}

	public void setThoiGianGui(String thoiGianGui) {
		this.thoiGianGui = thoiGianGui;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String string) {
		this.trangThai = string;
	}

	public TinNhan(String idGui, String idNhan, String ngayGui, String thoiGianGui, String noiDung, String trangThai) {
		super();
		this.idGui = idGui;
		this.idNhan = idNhan;
		this.ngayGui = ngayGui;
		this.thoiGianGui = thoiGianGui;
		this.noiDung = noiDung;
		this.trangThai = trangThai;
	}

	public TinNhan() {

	}

	@Override
	public String toString() {
		return "TinNhan [idGui=" + idGui + ", idNhan=" + idNhan + ", ngayGui=" + ngayGui + ", thoiGianGui="
				+ thoiGianGui + ", noiDung=" + noiDung + ", trangThai=" + trangThai + "]";
	}

}
