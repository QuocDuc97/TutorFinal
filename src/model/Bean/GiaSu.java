package model.Bean;

public class GiaSu {

	private String idGS;
	private String hotenGS;
	private String gioiTinhGS;
	private String emailGS;
	private String imageGS;
	private String soDienThoaiGS;
	private String diaChiGS;
	private String ngheNghiepGS;
	private String price;
	private String moTa;

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public GiaSu() {
	}

	public GiaSu(String idGS, String hotenGS, String gioiTinhGS, String emailGS, String imageGS, String soDienThoaiGS,
			String diaChiGS, String ngheNghiepGS, String price, String moTa) {
		super();
		this.idGS = idGS;
		this.hotenGS = hotenGS;
		this.gioiTinhGS = gioiTinhGS;
		this.emailGS = emailGS;
		this.imageGS = imageGS;
		this.soDienThoaiGS = soDienThoaiGS;
		this.diaChiGS = diaChiGS;
		this.ngheNghiepGS = ngheNghiepGS;
		this.price = price;
		this.moTa = moTa;

	}

	public String getIdGS() {
		return idGS;
	}

	public void setIdGS(String idGS) {
		this.idGS = idGS;
	}

	public String getHotenGS() {
		return hotenGS;
	}

	public void setHotenGS(String hotenGS) {
		this.hotenGS = hotenGS;
	}

	public String getGioiTinhGS() {
		return gioiTinhGS;
	}

	public void setGioiTinhGS(String gioiTinhGS) {
		this.gioiTinhGS = gioiTinhGS;
	}

	public String getEmailGS() {
		return emailGS;
	}

	public void setEmailGS(String emailGS) {
		this.emailGS = emailGS;
	}

	public String getImageGS() {
		return imageGS;
	}

	public void setImageGS(String imageGS) {
		this.imageGS = imageGS;
	}

	public String getSoDienThoaiGS() {
		return soDienThoaiGS;
	}

	public void setSoDienThoaiGS(String soDienThoaiGS) {
		this.soDienThoaiGS = soDienThoaiGS;
	}

	public String getDiaChiGS() {
		return diaChiGS;
	}

	public void setDiaChiGS(String diaChiGS) {
		this.diaChiGS = diaChiGS;
	}

	public String getNgheNghiepGS() {
		return ngheNghiepGS;
	}

	public void setNgheNghiepGS(String ngheNghiepGS) {
		this.ngheNghiepGS = ngheNghiepGS;
	}

	@Override
	public String toString() {
		return "GiaSu [idGS=" + idGS + ", hotenGS=" + hotenGS + ", gioiTinhGS=" + gioiTinhGS + ", emailGS=" + emailGS
				+ ", imageGS=" + imageGS + ", soDienThoaiGS=" + soDienThoaiGS + ", diaChiGS=" + diaChiGS
				+ ", ngheNghiepGS=" + ngheNghiepGS + ", price=" + price + ", moTa=" + moTa + "]";
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

}
