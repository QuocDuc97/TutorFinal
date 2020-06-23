package model.BO;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import model.Bean.TinNhan;
import model.DAO.TinNhanDAO;

public class TinNhanBO {
	TinNhanDAO tnDao = new TinNhanDAO();

	public void insertMessenger(String idGui, String idNhan, LocalTime time, LocalDate date, String noiDung, String i) {
		tnDao.insertMessenger(idGui, idNhan, time, date, noiDung, i);

	}

	public ArrayList<TinNhan> getListMessenger(String id) {
		return tnDao.getListMessenger(id);
	}

}
