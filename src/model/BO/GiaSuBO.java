package model.BO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Bean.GiaSu;
import model.DAO.DatabaseConnect;
import model.DAO.GiaSuDAO;

public class GiaSuBO {
	GiaSuDAO gs1 = new GiaSuDAO();

	public String sinhMaGS() {
		return gs1.sinhMaGS();
	}

	public GiaSu giaSu() {
		return gs1.giaSu();
	}

	public void insertTutor(GiaSu giaSu) {
		gs1.insertTutor(giaSu);
		;
	}

	public ArrayList<GiaSu> listTutor(int start, int total) {
		return gs1.listTutor(start, total);
	}

	public GiaSu findTutor(String code) {
		return gs1.findTutor(code);
	}

	public void deleteTutor(String code) {
		gs1.deleteTutor(code);
	}

	public void updateTutor(GiaSu gs) {
		gs1.updateTutor(gs);
	}

	public ArrayList<GiaSu> searchByGender(String code) {
		return gs1.searchByGender(code);
	}

	public ArrayList<GiaSu> searchBySubject(String code) {
		return gs1.searchBySubject(code);
	}

	public int getNoOfRecordsTutor() {
		return gs1.getNoOfRecordsTutor();

	}

}
