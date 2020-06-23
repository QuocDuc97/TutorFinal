package model.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import model.Bean.Level;
import model.Bean.Lop;
import model.Bean.MonHoc;
import model.Bean.NhomMH;

public class LopDAO {
	public Lop lop;
	MonHocDAO mhDao = new MonHocDAO();
	LevelDAO levelDao = new LevelDAO();

	public void insertClass(Lop lop) {
		String sql = "insert into Lop VALUES(?,?,?,?,?,?,?,?,?)";
		DatabaseConnect.getConnect();
		PreparedStatement pr;
		try {
			pr = DatabaseConnect.conn.prepareStatement(sql);
			pr.setString(1, lop.getIdL());
			pr.setString(2, lop.getMonHoc().getIdMH());
			pr.setString(3, lop.getTenL());
			pr.setString(4, lop.getCapDo().getIdLevel());
			pr.setString(5, lop.getTrangThai());
			pr.setString(6, lop.getDiaChi());
			pr.setString(7, lop.getHocPhi());
			pr.setString(8, lop.getYeuCau());
			pr.setString(9, lop.getMoTa());
			pr.executeUpdate();
			System.out.println("insert class");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public String sinhMaLop() {
		String maMon = "CL" + DatabaseConnect.sinhMa("idLop", "Lop");
		return maMon;
	}

	public Lop getclass() {
		return lop;
	}

	// lấy danh sách lớp chưa nhận va chua phe duyet
	public ArrayList<Lop> getListClassNotReceiveAndApproved(int start, int total) {
		ArrayList<Lop> list = new ArrayList<>();
		String sql = String.format(
				"select * from Lop a join MonHoc b on a.id_mon= b.id_mon join Level c on c.idLevel= a.idLevel join NhomMH d on b.id_nhom= d.id_nhom where a.idLop not in (select idLop from DanhsachLopDaNhan) and a.status=1 order by a.tenLop"
						+ " OFFSET  %s ROWS " + " FETCH NEXT %s ROWS ONLY ",
				start, total);
		DatabaseConnect.getConnect();

		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					Lop m = new Lop();
					m.setIdL(rs.getString("idLop"));
					m.setMonHoc(new MonHoc(rs.getString("id_mon"), rs.getString("tenmon"),
							new NhomMH(rs.getString("id_nhom"), rs.getString("tennhom"))));
					m.setTenL(rs.getString("tenLop"));
					m.setCapDo(new Level(rs.getString("idLevel"), rs.getString("levelName")));
					m.setTrangThai(rs.getString("status"));
					m.setMoTa(rs.getString("Mota"));
					m.setDiaChi(rs.getString("diaChi"));
					m.setHocPhi(rs.getString("hocPhi"));
					m.setYeuCau(rs.getString("yeuCau"));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

//lấy danh sách lớp chưa nhận
	public ArrayList<Lop> getListClassNotReceive(int start, int total) {
		ArrayList<Lop> list = new ArrayList<>();
		String sql = String.format(
				"select * from Lop a join MonHoc b on a.id_mon= b.id_mon join Level c on c.idLevel= a.idLevel join NhomMH d on b.id_nhom= d.id_nhom where a.idLop not in (select idLop from DanhsachLopDaNhan) and a.status=0 order by a.tenLop"
						+ " OFFSET  %s ROWS " + " FETCH NEXT %s ROWS ONLY ",
				start, total);
		DatabaseConnect.getConnect();

		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					Lop m = new Lop();
					m.setIdL(rs.getString("idLop"));
					m.setMonHoc(new MonHoc(rs.getString("id_mon"), rs.getString("tenmon"),
							new NhomMH(rs.getString("id_nhom"), rs.getString("tennhom"))));
					m.setTenL(rs.getString("tenLop"));
					m.setCapDo(new Level(rs.getString("idLevel"), rs.getString("levelName")));
					m.setTrangThai(rs.getString("status"));
					m.setMoTa(rs.getString("Mota"));
					m.setDiaChi(rs.getString("diaChi"));
					m.setHocPhi(rs.getString("hocPhi"));
					m.setYeuCau(rs.getString("yeuCau"));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// lấy danh sách lớp đã nhận
	public ArrayList<Lop> getListClassReceive(int start, int total) {
		ArrayList<Lop> list = new ArrayList<>();
		String sql = String.format(
				"select * from Lop a join MonHoc b on a.id_mon= b.id_mon join Level c on c.idLevel= a.idLevel join NhomMH d on b.id_nhom= d.id_nhom where a.idLop in (select idLop from DanhsachLopDaNhan) and a.status= 0 order by a.tenLop"
						+ " OFFSET  %s ROWS " + " FETCH NEXT %s ROWS ONLY ",
				start, total);
		DatabaseConnect.getConnect();

		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					Lop m = new Lop();
					m.setIdL(rs.getString("idLop"));
					m.setMonHoc(new MonHoc(rs.getString("id_mon"), rs.getString("tenmon"),
							new NhomMH(rs.getString("id_nhom"), rs.getString("tennhom"))));
					m.setTenL(rs.getString("tenLop"));
					m.setCapDo(new Level(rs.getString("idLevel"), rs.getString("levelName")));
					m.setTrangThai(rs.getString("status"));
					m.setMoTa(rs.getString("Mota"));
					m.setDiaChi(rs.getString("diaChi"));
					m.setHocPhi(rs.getString("hocPhi"));
					m.setYeuCau(rs.getString("yeuCau"));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Lấy danh sách của tất cả các lớp

	public ArrayList<Lop> getAllListClass(int start, int total) {
		ArrayList<Lop> list = new ArrayList<>();
		String sql = String.format(
				"select * from Lop a join MonHoc b on a.id_mon= b.id_mon join Level c on c.idLevel= a.idLevel join NhomMH d on b.id_nhom= d.id_nhom order by a.tenLop"
						+ " OFFSET  %s ROWS " + " FETCH NEXT %s ROWS ONLY ",
				start, total);
		DatabaseConnect.getConnect();

		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					Lop m = new Lop();
					m.setIdL(rs.getString("idLop"));
					m.setMonHoc(new MonHoc(rs.getString("id_mon"), rs.getString("tenmon"),
							new NhomMH(rs.getString("id_nhom"), rs.getString("tennhom"))));
					m.setTenL(rs.getString("tenLop"));
					m.setCapDo(new Level(rs.getString("idLevel"), rs.getString("levelName")));
					m.setTrangThai(rs.getString("status"));
					m.setMoTa(rs.getString("Mota"));
					m.setDiaChi(rs.getString("diaChi"));
					m.setHocPhi(rs.getString("hocPhi"));
					m.setYeuCau(rs.getString("yeuCau"));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Lop findClass(String code) {
		DatabaseConnect.getConnect();
		String sql = "Select * from Lop a where a.idLop=?";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);

			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				String idL = rs.getString("idLop");
				String tenL = rs.getString("tenLop");
				MonHoc monHoc = mhDao.findMonHoc(rs.getString("id_mon"));
				Level capDo = levelDao.findLevel(rs.getString("idLevel"));
				String trangThai = rs.getString("status");
				String moTa = rs.getString("Mota");
				String diaChi = rs.getString("diaChi");
				String hocPhi = rs.getString("hocPhi");
				String yeuCau = rs.getString("yeuCau");
				Lop lp = new Lop(idL, tenL, monHoc, capDo, trangThai, moTa, diaChi, hocPhi, yeuCau);
				return lp;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return null;
	}

	public void updateClass(String idLop, String idMon, String idCapDo, String tenLop, String mota, String status,
			String diaChi, String hocPhi, String yeuCau) {
		DatabaseConnect.getConnect();
		String sql = String.format(
				"UPDATE Lop SET [tenlop] = N'%s',id_mon='%s',idLevel='%s',status='%s',Mota=N'%s',diaChi=N'%s',hocPhi=N'%s', yeuCau=N'%s' where idLop='%s'",
				tenLop, idMon, idCapDo, status, mota, diaChi, hocPhi, yeuCau, idLop);
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			System.out.println(sql);
			pstm.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void updateClass(String idLop, String trangThai) {
		DatabaseConnect.getConnect();
		String sql = String.format("UPDATE Lop SET status='%s'where idLop='%s'", trangThai, idLop);
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			System.out.println(sql);
			pstm.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void deleteClass(String code) {
		DatabaseConnect.getConnect();
		String sql = "Delete From Lop where idLop= ?";

		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			pstm.setString(1, code);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

//them vao nhat ky tao lơp
	public void insertClassDiary(String idLop, String idUser, LocalDate date) {
		DatabaseConnect.getConnect();
		String sql = String.format("insert into NhatKyTaoLop VALUES('%s','%s','%s')", idLop, idUser, date);
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			System.out.println("insert Class Diary" + sql);
			pstm.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	// them vao bang yeu cau
	public void insertClassSeggest(String idLop, String idKH, String idGS, LocalDate date, LocalTime time) {
		DatabaseConnect.getConnect();
		String sql = String.format("insert into YeuCauChonGS VALUES('%s','%s','%s','%s','%s')", idKH, idGS, idLop, time,
				date);
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			System.out.println("insert bảng yêu cầu" + sql);
			pstm.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

//lấy thông tin lớp theo mã khách hàng
	public ArrayList<Lop> getListClassAddbyCustomer(String id, int start, int total) {
		ArrayList<Lop> list = new ArrayList<>();
		String sql = String.format(
				"select * from Lop a join NhatKyTaoLop e on a.idLop= e.idLop join MonHoc b on a.id_mon= b.id_mon join Level c on c.idLevel= a.idLevel join NhomMH d on b.id_nhom= d.id_nhom where e.idKH='%s' order by a.tenLop"
						+ " OFFSET  %s ROWS " + " FETCH NEXT %s ROWS ONLY ",
				id, start, total);
		DatabaseConnect.getConnect();
		System.out.println(sql);
		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					Lop m = new Lop();
					m.setIdL(rs.getString("idLop"));
					m.setMonHoc(new MonHoc(rs.getString("id_mon"), rs.getString("tenmon"),
							new NhomMH(rs.getString("id_nhom"), rs.getString("tennhom"))));
					m.setTenL(rs.getString("tenLop"));
					m.setCapDo(new Level(rs.getString("idLevel"), rs.getString("levelName")));
					m.setTrangThai(rs.getString("status"));
					m.setMoTa(rs.getString("Mota"));
					m.setDiaChi(rs.getString("diaChi"));
					m.setHocPhi(rs.getString("hocPhi"));
					m.setYeuCau(rs.getString("yeuCau"));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getNoOfRecords() {
		int a = 0;
		DatabaseConnect.getConnect();
		String sql = "select * from Lop";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				a++;
			}
			return a;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;

	}

	// lay tong so ban ghi cua cac lop chua nhan
	public int getNoOfRecordsNotReceive() {
		int a = 0;
		DatabaseConnect.getConnect();
		String sql = "select * from Lop a join MonHoc b on a.id_mon= b.id_mon join Level c on c.idLevel= a.idLevel join NhomMH d on b.id_nhom= d.id_nhom where a.idLop not in (select idLop from DanhsachLopDaNhan) and a.status=0";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				a++;
			}
			return a;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;

	}

	// lay tong so ban ghi cua cac lop chua nhan va chua phe duyet
	public int getNoOfRecordsNotReceiveAndApproved() {
		int a = 0;
		DatabaseConnect.getConnect();
		String sql = "select * from Lop a join MonHoc b on a.id_mon= b.id_mon join Level c on c.idLevel= a.idLevel join NhomMH d on b.id_nhom= d.id_nhom where a.idLop not in (select idLop from DanhsachLopDaNhan) and a.status=1";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				a++;
			}
			return a;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;

	}

	public int getNoOfRecordsListClassReceive() {
		int a = 0;
		DatabaseConnect.getConnect();
		String sql = "select * from DanhSachLopDaNhan";
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				a++;
			}
			return a;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;

	}

	public int getNoOfRecordsByCustomer(String id) {
		int a = 0;
		DatabaseConnect.getConnect();
		String sql = String.format(
				"select * from Lop a join NhatKyTaoLop e on a.idLop= e.idLop join MonHoc b on a.id_mon= b.id_mon join Level c on c.idLevel= a.idLevel join NhomMH d on b.id_nhom= d.id_nhom where e.idKH='%s'",
				id);
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				a++;
			}
			return a;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}

	// Apply lơp
	public void applyClass(String idClass, String idGs, LocalTime time, LocalDate date) {
		String sql = String.format("insert into DanhsachLopDaNhan VALUES('%s','%s','%s','%s')", idGs, idClass, time,
				date);
		DatabaseConnect.getConnect();
		PreparedStatement pr;
		try {
			pr = DatabaseConnect.conn.prepareStatement(sql);
			pr.executeUpdate();
			System.out.println("insert applyClass");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	// lay ma khach hang theo ma lop

	public String getIDKH(String idLop) {
		String idKh = null;
		String sql = String.format("Select idKH from NhatKyTaoLop where idLop='%s'", idLop);
		DatabaseConnect.getConnect();
		PreparedStatement pr;
		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					idKh = rs.getString("idKH");
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idKh;
	}

	// layDanhsachLopDangDay theo ma gia su
	public ArrayList<Lop> getListClassByIDTutor(String idTutor, int start, int total) {
		String sql = String.format(
				"select * from Lop a join NhatKyTaoLop e on a.idLop= e.idLop join MonHoc b on a.id_mon= b.id_mon join Level c on c.idLevel= a.idLevel join NhomMH d on b.id_nhom= d.id_nhom where a.idLop in (select idLop from DanhsachLopDaNhan g where g.idGS='%s') order by tenLop OFFSET  %s ROWS FETCH NEXT %s ROWS ONLY",
				idTutor, start, total);
		DatabaseConnect.getConnect();
		ArrayList<Lop> list = new ArrayList<>();
		PreparedStatement pr;
		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					Lop m = new Lop();
					m.setIdL(rs.getString("idLop"));
					m.setMonHoc(new MonHoc(rs.getString("id_mon"), rs.getString("tenmon"),
							new NhomMH(rs.getString("id_nhom"), rs.getString("tennhom"))));
					m.setTenL(rs.getString("tenLop"));
					m.setCapDo(new Level(rs.getString("idLevel"), rs.getString("levelName")));
					m.setTrangThai(rs.getString("status"));
					m.setMoTa(rs.getString("Mota"));
					m.setDiaChi(rs.getString("diaChi"));
					m.setHocPhi(rs.getString("hocPhi"));
					m.setYeuCau(rs.getString("yeuCau"));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// layDanhsachLopDanghọc cua tung khach hang
	public ArrayList<Lop> getListClassByIDCustomer(String idCustomer, int start, int total) {
		String sql = String.format(
				"select * from Lop a join DanhsachLopDaNhan e on a.idLop= e.idLop join MonHoc b on a.id_mon= b.id_mon join Level c on c.idLevel= a.idLevel join NhomMH d on b.id_nhom= d.id_nhom where a.idLop in (select idLop from NhatKyTaoLop g where g.idKH='%s') order by tenLop OFFSET  %s ROWS FETCH NEXT %s ROWS ONLY",
				idCustomer, start, total);
		DatabaseConnect.getConnect();
		ArrayList<Lop> list = new ArrayList<>();
		PreparedStatement pr;
		ResultSet rs = null;
		try {
			PreparedStatement preparedStatement = DatabaseConnect.conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();
			if (rs == null) {
				System.out.println("rs bi null");
			} else {
				while (rs.next()) {
					Lop m = new Lop();
					m.setIdL(rs.getString("idLop"));
					m.setMonHoc(new MonHoc(rs.getString("id_mon"), rs.getString("tenmon"),
							new NhomMH(rs.getString("id_nhom"), rs.getString("tennhom"))));
					m.setTenL(rs.getString("tenLop"));
					m.setCapDo(new Level(rs.getString("idLevel"), rs.getString("levelName")));
					m.setTrangThai(rs.getString("status"));
					m.setMoTa(rs.getString("Mota"));
					m.setDiaChi(rs.getString("diaChi"));
					m.setHocPhi(rs.getString("hocPhi"));
					m.setYeuCau(rs.getString("yeuCau"));
					list.add(m);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// đếm số bản ghi danh sach lớp theo gia sư
	public int getNoOfRecordsListClassByTutor(String id) {
		int a = 0;
		DatabaseConnect.getConnect();
		String sql = String.format("select * from DanhSachLopDaNhan e where e.idGS='%s'", id);
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				a++;
			}
			return a;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}

	// đếm số bản ghi danh sách lớp đang học cua khach hang
	public int getNoOfRecordsListClassByCustomer(String id) {
		int a = 0;
		DatabaseConnect.getConnect();
		String sql = String.format(
				"select * from DanhSachLopDaNhan a join NhatKyTaoLop e on e.idLop=a.idLop where e.idKH='%s'", id);
		PreparedStatement pstm;
		try {
			pstm = DatabaseConnect.conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			while (rs.next()) {
				a++;
			}
			return a;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}

}
