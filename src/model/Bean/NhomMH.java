package model.Bean;

public class NhomMH {
	private String idN;
	private String tenN;

	public NhomMH(String idN, String tenN) {
		super();
		this.idN = idN;
		this.tenN = tenN;
	}

	public String getIdN() {
		return idN;
	}

	public void setIdN(String idN) {
		this.idN = idN;
	}

	public String getTenN() {
		return tenN;
	}

	public void setTenN(String tenN) {
		this.tenN = tenN;
	}

	@Override
	public String toString() {
		return "NhomMH [idN=" + idN + ", tenN=" + tenN + "]";
	}
	

}
