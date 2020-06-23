package model.BO;

import java.util.ArrayList;

import model.Bean.Level;
import model.DAO.LevelDAO;

public class LevelBO {
	
	LevelDAO lvDao= new LevelDAO();
	
	public void insertLevel(Level khachHang) {
		lvDao.insertLevel(khachHang);
	}

	public String sinhMaLevel() {
		return lvDao.sinhMaLevel();
	}

	public Level level() {
		return lvDao.lv;
	}

	public ArrayList<Level> listLevel() {
		return lvDao.listLevel();
	}

	public Level findLevel(String code) {
		return lvDao.findLevel(code);
	}

	public void updateLevel(Level gs, String id) {
		lvDao.updateLevel(gs, id);

	}

	public void deleteLevel(String code) {
		lvDao.deleteLevel(code);
	}


}
