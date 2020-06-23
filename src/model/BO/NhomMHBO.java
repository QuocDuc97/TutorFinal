package model.BO;

import java.util.ArrayList;

import model.Bean.NhomMH;
import model.DAO.NhomMHDAO;

public class NhomMHBO {
	NhomMHDAO nMH = new NhomMHDAO();

	public String sinhMaNhomMH() {
		return nMH.sinhMaNhomMH();
	}

	public NhomMH nhomMh() {
		return nMH.nhomMH();
	}

	public void insertNhomMH(NhomMH giaSu) {
		nMH.insertNhomMH(giaSu);
		;
	}

	public ArrayList<NhomMH> listNhomMH() {
		return nMH.listNhomMH();
	}

	public NhomMH findNhomMH(String code) {
		return nMH.findNhomMH(code);
	}

	public void deleteNhomMH(String code) {
		nMH.deleteNhomMH(code);
		;
	}

	public void updateNhomMH(NhomMH gs, String id) {
		nMH.updateNhomMH(gs, id);
	}

}
