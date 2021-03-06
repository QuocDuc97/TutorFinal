USE [Tutor]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[idKH] [nvarchar](20) NOT NULL,
	[idGS] [nvarchar](20) NOT NULL,
	[idLop] [nvarchar](10) NULL,
	[BinhLuan] [nvarchar](max) NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[idKH] ASC,
	[idGS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhsachLopDaNhan]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhsachLopDaNhan](
	[idGS] [nvarchar](20) NOT NULL,
	[idLop] [nvarchar](20) NOT NULL,
	[thoiGianNhan] [time](7) NOT NULL,
	[ngayNhan] [date] NULL,
 CONSTRAINT [PK_DanhsachLopDaNhan_1] PRIMARY KEY CLUSTERED 
(
	[idGS] ASC,
	[idLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaSu]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaSu](
	[idGS] [nvarchar](20) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[gioitinh] [nvarchar](10) NULL,
	[email] [nvarchar](50) NULL,
	[image] [nvarchar](300) NULL,
	[sodienthoai] [nvarchar](11) NULL,
	[nghenghiep] [nvarchar](50) NULL,
	[diachi] [nvarchar](max) NULL,
	[hocphi] [decimal](18, 0) NULL,
	[moTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_GiaSu] PRIMARY KEY CLUSTERED 
(
	[idGS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiaSu_MH]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaSu_MH](
	[idGS] [nvarchar](20) NOT NULL,
	[id_mon] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_GiaSu_MH] PRIMARY KEY CLUSTERED 
(
	[idGS] ASC,
	[id_mon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[idKH] [nvarchar](20) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[gioitinh] [nvarchar](20) NULL,
	[sodienthoai] [nvarchar](11) NULL,
	[diachi] [nvarchar](max) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[idKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Level]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[idLevel] [nvarchar](10) NOT NULL,
	[LevelName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[idLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lop]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[idLop] [nvarchar](20) NOT NULL,
	[id_mon] [nvarchar](10) NULL,
	[tenLop] [nvarchar](50) NULL,
	[idLevel] [nvarchar](10) NULL,
	[status] [int] NULL,
	[diaChi] [nvarchar](250) NULL,
	[hocPhi] [decimal](18, 0) NULL,
	[yeuCau] [nvarchar](max) NULL,
	[Mota] [nvarchar](max) NULL,
 CONSTRAINT [PK_Lop] PRIMARY KEY CLUSTERED 
(
	[idLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[id_mon] [nvarchar](10) NOT NULL,
	[tenmon] [nvarchar](50) NULL,
	[id_nhom] [nvarchar](10) NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[id_mon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhatKyTaoLop]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhatKyTaoLop](
	[idLop] [nvarchar](20) NOT NULL,
	[idKH] [nvarchar](20) NOT NULL,
	[trangThai] [bit] NULL,
	[ngayTao] [date] NOT NULL,
 CONSTRAINT [PK_NhatKyTaoLop] PRIMARY KEY CLUSTERED 
(
	[idLop] ASC,
	[idKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomMH]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomMH](
	[id_nhom] [nvarchar](10) NOT NULL,
	[tennhom] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhomMonHoc] PRIMARY KEY CLUSTERED 
(
	[id_nhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SoLienLac]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoLienLac](
	[idLop] [nvarchar](20) NOT NULL,
	[idGS] [nvarchar](20) NOT NULL,
	[thoiGian] [date] NOT NULL,
	[noiDung] [nvarchar](max) NULL,
 CONSTRAINT [PK_SoLienLac] PRIMARY KEY CLUSTERED 
(
	[idLop] ASC,
	[idGS] ASC,
	[thoiGian] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[id] [nvarchar](20) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](300) NULL,
	[role] [int] NULL,
	[status] [int] NULL,
	[accountType] [int] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinNhan]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinNhan](
	[idGui] [nvarchar](20) NOT NULL,
	[idNhan] [nvarchar](20) NOT NULL,
	[ngayGui] [date] NULL,
	[thoiGianGui] [time](7) NULL,
	[noiDung] [nvarchar](max) NULL,
	[trangThai] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YeuCauChonGS]    Script Date: 1/15/2020 10:03:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuCauChonGS](
	[idYeuCau] [nvarchar](20) NOT NULL,
	[idNhan] [nvarchar](20) NOT NULL,
	[idLop] [nvarchar](20) NULL,
	[thoiGian] [time](7) NULL,
	[NgayYeuCau] [date] NULL
) ON [PRIMARY]

GO
INSERT [dbo].[DanhsachLopDaNhan] ([idGS], [idLop], [thoiGianNhan], [ngayNhan]) VALUES (N'GS7', N'CL10 ', CAST(N'11:52:27.4800000' AS Time), CAST(N'2020-01-14' AS Date))
INSERT [dbo].[DanhsachLopDaNhan] ([idGS], [idLop], [thoiGianNhan], [ngayNhan]) VALUES (N'GS7', N'CL6 ', CAST(N'20:43:50.6430000' AS Time), CAST(N'2020-01-11' AS Date))
INSERT [dbo].[DanhsachLopDaNhan] ([idGS], [idLop], [thoiGianNhan], [ngayNhan]) VALUES (N'GS7', N'CL7 ', CAST(N'21:09:12.4890000' AS Time), CAST(N'2020-01-11' AS Date))
INSERT [dbo].[DanhsachLopDaNhan] ([idGS], [idLop], [thoiGianNhan], [ngayNhan]) VALUES (N'GS7', N'CL9 ', CAST(N'06:34:33.4990000' AS Time), CAST(N'2020-01-11' AS Date))
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS10', N'le hoai nam 2', N'Male', N'hoainam@gmail.com', N'1574017049519.jpg', N'0987654321', N'Sinh vien', N'<p><strong>nghi xu&acirc;n</strong></p>
', CAST(120000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS11', N'nguyen thi mai', N'Male', N'maimai0503@gmail.com', N'1578976653192.jpg', N'0987654321', N'khac', N'<p>ha tinh</p>
', CAST(130000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS12', N'nguyễn ngọc khánh', N'Male', N'khanh@gmail.com', N'1578976653192.jpg', N'0987654321', N'khac', N'<p>hung nguyen</p>
', CAST(140000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS13', N'lê ngọc phát', N'Male', N'phat@gmail.com', N'1578976653192.jpg', N'99087612', N'khac', N'thanh hoa
', CAST(200000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS14', N'nguyễn thị mai', N'Male', N'maimai0503@gmail.com', N'1578976653192.jpg', N'0987654321', N'khac', N'Nghi xuân', CAST(300000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS15', N'đậu thị tường nam', N'Female', N'namtuong@gmail.com', N'1578976653192.jpg', N'0987654321', N'Sinh vien', N'nghi xuan
', CAST(150000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS16', N'le thi huyen', N'Female', N'huyen@gmail.com', N'1578976653192.jpg', NULL, N'Sinh vien', N'Nghi xuân', CAST(120000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS17', N'le thi huyen', N'Female', N'huyen@gmail.com', N'1578976653192.jpg', NULL, N'Sinh vien', N'Hưng nguyên', CAST(120000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS18', N'le thi huyen', N'Female', N'huyen@gmail.com', N'1576719879212.jpg', NULL, N'Sinh vien', N'Nghi lộc', CAST(120000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS19', N'le thi huyen', N'Female', N'huyen@gmail.com', N'1576719882655.jpg', NULL, N'Sinh vien', N'Nghi xuân', CAST(120000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS20', N'le thi huyen', N'Female', N'huyen@gmail.com', N'1576719943508.jpg', NULL, N'Sinh vien', N'Hà tĩnh', CAST(120000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS21', N'Bùi Qu?c Ð?c', N'Male', N'anhduc@gmail.com', N'1578920732294.jpg', N'0981895317', N'Sinh viÃªn', N'HÃ  tÄ©nh', CAST(150000 AS Decimal(18, 0)), N'Sinh viÃªn nghÃ nh cÃ´ng nghá»? thÃ´ng tin')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS22', N'Bùi Văn Thắng', N'Male', N'anhthang@gmail.com', N'1578920971375.jpg', N'0987654321', N'Sinh viÃªn', N'Hà tĩnh', CAST(200000 AS Decimal(18, 0)), N'Sinh viên nghành tự động hóa')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS23', N'Dương Văn Đạt', N'Female', N'dat@gmail.com', N'1578932419357.jpg', N'0987654321', N'Sinh viên', N'hà tĩnh', CAST(159000 AS Decimal(18, 0)), N'sinh viên đại học vinh')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS24', N'Dương Văn Đạt', N'Female', N'dat@gmail.com', N'1578935294461.jpg', N'09783452', N'Sinh viên', N'hà tĩnh', CAST(160000 AS Decimal(18, 0)), N'Sinh viên cntt')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS25', N'abc', N'Female', N'anhduc@gmail.com', N'1578976653192.jpg', N'0981895317', N'Sinh viên', N'hà tĩnh', CAST(120000 AS Decimal(18, 0)), N'sinh viên đại học')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS6', N'duong van dat 3', N'Male', N'quocanh02011990@gmail.com', N'1573886442305.jpg', N'0987654321', N'Sinh vien', N'gdgfgdgdfgdfgdsfsfsdfsdfsdfdfsf', CAST(200000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS7', N'bui quoc duc1', N'Male', N'quocanh02011990@gmail.com', N'1573876700208.jpg', N'0987654321', N'Sinh vien', N'xin chao', CAST(230000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS8', N'anhnam', N'Female', N'DBHVd@gmail.com', N'1573886412812.jpg', N'0987654321', N'Sinh vien', N'<p>long an</p>
', CAST(230000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu] ([idGS], [hoten], [gioitinh], [email], [image], [sodienthoai], [nghenghiep], [diachi], [hocphi], [moTa]) VALUES (N'GS9', N'le hoai nam', N'Female', N'hoainam@gmail.com', N'1574013409793.jpg', N'0987654321', N'Sinh vien', N'<p>thanh xuan</p>
', CAST(150000 AS Decimal(18, 0)), N'Tôi là sinh viên loại giỏi của trường Đại học Vinh.')
INSERT [dbo].[GiaSu_MH] ([idGS], [id_mon]) VALUES (N'GS10', N'MH5')
INSERT [dbo].[GiaSu_MH] ([idGS], [id_mon]) VALUES (N'GS11', N'MH1')
INSERT [dbo].[GiaSu_MH] ([idGS], [id_mon]) VALUES (N'GS7', N'MH1')
INSERT [dbo].[GiaSu_MH] ([idGS], [id_mon]) VALUES (N'GS7', N'MH5')
INSERT [dbo].[GiaSu_MH] ([idGS], [id_mon]) VALUES (N'GS7', N'MH6')
INSERT [dbo].[GiaSu_MH] ([idGS], [id_mon]) VALUES (N'KH7', N'MH1')
INSERT [dbo].[KhachHang] ([idKH], [hoten], [email], [gioitinh], [sodienthoai], [diachi]) VALUES (N'KH1', N'Bùi Quốc Đức', N'quocanh02011990@gmail.com', N'Female', N'3523963040', N'Nghệ an
')
INSERT [dbo].[KhachHang] ([idKH], [hoten], [email], [gioitinh], [sodienthoai], [diachi]) VALUES (N'KH2', N'được ròi nè', N'quocanh02011990@gmail.com', N'Female', N'3523963040', N'<p>nghe an</p>
')
INSERT [dbo].[KhachHang] ([idKH], [hoten], [email], [gioitinh], [sodienthoai], [diachi]) VALUES (N'KH3', N'William K. Lloyd', N'quocanh02011990@gmail.com', N'Male', N'3523963040', N'Hà tĩnh
')
INSERT [dbo].[KhachHang] ([idKH], [hoten], [email], [gioitinh], [sodienthoai], [diachi]) VALUES (N'KH4', N'William K. Lloyd', N'quocanh02011990@gmail.com', N'Male', N'3523963040', N'Nam đàn
')
INSERT [dbo].[KhachHang] ([idKH], [hoten], [email], [gioitinh], [sodienthoai], [diachi]) VALUES (N'KH6', N'Đức Bùi Quốc', N'quocanh02011990@gmail.com', N'Female', N'3523963040', N'2222 Rhapsody Street')
INSERT [dbo].[KhachHang] ([idKH], [hoten], [email], [gioitinh], [sodienthoai], [diachi]) VALUES (N'KH7', N'nguyễn hoài nam', N'quocanh02011990@gmail.com', N'Female', N'0987675315', N'Hà tĩnh, Việt Nam
')
INSERT [dbo].[KhachHang] ([idKH], [hoten], [email], [gioitinh], [sodienthoai], [diachi]) VALUES (N'KH8', N'Nguyễn Thị Mai', N'maimai@gmail.com', N'Female', N'09876543', N'ha tinh')
INSERT [dbo].[Level] ([idLevel], [LevelName]) VALUES (N'LV1', N'Tiểu học')
INSERT [dbo].[Level] ([idLevel], [LevelName]) VALUES (N'LV2', N'Trung học cơ sở')
INSERT [dbo].[Level] ([idLevel], [LevelName]) VALUES (N'LV3', N'Đại học')
INSERT [dbo].[Level] ([idLevel], [LevelName]) VALUES (N'LV4', N'Trung học phổ thông nè')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL1', N'MH1', N'Toán cao cấp', N'LV1', 0, N'Nghi xuân, hà tĩnh', CAST(150000 AS Decimal(18, 0)), N'Sinh viên tốt nghiệp đại học chuyên nghành sư phạm', N'toán cao cấp nề')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL10', N'MH1', N'Toán lớp 4', N'LV1', 0, N'Nghi xuân', CAST(120000 AS Decimal(18, 0)), N'môn toán', N'abc')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL11', N'MH1', N'Toán A2', N'LV1', 0, N'Hà tĩnh', CAST(120000 AS Decimal(18, 0)), N'sinh viên sư phạm toán học', N'Bổ trợ môn toán')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL12', N'MH1', N'Toán A2', N'LV1', 0, N'ha tinh', CAST(120000 AS Decimal(18, 0)), N'sfgdg', N'fsfdfd')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL2', N'MH1', N'Toán A2', N'LV2', 0, N'Thành phố Vinh', CAST(130000 AS Decimal(18, 0)), N'Sinh viên tốt nghiệp đại học chuyên nghành sư phạm', N'đây là môn toán A2')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL3', N'MH1', N'Toán lớp 3', N'LV1', 0, N'đường nguyễn du, thành phố vinh', CAST(120000 AS Decimal(18, 0)), N'Sinh viên tốt nghiệp đại học chuyên nghành sư phạm', N'dành cho học sinh lớp 3')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL4', N'MH1', N'Toán lớp 2 ', N'LV1', 0, N'Thành phố vinh', CAST(138000 AS Decimal(18, 0)), N'Sinh viên tốt nghiệp đại học chuyên nghành sư phạm', N'dành cho học sinh lớp 2')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL5', N'MH1', N'Tiếng việt lớp 1', N'LV1', 0, N'Nguyễn trãi, thành phố vinh', CAST(120000 AS Decimal(18, 0)), N'Sinh viên tốt nghiệp đại học chuyên nghành sư phạm', N'môn tiếng việt dành cho học sinh lớp 1')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL6', N'MH1', N'Tiếng việt lớp 3', N'LV1', 0, N'Thị trấn hưng nguyên', CAST(150000 AS Decimal(18, 0)), N'Sinh viên tốt nghiệp chuyên nghành sư phạm', N'Bộ môn tiếng việt dành cho tiểu học')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL7', N'MH1', N'Toán lớp 4', N'LV1', 0, N'số 3, đường nguyễn du', CAST(150000 AS Decimal(18, 0)), N'sinh viên nghành sư phạm', N'môn học dành cho học sinh lớp 4')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL8', N'MH1', N'Toán lớp 5', N'LV1', 1, N'Khối 1, phường trung đô, thành phố vinh', CAST(130000 AS Decimal(18, 0)), N'sinh viên tốt nghiệp xuất sắc nghành sư phạm toán', N'Môn toán')
INSERT [dbo].[Lop] ([idLop], [id_mon], [tenLop], [idLevel], [status], [diaChi], [hocPhi], [yeuCau], [Mota]) VALUES (N'CL9', N'MH1', N'Khoa học', N'LV1', 0, N'chợ đại học vinh', CAST(120000 AS Decimal(18, 0)), N'sinh viên nghành sư phạm', N'môn khoa học')
INSERT [dbo].[MonHoc] ([id_mon], [tenmon], [id_nhom]) VALUES (N'MH1', N'Toan lop 1', N'NM8')
INSERT [dbo].[MonHoc] ([id_mon], [tenmon], [id_nhom]) VALUES (N'MH5', N'Toan lop 2', N'NM3')
INSERT [dbo].[MonHoc] ([id_mon], [tenmon], [id_nhom]) VALUES (N'MH6', N'Toan lop 3', N'NM4')
INSERT [dbo].[MonHoc] ([id_mon], [tenmon], [id_nhom]) VALUES (N'MH7', N'Toan lop 4', N'NM3')
INSERT [dbo].[NhatKyTaoLop] ([idLop], [idKH], [trangThai], [ngayTao]) VALUES (N'CL10', N'KH7', 1, CAST(N'2020-01-03' AS Date))
INSERT [dbo].[NhatKyTaoLop] ([idLop], [idKH], [trangThai], [ngayTao]) VALUES (N'CL4', N'KH7', 1, CAST(N'2019-12-07' AS Date))
INSERT [dbo].[NhatKyTaoLop] ([idLop], [idKH], [trangThai], [ngayTao]) VALUES (N'CL5', N'KH7', 1, CAST(N'2019-12-07' AS Date))
INSERT [dbo].[NhatKyTaoLop] ([idLop], [idKH], [trangThai], [ngayTao]) VALUES (N'CL6', N'KH7', 1, CAST(N'2019-12-07' AS Date))
INSERT [dbo].[NhatKyTaoLop] ([idLop], [idKH], [trangThai], [ngayTao]) VALUES (N'CL7', N'KH7', 1, CAST(N'2019-12-08' AS Date))
INSERT [dbo].[NhatKyTaoLop] ([idLop], [idKH], [trangThai], [ngayTao]) VALUES (N'CL8', N'KH7', 1, CAST(N'2019-12-08' AS Date))
INSERT [dbo].[NhatKyTaoLop] ([idLop], [idKH], [trangThai], [ngayTao]) VALUES (N'CL9', N'KH7', 1, CAST(N'2019-12-08' AS Date))
INSERT [dbo].[NhomMH] ([id_nhom], [tennhom]) VALUES (N'NM11', N'Toán rời rac')
INSERT [dbo].[NhomMH] ([id_nhom], [tennhom]) VALUES (N'NM3', N'Khoa học tự nhiên')
INSERT [dbo].[NhomMH] ([id_nhom], [tennhom]) VALUES (N'NM4', N'khoa học xã hội')
INSERT [dbo].[NhomMH] ([id_nhom], [tennhom]) VALUES (N'NM5', N'Toán cao cấp')
INSERT [dbo].[NhomMH] ([id_nhom], [tennhom]) VALUES (N'NM6', N'Tiểu Thuyết')
INSERT [dbo].[NhomMH] ([id_nhom], [tennhom]) VALUES (N'NM8', N'Khoa học tự nhiên')
INSERT [dbo].[NhomMH] ([id_nhom], [tennhom]) VALUES (N'NM9', N'Khoa học xã hội')
INSERT [dbo].[TaiKhoan] ([id], [username], [password], [role], [status], [accountType]) VALUES (N'admin', N'Admin', N'202cb962ac59075b964b07152d234b70', 0, 1, 0)
INSERT [dbo].[TaiKhoan] ([id], [username], [password], [role], [status], [accountType]) VALUES (N'GS10', N'testGS', N'123456', 1, 1, 2)
INSERT [dbo].[TaiKhoan] ([id], [username], [password], [role], [status], [accountType]) VALUES (N'GS21', N'anhduc', N'123456', 1, 1, 2)
INSERT [dbo].[TaiKhoan] ([id], [username], [password], [role], [status], [accountType]) VALUES (N'GS22', N'anhthang', N'12345', 1, 1, 2)
INSERT [dbo].[TaiKhoan] ([id], [username], [password], [role], [status], [accountType]) VALUES (N'GS24', N'datduong', N'e10adc3949ba59abbe56e057f20f883e', 1, 1, 2)
INSERT [dbo].[TaiKhoan] ([id], [username], [password], [role], [status], [accountType]) VALUES (N'GS25', N'abc', N'fcea920f7412b5da7be0cf42b8c93759', 1, 1, 2)
INSERT [dbo].[TaiKhoan] ([id], [username], [password], [role], [status], [accountType]) VALUES (N'GS7', N'user2', N'202cb962ac59075b964b07152d234b70', 1, 1, 2)
INSERT [dbo].[TaiKhoan] ([id], [username], [password], [role], [status], [accountType]) VALUES (N'KH6', N'user1', N'123', 1, 1, 1)
INSERT [dbo].[TaiKhoan] ([id], [username], [password], [role], [status], [accountType]) VALUES (N'KH7', N'hoainam', N'202cb962ac59075b964b07152d234b70', 1, 1, 1)
INSERT [dbo].[TaiKhoan] ([id], [username], [password], [role], [status], [accountType]) VALUES (N'KH8', N'maimai', N'12345', 1, 1, 1)
INSERT [dbo].[TaiKhoan] ([id], [username], [password], [role], [status], [accountType]) VALUES (N'KH9', N'Lenan', N'1233456', 1, 1, 1)
INSERT [dbo].[TinNhan] ([idGui], [idNhan], [ngayGui], [thoiGianGui], [noiDung], [trangThai]) VALUES (N'GS7', N'KH7', CAST(N'2020-01-11' AS Date), CAST(N'06:34:33.4690000' AS Time), N'hoainam đã đồng ý nhận lớp của bạn', 1)
INSERT [dbo].[TinNhan] ([idGui], [idNhan], [ngayGui], [thoiGianGui], [noiDung], [trangThai]) VALUES (N'GS7', N'KH7', CAST(N'2020-01-11' AS Date), CAST(N'21:09:12.4580000' AS Time), N'hoainam đã đồng ý nhận lớp của bạn', 1)
INSERT [dbo].[TinNhan] ([idGui], [idNhan], [ngayGui], [thoiGianGui], [noiDung], [trangThai]) VALUES (N'KH6', N'GS7', CAST(N'2020-01-11' AS Date), CAST(N'21:09:12.4580000' AS Time), N'Bùi Quốc Đức muốn đã gửi lời mời dạy lớp của anh ấy', 1)
INSERT [dbo].[TinNhan] ([idGui], [idNhan], [ngayGui], [thoiGianGui], [noiDung], [trangThai]) VALUES (N'KH7', N'GS10', CAST(N'2020-01-13' AS Date), CAST(N'15:20:00.0480000' AS Time), N'hoainam gửi lời đề nghị nhận bạn làm gia sư', 1)
INSERT [dbo].[TinNhan] ([idGui], [idNhan], [ngayGui], [thoiGianGui], [noiDung], [trangThai]) VALUES (N'GS7', N'KH7', CAST(N'2020-01-14' AS Date), CAST(N'11:52:27.4570000' AS Time), N'hoainam đã đồng ý nhận lớp của bạn', 1)
INSERT [dbo].[YeuCauChonGS] ([idYeuCau], [idNhan], [idLop], [thoiGian], [NgayYeuCau]) VALUES (N'KH7', N'GS10', N'CL11', CAST(N'15:20:00.0700000' AS Time), CAST(N'2020-01-13' AS Date))
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_GiaSu] FOREIGN KEY([idGS])
REFERENCES [dbo].[GiaSu] ([idGS])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_GiaSu]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_KhachHang] FOREIGN KEY([idKH])
REFERENCES [dbo].[KhachHang] ([idKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_KhachHang]
GO
ALTER TABLE [dbo].[DanhsachLopDaNhan]  WITH CHECK ADD  CONSTRAINT [FK_DanhsachLopDaNhan_GiaSu] FOREIGN KEY([idGS])
REFERENCES [dbo].[GiaSu] ([idGS])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhsachLopDaNhan] CHECK CONSTRAINT [FK_DanhsachLopDaNhan_GiaSu]
GO
ALTER TABLE [dbo].[DanhsachLopDaNhan]  WITH CHECK ADD  CONSTRAINT [FK_DanhsachLopDaNhan_Lop] FOREIGN KEY([idLop])
REFERENCES [dbo].[Lop] ([idLop])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhsachLopDaNhan] CHECK CONSTRAINT [FK_DanhsachLopDaNhan_Lop]
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Lop_Level] FOREIGN KEY([idLevel])
REFERENCES [dbo].[Level] ([idLevel])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Lop_Level]
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD  CONSTRAINT [FK_Lop_MonHoc] FOREIGN KEY([id_mon])
REFERENCES [dbo].[MonHoc] ([id_mon])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lop] CHECK CONSTRAINT [FK_Lop_MonHoc]
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD  CONSTRAINT [FK_MonHoc_NhomMonHoc] FOREIGN KEY([id_nhom])
REFERENCES [dbo].[NhomMH] ([id_nhom])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MonHoc] CHECK CONSTRAINT [FK_MonHoc_NhomMonHoc]
GO
ALTER TABLE [dbo].[NhatKyTaoLop]  WITH CHECK ADD  CONSTRAINT [FK_NhatKyTaoLop_KhachHang] FOREIGN KEY([idKH])
REFERENCES [dbo].[KhachHang] ([idKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhatKyTaoLop] CHECK CONSTRAINT [FK_NhatKyTaoLop_KhachHang]
GO
ALTER TABLE [dbo].[NhatKyTaoLop]  WITH CHECK ADD  CONSTRAINT [FK_NhatKyTaoLop_Lop] FOREIGN KEY([idLop])
REFERENCES [dbo].[Lop] ([idLop])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhatKyTaoLop] CHECK CONSTRAINT [FK_NhatKyTaoLop_Lop]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 la phe duyet, 1 la chua phe duyet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lop', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 là phê duyệt, 1 là chưa phê duyệt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NhatKyTaoLop', @level2type=N'COLUMN',@level2name=N'trangThai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 là admin
1 là khách hàng
2 là gia sư
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TaiKhoan', @level2type=N'COLUMN',@level2name=N'accountType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 là đã xem
1 là chưa xem
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TinNhan', @level2type=N'COLUMN',@level2name=N'trangThai'
GO
