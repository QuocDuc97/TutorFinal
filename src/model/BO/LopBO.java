package model.BO;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;

import model.Bean.Lop;
import model.DAO.LopDAO;

public class LopBO {
	LopDAO lopDAO = new LopDAO();

	public void insertClass(Lop clop) {
		lopDAO.insertClass(clop);

	}

	public String sinhMaLop() {
		return lopDAO.sinhMaLop();
	}

	public Lop getclass() {
		return lopDAO.getclass();
	}

	public ArrayList<Lop> getListClassNotReceive(int start, int total) {
		return lopDAO.getListClassNotReceive(start, total);
	}

	public ArrayList<Lop> getListClassNotReceiveAndApproved(int start, int total) {
		return lopDAO.getListClassNotReceiveAndApproved(start, total);
	}

	public ArrayList<Lop> getAllListClass(int start, int total) {
		return lopDAO.getAllListClass(start, total);
	}

	public ArrayList<Lop> getListClassReceive(int start, int total) {
		return lopDAO.getListClassReceive(start, total);
	}

	public Lop findClass(String code) {
		return lopDAO.findClass(code);
	}

	public void updateClass(String idLop, String idMon, String idCapDo, String tenLop, String mota, String status,
			String diaChi, String hocPhi, String yeuCau) {
		lopDAO.updateClass(idLop, idMon, idCapDo, tenLop, mota, status, diaChi, hocPhi, yeuCau);
	}

	public void deleteClass(String code) {
		lopDAO.deleteClass(code);
	}

	public void insertClassDiary(String idLop, String idUser, LocalDate localDate) {
		lopDAO.insertClassDiary(idLop, idUser, localDate);
	}

	public ArrayList<Lop> getListClassAddbyCustomer(String id, int start, int total) {
		return lopDAO.getListClassAddbyCustomer(id, start, total);
	}

	public int getNoOfRecords() {
		return lopDAO.getNoOfRecords();
	}

	public int getNoOfRecordsNotReceive() {
		return lopDAO.getNoOfRecordsNotReceive();
	}

	public int getNoOfRecordsNotReceiveAndApproved() {
		return lopDAO.getNoOfRecordsNotReceiveAndApproved();
	}

	public int getNoOfRecordsListClassReceive() {
		return lopDAO.getNoOfRecordsListClassReceive();
	}

	public int getNoOfRecordsByCustomer(String id) {
		return lopDAO.getNoOfRecordsByCustomer(id);
	}

	public void applyClass(String idClass, String idGs, LocalTime time, LocalDate date) {
		lopDAO.applyClass(idClass, idGs, time, date);
	}

	public String getIDKH(String idLop) {
		return lopDAO.getIDKH(idLop);
	}

	public ArrayList<Lop> getListClassByIDTutor(String idTutor, int start, int total) {
		return lopDAO.getListClassByIDTutor(idTutor, start, total);
	}

	public int getNoOfRecordsListClassByTutor(String id) {
		return lopDAO.getNoOfRecordsListClassByTutor(id);
	}

	public ArrayList<Lop> getListClassByIDCustomer(String idCustomer, int start, int total) {
		return lopDAO.getListClassByIDCustomer(idCustomer, start, total);
	}

	public int getNoOfRecordsListClassByCustomer(String id) {
		return lopDAO.getNoOfRecordsListClassByCustomer(id);
	}

	public void insertClassSeggest(String idLop, String idKH, String idGS, LocalDate date, LocalTime time) {
		lopDAO.insertClassSeggest(idLop, idKH, idGS, date, time);
	}

	public void updateClass(String idLop, String status) {
		lopDAO.updateClass(idLop, status);
	}
}
