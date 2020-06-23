package model.BO;

import java.util.ArrayList;

import model.Bean.KhachHang;
import model.DAO.KhachHangDAO;

public class KhachHangBO {
	KhachHangDAO kh = new KhachHangDAO();

	public String sinhMaKH() {
		return kh.sinhMaKH();
	}

	public KhachHang khachHang() {
		return kh.khachHang();
	}

	public void insertCustomer(KhachHang khachHang) {
		kh.insertCustomer(khachHang);
	}

	public ArrayList<KhachHang> listCustomer() {
		return kh.listCustomer();
	}

	public KhachHang findCustomer(String code) {
		return kh.findCustomer(code);
	}

	public void updateCustomer(KhachHang customer, String id) {
		kh.updateCustomer(customer, id);
	}

	public void deleteCustomer(String code) {
		kh.deleteCustomer(code);
	}
}
