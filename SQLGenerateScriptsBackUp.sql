USE [master]
GO
/****** Object:  Database [QLCHTL]    Script Date: 4/22/2025 8:47:32 PM ******/
CREATE DATABASE [QLCHTL] ON  PRIMARY 
( NAME = N'QLCHTL_DATA', FILENAME = N'D:\QLCHTL_DATA.mdf' , SIZE = 10240KB , MAXSIZE = 102400KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'QLCHTL_log', FILENAME = N'D:\QLCHTL_DATA.ldf' , SIZE = 10240KB , MAXSIZE = 204800KB , FILEGROWTH = 3072KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLCHTL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLCHTL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLCHTL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLCHTL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLCHTL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLCHTL] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLCHTL] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLCHTL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLCHTL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLCHTL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLCHTL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLCHTL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLCHTL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLCHTL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLCHTL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLCHTL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLCHTL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLCHTL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLCHTL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLCHTL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLCHTL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLCHTL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLCHTL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLCHTL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLCHTL] SET  MULTI_USER 
GO
ALTER DATABASE [QLCHTL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLCHTL] SET DB_CHAINING OFF 
GO
USE [QLCHTL]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_LayTenNhanVien]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------LayTenNhanVien
create FUNCTIon [dbo].[fn_LayTenNhanVien] (@MaNV int)
returnS nvarchar(255)
as
begin
    DECLARE @HoTen nvarchar(255);

    select @HoTen = HoTen
    from NhanVien
    where MaNV = @MaNV;

    return @HoTen;
end
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TinhTongTienHoaDonBan]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--- function

----------------------TinhTongTienHoaDonBan
create FUNCTIon [dbo].[fn_TinhTongTienHoaDonBan] (@MaHDBan int)
returnS DECIMAL(10, 2)
as
begin
    DECLARE @TongTien DECIMAL(10, 2);

    select @TongTien = SUM(ThanhTien)
    from ChiTietHDBan
    where MaHDBan = @MaHDBan;

    return ISNULL(@TongTien, 0);
end
GO
/****** Object:  Table [dbo].[ChiTietHDBan]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDBan](
	[MaHDBan] [int] NOT NULL,
	[MasP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [decimal](10, 2) NOT NULL,
	[ThanhTien] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDBan] ASC,
	[MasP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHDNhap]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDNhap](
	[MaHDNhap] [int] NOT NULL,
	[MasP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [decimal](10, 2) NOT NULL,
	[ThanhTien] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDNhap] ASC,
	[MasP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietKhuyenMai]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKhuyenMai](
	[MaKM] [int] NOT NULL,
	[MasP] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKM] ASC,
	[MasP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuKiemKho]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuKiemKho](
	[MaPhieuKK] [int] NOT NULL,
	[MasP] [int] NOT NULL,
	[SoLuongThucTe] [int] NOT NULL,
	[SoLuongHeThong] [int] NOT NULL,
	[ChenhLech] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuKK] ASC,
	[MasP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHDBan] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[MaKH] [int] NOT NULL,
	[NgayBan] [datetime] NULL,
	[TongTien] [decimal](10, 2) NOT NULL,
	[DiemSuDung] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[MaHDNhap] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[MaNCC] [int] NOT NULL,
	[NgayNhap] [datetime] NOT NULL,
	[TongTien] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](255) NOT NULL,
	[SDT] [varchar](20) NOT NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[DiemTichLuy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKM] [int] IDENTITY(1,1) NOT NULL,
	[TenKM] [nvarchar](40) NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[PhanTramGiamGia] [decimal](5, 2) NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSP] [nvarchar](255) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](255) NOT NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SDT] [varchar](20) NULL,
	[Email] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](255) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[SDT] [varchar](20) NOT NULL,
	[Email] [varchar](255) NULL,
	[ChucVu] [nvarchar](50) NOT NULL,
	[NgayVaoLam] [date] NULL,
	[Luong] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuKiemKho]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuKiemKho](
	[MaPhieuKK] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[NgayKiemKho] [datetime] NOT NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuKK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MasP] [int] NOT NULL,
	[TenSP] [nvarchar](255) NOT NULL,
	[MaLoaiSP] [int] NOT NULL,
	[MaNCC] [int] NOT NULL,
	[DonViTinh] [nvarchar](50) NOT NULL,
	[GiaNhap] [decimal](10, 2) NOT NULL,
	[GiaBan] [decimal](10, 2) NOT NULL,
	[SoLuongTonKho] [int] NOT NULL,
	[HanSuDung] [date] NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MasP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_ChiTietKhuyenMaiVoiTenSPVaTenKM]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- bang view chi tiet khuyen mai ten san pham va ten khuuyen mai
create view [dbo].[v_ChiTietKhuyenMaiVoiTenSPVaTenKM] as
select km.TenKM, sp.TenSP
from ChiTietKhuyenMai ctkm
JOIN KhuyenMai km on ctkm.MaKM = km.MaKM
JOIN SanPham sp on ctkm.MasP = sp.MasP;

GO
/****** Object:  View [dbo].[v_DoanhThuTheoLoaiSanPhamThang]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---Doanh thu thoe loai san pham
create view [dbo].[v_DoanhThuTheoLoaiSanPhamThang] as
select lsp.TenLoaiSP, SUM(cthdb.ThanhTien) as DoanhThu
from ChiTietHDBan cthdb
JOIN SanPham sp on cthdb.MasP = sp.MasP
JOIN LoaiSanPham lsp on sp.MaLoaiSP = lsp.MaLoaiSP
JOIN HoaDonBan hdb on cthdb.MaHDBan = hdb.MaHDBan
where YEAR(hdb.NgayBan) = YEAR(GETdate()) AND MonTH(hdb.NgayBan) = MonTH(GETdate())
GROUP BY lsp.TenLoaiSP;

GO
/****** Object:  View [dbo].[v_NhanVienBanDuocNhieuNhat]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---nhan vien ban duoc nhieu nhat
create view [dbo].[v_NhanVienBanDuocNhieuNhat] as
select TOP 1 nv.MaNV, nv.HoTen, SUM(hdb.TongTien) as TongTienBan
from HoaDonBan hdb
JOIN NhanVien nv on hdb.MaNV = nv.MaNV
GROUP BY nv.MaNV, nv.HoTen
ORDER BY TongTienBan DESC;

GO
/****** Object:  View [dbo].[v_NhanVienCoHoaDonBanCaonhat]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---bảng view nhan vien co hoa don cao nhat
create view [dbo].[v_NhanVienCoHoaDonBanCaonhat] as
select TOP 1 nv.MaNV, nv.HoTen, SUM(hdb.TongTien) as TongGiaTriBan
from NhanVien nv
JOIN HoaDonBan hdb on nv.MaNV = hdb.MaNV
where YEAR(hdb.NgayBan) = YEAR(GETdate())
GROUP BY nv.MaNV, nv.HoTen
ORDER BY TongGiaTriBan DESC;

GO
/****** Object:  View [dbo].[v_SanPhamCanNhapThem]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- bang view  san pham cap nhat them
create view [dbo].[v_SanPhamCanNhapThem] as
select sp.MasP, sp.TenSP, sp.SoLuongTonKho, SUM(cthdb.SoLuong) as SoLuongBanTrongThang
from SanPham sp
JOIN ChiTietHDBan cthdb on sp.MasP = cthdb.MasP
JOIN HoaDonBan hdb on cthdb.MaHDBan = hdb.MaHDBan
where sp.SoLuongTonKho < 20
  AND YEAR(hdb.NgayBan) = YEAR(GETdate()) AND MonTH(hdb.NgayBan) = MonTH(GETdate())
GROUP BY sp.MasP, sp.TenSP, sp.SoLuongTonKho
HAVING SUM(cthdb.SoLuong) > 50;

GO
/****** Object:  View [dbo].[v_SanPhamLoiNhuanCaonhatThang]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--bảng view SanPhamLoiNhuanCaonhatThang
create view [dbo].[v_SanPhamLoiNhuanCaonhatThang] as
select TOP 1
    sp.MasP,
    sp.TenSP,
    SUM(cthdb.SoLuong * (sp.GiaBan - sp.GiaNhap)) as TongLoiNhuan
from ChiTietHDBan cthdb
JOIN SanPham sp on cthdb.MasP = sp.MasP
JOIN HoaDonBan hdb on cthdb.MaHDBan = hdb.MaHDBan
where YEAR(hdb.NgayBan) = YEAR(GETdate()) AND MonTH(hdb.NgayBan) = MonTH(GETdate())
GROUP BY sp.MasP, sp.TenSP
ORDER BY TongLoiNhuan DESC;

--- store proucedure
GO
/****** Object:  View [dbo].[v_SanPhamSapHetHan]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- sản phẩm sap hêt hạn
create view [dbo].[v_SanPhamSapHetHan] as
select MasP, TenSP, HanSuDung
from SanPham
where HanSuDung IS NOT NULL AND HanSuDung <= dateADD(day, 30, GETdate()) AND HanSuDung >= GETdate();

GO
/****** Object:  View [dbo].[v_SoLuongChenhLechKiemKho]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- bang biew so luong chenh lech kiem kho
create view [dbo].[v_SoLuongChenhLechKiemKho] as
select
    pkk.MaPhieuKK,
    pkk.NgayKiemKho,
    nv.HoTen as NguoiKiemKho,
    sp.TenSP,
    ctpkk.SoLuongThucTe,
    ctpkk.SoLuongHeThong,
    ctpkk.ChenhLech
from PhieuKiemKho pkk
JOIN ChiTietPhieuKiemKho ctpkk on pkk.MaPhieuKK = ctpkk.MaPhieuKK
JOIN SanPham sp on ctpkk.MasP = sp.MasP
JOIN NhanVien nv on pkk.MaNV = nv.MaNV;

GO
/****** Object:  View [dbo].[v_ThongKeNhapXuatTonThang]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--bang vew có thong ke nhap xuat hang thang
create view [dbo].[v_ThongKeNhapXuatTonThang] as
select
    sp.MasP,
    sp.TenSP,
    SUM(CasE WHEN YEAR(hdn.NgayNhap) = YEAR(GETdate()) AND MonTH(hdn.NgayNhap) = MonTH(GETdate()) THEN cthdn.SoLuong ELSE 0 end) as TongSoLuongNhapThang,
    SUM(CasE WHEN YEAR(hdb.NgayBan) = YEAR(GETdate()) AND MonTH(hdb.NgayBan) = MonTH(GETdate()) THEN cthdb.SoLuong ELSE 0 end) as TongSoLuongXuatThang,
    sp.SoLuongTonKho as TonHienTai
from SanPham sp
LEFT JOIN ChiTietHDNhap cthdn on sp.MasP = cthdn.MasP
LEFT JOIN HoaDonNhap hdn on cthdn.MaHDNhap = hdn.MaHDNhap
LEFT JOIN ChiTietHDBan cthdb on sp.MasP = cthdb.MasP
LEFT JOIN HoaDonBan hdb on cthdb.MaHDBan = hdb.MaHDBan
GROUP BY sp.MasP, sp.TenSP, sp.SoLuongTonKho;

GO
/****** Object:  View [dbo].[v_TongSoLuongNhapTheonCCThang]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---tong so luong nhaop theo nha cung cap
create view [dbo].[v_TongSoLuongNhapTheonCCThang] as
select ncc.TenNCC, SUM(cthdn.SoLuong) as TongSoLuongNhap
from ChiTietHDNhap cthdn
JOIN HoaDonNhap hdn on cthdn.MaHDNhap = hdn.MaHDNhap
JOIN NhaCungCap ncc on hdn.MaNCC = ncc.MaNCC
where YEAR(hdn.NgayNhap) = YEAR(GETdate()) AND MonTH(hdn.NgayNhap) = MonTH(GETdate())
GROUP BY ncc.TenNCC;

GO
/****** Object:  View [dbo].[v_Top5SanPhamBanChayNhatThang]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---bang view top 5 sang pham ban chay nhat thanh

create view [dbo].[v_Top5SanPhamBanChayNhatThang] as
select TOP 5 sp.MasP, sp.TenSP, SUM(cthdb.SoLuong) as TongSoLuongBan
from ChiTietHDBan cthdb
JOIN SanPham sp on cthdb.MasP = sp.MasP
JOIN HoaDonBan hdb on cthdb.MaHDBan = hdb.MaHDBan
where YEAR(hdb.NgayBan) = YEAR(GETdate()) AND MonTH(hdb.NgayBan) = MonTH(GETdate())
GROUP BY sp.MasP, sp.TenSP
ORDER BY TongSoLuongBan DESC;
GO
/****** Object:  View [dbo].[vw_DanhSachNhanVien]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------query truy vấn các thành phần trong bảng -------------------------------------

----- tạo bảng view

---danh sach nhan vien
create view [dbo].[vw_DanhSachNhanVien] as
select MaNV, HoTen, NgaySinh, GioiTinh, ChucVu
from NhanVien;
GO
/****** Object:  View [dbo].[vw_DanhSachSanPham]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- danh sach san pham
create view [dbo].[vw_DanhSachSanPham] as
select sp.MasP, sp.TenSP, lsp.TenLoaiSP, sp.GiaBan, sp.SoLuongTonKho
from SanPham sp
JOIN LoaiSanPham lsp on sp.MaLoaiSP = lsp.MaLoaiSP;

GO
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (1, 1, 1, CAST(12000000.00 AS Decimal(10, 2)), CAST(12000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (2, 2, 1, CAST(500000.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3, 3, 1, CAST(90000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (4, 4, 1, CAST(250000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (5, 5, 1, CAST(80000.00 AS Decimal(10, 2)), CAST(80000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (6, 6, 1, CAST(350000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (7, 7, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (8, 8, 1, CAST(40000.00 AS Decimal(10, 2)), CAST(40000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (9, 9, 1, CAST(800000.00 AS Decimal(10, 2)), CAST(800000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (10, 10, 1, CAST(35000.00 AS Decimal(10, 2)), CAST(35000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (11, 11, 1, CAST(20000000.00 AS Decimal(10, 2)), CAST(20000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (12, 12, 1, CAST(7500000.00 AS Decimal(10, 2)), CAST(7500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (13, 13, 2, CAST(180000.00 AS Decimal(10, 2)), CAST(360000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (14, 14, 1, CAST(600000.00 AS Decimal(10, 2)), CAST(600000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (15, 15, 2, CAST(100000.00 AS Decimal(10, 2)), CAST(200000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (16, 16, 1, CAST(250000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (17, 17, 3, CAST(300000.00 AS Decimal(10, 2)), CAST(900000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (18, 18, 5, CAST(25000.00 AS Decimal(10, 2)), CAST(125000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (19, 19, 1, CAST(450000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (20, 20, 2, CAST(150000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (21, 21, 1, CAST(10000000.00 AS Decimal(10, 2)), CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (22, 22, 3, CAST(80000.00 AS Decimal(10, 2)), CAST(240000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (23, 23, 1, CAST(500000.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (24, 24, 2, CAST(70000.00 AS Decimal(10, 2)), CAST(140000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (25, 25, 1, CAST(450000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (26, 26, 1, CAST(180000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (27, 27, 2, CAST(800000.00 AS Decimal(10, 2)), CAST(1600000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (28, 28, 4, CAST(35000.00 AS Decimal(10, 2)), CAST(140000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (29, 29, 1, CAST(900000.00 AS Decimal(10, 2)), CAST(900000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (30, 30, 2, CAST(60000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (31, 31, 1, CAST(27000000.00 AS Decimal(10, 2)), CAST(27000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (32, 32, 3, CAST(80000.00 AS Decimal(10, 2)), CAST(240000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (33, 33, 1, CAST(350000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (34, 34, 2, CAST(180000.00 AS Decimal(10, 2)), CAST(360000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (35, 35, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (36, 36, 5, CAST(25000.00 AS Decimal(10, 2)), CAST(125000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (37, 37, 1, CAST(400000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (38, 38, 2, CAST(50000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (39, 39, 1, CAST(800000.00 AS Decimal(10, 2)), CAST(800000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (40, 40, 3, CAST(35000.00 AS Decimal(10, 2)), CAST(105000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (41, 41, 1, CAST(6000000.00 AS Decimal(10, 2)), CAST(6000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (42, 42, 2, CAST(50000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (43, 43, 1, CAST(350000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (44, 44, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (45, 45, 4, CAST(25000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (46, 46, 1, CAST(250000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (47, 47, 2, CAST(150000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (48, 48, 3, CAST(120000.00 AS Decimal(10, 2)), CAST(360000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (49, 49, 1, CAST(2000000.00 AS Decimal(10, 2)), CAST(2000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (50, 50, 5, CAST(25000.00 AS Decimal(10, 2)), CAST(125000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (51, 51, 1, CAST(9000000.00 AS Decimal(10, 2)), CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (52, 52, 2, CAST(35000.00 AS Decimal(10, 2)), CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (53, 53, 1, CAST(400000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (54, 54, 3, CAST(50000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (55, 55, 1, CAST(150000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (56, 56, 2, CAST(120000.00 AS Decimal(10, 2)), CAST(240000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (57, 57, 1, CAST(800000.00 AS Decimal(10, 2)), CAST(800000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (58, 58, 4, CAST(25000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (59, 59, 1, CAST(3000000.00 AS Decimal(10, 2)), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (60, 60, 2, CAST(60000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (61, 61, 1, CAST(3000000.00 AS Decimal(10, 2)), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (62, 62, 3, CAST(35000.00 AS Decimal(10, 2)), CAST(105000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (63, 63, 1, CAST(350000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (64, 64, 2, CAST(140000.00 AS Decimal(10, 2)), CAST(280000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (65, 65, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (66, 66, 5, CAST(25000.00 AS Decimal(10, 2)), CAST(125000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (67, 67, 1, CAST(600000.00 AS Decimal(10, 2)), CAST(600000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (68, 68, 2, CAST(90000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (69, 69, 1, CAST(1500000.00 AS Decimal(10, 2)), CAST(1500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (70, 70, 3, CAST(50000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (71, 71, 1, CAST(7000000.00 AS Decimal(10, 2)), CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (72, 72, 2, CAST(30000.00 AS Decimal(10, 2)), CAST(60000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (73, 73, 1, CAST(300000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (74, 74, 4, CAST(80000.00 AS Decimal(10, 2)), CAST(320000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (75, 75, 1, CAST(120000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (76, 76, 2, CAST(150000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (77, 77, 1, CAST(450000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (78, 78, 3, CAST(35000.00 AS Decimal(10, 2)), CAST(105000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (79, 79, 1, CAST(2000000.00 AS Decimal(10, 2)), CAST(2000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (80, 80, 5, CAST(25000.00 AS Decimal(10, 2)), CAST(125000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (81, 81, 1, CAST(900000.00 AS Decimal(10, 2)), CAST(900000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (82, 82, 2, CAST(60000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (83, 83, 1, CAST(350000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (84, 84, 3, CAST(100000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (85, 85, 1, CAST(150000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (86, 86, 2, CAST(120000.00 AS Decimal(10, 2)), CAST(240000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (87, 87, 1, CAST(800000.00 AS Decimal(10, 2)), CAST(800000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (88, 88, 4, CAST(25000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (89, 89, 1, CAST(3000000.00 AS Decimal(10, 2)), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (90, 90, 2, CAST(50000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (91, 91, 1, CAST(7000000.00 AS Decimal(10, 2)), CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (92, 92, 3, CAST(35000.00 AS Decimal(10, 2)), CAST(105000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (93, 93, 1, CAST(400000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (94, 94, 2, CAST(120000.00 AS Decimal(10, 2)), CAST(240000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (95, 95, 1, CAST(150000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (96, 96, 5, CAST(25000.00 AS Decimal(10, 2)), CAST(125000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (97, 97, 1, CAST(600000.00 AS Decimal(10, 2)), CAST(600000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (98, 98, 2, CAST(80000.00 AS Decimal(10, 2)), CAST(160000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (99, 99, 1, CAST(2000000.00 AS Decimal(10, 2)), CAST(2000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDBan] ([MaHDBan], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (100, 100, 3, CAST(50000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (1, 1, 10, CAST(720000.00 AS Decimal(10, 2)), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (2, 2, 30, CAST(500000.00 AS Decimal(10, 2)), CAST(15000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (3, 3, 60, CAST(9000.00 AS Decimal(10, 2)), CAST(540000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (4, 4, 8, CAST(150000.00 AS Decimal(10, 2)), CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (5, 5, 30, CAST(70000.00 AS Decimal(10, 2)), CAST(2100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (6, 6, 20, CAST(240000.00 AS Decimal(10, 2)), CAST(4800000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (7, 7, 15, CAST(60000.00 AS Decimal(10, 2)), CAST(900000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (8, 8, 50, CAST(210000.00 AS Decimal(10, 2)), CAST(10500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (9, 9, 8, CAST(450000.00 AS Decimal(10, 2)), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (10, 10, 90, CAST(20000.00 AS Decimal(10, 2)), CAST(1800000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (11, 11, 20, CAST(310000.00 AS Decimal(10, 2)), CAST(6200000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (12, 12, 30, CAST(466667.00 AS Decimal(10, 2)), CAST(14000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (13, 13, 80, CAST(9500.00 AS Decimal(10, 2)), CAST(760000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (14, 14, 11, CAST(100000.00 AS Decimal(10, 2)), CAST(1100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (15, 15, 30, CAST(90000.00 AS Decimal(10, 2)), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (16, 16, 45, CAST(100000.00 AS Decimal(10, 2)), CAST(4500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (17, 17, 11, CAST(90000.00 AS Decimal(10, 2)), CAST(990000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (18, 18, 48, CAST(225000.00 AS Decimal(10, 2)), CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (19, 19, 74, CAST(50000.00 AS Decimal(10, 2)), CAST(3700000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (20, 20, 95, CAST(20000.00 AS Decimal(10, 2)), CAST(1900000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (21, 1, 41, CAST(200000.00 AS Decimal(10, 2)), CAST(8200000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (22, 2, 50, CAST(250000.00 AS Decimal(10, 2)), CAST(12500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (23, 3, 80, CAST(8000.00 AS Decimal(10, 2)), CAST(640000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (24, 4, 10, CAST(100000.00 AS Decimal(10, 2)), CAST(1000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (25, 5, 57, CAST(43860.00 AS Decimal(10, 2)), CAST(2500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (26, 6, 47, CAST(100000.00 AS Decimal(10, 2)), CAST(4700000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (27, 7, 29, CAST(30000.00 AS Decimal(10, 2)), CAST(870000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (28, 8, 38, CAST(250000.00 AS Decimal(10, 2)), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (29, 9, 62, CAST(50000.00 AS Decimal(10, 2)), CAST(3100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (30, 10, 70, CAST(25000.00 AS Decimal(10, 2)), CAST(1750000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (31, 11, 65, CAST(110000.00 AS Decimal(10, 2)), CAST(7150000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (32, 12, 58, CAST(250000.00 AS Decimal(10, 2)), CAST(14500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (33, 13, 57, CAST(10000.00 AS Decimal(10, 2)), CAST(570000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (34, 14, 9, CAST(150000.00 AS Decimal(10, 2)), CAST(1350000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (35, 15, 59, CAST(50000.00 AS Decimal(10, 2)), CAST(2950000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (36, 16, 41, CAST(100000.00 AS Decimal(10, 2)), CAST(4100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (37, 17, 19, CAST(50000.00 AS Decimal(10, 2)), CAST(950000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (38, 18, 56, CAST(200000.00 AS Decimal(10, 2)), CAST(11200000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (39, 19, 68, CAST(50000.00 AS Decimal(10, 2)), CAST(3400000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (40, 20, 84, CAST(25000.00 AS Decimal(10, 2)), CAST(2100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (41, 1, 82, CAST(95000.00 AS Decimal(10, 2)), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (42, 2, 52, CAST(250000.00 AS Decimal(10, 2)), CAST(13000000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (43, 3, 59, CAST(10000.00 AS Decimal(10, 2)), CAST(590000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (44, 4, 25, CAST(50000.00 AS Decimal(10, 2)), CAST(1250000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (45, 5, 57, CAST(50000.00 AS Decimal(10, 2)), CAST(2850000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (46, 6, 44, CAST(100000.00 AS Decimal(10, 2)), CAST(4400000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (47, 7, 49, CAST(20000.00 AS Decimal(10, 2)), CAST(980000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (48, 8, 51, CAST(200000.00 AS Decimal(10, 2)), CAST(10200000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (49, 9, 66, CAST(50000.00 AS Decimal(10, 2)), CAST(3300000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (50, 10, 80, CAST(20000.00 AS Decimal(10, 2)), CAST(1600000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (51, 11, 85, CAST(100000.00 AS Decimal(10, 2)), CAST(8500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (52, 12, 55, CAST(250000.00 AS Decimal(10, 2)), CAST(13750000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (53, 13, 53, CAST(10000.00 AS Decimal(10, 2)), CAST(530000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (54, 14, 10, CAST(145000.00 AS Decimal(10, 2)), CAST(1450000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (55, 15, 44, CAST(50000.00 AS Decimal(10, 2)), CAST(2200000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (56, 16, 46, CAST(100000.00 AS Decimal(10, 2)), CAST(4600000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (57, 17, 19, CAST(50000.00 AS Decimal(10, 2)), CAST(950000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (58, 18, 56, CAST(205000.00 AS Decimal(10, 2)), CAST(11500000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (59, 19, 71, CAST(50000.00 AS Decimal(10, 2)), CAST(3550000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (60, 20, 84, CAST(25000.00 AS Decimal(10, 2)), CAST(2100000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (61, 1, 85, CAST(90000.00 AS Decimal(10, 2)), CAST(7650000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (62, 2, 61, CAST(200000.00 AS Decimal(10, 2)), CAST(12200000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (63, 3, 79, CAST(9000.00 AS Decimal(10, 2)), CAST(710000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (64, 4, 10, CAST(95000.00 AS Decimal(10, 2)), CAST(950000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (65, 5, 61, CAST(50000.00 AS Decimal(10, 2)), CAST(3050000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (66, 6, 49, CAST(100000.00 AS Decimal(10, 2)), CAST(4900000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (67, 7, 51, CAST(20000.00 AS Decimal(10, 2)), CAST(1020000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (68, 8, 52, CAST(210000.00 AS Decimal(10, 2)), CAST(10920000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (69, 9, 74, CAST(50000.00 AS Decimal(10, 2)), CAST(3700000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (70, 10, 74, CAST(25000.00 AS Decimal(10, 2)), CAST(1850000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (71, 11, 53, CAST(150000.00 AS Decimal(10, 2)), CAST(7950000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (72, 12, 57, CAST(250000.00 AS Decimal(10, 2)), CAST(14250000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (73, 13, 65, CAST(10000.00 AS Decimal(10, 2)), CAST(650000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (74, 14, 12, CAST(115000.00 AS Decimal(10, 2)), CAST(1380000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (75, 15, 46, CAST(50000.00 AS Decimal(10, 2)), CAST(2300000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (76, 16, 43, CAST(100000.00 AS Decimal(10, 2)), CAST(4300000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (77, 17, 19, CAST(50000.00 AS Decimal(10, 2)), CAST(970000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (78, 18, 58, CAST(200000.00 AS Decimal(10, 2)), CAST(11600000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (79, 19, 65, CAST(50000.00 AS Decimal(10, 2)), CAST(3250000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (80, 20, 68, CAST(25000.00 AS Decimal(10, 2)), CAST(1700000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (81, 1, 83, CAST(100000.00 AS Decimal(10, 2)), CAST(8300000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (82, 2, 63, CAST(200000.00 AS Decimal(10, 2)), CAST(12600000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (83, 3, 67, CAST(10000.00 AS Decimal(10, 2)), CAST(670000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (84, 4, 10, CAST(112000.00 AS Decimal(10, 2)), CAST(1120000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (85, 5, 51, CAST(50000.00 AS Decimal(10, 2)), CAST(2550000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (86, 6, 48, CAST(100000.00 AS Decimal(10, 2)), CAST(4800000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (87, 7, 33, CAST(30000.00 AS Decimal(10, 2)), CAST(990000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (88, 8, 53, CAST(200000.00 AS Decimal(10, 2)), CAST(10600000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (89, 9, 69, CAST(50000.00 AS Decimal(10, 2)), CAST(3450000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (90, 10, 78, CAST(25000.00 AS Decimal(10, 2)), CAST(1950000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (91, 11, 47, CAST(150000.00 AS Decimal(10, 2)), CAST(7050000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (92, 12, 59, CAST(250000.00 AS Decimal(10, 2)), CAST(14750000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (93, 13, 58, CAST(10000.00 AS Decimal(10, 2)), CAST(580000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (94, 14, 13, CAST(125000.00 AS Decimal(10, 2)), CAST(1625000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (95, 15, 43, CAST(50000.00 AS Decimal(10, 2)), CAST(2150000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (96, 16, 42, CAST(100000.00 AS Decimal(10, 2)), CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (97, 17, 18, CAST(50000.00 AS Decimal(10, 2)), CAST(900000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (98, 18, 59, CAST(200000.00 AS Decimal(10, 2)), CAST(11800000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (99, 19, 65, CAST(50000.00 AS Decimal(10, 2)), CAST(3250000.00 AS Decimal(10, 2)))
INSERT [dbo].[ChiTietHDNhap] ([MaHDNhap], [MasP], [SoLuong], [DonGia], [ThanhTien]) VALUES (100, 20, 68, CAST(25000.00 AS Decimal(10, 2)), CAST(1700000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (1, 1)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (2, 2)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (3, 3)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (4, 3)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (4, 6)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (4, 7)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (5, 4)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (5, 8)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (5, 9)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (6, 5)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (6, 10)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (6, 11)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (7, 12)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (7, 13)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (8, 14)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (8, 15)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (9, 16)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (9, 17)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (10, 18)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (10, 19)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (11, 20)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (11, 21)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (12, 22)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (12, 23)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (13, 24)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (13, 25)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (14, 26)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (14, 27)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (15, 28)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (15, 29)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (16, 30)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (16, 31)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (17, 32)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (17, 33)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (18, 34)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (18, 35)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (19, 36)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (19, 37)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (20, 38)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (20, 39)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (21, 40)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (21, 41)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (22, 42)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (22, 43)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (23, 44)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (23, 45)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (24, 46)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (24, 47)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (25, 48)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (25, 49)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (26, 50)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (26, 51)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (27, 52)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (27, 53)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (28, 54)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (28, 55)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (29, 56)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (29, 57)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (30, 58)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (30, 59)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (31, 60)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (31, 61)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (32, 62)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (32, 63)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (33, 64)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (33, 65)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (34, 66)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (34, 67)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (35, 68)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (35, 69)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (36, 70)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (36, 71)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (37, 72)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (37, 73)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (38, 74)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (38, 75)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (39, 76)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (39, 77)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (40, 78)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (40, 79)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (41, 62)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (41, 80)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (42, 63)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (42, 64)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (43, 65)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (43, 66)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (44, 67)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (44, 68)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (45, 69)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (45, 70)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (46, 71)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (46, 72)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (47, 73)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (47, 74)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (48, 75)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (48, 76)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (49, 77)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (49, 78)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (50, 79)
INSERT [dbo].[ChiTietKhuyenMai] ([MaKM], [MasP]) VALUES (50, 80)
GO
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (1, 1, 50, 50, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (1, 2, 102, 100, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (2, 3, 200, 200, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (2, 4, 78, 80, -2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (3, 5, 150, 150, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (3, 6, 72, 70, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (4, 7, 118, 120, -2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (4, 8, 300, 300, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (5, 9, 60, 60, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (5, 10, 248, 250, -2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (6, 1, 100, 100, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (6, 2, 95, 100, -5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (7, 3, 110, 108, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (7, 4, 90, 90, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (8, 5, 130, 135, -5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (8, 6, 80, 80, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (9, 7, 120, 119, 1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (9, 8, 145, 150, -5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (10, 9, 60, 58, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (10, 10, 200, 200, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (11, 1, 101, 100, 1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (11, 2, 102, 100, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (12, 3, 199, 200, -1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (12, 4, 85, 85, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (13, 5, 140, 140, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (13, 6, 68, 70, -2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (14, 7, 117, 120, -3)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (14, 8, 310, 310, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (15, 9, 63, 60, 3)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (15, 10, 245, 250, -5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (16, 1, 48, 50, -2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (16, 2, 103, 100, 3)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (17, 3, 205, 200, 5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (17, 4, 82, 80, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (18, 5, 149, 150, -1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (18, 6, 75, 75, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (19, 7, 122, 120, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (19, 8, 298, 300, -2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (20, 9, 59, 60, -1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (20, 10, 260, 250, 10)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (21, 1, 50, 50, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (21, 2, 98, 100, -2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (22, 3, 198, 200, -2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (22, 4, 81, 80, 1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (23, 5, 155, 150, 5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (23, 6, 74, 70, 4)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (24, 7, 121, 120, 1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (24, 8, 302, 300, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (25, 9, 62, 60, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (25, 10, 240, 250, -10)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (26, 1, 49, 50, -1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (26, 2, 105, 100, 5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (27, 3, 201, 200, 1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (27, 4, 77, 80, -3)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (28, 5, 145, 150, -5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (28, 6, 73, 75, -2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (29, 7, 119, 120, -1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (29, 8, 295, 300, -5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (30, 9, 61, 60, 1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (30, 10, 255, 250, 5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (31, 1, 52, 50, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (31, 2, 97, 100, -3)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (32, 3, 203, 200, 3)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (32, 4, 83, 80, 3)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (33, 5, 151, 150, 1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (33, 6, 70, 70, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (34, 7, 115, 120, -5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (34, 8, 299, 300, -1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (35, 9, 65, 60, 5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (35, 10, 245, 250, -5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (36, 1, 50, 50, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (36, 2, 100, 100, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (37, 3, 200, 200, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (37, 4, 80, 80, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (38, 5, 150, 150, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (38, 6, 70, 70, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (39, 7, 120, 120, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (39, 8, 300, 300, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (40, 9, 60, 60, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (40, 10, 250, 250, 0)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (41, 1, 55, 50, 5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (41, 2, 110, 100, 10)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (42, 3, 190, 200, -10)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (42, 4, 85, 80, 5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (43, 5, 160, 150, 10)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (43, 6, 65, 70, -5)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (44, 7, 130, 120, 10)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (44, 8, 280, 300, -20)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (45, 9, 58, 60, -2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (45, 10, 240, 250, -10)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (46, 1, 51, 50, 1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (46, 2, 99, 100, -1)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (47, 3, 202, 200, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (47, 4, 82, 80, 2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (48, 5, 148, 150, -2)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (48, 6, 78, 75, 3)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (49, 7, 124, 120, 4)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (49, 8, 310, 300, 10)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (50, 9, 66, 60, 6)
INSERT [dbo].[ChiTietPhieuKiemKho] ([MaPhieuKK], [MasP], [SoLuongThucTe], [SoLuongHeThong], [ChenhLech]) VALUES (50, 10, 265, 250, 15)
GO
SET IDENTITY_INSERT [dbo].[HoaDonBan] ON 

INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (1, 1, 1, CAST(N'2025-04-22T20:44:08.363' AS DateTime), CAST(11400000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (2, 2, 2, CAST(N'2025-04-21T20:44:08.363' AS DateTime), CAST(450000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (3, 3, 3, CAST(N'2025-04-20T20:44:08.363' AS DateTime), CAST(72000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (4, 4, 4, CAST(N'2025-04-19T20:44:08.363' AS DateTime), CAST(225000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (5, 5, 5, CAST(N'2025-04-18T20:44:08.363' AS DateTime), CAST(315000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (6, 6, 6, CAST(N'2025-04-17T20:44:08.363' AS DateTime), CAST(108000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (7, 7, 7, CAST(N'2025-04-16T20:44:08.363' AS DateTime), CAST(84000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (8, 8, 8, CAST(N'2025-04-15T20:44:08.363' AS DateTime), CAST(36000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (9, 9, 9, CAST(N'2025-04-14T20:44:08.363' AS DateTime), CAST(760000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (10, 10, 10, CAST(N'2025-04-13T20:44:08.363' AS DateTime), CAST(31500.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (11, 11, 11, CAST(N'2025-04-12T20:44:08.363' AS DateTime), CAST(1500000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (12, 12, 12, CAST(N'2025-04-11T20:44:08.363' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (13, 13, 13, CAST(N'2025-04-10T20:44:08.363' AS DateTime), CAST(320000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (14, 14, 14, CAST(N'2025-04-09T20:44:08.363' AS DateTime), CAST(9500000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (15, 15, 15, CAST(N'2025-04-08T20:44:08.363' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (16, 16, 16, CAST(N'2025-04-07T20:44:08.363' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (17, 17, 17, CAST(N'2025-04-06T20:44:08.363' AS DateTime), CAST(2500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (18, 18, 18, CAST(N'2025-04-05T20:44:08.363' AS DateTime), CAST(60000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (19, 19, 19, CAST(N'2025-04-04T20:44:08.363' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (20, 20, 20, CAST(N'2025-04-03T20:44:08.363' AS DateTime), CAST(780000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (21, 21, 21, CAST(N'2025-04-02T20:44:08.363' AS DateTime), CAST(35000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (22, 22, 22, CAST(N'2025-04-01T20:44:08.363' AS DateTime), CAST(450000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (23, 23, 23, CAST(N'2025-03-31T20:44:08.363' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (24, 24, 24, CAST(N'2025-03-30T20:44:08.363' AS DateTime), CAST(95000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (25, 25, 25, CAST(N'2025-03-29T20:44:08.363' AS DateTime), CAST(300000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (26, 26, 26, CAST(N'2025-03-28T20:44:08.363' AS DateTime), CAST(15000000.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (27, 27, 27, CAST(N'2025-03-27T20:44:08.363' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (28, 28, 28, CAST(N'2025-03-26T20:44:08.363' AS DateTime), CAST(1800000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (29, 29, 29, CAST(N'2025-03-25T20:44:08.363' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (30, 30, 30, CAST(N'2025-03-24T20:44:08.363' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (31, 31, 31, CAST(N'2025-03-23T20:44:08.363' AS DateTime), CAST(250000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (32, 32, 32, CAST(N'2025-03-22T20:44:08.363' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (33, 33, 33, CAST(N'2025-03-21T20:44:08.363' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (34, 34, 34, CAST(N'2025-03-20T20:44:08.363' AS DateTime), CAST(150000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (35, 35, 35, CAST(N'2025-03-19T20:44:08.363' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (36, 36, 36, CAST(N'2025-03-18T20:44:08.363' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (37, 37, 37, CAST(N'2025-03-17T20:44:08.363' AS DateTime), CAST(900000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (38, 38, 38, CAST(N'2025-03-16T20:44:08.363' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (39, 39, 39, CAST(N'2025-03-15T20:44:08.363' AS DateTime), CAST(3500000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (40, 40, 40, CAST(N'2025-03-14T20:44:08.363' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (41, 41, 41, CAST(N'2025-03-13T20:44:08.363' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (42, 42, 42, CAST(N'2025-03-12T20:44:08.363' AS DateTime), CAST(2500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (43, 43, 43, CAST(N'2025-03-11T20:44:08.363' AS DateTime), CAST(95000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (44, 44, 44, CAST(N'2025-03-10T20:44:08.363' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (45, 45, 45, CAST(N'2025-03-09T20:44:08.363' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (46, 46, 46, CAST(N'2025-03-08T20:44:08.363' AS DateTime), CAST(1500000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (47, 47, 47, CAST(N'2025-03-07T20:44:08.363' AS DateTime), CAST(320000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (48, 48, 48, CAST(N'2025-03-06T20:44:08.363' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (49, 49, 49, CAST(N'2025-03-05T20:44:08.363' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (50, 50, 50, CAST(N'2025-03-04T20:44:08.363' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (51, 51, 51, CAST(N'2025-03-03T20:44:08.363' AS DateTime), CAST(9500000.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (52, 52, 52, CAST(N'2025-03-02T20:44:08.363' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (53, 53, 53, CAST(N'2025-03-01T20:44:08.363' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (54, 54, 54, CAST(N'2025-02-28T20:44:08.363' AS DateTime), CAST(2500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (55, 55, 55, CAST(N'2025-02-27T20:44:08.363' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (56, 56, 56, CAST(N'2025-02-26T20:44:08.363' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (57, 57, 57, CAST(N'2025-02-25T20:44:08.363' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (58, 58, 58, CAST(N'2025-02-24T20:44:08.363' AS DateTime), CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (59, 59, 59, CAST(N'2025-02-23T20:44:08.363' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (60, 60, 60, CAST(N'2025-02-22T20:44:08.363' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (61, 61, 61, CAST(N'2025-02-21T20:44:08.363' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (62, 62, 62, CAST(N'2025-02-20T20:44:08.363' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (63, 63, 63, CAST(N'2025-02-19T20:44:08.363' AS DateTime), CAST(1800000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (64, 64, 64, CAST(N'2025-02-18T20:44:08.363' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (65, 65, 65, CAST(N'2025-02-17T20:44:08.363' AS DateTime), CAST(95000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (66, 66, 66, CAST(N'2025-02-16T20:44:08.363' AS DateTime), CAST(250000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (67, 67, 67, CAST(N'2025-02-15T20:44:08.363' AS DateTime), CAST(1500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (68, 68, 68, CAST(N'2025-02-14T20:44:08.363' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (69, 69, 69, CAST(N'2025-02-13T20:44:08.363' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (70, 70, 70, CAST(N'2025-02-12T20:44:08.363' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (71, 71, 71, CAST(N'2025-02-11T20:44:08.363' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (72, 72, 72, CAST(N'2025-02-10T20:44:08.363' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (73, 73, 73, CAST(N'2025-02-09T20:44:08.363' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (74, 74, 74, CAST(N'2025-02-08T20:44:08.363' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (75, 75, 75, CAST(N'2025-02-07T20:44:08.363' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (76, 76, 76, CAST(N'2025-02-06T20:44:08.363' AS DateTime), CAST(9500000.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (77, 77, 77, CAST(N'2025-02-05T20:44:08.363' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (78, 78, 78, CAST(N'2025-02-04T20:44:08.363' AS DateTime), CAST(2500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (79, 79, 79, CAST(N'2025-02-03T20:44:08.363' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (80, 80, 80, CAST(N'2025-02-02T20:44:08.363' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (81, 81, 81, CAST(N'2025-02-01T20:44:08.363' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (82, 82, 82, CAST(N'2025-01-31T20:44:08.363' AS DateTime), CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (83, 83, 83, CAST(N'2025-01-30T20:44:08.363' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (84, 84, 84, CAST(N'2025-01-29T20:44:08.363' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (85, 85, 85, CAST(N'2025-01-28T20:44:08.363' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (86, 86, 86, CAST(N'2025-01-27T20:44:08.363' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (87, 87, 87, CAST(N'2025-01-26T20:44:08.363' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (88, 88, 88, CAST(N'2025-01-25T20:44:08.363' AS DateTime), CAST(9500000.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (89, 89, 89, CAST(N'2025-01-24T20:44:08.363' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (90, 90, 90, CAST(N'2025-01-23T20:44:08.363' AS DateTime), CAST(2500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (91, 91, 91, CAST(N'2025-01-22T20:44:08.363' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (92, 92, 92, CAST(N'2025-01-21T20:44:08.363' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (93, 93, 93, CAST(N'2025-01-20T20:44:08.363' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (94, 94, 94, CAST(N'2025-01-19T20:44:08.363' AS DateTime), CAST(150000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (95, 95, 95, CAST(N'2025-01-18T20:44:08.363' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (96, 96, 96, CAST(N'2025-01-17T20:44:08.363' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (97, 97, 97, CAST(N'2025-01-16T20:44:08.363' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (98, 98, 98, CAST(N'2025-01-15T20:44:08.363' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (99, 99, 99, CAST(N'2025-01-14T20:44:08.363' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
GO
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (100, 100, 100, CAST(N'2025-01-13T20:44:08.363' AS DateTime), CAST(9500000.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (101, 1, 1, CAST(N'2025-04-22T20:44:45.387' AS DateTime), CAST(11400000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (102, 2, 2, CAST(N'2025-04-21T20:44:45.387' AS DateTime), CAST(450000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (103, 3, 3, CAST(N'2025-04-20T20:44:45.387' AS DateTime), CAST(72000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (104, 4, 4, CAST(N'2025-04-19T20:44:45.387' AS DateTime), CAST(225000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (105, 5, 5, CAST(N'2025-04-18T20:44:45.387' AS DateTime), CAST(315000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (106, 6, 6, CAST(N'2025-04-17T20:44:45.387' AS DateTime), CAST(108000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (107, 7, 7, CAST(N'2025-04-16T20:44:45.387' AS DateTime), CAST(84000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (108, 8, 8, CAST(N'2025-04-15T20:44:45.387' AS DateTime), CAST(36000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (109, 9, 9, CAST(N'2025-04-14T20:44:45.387' AS DateTime), CAST(760000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (110, 10, 10, CAST(N'2025-04-13T20:44:45.387' AS DateTime), CAST(31500.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (111, 11, 11, CAST(N'2025-04-12T20:44:45.387' AS DateTime), CAST(1500000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (112, 12, 12, CAST(N'2025-04-11T20:44:45.387' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (113, 13, 13, CAST(N'2025-04-10T20:44:45.387' AS DateTime), CAST(320000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (114, 14, 14, CAST(N'2025-04-09T20:44:45.387' AS DateTime), CAST(9500000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (115, 15, 15, CAST(N'2025-04-08T20:44:45.387' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (116, 16, 16, CAST(N'2025-04-07T20:44:45.387' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (117, 17, 17, CAST(N'2025-04-06T20:44:45.387' AS DateTime), CAST(2500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (118, 18, 18, CAST(N'2025-04-05T20:44:45.387' AS DateTime), CAST(60000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (119, 19, 19, CAST(N'2025-04-04T20:44:45.387' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (120, 20, 20, CAST(N'2025-04-03T20:44:45.387' AS DateTime), CAST(780000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (121, 21, 21, CAST(N'2025-04-02T20:44:45.387' AS DateTime), CAST(35000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (122, 22, 22, CAST(N'2025-04-01T20:44:45.387' AS DateTime), CAST(450000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (123, 23, 23, CAST(N'2025-03-31T20:44:45.387' AS DateTime), CAST(2000000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (124, 24, 24, CAST(N'2025-03-30T20:44:45.387' AS DateTime), CAST(95000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (125, 25, 25, CAST(N'2025-03-29T20:44:45.387' AS DateTime), CAST(300000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (126, 26, 26, CAST(N'2025-03-28T20:44:45.387' AS DateTime), CAST(15000000.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (127, 27, 27, CAST(N'2025-03-27T20:44:45.387' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (128, 28, 28, CAST(N'2025-03-26T20:44:45.387' AS DateTime), CAST(1800000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (129, 29, 29, CAST(N'2025-03-25T20:44:45.387' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (130, 30, 30, CAST(N'2025-03-24T20:44:45.387' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (131, 31, 31, CAST(N'2025-03-23T20:44:45.387' AS DateTime), CAST(250000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (132, 32, 32, CAST(N'2025-03-22T20:44:45.387' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (133, 33, 33, CAST(N'2025-03-21T20:44:45.387' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (134, 34, 34, CAST(N'2025-03-20T20:44:45.387' AS DateTime), CAST(150000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (135, 35, 35, CAST(N'2025-03-19T20:44:45.387' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (136, 36, 36, CAST(N'2025-03-18T20:44:45.387' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (137, 37, 37, CAST(N'2025-03-17T20:44:45.387' AS DateTime), CAST(900000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (138, 38, 38, CAST(N'2025-03-16T20:44:45.387' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (139, 39, 39, CAST(N'2025-03-15T20:44:45.387' AS DateTime), CAST(3500000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (140, 40, 40, CAST(N'2025-03-14T20:44:45.387' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (141, 41, 41, CAST(N'2025-03-13T20:44:45.387' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (142, 42, 42, CAST(N'2025-03-12T20:44:45.387' AS DateTime), CAST(2500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (143, 43, 43, CAST(N'2025-03-11T20:44:45.387' AS DateTime), CAST(95000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (144, 44, 44, CAST(N'2025-03-10T20:44:45.387' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (145, 45, 45, CAST(N'2025-03-09T20:44:45.387' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (146, 46, 46, CAST(N'2025-03-08T20:44:45.387' AS DateTime), CAST(1500000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (147, 47, 47, CAST(N'2025-03-07T20:44:45.387' AS DateTime), CAST(320000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (148, 48, 48, CAST(N'2025-03-06T20:44:45.387' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (149, 49, 49, CAST(N'2025-03-05T20:44:45.387' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (150, 50, 50, CAST(N'2025-03-04T20:44:45.387' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (151, 51, 51, CAST(N'2025-03-03T20:44:45.387' AS DateTime), CAST(9500000.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (152, 52, 52, CAST(N'2025-03-02T20:44:45.387' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (153, 53, 53, CAST(N'2025-03-01T20:44:45.387' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (154, 54, 54, CAST(N'2025-02-28T20:44:45.387' AS DateTime), CAST(2500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (155, 55, 55, CAST(N'2025-02-27T20:44:45.387' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (156, 56, 56, CAST(N'2025-02-26T20:44:45.387' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (157, 57, 57, CAST(N'2025-02-25T20:44:45.387' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (158, 58, 58, CAST(N'2025-02-24T20:44:45.387' AS DateTime), CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (159, 59, 59, CAST(N'2025-02-23T20:44:45.387' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (160, 60, 60, CAST(N'2025-02-22T20:44:45.387' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (161, 61, 61, CAST(N'2025-02-21T20:44:45.387' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (162, 62, 62, CAST(N'2025-02-20T20:44:45.387' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (163, 63, 63, CAST(N'2025-02-19T20:44:45.387' AS DateTime), CAST(1800000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (164, 64, 64, CAST(N'2025-02-18T20:44:45.387' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (165, 65, 65, CAST(N'2025-02-17T20:44:45.387' AS DateTime), CAST(95000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (166, 66, 66, CAST(N'2025-02-16T20:44:45.387' AS DateTime), CAST(250000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (167, 67, 67, CAST(N'2025-02-15T20:44:45.387' AS DateTime), CAST(1500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (168, 68, 68, CAST(N'2025-02-14T20:44:45.387' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (169, 69, 69, CAST(N'2025-02-13T20:44:45.387' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (170, 70, 70, CAST(N'2025-02-12T20:44:45.387' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (171, 71, 71, CAST(N'2025-02-11T20:44:45.387' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (172, 72, 72, CAST(N'2025-02-10T20:44:45.387' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (173, 73, 73, CAST(N'2025-02-09T20:44:45.387' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (174, 74, 74, CAST(N'2025-02-08T20:44:45.387' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (175, 75, 75, CAST(N'2025-02-07T20:44:45.387' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (176, 76, 76, CAST(N'2025-02-06T20:44:45.387' AS DateTime), CAST(9500000.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (177, 77, 77, CAST(N'2025-02-05T20:44:45.387' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (178, 78, 78, CAST(N'2025-02-04T20:44:45.387' AS DateTime), CAST(2500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (179, 79, 79, CAST(N'2025-02-03T20:44:45.387' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (180, 80, 80, CAST(N'2025-02-02T20:44:45.387' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (181, 81, 81, CAST(N'2025-02-01T20:44:45.387' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (182, 82, 82, CAST(N'2025-01-31T20:44:45.387' AS DateTime), CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (183, 83, 83, CAST(N'2025-01-30T20:44:45.387' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (184, 84, 84, CAST(N'2025-01-29T20:44:45.387' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (185, 85, 85, CAST(N'2025-01-28T20:44:45.387' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (186, 86, 86, CAST(N'2025-01-27T20:44:45.387' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (187, 87, 87, CAST(N'2025-01-26T20:44:45.387' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (188, 88, 88, CAST(N'2025-01-25T20:44:45.387' AS DateTime), CAST(9500000.00 AS Decimal(10, 2)), 40)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (189, 89, 89, CAST(N'2025-01-24T20:44:45.387' AS DateTime), CAST(45000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (190, 90, 90, CAST(N'2025-01-23T20:44:45.387' AS DateTime), CAST(2500000.00 AS Decimal(10, 2)), 20)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (191, 91, 91, CAST(N'2025-01-22T20:44:45.387' AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (192, 92, 92, CAST(N'2025-01-21T20:44:45.387' AS DateTime), CAST(420000.00 AS Decimal(10, 2)), 15)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (193, 93, 93, CAST(N'2025-01-20T20:44:45.387' AS DateTime), CAST(75000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (194, 94, 94, CAST(N'2025-01-19T20:44:45.387' AS DateTime), CAST(150000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (195, 95, 95, CAST(N'2025-01-18T20:44:45.387' AS DateTime), CAST(3200000.00 AS Decimal(10, 2)), 30)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (196, 96, 96, CAST(N'2025-01-17T20:44:45.387' AS DateTime), CAST(85000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (197, 97, 97, CAST(N'2025-01-16T20:44:45.387' AS DateTime), CAST(180000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (198, 98, 98, CAST(N'2025-01-15T20:44:45.387' AS DateTime), CAST(600000.00 AS Decimal(10, 2)), 25)
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (199, 99, 99, CAST(N'2025-01-14T20:44:45.387' AS DateTime), CAST(120000.00 AS Decimal(10, 2)), 10)
GO
INSERT [dbo].[HoaDonBan] ([MaHDBan], [MaNV], [MaKH], [NgayBan], [TongTien], [DiemSuDung]) VALUES (200, 100, 100, CAST(N'2025-01-13T20:44:45.387' AS DateTime), CAST(9500000.00 AS Decimal(10, 2)), 40)
SET IDENTITY_INSERT [dbo].[HoaDonBan] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDonNhap] ON 

INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (1, 2, 1, CAST(N'2025-04-12T20:44:08.433' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (2, 3, 2, CAST(N'2025-04-11T20:44:08.433' AS DateTime), CAST(15000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (3, 4, 3, CAST(N'2025-04-10T20:44:08.433' AS DateTime), CAST(540000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (4, 5, 4, CAST(N'2025-04-09T20:44:08.433' AS DateTime), CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (5, 6, 5, CAST(N'2025-04-08T20:44:08.433' AS DateTime), CAST(2100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (6, 7, 6, CAST(N'2025-04-07T20:44:08.433' AS DateTime), CAST(4800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (7, 8, 7, CAST(N'2025-04-06T20:44:08.433' AS DateTime), CAST(900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (8, 9, 8, CAST(N'2025-04-05T20:44:08.433' AS DateTime), CAST(10500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (9, 10, 9, CAST(N'2025-04-04T20:44:08.433' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (10, 1, 10, CAST(N'2025-04-03T20:44:08.433' AS DateTime), CAST(1800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (11, 11, 11, CAST(N'2025-04-02T20:44:08.433' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (12, 12, 12, CAST(N'2025-04-01T20:44:08.433' AS DateTime), CAST(6300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (13, 13, 13, CAST(N'2025-03-31T20:44:08.433' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (14, 14, 14, CAST(N'2025-03-30T20:44:08.433' AS DateTime), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (15, 15, 15, CAST(N'2025-03-29T20:44:08.433' AS DateTime), CAST(1500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (16, 16, 16, CAST(N'2025-03-28T20:44:08.433' AS DateTime), CAST(9600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (17, 17, 17, CAST(N'2025-03-27T20:44:08.433' AS DateTime), CAST(3300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (18, 18, 18, CAST(N'2025-03-26T20:44:08.433' AS DateTime), CAST(5700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (19, 19, 19, CAST(N'2025-03-25T20:44:08.433' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (20, 20, 20, CAST(N'2025-03-24T20:44:08.433' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (21, 21, 21, CAST(N'2025-03-23T20:44:08.433' AS DateTime), CAST(3900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (22, 22, 22, CAST(N'2025-03-22T20:44:08.433' AS DateTime), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (23, 23, 23, CAST(N'2025-03-21T20:44:08.433' AS DateTime), CAST(1800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (24, 24, 24, CAST(N'2025-03-20T20:44:08.433' AS DateTime), CAST(5100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (25, 25, 25, CAST(N'2025-03-19T20:44:08.433' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (26, 26, 26, CAST(N'2025-03-18T20:44:08.433' AS DateTime), CAST(7500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (27, 27, 27, CAST(N'2025-03-17T20:44:08.433' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (28, 28, 28, CAST(N'2025-03-16T20:44:08.433' AS DateTime), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (29, 29, 29, CAST(N'2025-03-15T20:44:08.433' AS DateTime), CAST(2100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (30, 30, 30, CAST(N'2025-03-14T20:44:08.433' AS DateTime), CAST(6000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (31, 31, 31, CAST(N'2025-03-13T20:44:08.433' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (32, 32, 32, CAST(N'2025-03-12T20:44:08.433' AS DateTime), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (33, 33, 33, CAST(N'2025-03-11T20:44:08.433' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (34, 34, 34, CAST(N'2025-03-10T20:44:08.433' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (35, 35, 35, CAST(N'2025-03-09T20:44:08.433' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (36, 36, 36, CAST(N'2025-03-08T20:44:08.433' AS DateTime), CAST(8400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (37, 37, 37, CAST(N'2025-03-07T20:44:08.433' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (38, 38, 38, CAST(N'2025-03-06T20:44:08.433' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (39, 39, 39, CAST(N'2025-03-05T20:44:08.433' AS DateTime), CAST(3900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (40, 40, 40, CAST(N'2025-03-04T20:44:08.433' AS DateTime), CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (41, 41, 41, CAST(N'2025-03-03T20:44:08.433' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (42, 42, 42, CAST(N'2025-03-02T20:44:08.433' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (43, 43, 43, CAST(N'2025-03-01T20:44:08.433' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (44, 44, 44, CAST(N'2025-02-28T20:44:08.433' AS DateTime), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (45, 45, 45, CAST(N'2025-02-27T20:44:08.433' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (46, 46, 46, CAST(N'2025-02-26T20:44:08.433' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (47, 47, 47, CAST(N'2025-02-25T20:44:08.433' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (48, 48, 48, CAST(N'2025-02-24T20:44:08.433' AS DateTime), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (49, 49, 49, CAST(N'2025-02-23T20:44:08.433' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (50, 50, 50, CAST(N'2025-02-22T20:44:08.433' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (51, 51, 51, CAST(N'2025-02-21T20:44:08.433' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (52, 52, 52, CAST(N'2025-02-20T20:44:08.433' AS DateTime), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (53, 53, 53, CAST(N'2025-02-19T20:44:08.433' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (54, 54, 54, CAST(N'2025-02-18T20:44:08.433' AS DateTime), CAST(7500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (55, 55, 55, CAST(N'2025-02-17T20:44:08.433' AS DateTime), CAST(3900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (56, 56, 56, CAST(N'2025-02-16T20:44:08.433' AS DateTime), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (57, 57, 57, CAST(N'2025-02-15T20:44:08.433' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (58, 58, 58, CAST(N'2025-02-14T20:44:08.433' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (59, 59, 59, CAST(N'2025-02-13T20:44:08.433' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (60, 60, 60, CAST(N'2025-02-12T20:44:08.433' AS DateTime), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (61, 61, 61, CAST(N'2025-02-11T20:44:08.433' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (62, 62, 62, CAST(N'2025-02-10T20:44:08.433' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (63, 63, 63, CAST(N'2025-02-09T20:44:08.433' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (64, 64, 64, CAST(N'2025-02-08T20:44:08.433' AS DateTime), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (65, 65, 65, CAST(N'2025-02-07T20:44:08.433' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (66, 66, 66, CAST(N'2025-02-06T20:44:08.433' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (67, 67, 67, CAST(N'2025-02-05T20:44:08.433' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (68, 68, 68, CAST(N'2025-02-04T20:44:08.433' AS DateTime), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (69, 69, 69, CAST(N'2025-02-03T20:44:08.433' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (70, 70, 70, CAST(N'2025-02-02T20:44:08.433' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (71, 71, 71, CAST(N'2025-02-01T20:44:08.433' AS DateTime), CAST(3900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (72, 72, 72, CAST(N'2025-01-31T20:44:08.433' AS DateTime), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (73, 73, 73, CAST(N'2025-01-30T20:44:08.433' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (74, 74, 74, CAST(N'2025-01-29T20:44:08.433' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (75, 75, 75, CAST(N'2025-01-28T20:44:08.433' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (76, 76, 76, CAST(N'2025-01-27T20:44:08.433' AS DateTime), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (77, 77, 77, CAST(N'2025-01-26T20:44:08.433' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (78, 78, 78, CAST(N'2025-01-25T20:44:08.433' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (79, 79, 79, CAST(N'2025-01-24T20:44:08.433' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (80, 80, 80, CAST(N'2025-01-23T20:44:08.433' AS DateTime), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (81, 81, 81, CAST(N'2025-01-22T20:44:08.433' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (82, 82, 82, CAST(N'2025-01-21T20:44:08.433' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (83, 83, 83, CAST(N'2025-01-20T20:44:08.433' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (84, 84, 84, CAST(N'2025-01-19T20:44:08.433' AS DateTime), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (85, 85, 85, CAST(N'2025-01-18T20:44:08.433' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (86, 86, 86, CAST(N'2025-01-17T20:44:08.433' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (87, 87, 87, CAST(N'2025-01-16T20:44:08.433' AS DateTime), CAST(3900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (88, 88, 88, CAST(N'2025-01-15T20:44:08.433' AS DateTime), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (89, 89, 89, CAST(N'2025-01-14T20:44:08.433' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (90, 90, 90, CAST(N'2025-01-13T20:44:08.433' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (91, 91, 91, CAST(N'2025-01-12T20:44:08.433' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (92, 92, 92, CAST(N'2025-01-11T20:44:08.433' AS DateTime), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (93, 93, 93, CAST(N'2025-01-10T20:44:08.433' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (94, 94, 94, CAST(N'2025-01-09T20:44:08.433' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (95, 95, 95, CAST(N'2025-01-08T20:44:08.433' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (96, 96, 96, CAST(N'2025-01-07T20:44:08.433' AS DateTime), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (97, 97, 97, CAST(N'2025-01-06T20:44:08.433' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (98, 98, 98, CAST(N'2025-01-05T20:44:08.433' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (99, 99, 99, CAST(N'2025-01-04T20:44:08.433' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (100, 100, 100, CAST(N'2025-01-03T20:44:08.433' AS DateTime), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (101, 2, 1, CAST(N'2025-04-12T20:44:45.437' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (102, 3, 2, CAST(N'2025-04-11T20:44:45.437' AS DateTime), CAST(15000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (103, 4, 3, CAST(N'2025-04-10T20:44:45.437' AS DateTime), CAST(540000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (104, 5, 4, CAST(N'2025-04-09T20:44:45.437' AS DateTime), CAST(1200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (105, 6, 5, CAST(N'2025-04-08T20:44:45.437' AS DateTime), CAST(2100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (106, 7, 6, CAST(N'2025-04-07T20:44:45.437' AS DateTime), CAST(4800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (107, 8, 7, CAST(N'2025-04-06T20:44:45.437' AS DateTime), CAST(900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (108, 9, 8, CAST(N'2025-04-05T20:44:45.437' AS DateTime), CAST(10500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (109, 10, 9, CAST(N'2025-04-04T20:44:45.437' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (110, 1, 10, CAST(N'2025-04-03T20:44:45.437' AS DateTime), CAST(1800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (111, 11, 11, CAST(N'2025-04-02T20:44:45.437' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (112, 12, 12, CAST(N'2025-04-01T20:44:45.437' AS DateTime), CAST(6300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (113, 13, 13, CAST(N'2025-03-31T20:44:45.437' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (114, 14, 14, CAST(N'2025-03-30T20:44:45.437' AS DateTime), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (115, 15, 15, CAST(N'2025-03-29T20:44:45.437' AS DateTime), CAST(1500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (116, 16, 16, CAST(N'2025-03-28T20:44:45.437' AS DateTime), CAST(9600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (117, 17, 17, CAST(N'2025-03-27T20:44:45.437' AS DateTime), CAST(3300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (118, 18, 18, CAST(N'2025-03-26T20:44:45.437' AS DateTime), CAST(5700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (119, 19, 19, CAST(N'2025-03-25T20:44:45.437' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (120, 20, 20, CAST(N'2025-03-24T20:44:45.437' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (121, 21, 21, CAST(N'2025-03-23T20:44:45.437' AS DateTime), CAST(3900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (122, 22, 22, CAST(N'2025-03-22T20:44:45.437' AS DateTime), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (123, 23, 23, CAST(N'2025-03-21T20:44:45.437' AS DateTime), CAST(1800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (124, 24, 24, CAST(N'2025-03-20T20:44:45.437' AS DateTime), CAST(5100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (125, 25, 25, CAST(N'2025-03-19T20:44:45.437' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (126, 26, 26, CAST(N'2025-03-18T20:44:45.437' AS DateTime), CAST(7500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (127, 27, 27, CAST(N'2025-03-17T20:44:45.437' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (128, 28, 28, CAST(N'2025-03-16T20:44:45.437' AS DateTime), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (129, 29, 29, CAST(N'2025-03-15T20:44:45.437' AS DateTime), CAST(2100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (130, 30, 30, CAST(N'2025-03-14T20:44:45.437' AS DateTime), CAST(6000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (131, 31, 31, CAST(N'2025-03-13T20:44:45.437' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (132, 32, 32, CAST(N'2025-03-12T20:44:45.437' AS DateTime), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (133, 33, 33, CAST(N'2025-03-11T20:44:45.437' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (134, 34, 34, CAST(N'2025-03-10T20:44:45.437' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (135, 35, 35, CAST(N'2025-03-09T20:44:45.437' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (136, 36, 36, CAST(N'2025-03-08T20:44:45.437' AS DateTime), CAST(8400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (137, 37, 37, CAST(N'2025-03-07T20:44:45.437' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (138, 38, 38, CAST(N'2025-03-06T20:44:45.437' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (139, 39, 39, CAST(N'2025-03-05T20:44:45.437' AS DateTime), CAST(3900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (140, 40, 40, CAST(N'2025-03-04T20:44:45.437' AS DateTime), CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (141, 41, 41, CAST(N'2025-03-03T20:44:45.437' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (142, 42, 42, CAST(N'2025-03-02T20:44:45.437' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (143, 43, 43, CAST(N'2025-03-01T20:44:45.437' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (144, 44, 44, CAST(N'2025-02-28T20:44:45.437' AS DateTime), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (145, 45, 45, CAST(N'2025-02-27T20:44:45.437' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (146, 46, 46, CAST(N'2025-02-26T20:44:45.437' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (147, 47, 47, CAST(N'2025-02-25T20:44:45.437' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (148, 48, 48, CAST(N'2025-02-24T20:44:45.437' AS DateTime), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (149, 49, 49, CAST(N'2025-02-23T20:44:45.437' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (150, 50, 50, CAST(N'2025-02-22T20:44:45.437' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (151, 51, 51, CAST(N'2025-02-21T20:44:45.437' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (152, 52, 52, CAST(N'2025-02-20T20:44:45.437' AS DateTime), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (153, 53, 53, CAST(N'2025-02-19T20:44:45.437' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (154, 54, 54, CAST(N'2025-02-18T20:44:45.437' AS DateTime), CAST(7500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (155, 55, 55, CAST(N'2025-02-17T20:44:45.437' AS DateTime), CAST(3900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (156, 56, 56, CAST(N'2025-02-16T20:44:45.437' AS DateTime), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (157, 57, 57, CAST(N'2025-02-15T20:44:45.437' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (158, 58, 58, CAST(N'2025-02-14T20:44:45.437' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (159, 59, 59, CAST(N'2025-02-13T20:44:45.437' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (160, 60, 60, CAST(N'2025-02-12T20:44:45.437' AS DateTime), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (161, 61, 61, CAST(N'2025-02-11T20:44:45.437' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (162, 62, 62, CAST(N'2025-02-10T20:44:45.437' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (163, 63, 63, CAST(N'2025-02-09T20:44:45.437' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (164, 64, 64, CAST(N'2025-02-08T20:44:45.437' AS DateTime), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (165, 65, 65, CAST(N'2025-02-07T20:44:45.437' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (166, 66, 66, CAST(N'2025-02-06T20:44:45.437' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (167, 67, 67, CAST(N'2025-02-05T20:44:45.437' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (168, 68, 68, CAST(N'2025-02-04T20:44:45.437' AS DateTime), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (169, 69, 69, CAST(N'2025-02-03T20:44:45.437' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (170, 70, 70, CAST(N'2025-02-02T20:44:45.437' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (171, 71, 71, CAST(N'2025-02-01T20:44:45.437' AS DateTime), CAST(3900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (172, 72, 72, CAST(N'2025-01-31T20:44:45.437' AS DateTime), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (173, 73, 73, CAST(N'2025-01-30T20:44:45.437' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (174, 74, 74, CAST(N'2025-01-29T20:44:45.437' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (175, 75, 75, CAST(N'2025-01-28T20:44:45.437' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (176, 76, 76, CAST(N'2025-01-27T20:44:45.437' AS DateTime), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (177, 77, 77, CAST(N'2025-01-26T20:44:45.437' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (178, 78, 78, CAST(N'2025-01-25T20:44:45.437' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (179, 79, 79, CAST(N'2025-01-24T20:44:45.437' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (180, 80, 80, CAST(N'2025-01-23T20:44:45.437' AS DateTime), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (181, 81, 81, CAST(N'2025-01-22T20:44:45.437' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (182, 82, 82, CAST(N'2025-01-21T20:44:45.437' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (183, 83, 83, CAST(N'2025-01-20T20:44:45.437' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (184, 84, 84, CAST(N'2025-01-19T20:44:45.437' AS DateTime), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (185, 85, 85, CAST(N'2025-01-18T20:44:45.437' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (186, 86, 86, CAST(N'2025-01-17T20:44:45.437' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (187, 87, 87, CAST(N'2025-01-16T20:44:45.437' AS DateTime), CAST(3900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (188, 88, 88, CAST(N'2025-01-15T20:44:45.437' AS DateTime), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (189, 89, 89, CAST(N'2025-01-14T20:44:45.437' AS DateTime), CAST(3000000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (190, 90, 90, CAST(N'2025-01-13T20:44:45.437' AS DateTime), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (191, 91, 91, CAST(N'2025-01-12T20:44:45.437' AS DateTime), CAST(4500000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (192, 92, 92, CAST(N'2025-01-11T20:44:45.437' AS DateTime), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (193, 93, 93, CAST(N'2025-01-10T20:44:45.437' AS DateTime), CAST(2700000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (194, 94, 94, CAST(N'2025-01-09T20:44:45.437' AS DateTime), CAST(6600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (195, 95, 95, CAST(N'2025-01-08T20:44:45.437' AS DateTime), CAST(3600000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (196, 96, 96, CAST(N'2025-01-07T20:44:45.437' AS DateTime), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (197, 97, 97, CAST(N'2025-01-06T20:44:45.437' AS DateTime), CAST(2400000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (198, 98, 98, CAST(N'2025-01-05T20:44:45.437' AS DateTime), CAST(7200000.00 AS Decimal(10, 2)))
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (199, 99, 99, CAST(N'2025-01-04T20:44:45.437' AS DateTime), CAST(4200000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[HoaDonNhap] ([MaHDNhap], [MaNV], [MaNCC], [NgayNhap], [TongTien]) VALUES (200, 100, 100, CAST(N'2025-01-03T20:44:45.437' AS DateTime), CAST(8700000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[HoaDonNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (1, N'Lê Thị M', N'093123456', N'30 Đường Bà Triệu, Hà Nội', N'mle@email.com', 150)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (2, N'Phan Văn N', N'0988765432', N'60 Phố Tràng Thi, Hà Nội', N'n.phan@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (3, N'Hoàng Thị O', N'0911223344', N'90 Đường Hai Bà Trưng, Hà Nội', N'o.hoang@email.com', 100)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (4, N'Trịnh Văn P', N'0977889900', N'120 Đường Nguyễn Du, Hà Nội', N'p.trinh@email.com', 250)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (5, N'Vũ Thị Q', N'0933445566', N'150 Đường Lý Thường Kiệt, Hà Nội', N'q.vu@email.cm', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (6, N'Ngô Văn R', N'0966554433', N'180 Đường Trần Hưng Đạo, Hà Nội', N'r.ngo@email.com', 220)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (7, N'Bùi Thị S', N'0944667788', N'210 Đường Quang Trung, Hà Nội', N's.bui@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (8, N'Đào Văn T', N'0922778899', N'240 Đường Tây Hồ, Hà Nội', N't.dao@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (9, N'Lâm Thị U', N'0909998877', N'270 Đường Âu Cơ, Hà Nội', N'u.lam@email.com', 230)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (10, N'Lâm manh tu', N'0339998877', N'270 thanh xuân, Hà Nội', N'tub@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (11, N'Nguyễn Thị Hồng', N'0901234501', N'12 Nguyễn Trãi, Hà Nội', N'hong.nguyen@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (12, N'Lê Văn Dũng', N'0912345602', N'45 Trần Hưng Đạo, TP.HCM', N'dung.le@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (13, N'Trần Thị Mai', N'0923456703', N'78 Lê Lợi, Đà Nẵng', N'mai.tran@email.com', 150)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (14, N'Phạm Văn Khoa', N'0934567804', N'99 Hai Bà Trưng, Hải Phòng', N'khoa.pham@email.com', 240)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (15, N'Hoàng Thị Ngọc', N'0945678905', N'23 Nguyễn Văn Cừ, Huế', N'ngoc.hoang@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (16, N'Đặng Văn Minh', N'0956789006', N'56 Lê Duẩn, Cần Thơ', N'minh.dang@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (17, N'Bùi Thị Lan', N'0967890107', N'10 Trần Phú, Bắc Ninh', N'lan.bui@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (18, N'Vũ Văn Hùng', N'0978901208', N'67 Đinh Tiên Hoàng, Thanh Hóa', N'hung.vu@email.com', 220)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (19, N'Ngô Thị Hạnh', N'0989012309', N'34 Nguyễn Huệ, Ninh Bình', N'hanh.ngo@email.com', 165)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (20, N'Lý Văn Sơn', N'0990123410', N'89 Phan Đình Phùng, Hà Nam', N'son.ly@email.com', 230)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (21, N'Phan Thị Huệ', N'0901123411', N'21 Cầu Giấy, Hà Nội', N'hue.phan@email.com', 150)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (22, N'Huỳnh Văn Tài', N'0912234512', N'76 Nguyễn Khuyến, TP.HCM', N'tai.huynh@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (23, N'Cao Thị Tuyết', N'0923345613', N'33 Phạm Văn Đồng, Đà Nẵng', N'tuyet.cao@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (24, N'Mai Văn Hiếu', N'0934456714', N'88 Nguyễn Trãi, Cần Thơ', N'hieu.mai@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (25, N'Tô Thị Bình', N'0945567815', N'17 Phan Chu Trinh, Hải Dương', N'binh.to@email.com', 195)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (26, N'Châu Văn Toàn', N'0956678916', N'42 Điện Biên Phủ, Vũng Tàu', N'toan.chau@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (27, N'Lâm Thị Nhung', N'0967789017', N'61 Tôn Đức Thắng, Quảng Ngãi', N'nhung.lam@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (28, N'Tống Văn Quân', N'0978890118', N'84 Nguyễn Đình Chiểu, Đà Lạt', N'quan.tong@email.com', 220)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (29, N'Kiều Thị Giang', N'0989901219', N'19 Hùng Vương, Bắc Giang', N'giang.kieu@email.com', 205)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (30, N'Triệu Văn Phúc', N'0991012320', N'35 Trưng Trắc, Hải Phòng', N'phuc.trieu@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (31, N'Tạ Thị Hương', N'0902123421', N'72 Nguyễn Du, Hà Nội', N'huong.ta@email.com', 240)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (32, N'Thạch Văn Duy', N'0913234522', N'38 Trần Quang Khải, TP.HCM', N'duy.thach@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (33, N'Dương Thị Kim', N'0924345623', N'27 Lê Lai, Đà Nẵng', N'kim.duong@email.com', 215)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (34, N'Đoàn Văn Hoài', N'0935456724', N'64 Phạm Hùng, Huế', N'hoai.doan@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (35, N'Thái Thị Thanh', N'0946567825', N'14 Nguyễn Bỉnh Khiêm, Cần Thơ', N'thanh.thai@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (36, N'Hứa Văn Thắng', N'0957678926', N'83 Nguyễn Tri Phương, Bình Dương', N'thang.hua@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (37, N'Thân Thị Trinh', N'0968789027', N'25 Tân Sơn Nhì, Đồng Nai', N'trinh.than@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (38, N'Tăng Văn Hào', N'0979890128', N'46 Lý Chính Thắng, Hà Nội', N'hao.tang@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (39, N'Mạc Thị Thảo', N'0980901239', N'30 Nguyễn Gia Thiều, TP.HCM', N'thao.mac@email.com', 195)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (40, N'La Văn Tùng', N'0992012340', N'58 Trần Bình Trọng, Hà Tĩnh', N'tung.la@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (41, N'Từ Thị Mai', N'0903012341', N'13 Nguyễn Phong Sắc, Quảng Trị', N'mai.tu@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (42, N'Liễu Văn Bảo', N'0914123442', N'66 Nguyễn Kiệm, Bắc Ninh', N'bao.lieu@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (43, N'Triều Thị Quỳnh', N'0925234543', N'39 Trường Chinh, Thái Bình', N'quynh.trieu@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (44, N'Từ Văn Đức', N'0936345644', N'20 Trần Cao Vân, Bình Phước', N'duc.tu@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (45, N'Vi Thị Ngân', N'0947456745', N'77 Lạc Long Quân, Quảng Nam', N'ngan.vi@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (46, N'Trình Văn Nam', N'0958567846', N'55 Trần Hữu Dực, Hưng Yên', N'nam.trinh@email.com', 220)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (47, N'Lữ Thị Liên', N'0969678947', N'28 Xô Viết Nghệ Tĩnh, Nghệ An', N'lien.lu@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (48, N'Hầu Văn Khánh', N'0970789048', N'60 Phan Bội Châu, Hà Giang', N'khanh.hau@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (49, N'Triệu Thị Duyên', N'0981890149', N'31 Trần Đại Nghĩa, Sơn La', N'duyen.trieu@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (50, N'Bàng Văn Hòa', N'0992901250', N'74 Trần Nhật Duật, Tuyên Quang', N'hoa.bang@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (51, N'Giàng Thị Mỵ', N'0904012351', N'36 Nguyễn Cảnh Chân, Lào Cai', N'my.giang@email.com', 150)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (52, N'Tạ Văn Khôi', N'0915123452', N'10 Nguyễn Hữu Cảnh, TP.HCM', N'khoi.ta@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (53, N'Tống Thị Hân', N'0926234553', N'59 Trần Khánh Dư, Hà Nội', N'han.tong@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (54, N'Cổ Văn Sỹ', N'0937345654', N'28 Tạ Quang Bửu, Đà Nẵng', N'sy.co@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (55, N'Phùng Thị Hằng', N'0948456755', N'81 Lê Thánh Tông, Cần Thơ', N'hang.phung@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (56, N'Tôn Văn Hữu', N'0959567856', N'44 Nguyễn Tất Thành, Hải Phòng', N'huu.ton@email.com', 215)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (57, N'Trịnh Thị Nhã', N'0960678957', N'22 Lương Ngọc Quyến, Thái Nguyên', N'nha.trinh@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (58, N'Quách Văn Tâm', N'0971789058', N'75 Lê Văn Lương, Hà Nội', N'tam.quach@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (59, N'Đinh Thị Yến', N'0982890159', N'47 Nguyễn Văn Linh, Huế', N'yen.dinh@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (60, N'Thạch Văn Lâm', N'0993901260', N'31 Quang Trung, Đồng Nai', N'lam.thach@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (61, N'Từ Thị Hoa', N'0905012361', N'53 Nguyễn Văn Huyên, Hà Nội', N'hoa.tu@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (62, N'Triệu Văn Bình', N'0916123462', N'29 Cách Mạng Tháng Tám, TP.HCM', N'binh.trieu@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (63, N'Lê Thị Lệ', N'0927234563', N'70 Điện Biên Phủ, Đà Nẵng', N'le.le@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (64, N'Nguyễn Văn Hải', N'0938345664', N'35 Hoàng Diệu, Cần Thơ', N'hai.nguyen@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (65, N'Phạm Thị Quyên', N'0949456765', N'84 Võ Thị Sáu, Hải Dương', N'quyen.pham@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (66, N'Bùi Văn Đạt', N'0950567866', N'11 Phan Xích Long, Bình Dương', N'dat.bui@email.com', 165)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (67, N'Trương Thị Thu', N'0961678967', N'23 Tôn Đức Thắng, Quảng Nam', N'thu.truong@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (68, N'Đoàn Văn Tú', N'0972789068', N'36 Hùng Vương, Tây Ninh', N'tu.doan@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (69, N'Huỳnh Thị Như', N'0983890169', N'88 Nguyễn Trãi, Lâm Đồng', N'nhu.huynh@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (70, N'Hồ Văn Quý', N'0994901270', N'60 Lê Đại Hành, Kon Tum', N'quy.ho@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (71, N'Châu Thị Thanh', N'0906012371', N'25 Nguyễn An Ninh, Long An', N'thanh.chau@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (72, N'Phan Văn Thọ', N'0917123472', N'49 Trần Hưng Đạo, Vĩnh Long', N'tho.phan@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (73, N'Hứa Thị Phương', N'0928234573', N'67 Nguyễn Văn Trỗi, Hà Nam', N'phuong.hua@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (74, N'Lâm Văn Hậu', N'0939345674', N'34 Nguyễn Hồng Đào, TP.HCM', N'hau.lam@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (75, N'Cao Thị Tươi', N'0951456776', N'20 Nguyễn Khuyến, Huế', N'tuoi.cao@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (76, N'Tăng Văn Vinh', N'0962567877', N'41 Tân Kỳ Tân Quý, Hà Nội', N'vinh.tang@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (77, N'Lý Thị Duyên', N'0973678978', N'58 Lê Quang Định, Bà Rịa', N'duyen.ly@email.com', 195)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (78, N'Triều Văn Tấn', N'0984789079', N'15 Nguyễn Thiện Thuật, Bắc Ninh', N'tan.trieu@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (79, N'Kiều Thị Hà', N'0995890180', N'77 Nguyễn Hoàng, Hà Giang', N'ha.kieu@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (80, N'Thân Văn Vũ', N'0906901281', N'33 Trần Quốc Hoàn, Quảng Bình', N'vu.than@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (81, N'Từ Thị Vân', N'0917012382', N'45 Phan Văn Trị, Ninh Thuận', N'van.tu@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (82, N'Đặng Văn Nam', N'0928123483', N'19 Hoàng Văn Thụ, Nghệ An', N'nam.dang@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (83, N'Hoàng Thị Tuyết', N'0939234584', N'26 Nguyễn Công Trứ, Phú Yên', N'tuyet.hoang@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (84, N'Tống Văn Tân', N'0950345685', N'61 Trương Công Định, Lào Cai', N'tan.tong@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (85, N'Ngô Thị Huệ', N'0961456786', N'80 Nguyễn Du, Yên Bái', N'hue.ngo@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (86, N'Mai Văn Duy', N'0972567887', N'17 Nguyễn Tri Phương, Gia Lai', N'duy.mai@email.com', 195)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (87, N'La Thị Nhàn', N'0983678988', N'38 Hòa Bình, Bắc Kạn', N'nhan.la@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (88, N'Võ Văn Khải', N'0994789089', N'43 Hoàng Quốc Việt, Đồng Tháp', N'khai.vo@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (89, N'Tạ Thị Ánh', N'0905890190', N'27 Bạch Đằng, Trà Vinh', N'anh.ta@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (90, N'Tô Văn Trung', N'0916901291', N'54 Nguyễn Trãi, TP.HCM', N'trung.to@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (91, N'Chử Thị Như', N'0927012392', N'32 Phan Đăng Lưu, Hà Nội', N'nhu.chu@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (92, N'Nguyễn Thị Kim Chi', N'0938123493', N'68 Hùng Vương, Vĩnh Phúc', N'kimchi.nguyen@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (93, N'Phạm Văn Khánh', N'0949234594', N'21 Trần Văn Ơn, An Giang', N'khanh.pham@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (94, N'Lê Thị Nhàn', N'0950345695', N'14 Nguyễn Văn Cừ, Sóc Trăng', N'nhan.le@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (95, N'Đinh Văn Đoàn', N'0961456796', N'72 Trường Sa, Hậu Giang', N'doan.dinh@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (96, N'Đoàn Thị Cúc', N'097256797', N'11 Hoàng Hoa Thám, Kiên Giang', N'cuc.doan@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (97, N'Bạch Văn Ngọc', N'098368998', N'35 Trần Bình, Hòa Bình', N'ngoc.bach@email.com', 165)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (98, N'Vi Thị Lài', N'099478999', N'47 Nguyễn Văn Cừ, Cao Bằng', N'lai.vi@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (99, N'Chu Văn Long', N'090590100', N'26 Đinh Tiên Hoàng, Điện Biên', N'long.chu@email.com', 190)
GO
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (100, N'Hà Văn V', N'098111233', N'300 Đường Láng Hạ, Hà Nội', N'v.ha@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (101, N'Lê Thị M', N'093123456', N'30 Đường Bà Triệu, Hà Nội', N'mle@email.com', 150)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (102, N'Phan Văn N', N'0988765432', N'60 Phố Tràng Thi, Hà Nội', N'n.phan@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (103, N'Hoàng Thị O', N'0911223344', N'90 Đường Hai Bà Trưng, Hà Nội', N'o.hoang@email.com', 100)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (104, N'Trịnh Văn P', N'0977889900', N'120 Đường Nguyễn Du, Hà Nội', N'p.trinh@email.com', 250)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (105, N'Vũ Thị Q', N'0933445566', N'150 Đường Lý Thường Kiệt, Hà Nội', N'q.vu@email.cm', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (106, N'Ngô Văn R', N'0966554433', N'180 Đường Trần Hưng Đạo, Hà Nội', N'r.ngo@email.com', 220)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (107, N'Bùi Thị S', N'0944667788', N'210 Đường Quang Trung, Hà Nội', N's.bui@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (108, N'Đào Văn T', N'0922778899', N'240 Đường Tây Hồ, Hà Nội', N't.dao@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (109, N'Lâm Thị U', N'0909998877', N'270 Đường Âu Cơ, Hà Nội', N'u.lam@email.com', 230)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (110, N'Lâm manh tu', N'0339998877', N'270 thanh xuân, Hà Nội', N'tub@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (111, N'Nguyễn Thị Hồng', N'0901234501', N'12 Nguyễn Trãi, Hà Nội', N'hong.nguyen@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (112, N'Lê Văn Dũng', N'0912345602', N'45 Trần Hưng Đạo, TP.HCM', N'dung.le@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (113, N'Trần Thị Mai', N'0923456703', N'78 Lê Lợi, Đà Nẵng', N'mai.tran@email.com', 150)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (114, N'Phạm Văn Khoa', N'0934567804', N'99 Hai Bà Trưng, Hải Phòng', N'khoa.pham@email.com', 240)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (115, N'Hoàng Thị Ngọc', N'0945678905', N'23 Nguyễn Văn Cừ, Huế', N'ngoc.hoang@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (116, N'Đặng Văn Minh', N'0956789006', N'56 Lê Duẩn, Cần Thơ', N'minh.dang@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (117, N'Bùi Thị Lan', N'0967890107', N'10 Trần Phú, Bắc Ninh', N'lan.bui@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (118, N'Vũ Văn Hùng', N'0978901208', N'67 Đinh Tiên Hoàng, Thanh Hóa', N'hung.vu@email.com', 220)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (119, N'Ngô Thị Hạnh', N'0989012309', N'34 Nguyễn Huệ, Ninh Bình', N'hanh.ngo@email.com', 165)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (120, N'Lý Văn Sơn', N'0990123410', N'89 Phan Đình Phùng, Hà Nam', N'son.ly@email.com', 230)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (121, N'Phan Thị Huệ', N'0901123411', N'21 Cầu Giấy, Hà Nội', N'hue.phan@email.com', 150)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (122, N'Huỳnh Văn Tài', N'0912234512', N'76 Nguyễn Khuyến, TP.HCM', N'tai.huynh@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (123, N'Cao Thị Tuyết', N'0923345613', N'33 Phạm Văn Đồng, Đà Nẵng', N'tuyet.cao@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (124, N'Mai Văn Hiếu', N'0934456714', N'88 Nguyễn Trãi, Cần Thơ', N'hieu.mai@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (125, N'Tô Thị Bình', N'0945567815', N'17 Phan Chu Trinh, Hải Dương', N'binh.to@email.com', 195)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (126, N'Châu Văn Toàn', N'0956678916', N'42 Điện Biên Phủ, Vũng Tàu', N'toan.chau@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (127, N'Lâm Thị Nhung', N'0967789017', N'61 Tôn Đức Thắng, Quảng Ngãi', N'nhung.lam@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (128, N'Tống Văn Quân', N'0978890118', N'84 Nguyễn Đình Chiểu, Đà Lạt', N'quan.tong@email.com', 220)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (129, N'Kiều Thị Giang', N'0989901219', N'19 Hùng Vương, Bắc Giang', N'giang.kieu@email.com', 205)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (130, N'Triệu Văn Phúc', N'0991012320', N'35 Trưng Trắc, Hải Phòng', N'phuc.trieu@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (131, N'Tạ Thị Hương', N'0902123421', N'72 Nguyễn Du, Hà Nội', N'huong.ta@email.com', 240)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (132, N'Thạch Văn Duy', N'0913234522', N'38 Trần Quang Khải, TP.HCM', N'duy.thach@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (133, N'Dương Thị Kim', N'0924345623', N'27 Lê Lai, Đà Nẵng', N'kim.duong@email.com', 215)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (134, N'Đoàn Văn Hoài', N'0935456724', N'64 Phạm Hùng, Huế', N'hoai.doan@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (135, N'Thái Thị Thanh', N'0946567825', N'14 Nguyễn Bỉnh Khiêm, Cần Thơ', N'thanh.thai@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (136, N'Hứa Văn Thắng', N'0957678926', N'83 Nguyễn Tri Phương, Bình Dương', N'thang.hua@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (137, N'Thân Thị Trinh', N'0968789027', N'25 Tân Sơn Nhì, Đồng Nai', N'trinh.than@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (138, N'Tăng Văn Hào', N'0979890128', N'46 Lý Chính Thắng, Hà Nội', N'hao.tang@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (139, N'Mạc Thị Thảo', N'0980901239', N'30 Nguyễn Gia Thiều, TP.HCM', N'thao.mac@email.com', 195)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (140, N'La Văn Tùng', N'0992012340', N'58 Trần Bình Trọng, Hà Tĩnh', N'tung.la@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (141, N'Từ Thị Mai', N'0903012341', N'13 Nguyễn Phong Sắc, Quảng Trị', N'mai.tu@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (142, N'Liễu Văn Bảo', N'0914123442', N'66 Nguyễn Kiệm, Bắc Ninh', N'bao.lieu@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (143, N'Triều Thị Quỳnh', N'0925234543', N'39 Trường Chinh, Thái Bình', N'quynh.trieu@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (144, N'Từ Văn Đức', N'0936345644', N'20 Trần Cao Vân, Bình Phước', N'duc.tu@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (145, N'Vi Thị Ngân', N'0947456745', N'77 Lạc Long Quân, Quảng Nam', N'ngan.vi@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (146, N'Trình Văn Nam', N'0958567846', N'55 Trần Hữu Dực, Hưng Yên', N'nam.trinh@email.com', 220)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (147, N'Lữ Thị Liên', N'0969678947', N'28 Xô Viết Nghệ Tĩnh, Nghệ An', N'lien.lu@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (148, N'Hầu Văn Khánh', N'0970789048', N'60 Phan Bội Châu, Hà Giang', N'khanh.hau@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (149, N'Triệu Thị Duyên', N'0981890149', N'31 Trần Đại Nghĩa, Sơn La', N'duyen.trieu@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (150, N'Bàng Văn Hòa', N'0992901250', N'74 Trần Nhật Duật, Tuyên Quang', N'hoa.bang@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (151, N'Giàng Thị Mỵ', N'0904012351', N'36 Nguyễn Cảnh Chân, Lào Cai', N'my.giang@email.com', 150)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (152, N'Tạ Văn Khôi', N'0915123452', N'10 Nguyễn Hữu Cảnh, TP.HCM', N'khoi.ta@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (153, N'Tống Thị Hân', N'0926234553', N'59 Trần Khánh Dư, Hà Nội', N'han.tong@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (154, N'Cổ Văn Sỹ', N'0937345654', N'28 Tạ Quang Bửu, Đà Nẵng', N'sy.co@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (155, N'Phùng Thị Hằng', N'0948456755', N'81 Lê Thánh Tông, Cần Thơ', N'hang.phung@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (156, N'Tôn Văn Hữu', N'0959567856', N'44 Nguyễn Tất Thành, Hải Phòng', N'huu.ton@email.com', 215)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (157, N'Trịnh Thị Nhã', N'0960678957', N'22 Lương Ngọc Quyến, Thái Nguyên', N'nha.trinh@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (158, N'Quách Văn Tâm', N'0971789058', N'75 Lê Văn Lương, Hà Nội', N'tam.quach@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (159, N'Đinh Thị Yến', N'0982890159', N'47 Nguyễn Văn Linh, Huế', N'yen.dinh@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (160, N'Thạch Văn Lâm', N'0993901260', N'31 Quang Trung, Đồng Nai', N'lam.thach@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (161, N'Từ Thị Hoa', N'0905012361', N'53 Nguyễn Văn Huyên, Hà Nội', N'hoa.tu@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (162, N'Triệu Văn Bình', N'0916123462', N'29 Cách Mạng Tháng Tám, TP.HCM', N'binh.trieu@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (163, N'Lê Thị Lệ', N'0927234563', N'70 Điện Biên Phủ, Đà Nẵng', N'le.le@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (164, N'Nguyễn Văn Hải', N'0938345664', N'35 Hoàng Diệu, Cần Thơ', N'hai.nguyen@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (165, N'Phạm Thị Quyên', N'0949456765', N'84 Võ Thị Sáu, Hải Dương', N'quyen.pham@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (166, N'Bùi Văn Đạt', N'0950567866', N'11 Phan Xích Long, Bình Dương', N'dat.bui@email.com', 165)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (167, N'Trương Thị Thu', N'0961678967', N'23 Tôn Đức Thắng, Quảng Nam', N'thu.truong@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (168, N'Đoàn Văn Tú', N'0972789068', N'36 Hùng Vương, Tây Ninh', N'tu.doan@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (169, N'Huỳnh Thị Như', N'0983890169', N'88 Nguyễn Trãi, Lâm Đồng', N'nhu.huynh@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (170, N'Hồ Văn Quý', N'0994901270', N'60 Lê Đại Hành, Kon Tum', N'quy.ho@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (171, N'Châu Thị Thanh', N'0906012371', N'25 Nguyễn An Ninh, Long An', N'thanh.chau@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (172, N'Phan Văn Thọ', N'0917123472', N'49 Trần Hưng Đạo, Vĩnh Long', N'tho.phan@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (173, N'Hứa Thị Phương', N'0928234573', N'67 Nguyễn Văn Trỗi, Hà Nam', N'phuong.hua@email.com', 170)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (174, N'Lâm Văn Hậu', N'0939345674', N'34 Nguyễn Hồng Đào, TP.HCM', N'hau.lam@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (175, N'Cao Thị Tươi', N'0951456776', N'20 Nguyễn Khuyến, Huế', N'tuoi.cao@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (176, N'Tăng Văn Vinh', N'0962567877', N'41 Tân Kỳ Tân Quý, Hà Nội', N'vinh.tang@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (177, N'Lý Thị Duyên', N'0973678978', N'58 Lê Quang Định, Bà Rịa', N'duyen.ly@email.com', 195)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (178, N'Triều Văn Tấn', N'0984789079', N'15 Nguyễn Thiện Thuật, Bắc Ninh', N'tan.trieu@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (179, N'Kiều Thị Hà', N'0995890180', N'77 Nguyễn Hoàng, Hà Giang', N'ha.kieu@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (180, N'Thân Văn Vũ', N'0906901281', N'33 Trần Quốc Hoàn, Quảng Bình', N'vu.than@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (181, N'Từ Thị Vân', N'0917012382', N'45 Phan Văn Trị, Ninh Thuận', N'van.tu@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (182, N'Đặng Văn Nam', N'0928123483', N'19 Hoàng Văn Thụ, Nghệ An', N'nam.dang@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (183, N'Hoàng Thị Tuyết', N'0939234584', N'26 Nguyễn Công Trứ, Phú Yên', N'tuyet.hoang@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (184, N'Tống Văn Tân', N'0950345685', N'61 Trương Công Định, Lào Cai', N'tan.tong@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (185, N'Ngô Thị Huệ', N'0961456786', N'80 Nguyễn Du, Yên Bái', N'hue.ngo@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (186, N'Mai Văn Duy', N'0972567887', N'17 Nguyễn Tri Phương, Gia Lai', N'duy.mai@email.com', 195)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (187, N'La Thị Nhàn', N'0983678988', N'38 Hòa Bình, Bắc Kạn', N'nhan.la@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (188, N'Võ Văn Khải', N'0994789089', N'43 Hoàng Quốc Việt, Đồng Tháp', N'khai.vo@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (189, N'Tạ Thị Ánh', N'0905890190', N'27 Bạch Đằng, Trà Vinh', N'anh.ta@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (190, N'Tô Văn Trung', N'0916901291', N'54 Nguyễn Trãi, TP.HCM', N'trung.to@email.com', 160)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (191, N'Chử Thị Như', N'0927012392', N'32 Phan Đăng Lưu, Hà Nội', N'nhu.chu@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (192, N'Nguyễn Thị Kim Chi', N'0938123493', N'68 Hùng Vương, Vĩnh Phúc', N'kimchi.nguyen@email.com', 210)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (193, N'Phạm Văn Khánh', N'0949234594', N'21 Trần Văn Ơn, An Giang', N'khanh.pham@email.com', 190)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (194, N'Lê Thị Nhàn', N'0950345695', N'14 Nguyễn Văn Cừ, Sóc Trăng', N'nhan.le@email.com', 175)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (195, N'Đinh Văn Đoàn', N'0961456796', N'72 Trường Sa, Hậu Giang', N'doan.dinh@email.com', 185)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (196, N'Đoàn Thị Cúc', N'097256797', N'11 Hoàng Hoa Thám, Kiên Giang', N'cuc.doan@email.com', 200)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (197, N'Bạch Văn Ngọc', N'098368998', N'35 Trần Bình, Hòa Bình', N'ngoc.bach@email.com', 165)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (198, N'Vi Thị Lài', N'099478999', N'47 Nguyễn Văn Cừ, Cao Bằng', N'lai.vi@email.com', 180)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (199, N'Chu Văn Long', N'090590100', N'26 Đinh Tiên Hoàng, Điện Biên', N'long.chu@email.com', 190)
GO
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [SDT], [DiaChi], [Email], [DiemTichLuy]) VALUES (200, N'Hà Văn V', N'098111233', N'300 Đường Láng Hạ, Hà Nội', N'v.ha@email.com', 170)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhuyenMai] ON 

INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (1, N'Giảm giá cuối tuần', CAST(N'2025-04-12' AS Date), CAST(N'2025-04-13' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm vào cuối tuần')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (2, N'Khuyến mãi tháng 5', CAST(N'2025-05-01' AS Date), CAST(N'2025-05-31' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đơn hàng trên 500.000 VNĐ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (3, N'Mua 1 tặng 1', CAST(N'2025-04-15' AS Date), CAST(N'2025-04-20' AS Date), NULL, N'Mua một sản phẩm tặng một sản phẩm cùng loại')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (4, N'Giảm đặc biệt cho thành viên', CAST(N'2025-04-08' AS Date), CAST(N'2025-04-30' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho khách hàng có thẻ thành viên')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (5, N'Ngày hội mua sắm', CAST(N'2025-04-25' AS Date), CAST(N'2025-04-27' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm giá sốc trong 3 ngày')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (6, N'Chào hè rực rỡ', CAST(N'2025-06-01' AS Date), CAST(N'2025-06-30' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho các sản phẩm mùa hè')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (7, N'Black Friday sớm', CAST(N'2025-11-01' AS Date), CAST(N'2025-11-30' AS Date), CAST(30.00 AS Decimal(5, 2)), N'Giảm 30% cho một số mặt hàng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (8, N'Sinh nhật cửa hàng', CAST(N'2025-07-15' AS Date), CAST(N'2025-07-20' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% nhân dịp sinh nhật cửa hàng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (9, N'Xả hàng cuối năm', CAST(N'2025-12-20' AS Date), CAST(N'2025-12-31' AS Date), CAST(35.00 AS Decimal(5, 2)), N'Giảm giá mạnh cuối năm')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (10, N'Ưu đãi đặc biệt', CAST(N'2025-04-10' AS Date), CAST(N'2025-04-15' AS Date), CAST(5.00 AS Decimal(5, 2)), N'Giảm thêm 5% khi thanh toán online')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (11, N'Giảm giá mùa đông', CAST(N'2025-12-20' AS Date), CAST(N'2025-12-31' AS Date), CAST(35.00 AS Decimal(5, 2)), N'Giảm 35% cho tất cả sản phẩm mùa đông')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (12, N'Khuyến mãi Tết Nguyên Đán', CAST(N'2026-01-25' AS Date), CAST(N'2026-02-05' AS Date), CAST(30.00 AS Decimal(5, 2)), N'Giảm 30% cho tất cả sản phẩm dịp Tết')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (13, N'Giảm giá cho đơn hàng online', CAST(N'2025-09-15' AS Date), CAST(N'2025-09-25' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đơn hàng đặt qua website')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (14, N'Mua 1 tặng 1 sản phẩm thời trang', CAST(N'2025-11-10' AS Date), CAST(N'2025-11-20' AS Date), NULL, N'Mua 1 sản phẩm thời trang tặng 1 sản phẩm cùng loại')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (15, N'Giảm giá cho sản phẩm trẻ em', CAST(N'2025-06-01' AS Date), CAST(N'2025-06-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm dành cho trẻ em')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (16, N'Khuyến mãi ngày quốc khánh', CAST(N'2025-09-02' AS Date), CAST(N'2025-09-03' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm nhân dịp Quốc khánh')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (17, N'Giảm giá cho khách hàng VIP', CAST(N'2025-10-01' AS Date), CAST(N'2025-10-10' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho khách hàng đạt cấp VIP')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (18, N'Giảm giá mùa hè', CAST(N'2026-07-01' AS Date), CAST(N'2026-07-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm mùa hè')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (19, N'Khuyến mãi Black Friday', CAST(N'2025-11-28' AS Date), CAST(N'2025-11-30' AS Date), CAST(40.00 AS Decimal(5, 2)), N'Giảm 40% cho tất cả sản phẩm trong dịp Black Friday')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (20, N'Giảm giá cho sản phẩm nội thất', CAST(N'2025-08-10' AS Date), CAST(N'2025-08-20' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm nội thất')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (21, N'Giảm giá cho đơn hàng đầu tiên', CAST(N'2026-01-01' AS Date), CAST(N'2026-01-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đơn hàng đầu tiên của khách hàng mới')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (22, N'Khuyến mãi ngày thiếu nhi', CAST(N'2026-06-01' AS Date), CAST(N'2026-06-02' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho sản phẩm dành cho trẻ em nhân ngày 1/6')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (23, N'Giảm giá cho sản phẩm văn phòng', CAST(N'2025-09-20' AS Date), CAST(N'2025-09-30' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho tất cả sản phẩm văn phòng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (24, N'Giảm giá cho đơn hàng trên 500.000 VNĐ', CAST(N'2025-11-01' AS Date), CAST(N'2025-11-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đơn hàng từ 500.000 VNĐ trở lên')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (25, N'Khuyến mãi ngày phụ nữ Việt Nam', CAST(N'2025-10-20' AS Date), CAST(N'2025-10-21' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm dành cho phụ nữ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (26, N'Giảm giá cho sản phẩm đồ chơi', CAST(N'2026-05-10' AS Date), CAST(N'2026-05-20' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm đồ chơi')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (27, N'Giảm giá cho sản phẩm sách', CAST(N'2025-12-01' AS Date), CAST(N'2025-12-10' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sách và tài liệu học tập')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (28, N'Khuyến mãi ngày nhà giáo', CAST(N'2025-11-20' AS Date), CAST(N'2025-11-21' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm dành cho giáo viên và học sinh')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (29, N'Giảm giá cho sản phẩm thực phẩm', CAST(N'2026-03-01' AS Date), CAST(N'2026-03-15' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho tất cả sản phẩm thực phẩm')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (30, N'Giảm giá cho khách hàng trung thành', CAST(N'2026-02-01' AS Date), CAST(N'2026-02-10' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho khách hàng mua sắm trên 3 lần')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (31, N'Khuyến mãi mùa xuân', CAST(N'2026-03-01' AS Date), CAST(N'2026-03-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm mùa xuân')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (32, N'Giảm giá cho sản phẩm xe đạp', CAST(N'2025-07-10' AS Date), CAST(N'2025-07-20' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho tất cả xe đạp và phụ kiện')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (33, N'Giảm giá cho sản phẩm chăm sóc cá nhân', CAST(N'2026-04-01' AS Date), CAST(N'2026-04-15' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm chăm sóc cá nhân')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (34, N'Khuyến mãi ngày môi trường', CAST(N'2026-06-05' AS Date), CAST(N'2026-06-06' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm thân thiện với môi trường')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (35, N'Giảm giá cho sản phẩm trang sức', CAST(N'2025-12-15' AS Date), CAST(N'2025-12-25' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho tất cả sản phẩm trang sức')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (36, N'Giảm giá cho đơn hàng giao nhanh', CAST(N'2026-01-10' AS Date), CAST(N'2026-01-20' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đơn hàng giao trong 24h')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (37, N'Khuyến mãi ngày gia đình', CAST(N'2026-06-28' AS Date), CAST(N'2026-06-29' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm dành cho gia đình')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (38, N'Giảm giá cho sản phẩm giày dép', CAST(N'2025-10-15' AS Date), CAST(N'2025-10-25' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả giày dép')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (39, N'Giảm giá cho sản phẩm đồ gia dụng', CAST(N'2026-02-20' AS Date), CAST(N'2026-02-28' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả đồ gia dụng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (40, N'Khuyến mãi ngày độc lập', CAST(N'2026-09-02' AS Date), CAST(N'2026-09-03' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho tất cả sản phẩm nhân dịp Quốc khánh')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (41, N'Giảm giá cho sản phẩm đồ uống', CAST(N'2025-08-01' AS Date), CAST(N'2025-08-15' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho tất cả đồ uống đóng gói')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (42, N'Giảm giá cho sản phẩm đồ điện', CAST(N'2026-05-01' AS Date), CAST(N'2026-05-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm đồ điện')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (43, N'Khuyến mãi ngày trung thu', CAST(N'2025-09-15' AS Date), CAST(N'2025-09-16' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm bánh trung thu và lồng đèn')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (44, N'Giảm giá cho sản phẩm đồ chơi giáo dục', CAST(N'2026-07-01' AS Date), CAST(N'2026-07-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đồ chơi giáo dục')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (45, N'Giảm giá cho sản phẩm đồ dùng học tập', CAST(N'2025-08-20' AS Date), CAST(N'2025-08-30' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đồ dùng học tập')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (46, N'Khuyến mãi ngày hội sách', CAST(N'2026-04-21' AS Date), CAST(N'2026-04-23' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho tất cả sách trong ngày hội sách')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (47, N'Giảm giá cho sản phẩm đồ bơi', CAST(N'2026-06-15' AS Date), CAST(N'2026-06-30' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả đồ bơi và phụ kiện')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (48, N'Giảm giá cho sản phẩm đồ trang trí', CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho đồ trang trí Giáng sinh và năm mới')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (49, N'Khuyến mãi ngày sức khỏe', CAST(N'2026-04-07' AS Date), CAST(N'2026-04-08' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm chăm sóc sức khỏe')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (50, N'Giảm giá cho sản phẩm đồ da', CAST(N'2025-11-01' AS Date), CAST(N'2025-11-15' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm đồ da')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (51, N'Giảm giá cho đơn hàng trên 2.000.000 VNĐ', CAST(N'2026-03-10' AS Date), CAST(N'2026-03-20' AS Date), CAST(30.00 AS Decimal(5, 2)), N'Giảm 30% cho đơn hàng từ 2.000.000 VNĐ trở lên')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (52, N'Giảm giá mùa thu', CAST(N'2025-09-01' AS Date), CAST(N'2025-09-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho các sản phẩm mùa thu')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (53, N'Khuyến mãi ngày lễ lao động', CAST(N'2025-05-01' AS Date), CAST(N'2025-05-02' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm nhân dịp 1/5')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (54, N'Giảm giá cho sản phẩm công nghệ', CAST(N'2025-10-01' AS Date), CAST(N'2025-10-10' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho các sản phẩm công nghệ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (55, N'Mua 2 tặng 1', CAST(N'2025-06-10' AS Date), CAST(N'2025-06-15' AS Date), NULL, N'Mua 2 sản phẩm tặng 1 sản phẩm bất kỳ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (56, N'Giảm giá cho sản phẩm thời trang nam', CAST(N'2025-07-01' AS Date), CAST(N'2025-07-10' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho tất cả sản phẩm thời trang nam')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (57, N'Khuyến mãi ngày hội thể thao', CAST(N'2025-08-15' AS Date), CAST(N'2025-08-20' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm thể thao và ngoài trời')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (58, N'Giảm giá cho sản phẩm làm đẹp', CAST(N'2025-11-15' AS Date), CAST(N'2025-11-25' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho các sản phẩm chăm sóc sắc đẹp')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (59, N'Ưu đãi khách hàng mới', CAST(N'2025-05-20' AS Date), CAST(N'2025-05-30' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho khách hàng mua sắm lần đầu')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (60, N'Giảm giá cho sản phẩm điện tử', CAST(N'2025-12-10' AS Date), CAST(N'2025-12-20' AS Date), CAST(22.00 AS Decimal(5, 2)), N'Giảm 22% cho các sản phẩm điện tử')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (61, N'Khuyến mãi ngày hội công nghệ', CAST(N'2026-01-15' AS Date), CAST(N'2026-01-20' AS Date), CAST(30.00 AS Decimal(5, 2)), N'Giảm 30% cho các sản phẩm công nghệ cao')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (62, N'Giảm giá cho sản phẩm đồ chơi ngoài trời', CAST(N'2025-06-20' AS Date), CAST(N'2025-06-30' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho đồ chơi ngoài trời')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (63, N'Giảm giá cho đơn hàng trên 1.000.000 VNĐ', CAST(N'2025-09-10' AS Date), CAST(N'2025-09-20' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho đơn hàng từ 1.000.000 VNĐ trở lên')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (64, N'Khuyến mãi ngày hội thời trang', CAST(N'2025-10-10' AS Date), CAST(N'2025-10-15' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho tất cả sản phẩm thời trang')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (65, N'Giảm giá cho sản phẩm đồ dùng bếp', CAST(N'2025-11-01' AS Date), CAST(N'2025-11-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho các sản phẩm đồ dùng nhà bếp')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (66, N'Giảm giá cho sản phẩm chăm sóc sức khỏe', CAST(N'2026-02-15' AS Date), CAST(N'2026-02-25' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho sản phẩm chăm sóc sức khỏe')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (67, N'Khuyến mãi ngày hội trẻ em', CAST(N'2026-06-01' AS Date), CAST(N'2026-06-03' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm dành cho trẻ em')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (68, N'Giảm giá cho sản phẩm đồ uống giải nhiệt', CAST(N'2025-07-15' AS Date), CAST(N'2025-07-25' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đồ uống giải nhiệt mùa hè')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (69, N'Giảm giá cho sản phẩm đồ trang trí', CAST(N'2025-12-15' AS Date), CAST(N'2025-12-25' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho đồ trang trí nội thất')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (70, N'Khuyến mãi ngày hội mua sắm online', CAST(N'2025-08-01' AS Date), CAST(N'2025-08-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đơn hàng đặt qua ứng dụng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (71, N'Giảm giá cho sản phẩm đồ dùng cá nhân', CAST(N'2026-03-01' AS Date), CAST(N'2026-03-10' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho các sản phẩm đồ dùng cá nhân')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (72, N'Giảm giá cho sản phẩm thời trang nữ', CAST(N'2025-09-20' AS Date), CAST(N'2025-09-30' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm thời trang nữ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (73, N'Khuyến mãi ngày hội sức khỏe', CAST(N'2026-04-07' AS Date), CAST(N'2026-04-09' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm hỗ trợ sức khỏe')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (74, N'Giảm giá cho sản phẩm đồ chơi công nghệ', CAST(N'2025-10-20' AS Date), CAST(N'2025-10-30' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho đồ chơi công nghệ cao')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (75, N'Giảm giá cho đơn hàng giao hàng miễn phí', CAST(N'2025-11-10' AS Date), CAST(N'2025-11-20' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đơn hàng giao hàng miễn phí')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (76, N'Khuyến mãi ngày hội nội thất', CAST(N'2026-01-10' AS Date), CAST(N'2026-01-15' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho tất cả sản phẩm nội thất')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (77, N'Giảm giá cho sản phẩm thời trang trẻ em', CAST(N'2025-06-15' AS Date), CAST(N'2025-06-25' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho thời trang trẻ em')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (78, N'Giảm giá cho sản phẩm đồ dùng văn phòng', CAST(N'2025-08-10' AS Date), CAST(N'2025-08-20' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho đồ dùng văn phòng phẩm')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (79, N'Khuyến mãi ngày hội gia đình', CAST(N'2026-06-28' AS Date), CAST(N'2026-06-30' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm dành cho gia đình')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (80, N'Giảm giá cho sản phẩm đồ chơi lắp ráp', CAST(N'2025-07-20' AS Date), CAST(N'2025-07-30' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đồ chơi lắp ráp')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (81, N'Giảm giá cho sản phẩm thực phẩm hữu cơ', CAST(N'2026-03-15' AS Date), CAST(N'2026-03-25' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho thực phẩm hữu cơ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (82, N'Khuyến mãi ngày hội môi trường', CAST(N'2026-06-05' AS Date), CAST(N'2026-06-07' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm thân thiện môi trường')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (83, N'Giảm giá phụ kiện thời trang', CAST(N'2025-09-15' AS Date), CAST(N'2025-09-25' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho các phụ kiện thời trang')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (84, N'Giảm giá cho sản phẩm đồ điện gia dụng', CAST(N'2025-12-01' AS Date), CAST(N'2025-12-10' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho đồ điện gia dụng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (85, N'Khuyến mãi ngày hội công nghệ thông tin', CAST(N'2026-01-20' AS Date), CAST(N'2026-01-25' AS Date), CAST(30.00 AS Decimal(5, 2)), N'Giảm 30% cho sản phẩm công nghệ thông tin')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (86, N'Giảm giá cho sản phẩm đồ chơi giáo dục', CAST(N'2025-06-01' AS Date), CAST(N'2025-06-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đồ chơi giáo dục')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (87, N'Giảm giá cho sản phẩm chăm sóc tóc', CAST(N'2025-11-01' AS Date), CAST(N'2025-11-10' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho sản phẩm chăm sóc tóc')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (88, N'Khuyến mãi ngày hội mua sắm trực tuyến', CAST(N'2025-08-20' AS Date), CAST(N'2025-08-30' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho đơn hàng trực tuyến')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (89, N'Giảm giá cho sản phẩm đồ uống dinh dưỡng', CAST(N'2026-02-01' AS Date), CAST(N'2026-02-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đồ uống dinh dưỡng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (90, N'Giảm giá cho sản phẩm đồ chơi sáng tạo', CAST(N'2025-07-01' AS Date), CAST(N'2025-07-15' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho đồ chơi sáng tạo')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (91, N'Khuyến mãi ngày hội sức khỏe cộng đồng', CAST(N'2026-04-07' AS Date), CAST(N'2026-04-10' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm chăm sóc sức khỏe')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (92, N'Giảm giá cho sản phẩm đồ dùng học sinh', CAST(N'2025-08-15' AS Date), CAST(N'2025-08-25' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đồ dùng học sinh')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (93, N'Giảm giá thời trang thể thao', CAST(N'2025-09-01' AS Date), CAST(N'2025-09-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho thời trang thể thao')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (94, N'Khuyến mãi ngày hội công nghệ xanh', CAST(N'2026-06-05' AS Date), CAST(N'2026-06-08' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho sản phẩm công nghệ thân thiện môi trường')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (95, N'Giảm giá cho sản', CAST(N'2025-12-15' AS Date), CAST(N'2025-12-25' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm trang trí nhà cửa')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (96, N'Giảm giá cho sản phẩm đồ chơi nhập khẩu', CAST(N'2025-06-20' AS Date), CAST(N'2025-06-30' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho đồ chơi nhập khẩu')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (97, N'Khuyến mãi ngày hội du lịch', CAST(N'2026-07-01' AS Date), CAST(N'2026-07-05' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm du lịch và dã ngoại')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (98, N'Giảm giá phẩm đông lạnh', CAST(N'2025-11-15' AS Date), CAST(N'2025-11-25' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho thực phẩm đông lạnh')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (99, N'Giảm giá cho sản phẩm đồ dùng thể thao', CAST(N'2025-08-01' AS Date), CAST(N'2025-08-10' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho đồ dùng thể thao')
GO
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (100, N'Khuyến mãi ngày hội sáng tạo', CAST(N'2026-03-01' AS Date), CAST(N'2026-03-05' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho sản phẩm hỗ trợ sáng tạo')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (101, N'Giảm giá cuối tuần', CAST(N'2025-04-12' AS Date), CAST(N'2025-04-13' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm vào cuối tuần')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (102, N'Khuyến mãi tháng 5', CAST(N'2025-05-01' AS Date), CAST(N'2025-05-31' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đơn hàng trên 500.000 VNĐ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (103, N'Mua 1 tặng 1', CAST(N'2025-04-15' AS Date), CAST(N'2025-04-20' AS Date), NULL, N'Mua một sản phẩm tặng một sản phẩm cùng loại')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (104, N'Giảm đặc biệt cho thành viên', CAST(N'2025-04-08' AS Date), CAST(N'2025-04-30' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho khách hàng có thẻ thành viên')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (105, N'Ngày hội mua sắm', CAST(N'2025-04-25' AS Date), CAST(N'2025-04-27' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm giá sốc trong 3 ngày')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (106, N'Chào hè rực rỡ', CAST(N'2025-06-01' AS Date), CAST(N'2025-06-30' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho các sản phẩm mùa hè')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (107, N'Black Friday sớm', CAST(N'2025-11-01' AS Date), CAST(N'2025-11-30' AS Date), CAST(30.00 AS Decimal(5, 2)), N'Giảm 30% cho một số mặt hàng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (108, N'Sinh nhật cửa hàng', CAST(N'2025-07-15' AS Date), CAST(N'2025-07-20' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% nhân dịp sinh nhật cửa hàng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (109, N'Xả hàng cuối năm', CAST(N'2025-12-20' AS Date), CAST(N'2025-12-31' AS Date), CAST(35.00 AS Decimal(5, 2)), N'Giảm giá mạnh cuối năm')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (110, N'Ưu đãi đặc biệt', CAST(N'2025-04-10' AS Date), CAST(N'2025-04-15' AS Date), CAST(5.00 AS Decimal(5, 2)), N'Giảm thêm 5% khi thanh toán online')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (111, N'Giảm giá mùa đông', CAST(N'2025-12-20' AS Date), CAST(N'2025-12-31' AS Date), CAST(35.00 AS Decimal(5, 2)), N'Giảm 35% cho tất cả sản phẩm mùa đông')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (112, N'Khuyến mãi Tết Nguyên Đán', CAST(N'2026-01-25' AS Date), CAST(N'2026-02-05' AS Date), CAST(30.00 AS Decimal(5, 2)), N'Giảm 30% cho tất cả sản phẩm dịp Tết')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (113, N'Giảm giá cho đơn hàng online', CAST(N'2025-09-15' AS Date), CAST(N'2025-09-25' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đơn hàng đặt qua website')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (114, N'Mua 1 tặng 1 sản phẩm thời trang', CAST(N'2025-11-10' AS Date), CAST(N'2025-11-20' AS Date), NULL, N'Mua 1 sản phẩm thời trang tặng 1 sản phẩm cùng loại')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (115, N'Giảm giá cho sản phẩm trẻ em', CAST(N'2025-06-01' AS Date), CAST(N'2025-06-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm dành cho trẻ em')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (116, N'Khuyến mãi ngày quốc khánh', CAST(N'2025-09-02' AS Date), CAST(N'2025-09-03' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm nhân dịp Quốc khánh')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (117, N'Giảm giá cho khách hàng VIP', CAST(N'2025-10-01' AS Date), CAST(N'2025-10-10' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho khách hàng đạt cấp VIP')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (118, N'Giảm giá mùa hè', CAST(N'2026-07-01' AS Date), CAST(N'2026-07-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm mùa hè')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (119, N'Khuyến mãi Black Friday', CAST(N'2025-11-28' AS Date), CAST(N'2025-11-30' AS Date), CAST(40.00 AS Decimal(5, 2)), N'Giảm 40% cho tất cả sản phẩm trong dịp Black Friday')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (120, N'Giảm giá cho sản phẩm nội thất', CAST(N'2025-08-10' AS Date), CAST(N'2025-08-20' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm nội thất')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (121, N'Giảm giá cho đơn hàng đầu tiên', CAST(N'2026-01-01' AS Date), CAST(N'2026-01-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đơn hàng đầu tiên của khách hàng mới')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (122, N'Khuyến mãi ngày thiếu nhi', CAST(N'2026-06-01' AS Date), CAST(N'2026-06-02' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho sản phẩm dành cho trẻ em nhân ngày 1/6')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (123, N'Giảm giá cho sản phẩm văn phòng', CAST(N'2025-09-20' AS Date), CAST(N'2025-09-30' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho tất cả sản phẩm văn phòng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (124, N'Giảm giá cho đơn hàng trên 500.000 VNĐ', CAST(N'2025-11-01' AS Date), CAST(N'2025-11-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đơn hàng từ 500.000 VNĐ trở lên')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (125, N'Khuyến mãi ngày phụ nữ Việt Nam', CAST(N'2025-10-20' AS Date), CAST(N'2025-10-21' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm dành cho phụ nữ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (126, N'Giảm giá cho sản phẩm đồ chơi', CAST(N'2026-05-10' AS Date), CAST(N'2026-05-20' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm đồ chơi')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (127, N'Giảm giá cho sản phẩm sách', CAST(N'2025-12-01' AS Date), CAST(N'2025-12-10' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sách và tài liệu học tập')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (128, N'Khuyến mãi ngày nhà giáo', CAST(N'2025-11-20' AS Date), CAST(N'2025-11-21' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm dành cho giáo viên và học sinh')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (129, N'Giảm giá cho sản phẩm thực phẩm', CAST(N'2026-03-01' AS Date), CAST(N'2026-03-15' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho tất cả sản phẩm thực phẩm')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (130, N'Giảm giá cho khách hàng trung thành', CAST(N'2026-02-01' AS Date), CAST(N'2026-02-10' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho khách hàng mua sắm trên 3 lần')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (131, N'Khuyến mãi mùa xuân', CAST(N'2026-03-01' AS Date), CAST(N'2026-03-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm mùa xuân')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (132, N'Giảm giá cho sản phẩm xe đạp', CAST(N'2025-07-10' AS Date), CAST(N'2025-07-20' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho tất cả xe đạp và phụ kiện')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (133, N'Giảm giá cho sản phẩm chăm sóc cá nhân', CAST(N'2026-04-01' AS Date), CAST(N'2026-04-15' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm chăm sóc cá nhân')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (134, N'Khuyến mãi ngày môi trường', CAST(N'2026-06-05' AS Date), CAST(N'2026-06-06' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm thân thiện với môi trường')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (135, N'Giảm giá cho sản phẩm trang sức', CAST(N'2025-12-15' AS Date), CAST(N'2025-12-25' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho tất cả sản phẩm trang sức')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (136, N'Giảm giá cho đơn hàng giao nhanh', CAST(N'2026-01-10' AS Date), CAST(N'2026-01-20' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đơn hàng giao trong 24h')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (137, N'Khuyến mãi ngày gia đình', CAST(N'2026-06-28' AS Date), CAST(N'2026-06-29' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm dành cho gia đình')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (138, N'Giảm giá cho sản phẩm giày dép', CAST(N'2025-10-15' AS Date), CAST(N'2025-10-25' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả giày dép')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (139, N'Giảm giá cho sản phẩm đồ gia dụng', CAST(N'2026-02-20' AS Date), CAST(N'2026-02-28' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả đồ gia dụng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (140, N'Khuyến mãi ngày độc lập', CAST(N'2026-09-02' AS Date), CAST(N'2026-09-03' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho tất cả sản phẩm nhân dịp Quốc khánh')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (141, N'Giảm giá cho sản phẩm đồ uống', CAST(N'2025-08-01' AS Date), CAST(N'2025-08-15' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho tất cả đồ uống đóng gói')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (142, N'Giảm giá cho sản phẩm đồ điện', CAST(N'2026-05-01' AS Date), CAST(N'2026-05-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả sản phẩm đồ điện')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (143, N'Khuyến mãi ngày trung thu', CAST(N'2025-09-15' AS Date), CAST(N'2025-09-16' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm bánh trung thu và lồng đèn')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (144, N'Giảm giá cho sản phẩm đồ chơi giáo dục', CAST(N'2026-07-01' AS Date), CAST(N'2026-07-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đồ chơi giáo dục')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (145, N'Giảm giá cho sản phẩm đồ dùng học tập', CAST(N'2025-08-20' AS Date), CAST(N'2025-08-30' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đồ dùng học tập')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (146, N'Khuyến mãi ngày hội sách', CAST(N'2026-04-21' AS Date), CAST(N'2026-04-23' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho tất cả sách trong ngày hội sách')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (147, N'Giảm giá cho sản phẩm đồ bơi', CAST(N'2026-06-15' AS Date), CAST(N'2026-06-30' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho tất cả đồ bơi và phụ kiện')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (148, N'Giảm giá cho sản phẩm đồ trang trí', CAST(N'2025-12-01' AS Date), CAST(N'2025-12-15' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho đồ trang trí Giáng sinh và năm mới')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (149, N'Khuyến mãi ngày sức khỏe', CAST(N'2026-04-07' AS Date), CAST(N'2026-04-08' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm chăm sóc sức khỏe')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (150, N'Giảm giá cho sản phẩm đồ da', CAST(N'2025-11-01' AS Date), CAST(N'2025-11-15' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm đồ da')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (151, N'Giảm giá cho đơn hàng trên 2.000.000 VNĐ', CAST(N'2026-03-10' AS Date), CAST(N'2026-03-20' AS Date), CAST(30.00 AS Decimal(5, 2)), N'Giảm 30% cho đơn hàng từ 2.000.000 VNĐ trở lên')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (152, N'Giảm giá mùa thu', CAST(N'2025-09-01' AS Date), CAST(N'2025-09-15' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho các sản phẩm mùa thu')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (153, N'Khuyến mãi ngày lễ lao động', CAST(N'2025-05-01' AS Date), CAST(N'2025-05-02' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm nhân dịp 1/5')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (154, N'Giảm giá cho sản phẩm công nghệ', CAST(N'2025-10-01' AS Date), CAST(N'2025-10-10' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho các sản phẩm công nghệ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (155, N'Mua 2 tặng 1', CAST(N'2025-06-10' AS Date), CAST(N'2025-06-15' AS Date), NULL, N'Mua 2 sản phẩm tặng 1 sản phẩm bất kỳ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (156, N'Giảm giá cho sản phẩm thời trang nam', CAST(N'2025-07-01' AS Date), CAST(N'2025-07-10' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho tất cả sản phẩm thời trang nam')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (157, N'Khuyến mãi ngày hội thể thao', CAST(N'2025-08-15' AS Date), CAST(N'2025-08-20' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm thể thao và ngoài trời')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (158, N'Giảm giá cho sản phẩm làm đẹp', CAST(N'2025-11-15' AS Date), CAST(N'2025-11-25' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho các sản phẩm chăm sóc sắc đẹp')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (159, N'Ưu đãi khách hàng mới', CAST(N'2025-05-20' AS Date), CAST(N'2025-05-30' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho khách hàng mua sắm lần đầu')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (160, N'Giảm giá cho sản phẩm điện tử', CAST(N'2025-12-10' AS Date), CAST(N'2025-12-20' AS Date), CAST(22.00 AS Decimal(5, 2)), N'Giảm 22% cho các sản phẩm điện tử')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (161, N'Khuyến mãi ngày hội công nghệ', CAST(N'2026-01-15' AS Date), CAST(N'2026-01-20' AS Date), CAST(30.00 AS Decimal(5, 2)), N'Giảm 30% cho các sản phẩm công nghệ cao')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (162, N'Giảm giá cho sản phẩm đồ chơi ngoài trời', CAST(N'2025-06-20' AS Date), CAST(N'2025-06-30' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho đồ chơi ngoài trời')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (163, N'Giảm giá cho đơn hàng trên 1.000.000 VNĐ', CAST(N'2025-09-10' AS Date), CAST(N'2025-09-20' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho đơn hàng từ 1.000.000 VNĐ trở lên')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (164, N'Khuyến mãi ngày hội thời trang', CAST(N'2025-10-10' AS Date), CAST(N'2025-10-15' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho tất cả sản phẩm thời trang')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (165, N'Giảm giá cho sản phẩm đồ dùng bếp', CAST(N'2025-11-01' AS Date), CAST(N'2025-11-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho các sản phẩm đồ dùng nhà bếp')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (166, N'Giảm giá cho sản phẩm chăm sóc sức khỏe', CAST(N'2026-02-15' AS Date), CAST(N'2026-02-25' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho sản phẩm chăm sóc sức khỏe')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (167, N'Khuyến mãi ngày hội trẻ em', CAST(N'2026-06-01' AS Date), CAST(N'2026-06-03' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm dành cho trẻ em')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (168, N'Giảm giá cho sản phẩm đồ uống giải nhiệt', CAST(N'2025-07-15' AS Date), CAST(N'2025-07-25' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đồ uống giải nhiệt mùa hè')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (169, N'Giảm giá cho sản phẩm đồ trang trí', CAST(N'2025-12-15' AS Date), CAST(N'2025-12-25' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho đồ trang trí nội thất')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (170, N'Khuyến mãi ngày hội mua sắm online', CAST(N'2025-08-01' AS Date), CAST(N'2025-08-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đơn hàng đặt qua ứng dụng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (171, N'Giảm giá cho sản phẩm đồ dùng cá nhân', CAST(N'2026-03-01' AS Date), CAST(N'2026-03-10' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho các sản phẩm đồ dùng cá nhân')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (172, N'Giảm giá cho sản phẩm thời trang nữ', CAST(N'2025-09-20' AS Date), CAST(N'2025-09-30' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm thời trang nữ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (173, N'Khuyến mãi ngày hội sức khỏe', CAST(N'2026-04-07' AS Date), CAST(N'2026-04-09' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm hỗ trợ sức khỏe')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (174, N'Giảm giá cho sản phẩm đồ chơi công nghệ', CAST(N'2025-10-20' AS Date), CAST(N'2025-10-30' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho đồ chơi công nghệ cao')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (175, N'Giảm giá cho đơn hàng giao hàng miễn phí', CAST(N'2025-11-10' AS Date), CAST(N'2025-11-20' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đơn hàng giao hàng miễn phí')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (176, N'Khuyến mãi ngày hội nội thất', CAST(N'2026-01-10' AS Date), CAST(N'2026-01-15' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho tất cả sản phẩm nội thất')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (177, N'Giảm giá cho sản phẩm thời trang trẻ em', CAST(N'2025-06-15' AS Date), CAST(N'2025-06-25' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho thời trang trẻ em')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (178, N'Giảm giá cho sản phẩm đồ dùng văn phòng', CAST(N'2025-08-10' AS Date), CAST(N'2025-08-20' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho đồ dùng văn phòng phẩm')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (179, N'Khuyến mãi ngày hội gia đình', CAST(N'2026-06-28' AS Date), CAST(N'2026-06-30' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm dành cho gia đình')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (180, N'Giảm giá cho sản phẩm đồ chơi lắp ráp', CAST(N'2025-07-20' AS Date), CAST(N'2025-07-30' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đồ chơi lắp ráp')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (181, N'Giảm giá cho sản phẩm thực phẩm hữu cơ', CAST(N'2026-03-15' AS Date), CAST(N'2026-03-25' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho thực phẩm hữu cơ')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (182, N'Khuyến mãi ngày hội môi trường', CAST(N'2026-06-05' AS Date), CAST(N'2026-06-07' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm thân thiện môi trường')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (183, N'Giảm giá phụ kiện thời trang', CAST(N'2025-09-15' AS Date), CAST(N'2025-09-25' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho các phụ kiện thời trang')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (184, N'Giảm giá cho sản phẩm đồ điện gia dụng', CAST(N'2025-12-01' AS Date), CAST(N'2025-12-10' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho đồ điện gia dụng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (185, N'Khuyến mãi ngày hội công nghệ thông tin', CAST(N'2026-01-20' AS Date), CAST(N'2026-01-25' AS Date), CAST(30.00 AS Decimal(5, 2)), N'Giảm 30% cho sản phẩm công nghệ thông tin')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (186, N'Giảm giá cho sản phẩm đồ chơi giáo dục', CAST(N'2025-06-01' AS Date), CAST(N'2025-06-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đồ chơi giáo dục')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (187, N'Giảm giá cho sản phẩm chăm sóc tóc', CAST(N'2025-11-01' AS Date), CAST(N'2025-11-10' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho sản phẩm chăm sóc tóc')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (188, N'Khuyến mãi ngày hội mua sắm trực tuyến', CAST(N'2025-08-20' AS Date), CAST(N'2025-08-30' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho đơn hàng trực tuyến')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (189, N'Giảm giá cho sản phẩm đồ uống dinh dưỡng', CAST(N'2026-02-01' AS Date), CAST(N'2026-02-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho đồ uống dinh dưỡng')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (190, N'Giảm giá cho sản phẩm đồ chơi sáng tạo', CAST(N'2025-07-01' AS Date), CAST(N'2025-07-15' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho đồ chơi sáng tạo')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (191, N'Khuyến mãi ngày hội sức khỏe cộng đồng', CAST(N'2026-04-07' AS Date), CAST(N'2026-04-10' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho sản phẩm chăm sóc sức khỏe')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (192, N'Giảm giá cho sản phẩm đồ dùng học sinh', CAST(N'2025-08-15' AS Date), CAST(N'2025-08-25' AS Date), CAST(10.00 AS Decimal(5, 2)), N'Giảm 10% cho đồ dùng học sinh')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (193, N'Giảm giá thời trang thể thao', CAST(N'2025-09-01' AS Date), CAST(N'2025-09-10' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho thời trang thể thao')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (194, N'Khuyến mãi ngày hội công nghệ xanh', CAST(N'2026-06-05' AS Date), CAST(N'2026-06-08' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho sản phẩm công nghệ thân thiện môi trường')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (195, N'Giảm giá cho sản', CAST(N'2025-12-15' AS Date), CAST(N'2025-12-25' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho tất cả sản phẩm trang trí nhà cửa')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (196, N'Giảm giá cho sản phẩm đồ chơi nhập khẩu', CAST(N'2025-06-20' AS Date), CAST(N'2025-06-30' AS Date), CAST(18.00 AS Decimal(5, 2)), N'Giảm 18% cho đồ chơi nhập khẩu')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (197, N'Khuyến mãi ngày hội du lịch', CAST(N'2026-07-01' AS Date), CAST(N'2026-07-05' AS Date), CAST(15.00 AS Decimal(5, 2)), N'Giảm 15% cho sản phẩm du lịch và dã ngoại')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (198, N'Giảm giá phẩm đông lạnh', CAST(N'2025-11-15' AS Date), CAST(N'2025-11-25' AS Date), CAST(12.00 AS Decimal(5, 2)), N'Giảm 12% cho thực phẩm đông lạnh')
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (199, N'Giảm giá cho sản phẩm đồ dùng thể thao', CAST(N'2025-08-01' AS Date), CAST(N'2025-08-10' AS Date), CAST(20.00 AS Decimal(5, 2)), N'Giảm 20% cho đồ dùng thể thao')
GO
INSERT [dbo].[KhuyenMai] ([MaKM], [TenKM], [NgayBatDau], [NgayKetThuc], [PhanTramGiamGia], [MoTa]) VALUES (200, N'Khuyến mãi ngày hội sáng tạo', CAST(N'2026-03-01' AS Date), CAST(N'2026-03-05' AS Date), CAST(25.00 AS Decimal(5, 2)), N'Giảm 25% cho sản phẩm hỗ trợ sáng tạo')
SET IDENTITY_INSERT [dbo].[KhuyenMai] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (1, N'Điện tử', N'Các sản phẩm điện tử gia dụng và cá nhân')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (2, N'Gia dụng', N'Đồ dùng trong nhà')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (3, N'Thực phẩm', N'Các loại thực phẩm và đồ uống')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (4, N'Thời trang', N'Quần áo, giày dép và phụ kiện')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (5, N'Sách', N'Các loại sách và tạp chí')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (6, N'Đồ chơi', N'Đồ chơi cho trẻ em')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (7, N'Mỹ phẩm', N'Sản phẩm chăm sóc sắc đẹp')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (8, N'Văn phòng phẩm', N'Đồ dùng văn phòng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (9, N'Dụng cụ thể thao', N'Các sản phẩm phục vụ thể dục thể thao')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (10, N'Đồ dùng cá nhân', N'Các vật dụng cá nhân hàng ngày')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (11, N'Đồ nội thất', N'Các sản phẩm nội thất cho nhà ở và văn phòng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (12, N'Trang sức', N'Nhẫn, vòng cổ, bông tai và phụ kiện trang sức')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (13, N'Đồ dùng nhà bếp', N'Dụng cụ và thiết bị phục vụ nấu ăn')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (14, N'Thực phẩm hữu cơ', N'Các loại thực phẩm được sản xuất theo tiêu chuẩn hữu cơ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (15, N'Thời trang trẻ em', N'Quần áo và phụ kiện dành cho trẻ em')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (16, N'Đồ chơi giáo dục', N'Đồ chơi hỗ trợ học tập và phát triển trí tuệ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (17, N'Sản phẩm chăm sóc tóc', N'Sản phẩm chăm sóc và tạo kiểu tóc')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (18, N'Thiết bị văn phòng', N'Máy in, máy scan và thiết bị văn phòng khác')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (19, N'Phụ kiện thể thao', N'Băng bảo vệ, túi thể thao và phụ kiện thể thao')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (20, N'Sản phẩm chăm sóc sức khỏe', N'Thực phẩm bổ sung và thiết bị y tế cá nhân')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (21, N'Đồ trang trí nhà cửa', N'Các sản phẩm trang trí nội thất và ngoại thất')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (22, N'Thức ăn thú cưng', N'Thức ăn cho chó, mèo và các vật nuôi khác')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (23, N'Phụ kiện ô tô', N'Phụ kiện và đồ dùng cho xe hơi')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (24, N'Đồ uống nhập khẩu', N'Các loại đồ uống nhập khẩu từ nước ngoài')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (25, N'Thời trang nam', N'Quần áo và phụ kiện dành riêng cho nam giới')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (26, N'Đồ chơi ngoài trời', N'Đồ chơi sử dụng ngoài trời cho trẻ em')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (27, N'Sản phẩm dưỡng da', N'Kem dưỡng, serum và sản phẩm chăm sóc da')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (28, N'Vở và sách giáo khoa', N'Vở học sinh và sách giáo khoa các cấp')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (29, N'Đồ dùng leo núi', N'Thiết bị và phụ kiện cho môn leo núi')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (30, N'Sản phẩm vệ sinh cá nhân', N'Xà phòng, dầu gội và sản phẩm vệ sinh')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (31, N'Đồ dùng phòng ngủ', N'Chăn, ga, gối, nệm và phụ kiện phòng ngủ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (32, N'Phụ kiện thú cưng', N'Vòng cổ, chuồng và đồ chơi cho thú cưng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (33, N'Phụ kiện xe máy', N'Mũ bảo hiểm, găng tay và phụ kiện xe máy')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (34, N'Thực phẩm đông lạnh', N'Thực phẩm bảo quản đông lạnh')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (35, N'Thời trang nữ', N'Quần áo và phụ kiện dành riêng cho nữ giới')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (36, N'Đồ chơi công nghệ', N'Đồ chơi sử dụng công nghệ cao như robot')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (37, N'Sản phẩm tẩy trang', N'Nước tẩy trang và sản phẩm làm sạch da')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (38, N'Bút và mực cao cấp', N'Bút mực, bút bi cao cấp cho văn phòng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (39, N'Dụng cụ yoga', N'Thảm yoga, dây kháng lực và phụ kiện yoga')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (40, N'Thiết bị đo sức khỏe', N'Máy đo huyết áp, nhiệt kế và thiết bị y tế')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (41, N'Đồ dùng phòng khách', N'Bàn ghế, kệ tivi và đồ trang trí phòng khách')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (42, N'Đồ dùng chăm sóc thú cưng', N'Sản phẩm vệ sinh và chăm sóc thú cưng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (43, N'Thiết bị an ninh', N'Camera giám sát, khóa thông minh')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (44, N'Thực phẩm chế biến sẵn', N'Thực phẩm đóng hộp và chế biến sẵn')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (45, N'Phụ kiện thời trang', N'Túi xách, thắt lưng và khăn choàng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (46, N'Đồ chơi lắp ráp', N'Đồ chơi lắp ráp như LEgo và mô hình')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (47, N'Sản phẩm chăm sóc môi', N'Son dưỡng và sản phẩm chăm sóc môi')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (48, N'Thiết bị lưu trữ', N'USB, ổ cứng ngoài và thẻ nhớ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (49, N'Đồ dùng bơi lội', N'Áo bơi, kính bơi và phụ kiện bơi lội')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (50, N'Sản phẩm chăm sóc răng miệng', N'Kem đánh răng, bàn chải và nước súc miệng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (51, N'Đồ dùng phòng tắm', N'Khăn tắm, kệ đựng đồ và phụ kiện phòng tắm')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (52, N'Đồ dùng dã ngoại', N'Lều, túi ngủ và dụng cụ cắm trại')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (53, N'Thiết bị chiếu sáng', N'Đèn LED, đèn bàn và đèn trang trí')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (54, N'Thực phẩm dinh dưỡng', N'Sữa bột, thực phẩm bổ sung dinh dưỡng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (55, N'Đồng hồ thời trang', N'Đồng hồ đeo tay thời trang')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (56, N'Đồ chơi sáng tạo', N'Đồ chơi khuyến khích sáng tạo và tư duy')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (57, N'Sản phẩm chống nắng', N'Kem chống nắng và sản phẩm bảo vệ da')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (58, N'Giấy và sản phẩm giấy', N'Giấy in, giấy ghi chú và sản phẩm giấy')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (59, N'Dụng cụ thể dục tại nhà', N'Máy chạy bộ, tạ và thiết bị tập gym')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (60, N'Thiết bị chăm sóc cá nhân', N'Máy cạo râu, máy sấy tóc và thiết bị cá nhân')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (61, N'Đồ dùng sân vườn', N'Cây cảnh, dụng cụ làm vườn và đồ trang trí')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (62, N'Phụ kiện công nghệ', N'Tai nghe, sạc dự phòng và vỏ điện thoại')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (63, N'Thiết bị âm thanh', N'Loa Bluetooth, tai nghe và hệ thống âm thanh')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (64, N'Thực phẩm nhập khẩu', N'Thực phẩm nhập khẩu từ các nước')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (65, N'Ba lô và túi du lịch', N'Ba lô, vali và túi du lịch')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (66, N'Đồ chơi vận động', N'Xe trượt, bóng và đồ chơi vận động')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (67, N'Sản phẩm làm sạch da', N'Sữa rửa mặt và sản phẩm làm sạch da')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (68, N'Thiết bị mạng', N'Router, modem và thiết bị kết nối mạng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (69, N'Đồ dùng trượt tuyết', N'Ván trượt tuyết và phụ kiện trượt tuyết')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (70, N'Sản phẩm chăm sóc mắt', N'Kính áp tròng và sản phẩm chăm sóc mắt')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (71, N'Đồ dùng nhà ăn', N'Bát, đĩa, ly và đồ dùng nhà ăn')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (72, N'Đồ dùng cắm trại', N'Bếp dã ngoại, ghế gấp và đồ dùng cắm trại')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (73, N'Thiết bị giám sát', N'Camera an ninh và thiết bị giám sát')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (74, N'Thực phẩm chức năng', N'Vitamin và thực phẩm bổ sung sức khỏe')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (75, N'Mũ và nón thời trang', N'Mũ lưỡi trai, mũ len và nón thời trang')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (76, N'Đồ chơi mô hình', N'Mô hình xe, máy bay và tàu hỏa')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (77, N'Sản phẩm chăm sóc cơ thể', N'Sữa tắm và sản phẩm chăm sóc cơ thể')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (78, N'Máy tính và phụ kiện', N'Laptop, bàn phím và chuột máy tính')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (79, N'Dụng cụ câu cá', N'Cần câu, lưỡi câu và phụ kiện câu cá')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (80, N'Sản phẩm chăm sóc trẻ em', N'Sữa tắm, kem dưỡng dành cho trẻ em')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (81, N'Đồ dùng vệ sinh nhà cửa', N'Chổi, cây lau nhà và sản phẩm vệ sinh')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (82, N'Đồ dùng lễ hội', N'Đồ trang trí Giáng sinh, Tết và lễ hội')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (83, N'Thiết bị điện gia dụng', N'Quạt điện, máy sưởi và thiết bị gia dụng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (84, N'Thực phẩm khô', N'Hạt, trái cây sấy và thực phẩm khô')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (85, N'Phụ kiện tóc', N'Kẹp tóc, dây buộc tóc và phụ kiện tóc')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (86, N'Đồ chơi tương tác', N'Đồ chơi có tính năng tương tác với trẻ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (87, N'Sản phẩm làm đẹp cao cấp', N'Mỹ phẩm và sản phẩm làm đẹp cao cấp')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (88, N'Thiết bị trình chiếu', N'Máy chiếu và phụ kiện trình chiếu')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (89, N'Đồ dùng lướt sóng', N'Ván lướt sóng và phụ kiện lướt sóng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (90, N'Sản phẩm chăm sóc móng', N'Sơn móng tay và dụng cụ chăm sóc móng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (91, N'Đồ dùng học tập', N'Cặp sách, đồ dùng học sinh và học cụ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (92, N'Đồ dùng tiệc tùng', N'Bong bóng, nến và đồ trang trí tiệc')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (93, N'Thiết bị thông minh', N'Đồng hồ thông minh và thiết bị IoT')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (94, N'Thực phẩm chay', N'Thực phẩm dành cho người ăn chay')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (95, N'Túi xách thời trang', N'Túi xách thời trang cho nam và nữ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (96, N'Đồ chơi khoa học', N'Bộ thí nghiệm và đồ chơi khoa học')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (97, N'Sản phẩm chống lão hóa', N'Kem chống lão hóa và sản phẩm dưỡng da')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (98, N'Thiết bị lưu điện', N'Bộ lưu điện và thiết bị dự phòng điện')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (99, N'Dụng cụ golf', N'Gậy golf, bóng golf và phụ kiện golf')
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (100, N'Sản phẩm chăm sóc da nhạy cảm', N'Sản phẩm dành cho da nhạy cảm')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (101, N'Điện tử', N'Các sản phẩm điện tử gia dụng và cá nhân')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (102, N'Gia dụng', N'Đồ dùng trong nhà')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (103, N'Thực phẩm', N'Các loại thực phẩm và đồ uống')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (104, N'Thời trang', N'Quần áo, giày dép và phụ kiện')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (105, N'Sách', N'Các loại sách và tạp chí')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (106, N'Đồ chơi', N'Đồ chơi cho trẻ em')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (107, N'Mỹ phẩm', N'Sản phẩm chăm sóc sắc đẹp')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (108, N'Văn phòng phẩm', N'Đồ dùng văn phòng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (109, N'Dụng cụ thể thao', N'Các sản phẩm phục vụ thể dục thể thao')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (110, N'Đồ dùng cá nhân', N'Các vật dụng cá nhân hàng ngày')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (111, N'Đồ nội thất', N'Các sản phẩm nội thất cho nhà ở và văn phòng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (112, N'Trang sức', N'Nhẫn, vòng cổ, bông tai và phụ kiện trang sức')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (113, N'Đồ dùng nhà bếp', N'Dụng cụ và thiết bị phục vụ nấu ăn')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (114, N'Thực phẩm hữu cơ', N'Các loại thực phẩm được sản xuất theo tiêu chuẩn hữu cơ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (115, N'Thời trang trẻ em', N'Quần áo và phụ kiện dành cho trẻ em')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (116, N'Đồ chơi giáo dục', N'Đồ chơi hỗ trợ học tập và phát triển trí tuệ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (117, N'Sản phẩm chăm sóc tóc', N'Sản phẩm chăm sóc và tạo kiểu tóc')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (118, N'Thiết bị văn phòng', N'Máy in, máy scan và thiết bị văn phòng khác')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (119, N'Phụ kiện thể thao', N'Băng bảo vệ, túi thể thao và phụ kiện thể thao')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (120, N'Sản phẩm chăm sóc sức khỏe', N'Thực phẩm bổ sung và thiết bị y tế cá nhân')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (121, N'Đồ trang trí nhà cửa', N'Các sản phẩm trang trí nội thất và ngoại thất')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (122, N'Thức ăn thú cưng', N'Thức ăn cho chó, mèo và các vật nuôi khác')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (123, N'Phụ kiện ô tô', N'Phụ kiện và đồ dùng cho xe hơi')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (124, N'Đồ uống nhập khẩu', N'Các loại đồ uống nhập khẩu từ nước ngoài')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (125, N'Thời trang nam', N'Quần áo và phụ kiện dành riêng cho nam giới')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (126, N'Đồ chơi ngoài trời', N'Đồ chơi sử dụng ngoài trời cho trẻ em')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (127, N'Sản phẩm dưỡng da', N'Kem dưỡng, serum và sản phẩm chăm sóc da')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (128, N'Vở và sách giáo khoa', N'Vở học sinh và sách giáo khoa các cấp')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (129, N'Đồ dùng leo núi', N'Thiết bị và phụ kiện cho môn leo núi')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (130, N'Sản phẩm vệ sinh cá nhân', N'Xà phòng, dầu gội và sản phẩm vệ sinh')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (131, N'Đồ dùng phòng ngủ', N'Chăn, ga, gối, nệm và phụ kiện phòng ngủ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (132, N'Phụ kiện thú cưng', N'Vòng cổ, chuồng và đồ chơi cho thú cưng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (133, N'Phụ kiện xe máy', N'Mũ bảo hiểm, găng tay và phụ kiện xe máy')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (134, N'Thực phẩm đông lạnh', N'Thực phẩm bảo quản đông lạnh')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (135, N'Thời trang nữ', N'Quần áo và phụ kiện dành riêng cho nữ giới')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (136, N'Đồ chơi công nghệ', N'Đồ chơi sử dụng công nghệ cao như robot')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (137, N'Sản phẩm tẩy trang', N'Nước tẩy trang và sản phẩm làm sạch da')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (138, N'Bút và mực cao cấp', N'Bút mực, bút bi cao cấp cho văn phòng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (139, N'Dụng cụ yoga', N'Thảm yoga, dây kháng lực và phụ kiện yoga')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (140, N'Thiết bị đo sức khỏe', N'Máy đo huyết áp, nhiệt kế và thiết bị y tế')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (141, N'Đồ dùng phòng khách', N'Bàn ghế, kệ tivi và đồ trang trí phòng khách')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (142, N'Đồ dùng chăm sóc thú cưng', N'Sản phẩm vệ sinh và chăm sóc thú cưng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (143, N'Thiết bị an ninh', N'Camera giám sát, khóa thông minh')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (144, N'Thực phẩm chế biến sẵn', N'Thực phẩm đóng hộp và chế biến sẵn')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (145, N'Phụ kiện thời trang', N'Túi xách, thắt lưng và khăn choàng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (146, N'Đồ chơi lắp ráp', N'Đồ chơi lắp ráp như LEgo và mô hình')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (147, N'Sản phẩm chăm sóc môi', N'Son dưỡng và sản phẩm chăm sóc môi')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (148, N'Thiết bị lưu trữ', N'USB, ổ cứng ngoài và thẻ nhớ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (149, N'Đồ dùng bơi lội', N'Áo bơi, kính bơi và phụ kiện bơi lội')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (150, N'Sản phẩm chăm sóc răng miệng', N'Kem đánh răng, bàn chải và nước súc miệng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (151, N'Đồ dùng phòng tắm', N'Khăn tắm, kệ đựng đồ và phụ kiện phòng tắm')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (152, N'Đồ dùng dã ngoại', N'Lều, túi ngủ và dụng cụ cắm trại')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (153, N'Thiết bị chiếu sáng', N'Đèn LED, đèn bàn và đèn trang trí')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (154, N'Thực phẩm dinh dưỡng', N'Sữa bột, thực phẩm bổ sung dinh dưỡng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (155, N'Đồng hồ thời trang', N'Đồng hồ đeo tay thời trang')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (156, N'Đồ chơi sáng tạo', N'Đồ chơi khuyến khích sáng tạo và tư duy')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (157, N'Sản phẩm chống nắng', N'Kem chống nắng và sản phẩm bảo vệ da')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (158, N'Giấy và sản phẩm giấy', N'Giấy in, giấy ghi chú và sản phẩm giấy')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (159, N'Dụng cụ thể dục tại nhà', N'Máy chạy bộ, tạ và thiết bị tập gym')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (160, N'Thiết bị chăm sóc cá nhân', N'Máy cạo râu, máy sấy tóc và thiết bị cá nhân')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (161, N'Đồ dùng sân vườn', N'Cây cảnh, dụng cụ làm vườn và đồ trang trí')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (162, N'Phụ kiện công nghệ', N'Tai nghe, sạc dự phòng và vỏ điện thoại')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (163, N'Thiết bị âm thanh', N'Loa Bluetooth, tai nghe và hệ thống âm thanh')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (164, N'Thực phẩm nhập khẩu', N'Thực phẩm nhập khẩu từ các nước')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (165, N'Ba lô và túi du lịch', N'Ba lô, vali và túi du lịch')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (166, N'Đồ chơi vận động', N'Xe trượt, bóng và đồ chơi vận động')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (167, N'Sản phẩm làm sạch da', N'Sữa rửa mặt và sản phẩm làm sạch da')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (168, N'Thiết bị mạng', N'Router, modem và thiết bị kết nối mạng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (169, N'Đồ dùng trượt tuyết', N'Ván trượt tuyết và phụ kiện trượt tuyết')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (170, N'Sản phẩm chăm sóc mắt', N'Kính áp tròng và sản phẩm chăm sóc mắt')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (171, N'Đồ dùng nhà ăn', N'Bát, đĩa, ly và đồ dùng nhà ăn')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (172, N'Đồ dùng cắm trại', N'Bếp dã ngoại, ghế gấp và đồ dùng cắm trại')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (173, N'Thiết bị giám sát', N'Camera an ninh và thiết bị giám sát')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (174, N'Thực phẩm chức năng', N'Vitamin và thực phẩm bổ sung sức khỏe')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (175, N'Mũ và nón thời trang', N'Mũ lưỡi trai, mũ len và nón thời trang')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (176, N'Đồ chơi mô hình', N'Mô hình xe, máy bay và tàu hỏa')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (177, N'Sản phẩm chăm sóc cơ thể', N'Sữa tắm và sản phẩm chăm sóc cơ thể')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (178, N'Máy tính và phụ kiện', N'Laptop, bàn phím và chuột máy tính')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (179, N'Dụng cụ câu cá', N'Cần câu, lưỡi câu và phụ kiện câu cá')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (180, N'Sản phẩm chăm sóc trẻ em', N'Sữa tắm, kem dưỡng dành cho trẻ em')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (181, N'Đồ dùng vệ sinh nhà cửa', N'Chổi, cây lau nhà và sản phẩm vệ sinh')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (182, N'Đồ dùng lễ hội', N'Đồ trang trí Giáng sinh, Tết và lễ hội')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (183, N'Thiết bị điện gia dụng', N'Quạt điện, máy sưởi và thiết bị gia dụng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (184, N'Thực phẩm khô', N'Hạt, trái cây sấy và thực phẩm khô')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (185, N'Phụ kiện tóc', N'Kẹp tóc, dây buộc tóc và phụ kiện tóc')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (186, N'Đồ chơi tương tác', N'Đồ chơi có tính năng tương tác với trẻ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (187, N'Sản phẩm làm đẹp cao cấp', N'Mỹ phẩm và sản phẩm làm đẹp cao cấp')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (188, N'Thiết bị trình chiếu', N'Máy chiếu và phụ kiện trình chiếu')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (189, N'Đồ dùng lướt sóng', N'Ván lướt sóng và phụ kiện lướt sóng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (190, N'Sản phẩm chăm sóc móng', N'Sơn móng tay và dụng cụ chăm sóc móng')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (191, N'Đồ dùng học tập', N'Cặp sách, đồ dùng học sinh và học cụ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (192, N'Đồ dùng tiệc tùng', N'Bong bóng, nến và đồ trang trí tiệc')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (193, N'Thiết bị thông minh', N'Đồng hồ thông minh và thiết bị IoT')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (194, N'Thực phẩm chay', N'Thực phẩm dành cho người ăn chay')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (195, N'Túi xách thời trang', N'Túi xách thời trang cho nam và nữ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (196, N'Đồ chơi khoa học', N'Bộ thí nghiệm và đồ chơi khoa học')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (197, N'Sản phẩm chống lão hóa', N'Kem chống lão hóa và sản phẩm dưỡng da')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (198, N'Thiết bị lưu điện', N'Bộ lưu điện và thiết bị dự phòng điện')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (199, N'Dụng cụ golf', N'Gậy golf, bóng golf và phụ kiện golf')
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoaiSP], [MoTa]) VALUES (200, N'Sản phẩm chăm sóc da nhạy cảm', N'Sản phẩm dành cho da nhạy cảm')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (1, N'Công ty ABC', N'Khu công nghiệp X, Hà Nội', N'024123467', N'info@abc.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (2, N'Nhà cung cấp XYZ', N'Khu công nghiệp Y, Hà Nội', N'0249876543', N'sales@xyz.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (3, N'Doanh nghiệp 123', N'Thành phố Hồ Chí Minh', N'0281122334', N'contact@123.net')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (4, N'Đơn vị Thương Mại 456', N'Đà Nẵng', N'02365567', N'support@456.org')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (5, N'Tổ chức Bán Lẻ 789', N'Hải Phòng', N'0225990011', N'marketing@789.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (6, N'Công ty Sản Xuất A', N'Bắc Ninh', N'0222334455', N'order@sanxuatA.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (7, N'Nhà phân phối B', N'Hưng Yên', N'0221667788', N'distribute@phanphoiB.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (8, N'Xưởng Chế Tạo C', N'Vĩnh Phúc', N'0211990088', N'factoryC@chetao.net')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (9, N'Tổng công ty D', N'Thái Nguyên', N'0208112299', N'general@tongcongtyD.org')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (10, N'Công ty TNHH Sản xuất Minh Đức', N'Hà Nội', N'0241234567', N'info@minhduc.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (11, N'Nhà cung cấp Thiết bị Công Nghệ Bình Minh', N'Đà Nẵng', N'0236556677', N'support@binhminh.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (12, N'Công ty Xuất khẩu Thăng Long', N'Bình Dương', N'0274412345', N'contact@thanglong.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (13, N'Nhà phân phối Vật liệu Xây dựng Phú Thọ', N'Vĩnh Phúc', N'0211990088', N'factoryphutho@vatlieu.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (14, N'Tổ chức Thương mại Quốc tế Hải Minh', N'Quảng Ngãi', N'0256937456', N'sales@haiminh.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (15, N'Công ty Hóa chất Thành Hưng', N'Bắc Ninh', N'0222334455', N'order@hoachatthanhhung.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (16, N'Nhà cung cấp Thiết bị điện Toàn Cầu', N'Hồ Chí Minh', N'0281234567', N'info@toancau.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (17, N'Xưởng chế tạo Cơ khí Hoàng Nam', N'Hải Phòng', N'0222345678', N'factoryhoangnam@chetao.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (18, N'Tổng công ty Xây dựng Long Phát', N'Hà Nam', N'0223334445', N'contact@tongcongtylongphat.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (19, N'Hợp tác xã Nông sản Vân Nam', N'Thái Nguyên', N'0208112299', N'cooperativevannam@hoptac.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (20, N'Công ty Kỹ thuật Điện tử Gia Hòa', N'Quảng Ninh', N'0233456789', N'technicalgiahoa@congty.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (21, N'Nhà cung cấp Lắp đặt Hệ thống An Phát', N'Lạng Sơn', N'0201234567', N'installanphat@lapdat.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (22, N'Nhà phân phối Sản phẩm Mới Tiến Phát', N'Hưng Yên', N'0221993456', N'distributiontienphat@sanpham.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (23, N'Xưởng chế tạo Kim loại Phúc Lộc', N'Thái Bình', N'0222112233', N'factoryphucloc@kimloai.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (24, N'Công ty Thiết bị Y tế Hòa Bình', N'Hải Dương', N'0202223344', N'medicalhoabinh@thietbiyte.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (25, N'Nhà cung cấp Dịch vụ Thực phẩm Thảo Nguyên', N'Vĩnh Long', N'0270857632', N'service@thao.nguyen.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (26, N'Công ty TNHH Vật liệu Xây dựng Toàn Cầu', N'Bắc Giang', N'0223456789', N'material@toancau.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (27, N'Tổng công ty Dịch vụ Logistic Bắc Trung Nam', N'Nghệ An', N'0236541234', N'logistics@btc.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (28, N'Nhà phân phối Thiết bị Cơ khí Đồng Nai', N'Đồng Nai', N'0257889922', N'distributedd@congnghiep.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (29, N'Công ty TNHH Sản phẩm Gia dụng Nhật Bản', N'Hà Nội', N'0249123456', N'products@nhatban.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (30, N'Nhà cung cấp Dịch vụ Mạng Thông tin Hải Đăng', N'Hồ Chí Minh', N'0287654321', N'network@haidang.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (31, N'Xưởng chế tạo Linh kiện Ô tô Tân Thành', N'Quảng Nam', N'0234567890', N'factorytanthanh@linhkien.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (32, N'Công ty TNHH Công nghệ Mới Sài Gòn', N'Hồ Chí Minh', N'0281238765', N'newtech@saigon.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (33, N'Nhà cung cấp Sản phẩm Điện tử Bình An', N'Hà Nội', N'0245566778', N'electronics@binhan.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (34, N'Tổ chức Dịch vụ Du lịch Sông Hồng', N'Hải Phòng', N'0227123456', N'tourism@songhong.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (35, N'Nhà phân phối Dược phẩm An Bình', N'Quảng Ngãi', N'0256345678', N'pharmacy@anbinh.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (36, N'Công ty Cổ phần Dầu khí Đông Á', N'Quảng Trị', N'0239945678', N'oil@donga.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (37, N'Tổng công ty Vận tải Quốc tế Tiến Lên', N'Phú Thọ', N'0209876543', N'transport@tienlen.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (38, N'Nhà cung cấp Thực phẩm sạch Hoa Sen', N'Thái Nguyên', N'0212666666', N'food@hoasen.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (39, N'Xưởng chế tạo Máy móc Công nghiệp Trường Thành', N'Bắc Ninh', N'0221998866', N'machinery@truongthanh.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (40, N'Công ty Dịch vụ Sửa chữa Ô tô Hoàng Gia', N'Hà Nội', N'0241122334', N'carrepair@hoanggia.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (41, N'Công ty Sản phẩm Điện Gia Dụng Lioa', N'Khu công nghiệp Lào Cai', N'0212123456', N'contact@lioa.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (42, N'Công ty Thực phẩm Tươi Sống Vinmart', N'Hà Nội', N'0243123456', N'info@vinmart.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (43, N'Nhà phân phối Đồ Gia Dụng Tupperware', N'TP.HCM', N'0287654321', N'sales@tupperware.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (44, N'Công ty Đồ điện tử Samsung Việt Nam', N'Khu công nghiệp Bình Dương', N'0274234567', N'support@samsung.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (45, N'Nhà cung cấp Mỹ phẩm Scenti', N'Hà Nội', N'0248765432', N'service@scenti.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (46, N'Nhà cung cấp Thực phẩm An Toàn Vina', N'Đà Nẵng', N'0236334555', N'contact@vinatao.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (47, N'Công ty Thực phẩm Tiện Lợi Nestlé', N'TP.HCM', N'0282233445', N'care@nestle.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (48, N'Nhà cung cấp Điện thoại Di Động FPT', N'Hà Nội', N'0244444555', N'support@fptmobile.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (49, N'Công ty Phụ kiện Ô tô Mai Linh', N'Hải Phòng', N'0222333444', N'info@mailinhome.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (50, N'Nhà cung cấp Nước giải khát Coca-Cola', N'Bắc Ninh', N'0223456789', N'sales@cokecorp.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (51, N'Công ty Vật liệu xây dựng VinaHome', N'Hà Nội', N'0241213145', N'info@vinahome.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (52, N'Nhà cung cấp Sản phẩm Thời trang H&M', N'TP.HCM', N'0286767889', N'contact@hm.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (53, N'Công ty Thực phẩm Ánh Dương', N'Quảng Ninh', N'0234837383', N'support@anhduongfood.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (54, N'Nhà phân phối Đồ điện tử Sony', N'Bình Dương', N'0274747474', N'help@sony.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (55, N'Công ty Cung cấp Tỏi sạch Hồng Phát', N'Vĩnh Phúc', N'0211382828', N'contact@hongphat.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (56, N'Nhà cung cấp Sản phẩm Bảo vệ gia đình Honeywell', N'Hà Nội', N'0242525222', N'service@honeywell.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (57, N'Công ty Giày dép Nike', N'TP.HCM', N'0281292929', N'support@nike.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (58, N'Nhà cung cấp Thiết bị y tế Medtronic', N'Hải Dương', N'0226789098', N'info@medtronic.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (59, N'Nhà cung cấp Máy tính Dell Việt Nam', N'Bắc Giang', N'0229876543', N'contact@dell.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (60, N'Nhà phân phối Sữa tươi Vinamilk', N'Hà Nội', N'0249001020', N'sales@vinamilk.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (61, N'Công ty Hàng gia dụng Philips', N'Hồ Chí Minh', N'0281234567', N'info@philips.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (62, N'Nhà cung cấp Thực phẩm sạch Gạo Lúa', N'Thái Nguyên', N'0201112233', N'sales@gaolua.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (63, N'Công ty Đồ chơi trẻ em Lego', N'Bình Dương', N'0274234455', N'contact@lego.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (64, N'Nhà cung cấp Sản phẩm nội thất IKEA', N'TP.HCM', N'0289876543', N'service@ikea.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (65, N'Công ty Vận chuyển và Logistics Grab', N'Đà Nẵng', N'0236234343', N'support@grab.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (66, N'Nhà cung cấp Bánh kẹo Mondelez', N'Hà Nội', N'0245432189', N'info@mondelez.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (67, N'Công ty Tupperware Việt Nam', N'TP.HCM', N'0285678934', N'contact@tupperware.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (68, N'Nhà cung cấp Đồ gia dụng Bluestone', N'Bắc Giang', N'0223456712', N'info@bluestone.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (69, N'Công ty Dược phẩm Sanofi', N'TP.HCM', N'0287654345', N'support@sanofi.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (70, N'Nhà phân phối Hóa mỹ phẩm P&G', N'Quảng Ngãi', N'0234567890', N'service@pg.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (71, N'Công ty Máy móc và Thiết bị Siemens', N'Vĩnh Phúc', N'0213123456', N'help@siemens.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (72, N'Nhà cung cấp Dụng cụ thể thao Adidas', N'Hà Nội', N'0248765431', N'sales@adidas.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (73, N'Công ty Chế biến thực phẩm Minh Dương', N'Hà Nội', N'0242333445', N'sales@minhduongfood.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (74, N'Nhà cung cấp Điện tử LG', N'TP.HCM', N'0286364747', N'support@lg.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (75, N'Công ty Nước giải khát PepsiCo', N'Bình Dương', N'0274747477', N'contact@pepsico.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (76, N'Nhà cung cấp Thực phẩm Sữa Ba Vì', N'Hà Nội', N'0245454545', N'info@bavi.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (77, N'Công ty Vận tải và Logistics DHL', N'Hồ Chí Minh', N'0282222333', N'support@dhl.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (78, N'Nhà cung cấp Điện thoại Huawei', N'Bắc Ninh', N'0222333444', N'service@huawei.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (79, N'Công ty Nội thất Hòa Phát', N'TP.HCM', N'0282333445', N'contact@hoaphat.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (80, N'Nhà phân phối Thực phẩm Vietfood', N'Hà Nội', N'0242123456', N'sales@vietfood.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (81, N'Công ty Sản xuất Nhựa An Phú', N'Bắc Giang', N'0222345678', N'info@anphu.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (82, N'Nhà cung cấp Thực phẩm dinh dưỡng Abbott', N'TP.HCM', N'0284534343', N'care@abbott.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (83, N'Công ty Máy móc công nghiệp Daewoo', N'Bình Dương', N'0274332211', N'info@daewoo.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (84, N'Nhà cung cấp Thực phẩm hữu cơ GreenFood', N'Đà Nẵng', N'0236333232', N'contact@greenfood.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (85, N'Công ty Tư vấn bất động sản Vinhomes', N'Hà Nội', N'0242123457', N'info@vinhomes.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (86, N'Nhà cung cấp Hóa mỹ phẩm L’Oreal', N'Hồ Chí Minh', N'0287654321', N'care@loreal.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (87, N'Công ty Giày thể thao Puma', N'Bắc Ninh', N'0221112233', N'support@puma.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (88, N'Nhà phân phối Máy tính bảng Apple', N'Hà Nội', N'0246758492', N'support@apple.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (89, N'Công ty Sản phẩm Chăm sóc sức khỏe Unilever', N'Bắc Giang', N'0221334455', N'service@unilever.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (90, N'Nhà cung cấp Tủ lạnh Panasonic', N'Hồ Chí Minh', N'0282111222', N'contact@panasonic.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (91, N'Công ty Hệ thống điện Schneider', N'Vĩnh Phúc', N'0211252323', N'support@schneider.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (92, N'Nhà cung cấp Dụng cụ thể thao Nike', N'Hà Nội', N'0241234567', N'info@nike.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (93, N'Công ty Máy lạnh Daikin', N'Bắc Ninh', N'0222333445', N'service@daikin.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (94, N'Nhà phân phối Sản phẩm siêu thị Big C', N'TP.HCM', N'0289888777', N'sales@bigc.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (95, N'Công ty Thiết bị điện LG', N'Hà Nội', N'0242333344', N'support@lg.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (96, N'Nhà cung cấp Đồ gia dụng Cuckoo', N'Bắc Giang', N'0222334567', N'info@cuckoo.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (97, N'Công ty Vận chuyển Grab', N'TP.HCM', N'0286677889', N'support@grab.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (98, N'Nhà phân phối Phụ kiện điện thoại Anker', N'Hà Nội', N'0242333345', N'sales@anker.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (99, N'Công ty Thực phẩm quốc tế Masan', N'TP.HCM', N'0282222334', N'support@masan.vn')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (100, N'Hợp tác xã E', N'Hà Nam', N'0226554433', N'cooperativeE@hoptac.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (101, N'Công ty ABC', N'Khu công nghiệp X, Hà Nội', N'024123467', N'info@abc.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (102, N'Nhà cung cấp XYZ', N'Khu công nghiệp Y, Hà Nội', N'0249876543', N'sales@xyz.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (103, N'Doanh nghiệp 123', N'Thành phố Hồ Chí Minh', N'0281122334', N'contact@123.net')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (104, N'Đơn vị Thương Mại 456', N'Đà Nẵng', N'02365567', N'support@456.org')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (105, N'Tổ chức Bán Lẻ 789', N'Hải Phòng', N'0225990011', N'marketing@789.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (106, N'Công ty Sản Xuất A', N'Bắc Ninh', N'0222334455', N'order@sanxuatA.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (107, N'Nhà phân phối B', N'Hưng Yên', N'0221667788', N'distribute@phanphoiB.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (108, N'Xưởng Chế Tạo C', N'Vĩnh Phúc', N'0211990088', N'factoryC@chetao.net')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (109, N'Tổng công ty D', N'Thái Nguyên', N'0208112299', N'general@tongcongtyD.org')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (110, N'Công ty TNHH Sản xuất Minh Đức', N'Hà Nội', N'0241234567', N'info@minhduc.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (111, N'Nhà cung cấp Thiết bị Công Nghệ Bình Minh', N'Đà Nẵng', N'0236556677', N'support@binhminh.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (112, N'Công ty Xuất khẩu Thăng Long', N'Bình Dương', N'0274412345', N'contact@thanglong.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (113, N'Nhà phân phối Vật liệu Xây dựng Phú Thọ', N'Vĩnh Phúc', N'0211990088', N'factoryphutho@vatlieu.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (114, N'Tổ chức Thương mại Quốc tế Hải Minh', N'Quảng Ngãi', N'0256937456', N'sales@haiminh.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (115, N'Công ty Hóa chất Thành Hưng', N'Bắc Ninh', N'0222334455', N'order@hoachatthanhhung.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (116, N'Nhà cung cấp Thiết bị điện Toàn Cầu', N'Hồ Chí Minh', N'0281234567', N'info@toancau.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (117, N'Xưởng chế tạo Cơ khí Hoàng Nam', N'Hải Phòng', N'0222345678', N'factoryhoangnam@chetao.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (118, N'Tổng công ty Xây dựng Long Phát', N'Hà Nam', N'0223334445', N'contact@tongcongtylongphat.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (119, N'Hợp tác xã Nông sản Vân Nam', N'Thái Nguyên', N'0208112299', N'cooperativevannam@hoptac.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (120, N'Công ty Kỹ thuật Điện tử Gia Hòa', N'Quảng Ninh', N'0233456789', N'technicalgiahoa@congty.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (121, N'Nhà cung cấp Lắp đặt Hệ thống An Phát', N'Lạng Sơn', N'0201234567', N'installanphat@lapdat.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (122, N'Nhà phân phối Sản phẩm Mới Tiến Phát', N'Hưng Yên', N'0221993456', N'distributiontienphat@sanpham.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (123, N'Xưởng chế tạo Kim loại Phúc Lộc', N'Thái Bình', N'0222112233', N'factoryphucloc@kimloai.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (124, N'Công ty Thiết bị Y tế Hòa Bình', N'Hải Dương', N'0202223344', N'medicalhoabinh@thietbiyte.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (125, N'Nhà cung cấp Dịch vụ Thực phẩm Thảo Nguyên', N'Vĩnh Long', N'0270857632', N'service@thao.nguyen.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (126, N'Công ty TNHH Vật liệu Xây dựng Toàn Cầu', N'Bắc Giang', N'0223456789', N'material@toancau.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (127, N'Tổng công ty Dịch vụ Logistic Bắc Trung Nam', N'Nghệ An', N'0236541234', N'logistics@btc.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (128, N'Nhà phân phối Thiết bị Cơ khí Đồng Nai', N'Đồng Nai', N'0257889922', N'distributedd@congnghiep.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (129, N'Công ty TNHH Sản phẩm Gia dụng Nhật Bản', N'Hà Nội', N'0249123456', N'products@nhatban.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (130, N'Nhà cung cấp Dịch vụ Mạng Thông tin Hải Đăng', N'Hồ Chí Minh', N'0287654321', N'network@haidang.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (131, N'Xưởng chế tạo Linh kiện Ô tô Tân Thành', N'Quảng Nam', N'0234567890', N'factorytanthanh@linhkien.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (132, N'Công ty TNHH Công nghệ Mới Sài Gòn', N'Hồ Chí Minh', N'0281238765', N'newtech@saigon.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (133, N'Nhà cung cấp Sản phẩm Điện tử Bình An', N'Hà Nội', N'0245566778', N'electronics@binhan.com')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (134, N'Tổ chức Dịch vụ Du lịch Sông Hồng', N'Hải Phòng', N'0227123456', N'tourism@songhong.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (135, N'Nhà phân phối Dược phẩm An Bình', N'Quảng Ngãi', N'0256345678', N'pharmacy@anbinh.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (136, N'Công ty Cổ phần Dầu khí Đông Á', N'Quảng Trị', N'0239945678', N'oil@donga.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (137, N'Tổng công ty Vận tải Quốc tế Tiến Lên', N'Phú Thọ', N'0209876543', N'transport@tienlen.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (138, N'Nhà cung cấp Thực phẩm sạch Hoa Sen', N'Thái Nguyên', N'0212666666', N'food@hoasen.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (139, N'Xưởng chế tạo Máy móc Công nghiệp Trường Thành', N'Bắc Ninh', N'0221998866', N'machinery@truongthanh.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (140, N'Công ty Dịch vụ Sửa chữa Ô tô Hoàng Gia', N'Hà Nội', N'0241122334', N'carrepair@hoanggia.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (141, N'Công ty Sản phẩm Điện Gia Dụng Lioa', N'Khu công nghiệp Lào Cai', N'0212123456', N'contact@lioa.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (142, N'Công ty Thực phẩm Tươi Sống Vinmart', N'Hà Nội', N'0243123456', N'info@vinmart.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (143, N'Nhà phân phối Đồ Gia Dụng Tupperware', N'TP.HCM', N'0287654321', N'sales@tupperware.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (144, N'Công ty Đồ điện tử Samsung Việt Nam', N'Khu công nghiệp Bình Dương', N'0274234567', N'support@samsung.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (145, N'Nhà cung cấp Mỹ phẩm Scenti', N'Hà Nội', N'0248765432', N'service@scenti.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (146, N'Nhà cung cấp Thực phẩm An Toàn Vina', N'Đà Nẵng', N'0236334555', N'contact@vinatao.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (147, N'Công ty Thực phẩm Tiện Lợi Nestlé', N'TP.HCM', N'0282233445', N'care@nestle.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (148, N'Nhà cung cấp Điện thoại Di Động FPT', N'Hà Nội', N'0244444555', N'support@fptmobile.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (149, N'Công ty Phụ kiện Ô tô Mai Linh', N'Hải Phòng', N'0222333444', N'info@mailinhome.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (150, N'Nhà cung cấp Nước giải khát Coca-Cola', N'Bắc Ninh', N'0223456789', N'sales@cokecorp.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (151, N'Công ty Vật liệu xây dựng VinaHome', N'Hà Nội', N'0241213145', N'info@vinahome.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (152, N'Nhà cung cấp Sản phẩm Thời trang H&M', N'TP.HCM', N'0286767889', N'contact@hm.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (153, N'Công ty Thực phẩm Ánh Dương', N'Quảng Ninh', N'0234837383', N'support@anhduongfood.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (154, N'Nhà phân phối Đồ điện tử Sony', N'Bình Dương', N'0274747474', N'help@sony.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (155, N'Công ty Cung cấp Tỏi sạch Hồng Phát', N'Vĩnh Phúc', N'0211382828', N'contact@hongphat.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (156, N'Nhà cung cấp Sản phẩm Bảo vệ gia đình Honeywell', N'Hà Nội', N'0242525222', N'service@honeywell.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (157, N'Công ty Giày dép Nike', N'TP.HCM', N'0281292929', N'support@nike.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (158, N'Nhà cung cấp Thiết bị y tế Medtronic', N'Hải Dương', N'0226789098', N'info@medtronic.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (159, N'Nhà cung cấp Máy tính Dell Việt Nam', N'Bắc Giang', N'0229876543', N'contact@dell.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (160, N'Nhà phân phối Sữa tươi Vinamilk', N'Hà Nội', N'0249001020', N'sales@vinamilk.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (161, N'Công ty Hàng gia dụng Philips', N'Hồ Chí Minh', N'0281234567', N'info@philips.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (162, N'Nhà cung cấp Thực phẩm sạch Gạo Lúa', N'Thái Nguyên', N'0201112233', N'sales@gaolua.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (163, N'Công ty Đồ chơi trẻ em Lego', N'Bình Dương', N'0274234455', N'contact@lego.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (164, N'Nhà cung cấp Sản phẩm nội thất IKEA', N'TP.HCM', N'0289876543', N'service@ikea.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (165, N'Công ty Vận chuyển và Logistics Grab', N'Đà Nẵng', N'0236234343', N'support@grab.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (166, N'Nhà cung cấp Bánh kẹo Mondelez', N'Hà Nội', N'0245432189', N'info@mondelez.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (167, N'Công ty Tupperware Việt Nam', N'TP.HCM', N'0285678934', N'contact@tupperware.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (168, N'Nhà cung cấp Đồ gia dụng Bluestone', N'Bắc Giang', N'0223456712', N'info@bluestone.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (169, N'Công ty Dược phẩm Sanofi', N'TP.HCM', N'0287654345', N'support@sanofi.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (170, N'Nhà phân phối Hóa mỹ phẩm P&G', N'Quảng Ngãi', N'0234567890', N'service@pg.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (171, N'Công ty Máy móc và Thiết bị Siemens', N'Vĩnh Phúc', N'0213123456', N'help@siemens.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (172, N'Nhà cung cấp Dụng cụ thể thao Adidas', N'Hà Nội', N'0248765431', N'sales@adidas.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (173, N'Công ty Chế biến thực phẩm Minh Dương', N'Hà Nội', N'0242333445', N'sales@minhduongfood.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (174, N'Nhà cung cấp Điện tử LG', N'TP.HCM', N'0286364747', N'support@lg.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (175, N'Công ty Nước giải khát PepsiCo', N'Bình Dương', N'0274747477', N'contact@pepsico.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (176, N'Nhà cung cấp Thực phẩm Sữa Ba Vì', N'Hà Nội', N'0245454545', N'info@bavi.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (177, N'Công ty Vận tải và Logistics DHL', N'Hồ Chí Minh', N'0282222333', N'support@dhl.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (178, N'Nhà cung cấp Điện thoại Huawei', N'Bắc Ninh', N'0222333444', N'service@huawei.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (179, N'Công ty Nội thất Hòa Phát', N'TP.HCM', N'0282333445', N'contact@hoaphat.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (180, N'Nhà phân phối Thực phẩm Vietfood', N'Hà Nội', N'0242123456', N'sales@vietfood.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (181, N'Công ty Sản xuất Nhựa An Phú', N'Bắc Giang', N'0222345678', N'info@anphu.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (182, N'Nhà cung cấp Thực phẩm dinh dưỡng Abbott', N'TP.HCM', N'0284534343', N'care@abbott.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (183, N'Công ty Máy móc công nghiệp Daewoo', N'Bình Dương', N'0274332211', N'info@daewoo.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (184, N'Nhà cung cấp Thực phẩm hữu cơ GreenFood', N'Đà Nẵng', N'0236333232', N'contact@greenfood.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (185, N'Công ty Tư vấn bất động sản Vinhomes', N'Hà Nội', N'0242123457', N'info@vinhomes.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (186, N'Nhà cung cấp Hóa mỹ phẩm L’Oreal', N'Hồ Chí Minh', N'0287654321', N'care@loreal.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (187, N'Công ty Giày thể thao Puma', N'Bắc Ninh', N'0221112233', N'support@puma.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (188, N'Nhà phân phối Máy tính bảng Apple', N'Hà Nội', N'0246758492', N'support@apple.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (189, N'Công ty Sản phẩm Chăm sóc sức khỏe Unilever', N'Bắc Giang', N'0221334455', N'service@unilever.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (190, N'Nhà cung cấp Tủ lạnh Panasonic', N'Hồ Chí Minh', N'0282111222', N'contact@panasonic.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (191, N'Công ty Hệ thống điện Schneider', N'Vĩnh Phúc', N'0211252323', N'support@schneider.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (192, N'Nhà cung cấp Dụng cụ thể thao Nike', N'Hà Nội', N'0241234567', N'info@nike.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (193, N'Công ty Máy lạnh Daikin', N'Bắc Ninh', N'0222333445', N'service@daikin.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (194, N'Nhà phân phối Sản phẩm siêu thị Big C', N'TP.HCM', N'0289888777', N'sales@bigc.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (195, N'Công ty Thiết bị điện LG', N'Hà Nội', N'0242333344', N'support@lg.com.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (196, N'Nhà cung cấp Đồ gia dụng Cuckoo', N'Bắc Giang', N'0222334567', N'info@cuckoo.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (197, N'Công ty Vận chuyển Grab', N'TP.HCM', N'0286677889', N'support@grab.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (198, N'Nhà phân phối Phụ kiện điện thoại Anker', N'Hà Nội', N'0242333345', N'sales@anker.vn')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (199, N'Công ty Thực phẩm quốc tế Masan', N'TP.HCM', N'0282222334', N'support@masan.vn')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (200, N'Hợp tác xã E', N'Hà Nam', N'0226554433', N'cooperativeE@hoptac.com')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (1, N'Nguyễn Văn A', CAST(N'1990-05-15' AS Date), N'Nam', N'Hà Nội', N'090123467', N'annguyen@email.com', N'Quản lý', CAST(N'2020-08-01' AS Date), CAST(15000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (2, N'Trần Thị B', CAST(N'1992-11-20' AS Date), N'Nữ', N'Hà Nội', N'098765321', N'btran@email.com', N'Nhân viên bán hàng', CAST(N'2021-03-10' AS Date), CAST(8000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (3, N'Lê Văn C', CAST(N'1988-07-05' AS Date), N'Nam', N' Hà Nội', N'091245678', N'cle@email.com', N'Kế toán', CAST(N'2022-01-15' AS Date), CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (4, N'Phạm Thị D', CAST(N'1995-02-28' AS Date), N'Nữ', N'Nam Định', N'098901234', N'dpham@email.com', N'Thu ngân', CAST(N'2022-05-20' AS Date), CAST(7500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (5, N'Hoàng Văn E', CAST(N'1991-09-10' AS Date), N'Nam', N'Thái Bình', N'034567890', N'ehoang@email.com', N'Nhân viên kho', CAST(N'2023-07-01' AS Date), CAST(8500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (6, N'Vũ Thị F', CAST(N'1993-04-01' AS Date), N'Nữ', N' HCM', N'096543219', N'fvu@email.com', N'Marketing', CAST(N'2023-11-05' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (7, N'Đặng Văn G', CAST(N'1989-12-25' AS Date), N'Nam', N' Bắc Ninh', N'041234567', N'gdang@email.com', N'IT', CAST(N'2024-02-10' AS Date), CAST(12000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (8, N'Bùi Thị H', CAST(N'1994-06-30' AS Date), N'Nữ', N'Bắc Giang', N'098765432', N'hbui@email.com', N'Chăm sóc khách hàng', CAST(N'2024-06-15' AS Date), CAST(8200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (9, N'Cao Văn I', CAST(N'1996-01-20' AS Date), N'Nam', N'Hà Nam', N'090876543', N'icao@email.com', N'Bảo vệ', CAST(N'2024-09-01' AS Date), CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (10, N'Lê Văn G', CAST(N'1992-11-18' AS Date), N'Nam', N'HCM', N'090111001', N'gle@email.com', N'Nhân viên bán hàng', CAST(N'2023-01-15' AS Date), CAST(8200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (11, N'Phạm Thị H', CAST(N'1987-05-03' AS Date), N'Nữ', N'Lạng Sơn', N'098222002', N'hham@emil.com', N'Kế toán', CAST(N'2021-07-20' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (12, N'Hoàng Văn I', CAST(N'1995-09-25' AS Date), N'Nam', N'Lai Châu', N'091333303', N'hoang@email.com', N'Thu ngân', CAST(N'2024-03-10' AS Date), CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (13, N'Trần Thị K', CAST(N'1990-03-12' AS Date), N'Nữ', N'Cao Bằng', N'097444400', N'ran@email.com', N'Nhân viên kho', CAST(N'2022-09-05' AS Date), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (14, N'Vũ Văn L', CAST(N'1998-07-01' AS Date), N'Nam', N'Hưng Yên', N'093555505', N'vu@email.com', N'Marketing', CAST(N'2025-01-01' AS Date), CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (15, N'Đặng Thị M', CAST(N'1983-12-10' AS Date), N'Nữ', N'Yên bái', N'096666606', N'mdang@email.com', N'IT', CAST(N'2020-11-20' AS Date), CAST(12500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (16, N'Bùi Văn N', CAST(N'1996-04-17' AS Date), N'Nam', N'Ninh Bình', N'094777007', N'nbui@email.com', N'Chăm sóc khách hàng', CAST(N'2023-05-25' AS Date), CAST(8000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (17, N'Cao Thị O', CAST(N'1991-08-28' AS Date), N'Nữ', N' Hà Nội', N'092888008', N'ocao@email.com', N'Bảo vệ', CAST(N'2024-08-15' AS Date), CAST(6800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (18, N'Mai Văn P', CAST(N'1999-01-05' AS Date), N'Nam', N' Hà Nội', N'090999009', N'pmai@email.com', N'Thực tập sinh', CAST(N'2025-04-01' AS Date), CAST(5200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (19, N'Lý Thị Q', CAST(N'1985-06-20' AS Date), N'Nữ', N' Hà Nội', N'091011010', N'qly@email.com', N'Quản lý kho', CAST(N'2022-02-10' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (20, N'Vương Văn R', CAST(N'1993-11-02' AS Date), N'Nam', N' Hà Nội', N'981222011', N'rvuong@email.com', N'Bán hàng online', CAST(N'2023-08-25' AS Date), CAST(7900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (21, N'Ngô Thị S', CAST(N'1988-02-15' AS Date), N'Nữ', N'Hà Nội', N'093333012', N'sngo@email.com', N'Kỹ thuật viên', CAST(N'2021-01-01' AS Date), CAST(11500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (22, N'Phùng Văn T', CAST(N'1997-05-28' AS Date), N'Nam', N'Nghệ An', N'963444013', N'tphung@email.com', N'Lễ tân', CAST(N'2024-09-20' AS Date), CAST(6700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (23, N'Trịnh Thị U', CAST(N'1990-09-10' AS Date), N'Nữ', N'Hà Nội', N'094455501', N'utrinh@email.com', N'Nhân viên giao hàng', CAST(N'2025-05-15' AS Date), CAST(7300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (24, N'Hồ Văn V', CAST(N'1994-12-25' AS Date), N'Nam', N'Thái Bình', N'092566605', N'vho@email.com', N'Tuyển dụng', CAST(N'2023-12-01' AS Date), CAST(8500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (25, N'Bạch Thị X', CAST(N'1989-07-08' AS Date), N'Nữ', N'Thái Bình', N'090677016', N'xbach@email.com', N'Trưởng nhóm bán hàng', CAST(N'2024-04-10' AS Date), CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (26, N'Sầm Văn Y', CAST(N'1996-01-20' AS Date), N'Nam', N' Hà Nội', N'097788017', N'ysam@email.com', N'Nhân viên hỗ trợ', CAST(N'2022-06-25' AS Date), CAST(7700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (27, N'Quách Thị Z', CAST(N'1991-04-03' AS Date), N'Nữ', N'Hà Nội', N'093899018', N'zquach@email.com', N'Phân tích dữ liệu', CAST(N'2025-02-01' AS Date), CAST(11200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (28, N'Uông Văn AA', CAST(N'1999-09-15' AS Date), N'Nam', N'Nam Định', N'069000019', N'a.uong@email.com', N'Thực tập sinh marketing', CAST(N'2024-10-15' AS Date), CAST(5300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (29, N'Phan Thị BB', CAST(N'1984-03-01' AS Date), N'Nữ', N'Hà Nội', N'091222020', N'bb.phan@mail.com', N'Kiểm toán viên', CAST(N'2023-03-01' AS Date), CAST(12200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (30, N'Lâm Văn CC', CAST(N'1997-07-18' AS Date), N'Nam', N'Bắc cạn', N'082333021', N'cclam@email.com', N'Nhân viên lễ tân', CAST(N'2024-11-30' AS Date), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (31, N'Trần Thị DD', CAST(N'1992-10-25' AS Date), N'Nữ', N'Thanh Hóa', N'933444022', N'ddtran@email.com', N'Chuyên viên nhân sự', CAST(N'2022-07-10' AS Date), CAST(9800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (32, N'Đỗ Văn EE', CAST(N'1987-01-10' AS Date), N'Nam', N'Hà Nội', N'096555023', N'eedo@email.com', N'Nhân viên kinh doanh', CAST(N'2025-01-01' AS Date), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (33, N'Nguyễn Thị FF', CAST(N'1995-05-03' AS Date), N'Nữ', N'Hòa Bình', N'945666024', N'ffnguyen@email.com', N'Nhân viên kỹ thuật', CAST(N'2023-04-20' AS Date), CAST(10200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (34, N'Lê Văn GG', CAST(N'1990-08-20' AS Date), N'Nam', N'Hà Nội', N'092677025', N'gge@email.com', N'Marketing executive', CAST(N'2021-09-01' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (35, N'Phạm Thị HH', CAST(N'1998-12-05' AS Date), N'Nữ', N'Hà Nội', N'090888026', N'hham@email.com', N'Nhân viên kho', CAST(N'2024-07-15' AS Date), CAST(7600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (36, N'Hoàng Văn II', CAST(N'1983-03-15' AS Date), N'Nam', N'Yên Bái', N'098999027', N'ioang@email.com', N'Trưởng phòng kinh doanh', CAST(N'2022-10-05' AS Date), CAST(14500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (37, N'Trần Thị JJ', CAST(N'1996-07-01' AS Date), N'Nữ', N'Quảng Ninh', N'019000028', N'tran@email.com', N'Phó phòng marketing', CAST(N'2024-12-10' AS Date), CAST(11200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (38, N'Vũ Văn KK', CAST(N'1991-10-18' AS Date), N'Nam', N'Hải Phòng', N'090111029', N'vu@eail.com', N'Nhân viên hành chính', CAST(N'2023-03-01' AS Date), CAST(7100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (39, N'Đặng Thị LL', CAST(N'1999-02-25' AS Date), N'Nữ', N'Hải Dương', N'031222030', N'dang@email.com', N'Quản lý dự án', CAST(N'2025-05-20' AS Date), CAST(13800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (40, N'Bùi Văn MM', CAST(N'1986-06-10' AS Date), N'Nam', N'Hải Phòng', N'062333031', N'mbui@email.com', N'Kiểm soát chất lượng', CAST(N'2022-08-01' AS Date), CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (41, N'Cao Thị NN', CAST(N'1994-11-22' AS Date), N'Nữ', N'Hà Nội', N'094344032', N'nao@email.com', N'Chuyên viên tài chính', CAST(N'2024-01-15' AS Date), CAST(11800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (42, N'Mai Văn OO', CAST(N'1989-04-05' AS Date), N'Nam', N'Hà Nội', N'094555033', N'oo.mai@emaádl.com', N'Nhân viên nhập liệu', CAST(N'2023-06-10' AS Date), CAST(6500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (43, N'Lý Thị PP', CAST(N'1997-08-12' AS Date), N'Nữ', N'Hà Nội', N'090666034', N'pp@email.com', N'Trưởng nhóm kỹ thuật', CAST(N'2025-02-25' AS Date), CAST(15000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (44, N'Vương Văn QQ', CAST(N'1982-12-28' AS Date), N'Nam', N'Hà Nội', N'086777035', N'qq.uong@email.com', N'Phó phòng nhân sự', CAST(N'2021-11-01' AS Date), CAST(12500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (45, N'Ngô Thị RR', CAST(N'1995-03-03' AS Date), N'Nữ', N'Hà Nội', N'093788036', N'r.ngo@email.com', N'Nhân viên thống kê', CAST(N'2024-09-05' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (46, N'Phùng Văn SS', CAST(N'1990-07-15' AS Date), N'Nam', N'Bình Định', N'096899037', N'shung@email.com', N'Chuyên viên đào tạo', CAST(N'2022-03-10' AS Date), CAST(10500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (47, N'Trịnh Thị TT', CAST(N'1998-11-20' AS Date), N'Nữ', N'Hà Nội', N'09490038', N'trinh@email.com', N'Thư ký', CAST(N'2025-01-20' AS Date), CAST(6200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (48, N'Hồ Văn UU', CAST(N'1983-04-01' AS Date), N'Nam', N'Nam Định', N'092111039', N'uuo@email.com', N'Quản lý chi nhánh', CAST(N'2023-07-01' AS Date), CAST(16000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (49, N'Bạch Thị VV', CAST(N'1996-08-17' AS Date), N'Nữ', N'HCM', N'090122040', N'vvch@email.com', N'Nhân viên marketing online', CAST(N'2024-04-15' AS Date), CAST(9100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (50, N'Sầm Văn WW', CAST(N'1991-12-03' AS Date), N'Nam', N'HCM', N'097233041', N'wwam@email.com', N'Thiết kế đồ họa', CAST(N'2022-09-20' AS Date), CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (51, N'Quách Thị XX', CAST(N'1999-05-10' AS Date), N'Nữ', N'HCM', N'09344042', N'xquach@email.com', N'Nhân viên lễ tân', CAST(N'2025-02-01' AS Date), CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (52, N'Uông Văn YY', CAST(N'1984-09-25' AS Date), N'Nam', N'Hà Nội', N'064555043', N'yuong@email.com', N'Chuyên viên mua hàng', CAST(N'2023-12-10' AS Date), CAST(9600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (53, N'Phan Thị ZZ', CAST(N'1997-01-01' AS Date), N'Nữ', N'Bắc Giang', N'095666044', N'zphan@email.com', N'Nhân viên bán vé', CAST(N'2024-08-25' AS Date), CAST(7400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (54, N'Lâm Văn AAA', CAST(N'1992-04-17' AS Date), N'Nam', N'Hà Nam', N'092777045', N'aaalam@email.com', N'Kỹ sư phần mềm', CAST(N'2022-05-01' AS Date), CAST(13000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (55, N'Trần Thị BBB', CAST(N'1987-08-28' AS Date), N'Nữ', N'Bắc Giang', N'0908046', N'bbbtran@email.com', N'Chuyên viên kiểm toán', CAST(N'2025-03-15' AS Date), CAST(11500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (56, N'Mai Thị K', CAST(N'1992-08-12' AS Date), N'Nữ', N'Hà Nam', N'09776541', N'kmai@email.com', N'Thực tập sinh', CAST(N'2025-01-05' AS Date), CAST(5000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (57, N'Trịnh Thị Quỳnh', CAST(N'1992-07-09' AS Date), N'Nữ', N'Hà Nam', N'09803456', N'quynhinh@gmail.com', N'Nhân viên hành chính', CAST(N'2023-08-10' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (58, N'Nguyễn Văn Lâm', CAST(N'1990-03-03' AS Date), N'Nam', N'Hà Nội', N'09913456', N'lamguyen@gmail.com', N'Nhân viên IT', CAST(N'2022-09-15' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (59, N'Phạm Thị Hồng', CAST(N'1995-06-11' AS Date), N'Nữ', N'TP.HCM', N'090212346', N'hongham@gmail.com', N'Chuyên viên tư vấn', CAST(N'2023-12-05' AS Date), CAST(8900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (60, N'Lê Văn Đạo', CAST(N'1989-10-22' AS Date), N'Nam', N'Đà Nẵng', N'091312456', N'daoe@gmail.com', N'Kỹ sư phần mềm', CAST(N'2021-07-20' AS Date), CAST(12300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (61, N'Hoàng Thị Nhung', CAST(N'1993-01-17' AS Date), N'Nữ', N'Quảng Trị', N'924123456', N'nhuhoang@gmail.com', N'Nhân viên kế toán', CAST(N'2022-05-11' AS Date), CAST(8600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (62, N'Ngô Văn Đức', CAST(N'1988-04-30' AS Date), N'Nam', N'Thái Nguyên', N'0325123456', N'ducngo@gmail.com', N'Quản trị hệ thống', CAST(N'2023-03-18' AS Date), CAST(11000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (63, N'Trần Thị Kim', CAST(N'1997-09-25' AS Date), N'Nữ', N'Ninh Bình', N'09123456', N'kimtran@gmail.com', N'Chuyên viên truyền thông', CAST(N'2024-04-04' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (64, N'Phan Văn Toàn', CAST(N'1991-12-01' AS Date), N'Nam', N'Bắc Giang', N'093123456', N'toanphan@gmail.com', N'Nhân viên kỹ thuật', CAST(N'2022-12-01' AS Date), CAST(9900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (65, N'Thái Thị Hòa', CAST(N'1994-08-06' AS Date), N'Nữ', N'Nam Định', N'096234885', N'hoathai@gmail.com', N'Chuyên viên đào tạo', CAST(N'2024-01-15' AS Date), CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (66, N'Hà Văn Tùng', CAST(N'1987-11-29' AS Date), N'Nam', N'Lạng Sơn', N'09912346', N'tungha@gmail.com', N'Nhân viên vận hành', CAST(N'2021-11-01' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (67, N'Đinh Thị Hạnh', CAST(N'1996-02-18' AS Date), N'Nữ', N'Thanh Hóa', N'09008012367', N'hanhdinh@gmail.com', N'Nhân viên CSKH', CAST(N'2023-05-05' AS Date), CAST(8600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (68, N'Nguyễn Văn Bình', CAST(N'1992-05-23' AS Date), N'Nam', N'Tuyên Quang', N'09881123478', N'binhguyen@gmail.com', N'Bảo trì hệ thống', CAST(N'2022-08-10' AS Date), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (69, N'Phạm Thị Yến', CAST(N'1990-06-30' AS Date), N'Nữ', N'Bình Định', N'0902124889', N'yenm@gmail.com', N'Chuyên viên PR', CAST(N'2023-10-01' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (70, N'Lý Văn Khánh', CAST(N'1993-03-27' AS Date), N'Nam', N'Kiên Giang', N'091123490', N'khanhly@gmail.com', N'Thiết kế giao diện', CAST(N'2023-06-20' AS Date), CAST(10400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (71, N'Đỗ Thị Trang', CAST(N'1995-11-12' AS Date), N'Nữ', N'Hậu Giang', N'092413411', N'trangdo@gmail.com', N'Nhân viên nhân sự', CAST(N'2022-10-15' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (72, N'Cao Văn Bình', CAST(N'1989-08-14' AS Date), N'Nam', N'Bến Tre', N'093512334422', N'binhao@gmail.com', N'Kế toán trưởng', CAST(N'2021-03-01' AS Date), CAST(12500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (73, N'Trương Thị Linh', CAST(N'1996-01-04' AS Date), N'Nữ', N'Đồng Tháp', N'046123433', N'linhruong@gmail.com', N'Nhân viên chăm sóc KH', CAST(N'2024-03-01' AS Date), CAST(8500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (74, N'Bùi Văn Trí', CAST(N'1990-09-16' AS Date), N'Nam', N'Tây Ninh', N'09571233444', N'triui@gmail.com', N'Quản lý kỹ thuật', CAST(N'2022-12-20' AS Date), CAST(11400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (75, N'Trần Thị Mai', CAST(N'1994-04-09' AS Date), N'Nữ', N'An Giang', N'09681234525', N'mairan@gmail.com', N'Trợ lý Giám đốc', CAST(N'2024-01-05' AS Date), CAST(9900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (76, N'Nguyễn Văn Phú', CAST(N'1988-07-05' AS Date), N'Nam', N'Long An', N'09791234626', N'phguyen@gmail.com', N'Trưởng bộ phận IT', CAST(N'2021-05-10' AS Date), CAST(14000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (77, N'Lê Thị Hoa', CAST(N'1993-12-20' AS Date), N'Nữ', N'Hà Tĩnh', N'098012477', N'hole@gmail.com', N'Nhân viên bán hàng', CAST(N'2023-07-15' AS Date), CAST(8200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (78, N'Hoàng Văn Long', CAST(N'1992-10-03' AS Date), N'Nam', N'Phú Thọ', N'099113488', N'longhoang@gmail.com', N'Nhân viên tài chính', CAST(N'2022-09-25' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (79, N'Phạm Thị Dung', CAST(N'1991-01-25' AS Date), N'Nữ', N'Hòa Bình', N'09021234299', N'dungpham@gmail.com', N'Trợ lý hành chính', CAST(N'2023-04-01' AS Date), CAST(8600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (80, N'Trịnh Văn Khôi', CAST(N'1987-05-11' AS Date), N'Nam', N'Quảng Nam', N'091312340', N'khoi2rinh@gmail.com', N'Chuyên viên hệ thống', CAST(N'2022-07-01' AS Date), CAST(11800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (81, N'Nguyễn Thị Lệ', CAST(N'1993-03-21' AS Date), N'Nữ', N'Cần Thơ', N'0933123426', N'le2nguyen@gmail.com', N'Nhân viên thống kê', CAST(N'2023-11-10' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (82, N'Phạm Văn Định', CAST(N'1991-06-14' AS Date), N'Nam', N'Nghệ An', N'0942412456', N'dinh2ham@gmail.com', N'Thủ kho', CAST(N'2022-08-20' AS Date), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (83, N'Lê Thị Hằng', CAST(N'1996-12-05' AS Date), N'Nữ', N'Bình Dương', N'095512456', N'hangle@gmail.com', N'Nhân viên chăm sóc khách hàng', CAST(N'2024-05-30' AS Date), CAST(8600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (84, N'Hoàng Văn Kiên', CAST(N'1988-05-19' AS Date), N'Nam', N'Đồng Nai', N'096123456', N'kienhoang@gmail.com', N'IT Helpdesk', CAST(N'2023-07-01' AS Date), CAST(9800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (85, N'Ngô Thị Ngọc', CAST(N'1995-10-02' AS Date), N'Nữ', N'Hậu Giang', N'097723456', N'ngocgo@gmail.com', N'Marketing', CAST(N'2024-01-01' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (86, N'Bùi Văn Phong', CAST(N'1990-11-17' AS Date), N'Nam', N'Tây Ninh', N'098123456', N'phongbui@gmail.com', N'Nhân viên kỹ thuật', CAST(N'2023-06-01' AS Date), CAST(10500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (87, N'Vũ Thị Mai', CAST(N'1987-02-26' AS Date), N'Nữ', N'Bến Tre', N'099912456', N'maiu@gmail.com', N'Trưởng phòng nhân sự', CAST(N'2021-09-15' AS Date), CAST(13500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (88, N'Trần Văn Tiến', CAST(N'1992-08-08' AS Date), N'Nam', N'Hưng Yên', N'001123456', N'tienn@gmail.com', N'Nhân viên kho', CAST(N'2023-04-01' AS Date), CAST(7600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (89, N'Đặng Thị Yến', CAST(N'1994-09-30' AS Date), N'Nữ', N'Lào Cai', N'091123456', N'yeng@gmail.com', N'Thư ký', CAST(N'2025-01-10' AS Date), CAST(6700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (90, N'Cao Văn Trường', CAST(N'1991-12-15' AS Date), N'Nam', N'Sơn La', N'923123456', N'truongao@gmail.com', N'Bảo vệ', CAST(N'2023-11-20' AS Date), CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (91, N'Phan Thị Hương', CAST(N'1990-04-25' AS Date), N'Nữ', N'Lâm Đồng', N'034123456', N'huonghan@gmail.com', N'Nhân viên hành chính', CAST(N'2022-10-01' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (92, N'Mai Văn Hoàn', CAST(N'1985-01-05' AS Date), N'Nam', N'Tuyên Quang', N'045123456', N'hoanai@gmail.com', N'Kiểm toán viên', CAST(N'2023-05-15' AS Date), CAST(11500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (93, N'Quách Thị Tuyết', CAST(N'1997-06-21' AS Date), N'Nữ', N'Phú Yên', N'096123456', N'tuyetquach@gmail.com', N'Chuyên viên nhân sự', CAST(N'2024-06-25' AS Date), CAST(9800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (94, N'Nguyễn Minh Hải', CAST(N'1989-03-11' AS Date), N'Nam', N'Hà Tĩnh', N'067123456', N'hainguyen@gmail.com', N'Phân tích dữ liệu', CAST(N'2022-07-01' AS Date), CAST(11000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (95, N'Trịnh Văn Hoàng', CAST(N'1993-12-29' AS Date), N'Nam', N'Quảng Ngãi', N'0978123456', N'hoanginh@gmail.com', N'Quản lý chất lượng', CAST(N'2021-12-10' AS Date), CAST(12500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (96, N'Đỗ Thị Bích', CAST(N'1996-07-06' AS Date), N'Nữ', N'Bạc Liêu', N'0989123456', N'bicho@gmail.com', N'Chuyên viên đào tạo', CAST(N'2024-03-05' AS Date), CAST(10200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (97, N'Lý Văn Cường', CAST(N'1991-09-18' AS Date), N'Nam', N'Quảng Bình', N'0990123456', N'cuongly@gmail.com', N'IT', CAST(N'2022-06-20' AS Date), CAST(12200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (98, N'Bạch Thị Thủy', CAST(N'1995-05-27' AS Date), N'Nữ', N'An Giang', N'0902134567', N'thuych@gmail.com', N'Marketing online', CAST(N'2023-09-01' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (99, N'Trần Quốc Việt', CAST(N'1992-01-14' AS Date), N'Nam', N'Vĩnh Long', N'0913145678', N'vietran@gmail.com', N'Thiết kế đồ họa', CAST(N'2024-02-15' AS Date), CAST(10800000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (100, N'Hồ Thị Hạnh', CAST(N'1998-11-02' AS Date), N'Nữ', N'Trà Vinh', N'0924156789', N'hanhho@gmail.com', N'Phó phòng tài chính', CAST(N'2025-03-01' AS Date), CAST(11700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (101, N'Ngô Văn Huy', CAST(N'1990-08-24' AS Date), N'Nam', N'Ninh Thuận', N'0935167890', N'huyngo@gmail.com', N'Trưởng nhóm kiểm toán', CAST(N'2021-10-01' AS Date), CAST(13500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (102, N'Đặng Thị Thanh', CAST(N'1994-03-18' AS Date), N'Nữ', N'Kon Tum', N'0946178901', N'thanhdang@gmail.com', N'Nhân viên kinh doanh', CAST(N'2023-11-10' AS Date), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (103, N'Cao Văn Hòa', CAST(N'1988-10-07' AS Date), N'Nam', N'Gia Lai', N'0957189012', N'hoaao@gmail.com', N'Nhân viên hỗ trợ', CAST(N'2023-06-25' AS Date), CAST(7700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (104, N'Bùi Thị Duyên', CAST(N'1993-01-31' AS Date), N'Nữ', N'Bình Thuận', N'0968190123', N'duyenbui@gmail.com', N'Nhân viên marketing', CAST(N'2024-01-20' AS Date), CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (105, N'Vương Minh Phát', CAST(N'1987-12-12' AS Date), N'Nam', N'Cà Mau', N'0979201234', N'phatuong@gmail.com', N'Chuyên viên tài chính', CAST(N'2023-02-01' AS Date), CAST(11600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (106, N'Lê Minh Quân', CAST(N'1990-08-22' AS Date), N'Nam', N'Bình Dương', N'0903001001', N'quanle@gmail.com', N'Kỹ sư thiết kế', CAST(N'2023-06-01' AS Date), CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (107, N'Trần Thị Hương', CAST(N'1992-04-17' AS Date), N'Nữ', N'Bình Phước', N'0913001002', N'huongtran@gmail.com', N'Chuyên viên pháp lý', CAST(N'2022-03-12' AS Date), CAST(9900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (108, N'Nguyễn Văn Khoa', CAST(N'1989-02-09' AS Date), N'Nam', N'Cần Thơ', N'0923001003', N'khoaguyen@gmail.com', N'Nhân viên nghiên cứu', CAST(N'2021-11-09' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (109, N'Phan Thị Lệ', CAST(N'1996-12-28' AS Date), N'Nữ', N'Sóc Trăng', N'0933001004', N'lehan@gmail.com', N'Nhân viên hậu cần', CAST(N'2024-02-22' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (110, N'Đỗ Văn Tâm', CAST(N'1993-05-05' AS Date), N'Nam', N'Kon Tum', N'0943001005', N'tamo@gmail.com', N'Kỹ thuật viên phần mềm', CAST(N'2022-07-18' AS Date), CAST(10200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (111, N'Võ Thị Thu', CAST(N'1995-10-21' AS Date), N'Nữ', N'Nghệ An', N'0953001006', N'thu.vo@gmail.com', N'Nhân viên hành chính', CAST(N'2023-05-30' AS Date), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (112, N'Huỳnh Văn Sơn', CAST(N'1991-07-14' AS Date), N'Nam', N'Bạc Liêu', N'0963001007', N'son.huynh@gmail.com', N'Trưởng phòng kỹ thuật', CAST(N'2021-01-25' AS Date), CAST(12500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (113, N'Lý Thị Hồng', CAST(N'1990-09-30' AS Date), N'Nữ', N'Lâm Đồng', N'0973001008', N'hong.ly@gmail.com', N'Nhân viên kiểm toán', CAST(N'2022-08-10' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (114, N'Bùi Văn Đức', CAST(N'1987-11-11' AS Date), N'Nam', N'Tiền Giang', N'0983001009', N'duc.bui@gmail.com', N'Quản lý sản xuất', CAST(N'2020-12-05' AS Date), CAST(11200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (115, N'Bùi Văn huy', CAST(N'1997-11-11' AS Date), N'Nam', N'an Giang', N'0983771009', N'ducnii@gmail.com', N'Bán Hàng', CAST(N'2023-12-05' AS Date), CAST(112000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (116, N'Nguyễn Thị Hằng', CAST(N'1994-03-15' AS Date), N'Nữ', N'Quảng Bình', N'0993001010', N'hang.nguyen@gmail.com', N'Chuyên viên tuyển dụng', CAST(N'2023-06-10' AS Date), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (117, N'Phạm Văn Lâm', CAST(N'1988-01-01' AS Date), N'Nam', N'Hậu Giang', N'0904001011', N'lam.pham@gmail.com', N'Kỹ thuật điện', CAST(N'2021-04-04' AS Date), CAST(10100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (118, N'Trương Thị Bích', CAST(N'1992-02-02' AS Date), N'Nữ', N'Tây Ninh', N'0914001012', N'bich.truong@gmail.com', N'Chuyên viên đào tạo', CAST(N'2022-02-14' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (119, N'Cao Văn Phước', CAST(N'1993-12-12' AS Date), N'Nam', N'Bình Thuận', N'0924001013', N'phuoc.cao@gmail.com', N'Nhân viên bảo trì', CAST(N'2023-10-01' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (120, N'Lê Thị Thắm', CAST(N'1996-06-06' AS Date), N'Nữ', N'Bến Tre', N'0934001014', N'tham.le@gmail.com', N'Nhân viên thư viện', CAST(N'2023-09-15' AS Date), CAST(8500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (121, N'Thân Văn Kiệt', CAST(N'1989-03-23' AS Date), N'Nam', N'Trà Vinh', N'0944001015', N'kiet.than@gmail.com', N'Giám sát sản xuất', CAST(N'2022-11-01' AS Date), CAST(10900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (122, N'Nguyễn Thị Diễm', CAST(N'1995-01-18' AS Date), N'Nữ', N'Cà Mau', N'0954001016', N'diem.nguyen@gmail.com', N'Nhân viên kế hoạch', CAST(N'2024-03-20' AS Date), CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (123, N'Vũ Văn Thành', CAST(N'1990-10-10' AS Date), N'Nam', N'Hà Nội', N'0964001017', N'thanh.vu@gmail.com', N'Trưởng nhóm dự án', CAST(N'2021-08-08' AS Date), CAST(11500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (124, N'Tô Thị Liên', CAST(N'1993-07-19' AS Date), N'Nữ', N'Nam Định', N'0974001018', N'lien.to@gmail.com', N'Nhân viên báo cáo', CAST(N'2022-06-05' AS Date), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (125, N'Hồ Văn Nghĩa', CAST(N'1991-11-27' AS Date), N'Nam', N'Khánh Hòa', N'0984001019', N'nghia.ho@gmail.com', N'Chuyên viên nghiên cứu', CAST(N'2021-12-15' AS Date), CAST(9900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (126, N'Trần Thị Cúc', CAST(N'1994-08-08' AS Date), N'Nữ', N'An Giang', N'0994001020', N'cuc.tran@gmail.com', N'Kế toán thuế', CAST(N'2023-02-17' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (127, N'Lê Văn Hòa', CAST(N'1988-12-05' AS Date), N'Nam', N'Sơn La', N'0905001021', N'hoa.le@gmail.com', N'Nhân viên logistics', CAST(N'2022-01-25' AS Date), CAST(9600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (128, N'Đinh Thị Dung', CAST(N'1995-09-15' AS Date), N'Nữ', N'Hưng Yên', N'0915001022', N'dung.dinh@gmail.com', N'Nhân viên tư vấn', CAST(N'2023-12-12' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (129, N'Phan Văn Sáng', CAST(N'1987-06-11' AS Date), N'Nam', N'Hải Dương', N'0925001023', N'sang.phan@gmail.com', N'Chuyên viên CNTT', CAST(N'2021-05-18' AS Date), CAST(11000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (130, N'Vũ Thị Minh', CAST(N'1992-03-03' AS Date), N'Nữ', N'Tuyên Quang', N'0935001024', N'minh.vu@gmail.com', N'Nhân viên pháp chế', CAST(N'2023-01-01' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (131, N'Trịnh Văn Lộc', CAST(N'1989-05-26' AS Date), N'Nam', N'Phú Yên', N'0945001025', N'loc.trinh@gmail.com', N'Trưởng phòng vận hành', CAST(N'2020-10-10' AS Date), CAST(13000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (132, N'Hoàng Thị Hà', CAST(N'1991-07-01' AS Date), N'Nữ', N'Hải Phòng', N'0955001026', N'ha.hoang@gmail.com', N'Nhân viên chăm sóc khách hàng', CAST(N'2022-04-04' AS Date), CAST(8900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (133, N'Tống Văn Quang', CAST(N'1993-04-14' AS Date), N'Nam', N'Bắc Ninh', N'0965001027', N'quang.tong@gmail.com', N'Quản lý dữ liệu', CAST(N'2023-09-09' AS Date), CAST(9900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (134, N'Ngô Thị Kiều', CAST(N'1996-01-11' AS Date), N'Nữ', N'Yên Bái', N'0975001028', N'kieu.ngo@gmail.com', N'Chuyên viên văn hóa doanh nghiệp', CAST(N'2022-03-30' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (135, N'Tạ Văn Duy', CAST(N'1990-02-28' AS Date), N'Nam', N'Hòa Bình', N'0985001029', N'duy.ta@gmail.com', N'Nhân viên kỹ thuật', CAST(N'2021-06-06' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (136, N'Mai Thị Tươi', CAST(N'1995-05-05' AS Date), N'Nữ', N'Lai Châu', N'0995001030', N'tuoi.mai@gmail.com', N'Chuyên viên sự kiện', CAST(N'2023-07-07' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (137, N'Bùi Văn Hưng', CAST(N'1988-06-22' AS Date), N'Nam', N'Bình Dương', N'0906001031', N'hung.bui@gmail.com', N'Kỹ sư cơ khí', CAST(N'2021-09-09' AS Date), CAST(10200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (138, N'Nguyễn Thị Nga', CAST(N'1993-03-10' AS Date), N'Nữ', N'Quảng Ngãi', N'0916001032', N'nga.nguyen@gmail.com', N'Nhân viên phân tích', CAST(N'2022-08-12' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (139, N'Đoàn Văn Phú', CAST(N'1987-12-25' AS Date), N'Nam', N'Hà Tĩnh', N'0926001033', N'phu.doan@gmail.com', N'Kỹ thuật viên bảo trì', CAST(N'2020-11-17' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (140, N'Lê Thị Trang', CAST(N'1994-04-01' AS Date), N'Nữ', N'Quảng Trị', N'0936001034', N'trang.le@gmail.com', N'Chuyên viên chăm sóc khách hàng', CAST(N'2023-03-21' AS Date), CAST(8900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (141, N'Phạm Văn Bảo', CAST(N'1990-08-30' AS Date), N'Nam', N'Ninh Bình', N'0946001035', N'bao.pham@gmail.com', N'Nhân viên kiểm định', CAST(N'2021-07-01' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (142, N'Trịnh Thị Quỳnh', CAST(N'1992-10-18' AS Date), N'Nữ', N'Long An', N'0956001036', N'quynhtrinh@gmail.com', N'Chuyên viên nhân sự', CAST(N'2023-01-20' AS Date), CAST(9100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (143, N'Tống Văn Tiến', CAST(N'1989-01-15' AS Date), N'Nam', N'Lào Cai', N'0966001037', N'tien.tong@gmail.com', N'Nhân viên kho', CAST(N'2022-05-05' AS Date), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (144, N'Hoàng Thị Mai', CAST(N'1996-12-03' AS Date), N'Nữ', N'Bắc Kạn', N'0976001038', N'mai.hoang@gmail.com', N'Chuyên viên tiếp thị', CAST(N'2023-08-16' AS Date), CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (145, N'Nguyễn Văn Duy', CAST(N'1991-09-27' AS Date), N'Nam', N'Hà Nội', N'0986001039', N'duy.nguyen@gmail.com', N'Chuyên viên tài chính', CAST(N'2020-10-30' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (146, N'Cao Văn Lực', CAST(N'1990-01-19' AS Date), N'Nam', N'Bắc Ninh', N'0949001065', N'luc.cao@gmail.com', N'Nhân viên nghiên cứu thị trường', CAST(N'2022-03-03' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (147, N'Trương Thị Huyền', CAST(N'1995-04-04' AS Date), N'Nữ', N'Hà Nam', N'0959001066', N'huyen.truong@gmail.com', N'Chuyên viên bảo hiểm', CAST(N'2023-03-03' AS Date), CAST(9100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (148, N'Đỗ Văn Lợi', CAST(N'1989-06-30' AS Date), N'Nam', N'Hòa Bình', N'0969001067', N'loi.do@gmail.com', N'Nhân viên vận hành máy', CAST(N'2021-07-07' AS Date), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (149, N'Vũ Thị Oanh', CAST(N'1994-09-09' AS Date), N'Nữ', N'Ninh Thuận', N'0979001068', N'oanh.vu@gmail.com', N'Nhân viên phân tích kinh doanh', CAST(N'2023-05-15' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (150, N'Đặng Thị Loan', CAST(N'1994-02-02' AS Date), N'Nữ', N'Vĩnh Phúc', N'0924123421', N'loan.dang@gmail.com', N'Nhân viên phân tích dữ liệu', CAST(N'2024-05-01' AS Date), CAST(10100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (151, N'Nguyễn Văn A', CAST(N'1990-05-15' AS Date), N'Nam', N'Hà Nội', N'090123467', N'annguyen@email.com', N'Quản lý', CAST(N'2020-08-01' AS Date), CAST(15000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (152, N'Trần Thị B', CAST(N'1992-11-20' AS Date), N'Nữ', N'Hà Nội', N'098765321', N'btran@email.com', N'Nhân viên bán hàng', CAST(N'2021-03-10' AS Date), CAST(8000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (153, N'Lê Văn C', CAST(N'1988-07-05' AS Date), N'Nam', N' Hà Nội', N'091245678', N'cle@email.com', N'Kế toán', CAST(N'2022-01-15' AS Date), CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (154, N'Phạm Thị D', CAST(N'1995-02-28' AS Date), N'Nữ', N'Nam Định', N'098901234', N'dpham@email.com', N'Thu ngân', CAST(N'2022-05-20' AS Date), CAST(7500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (155, N'Hoàng Văn E', CAST(N'1991-09-10' AS Date), N'Nam', N'Thái Bình', N'034567890', N'ehoang@email.com', N'Nhân viên kho', CAST(N'2023-07-01' AS Date), CAST(8500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (156, N'Vũ Thị F', CAST(N'1993-04-01' AS Date), N'Nữ', N' HCM', N'096543219', N'fvu@email.com', N'Marketing', CAST(N'2023-11-05' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (157, N'Đặng Văn G', CAST(N'1989-12-25' AS Date), N'Nam', N' Bắc Ninh', N'041234567', N'gdang@email.com', N'IT', CAST(N'2024-02-10' AS Date), CAST(12000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (158, N'Bùi Thị H', CAST(N'1994-06-30' AS Date), N'Nữ', N'Bắc Giang', N'098765432', N'hbui@email.com', N'Chăm sóc khách hàng', CAST(N'2024-06-15' AS Date), CAST(8200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (159, N'Cao Văn I', CAST(N'1996-01-20' AS Date), N'Nam', N'Hà Nam', N'090876543', N'icao@email.com', N'Bảo vệ', CAST(N'2024-09-01' AS Date), CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (160, N'Lê Văn G', CAST(N'1992-11-18' AS Date), N'Nam', N'HCM', N'090111001', N'gle@email.com', N'Nhân viên bán hàng', CAST(N'2023-01-15' AS Date), CAST(8200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (161, N'Phạm Thị H', CAST(N'1987-05-03' AS Date), N'Nữ', N'Lạng Sơn', N'098222002', N'hham@emil.com', N'Kế toán', CAST(N'2021-07-20' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (162, N'Hoàng Văn I', CAST(N'1995-09-25' AS Date), N'Nam', N'Lai Châu', N'091333303', N'hoang@email.com', N'Thu ngân', CAST(N'2024-03-10' AS Date), CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (163, N'Trần Thị K', CAST(N'1990-03-12' AS Date), N'Nữ', N'Cao Bằng', N'097444400', N'ran@email.com', N'Nhân viên kho', CAST(N'2022-09-05' AS Date), CAST(7800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (164, N'Vũ Văn L', CAST(N'1998-07-01' AS Date), N'Nam', N'Hưng Yên', N'093555505', N'vu@email.com', N'Marketing', CAST(N'2025-01-01' AS Date), CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (165, N'Đặng Thị M', CAST(N'1983-12-10' AS Date), N'Nữ', N'Yên bái', N'096666606', N'mdang@email.com', N'IT', CAST(N'2020-11-20' AS Date), CAST(12500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (166, N'Bùi Văn N', CAST(N'1996-04-17' AS Date), N'Nam', N'Ninh Bình', N'094777007', N'nbui@email.com', N'Chăm sóc khách hàng', CAST(N'2023-05-25' AS Date), CAST(8000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (167, N'Cao Thị O', CAST(N'1991-08-28' AS Date), N'Nữ', N' Hà Nội', N'092888008', N'ocao@email.com', N'Bảo vệ', CAST(N'2024-08-15' AS Date), CAST(6800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (168, N'Mai Văn P', CAST(N'1999-01-05' AS Date), N'Nam', N' Hà Nội', N'090999009', N'pmai@email.com', N'Thực tập sinh', CAST(N'2025-04-01' AS Date), CAST(5200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (169, N'Lý Thị Q', CAST(N'1985-06-20' AS Date), N'Nữ', N' Hà Nội', N'091011010', N'qly@email.com', N'Quản lý kho', CAST(N'2022-02-10' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (170, N'Vương Văn R', CAST(N'1993-11-02' AS Date), N'Nam', N' Hà Nội', N'981222011', N'rvuong@email.com', N'Bán hàng online', CAST(N'2023-08-25' AS Date), CAST(7900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (171, N'Ngô Thị S', CAST(N'1988-02-15' AS Date), N'Nữ', N'Hà Nội', N'093333012', N'sngo@email.com', N'Kỹ thuật viên', CAST(N'2021-01-01' AS Date), CAST(11500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (172, N'Phùng Văn T', CAST(N'1997-05-28' AS Date), N'Nam', N'Nghệ An', N'963444013', N'tphung@email.com', N'Lễ tân', CAST(N'2024-09-20' AS Date), CAST(6700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (173, N'Trịnh Thị U', CAST(N'1990-09-10' AS Date), N'Nữ', N'Hà Nội', N'094455501', N'utrinh@email.com', N'Nhân viên giao hàng', CAST(N'2025-05-15' AS Date), CAST(7300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (174, N'Hồ Văn V', CAST(N'1994-12-25' AS Date), N'Nam', N'Thái Bình', N'092566605', N'vho@email.com', N'Tuyển dụng', CAST(N'2023-12-01' AS Date), CAST(8500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (175, N'Bạch Thị X', CAST(N'1989-07-08' AS Date), N'Nữ', N'Thái Bình', N'090677016', N'xbach@email.com', N'Trưởng nhóm bán hàng', CAST(N'2024-04-10' AS Date), CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (176, N'Sầm Văn Y', CAST(N'1996-01-20' AS Date), N'Nam', N' Hà Nội', N'097788017', N'ysam@email.com', N'Nhân viên hỗ trợ', CAST(N'2022-06-25' AS Date), CAST(7700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (177, N'Quách Thị Z', CAST(N'1991-04-03' AS Date), N'Nữ', N'Hà Nội', N'093899018', N'zquach@email.com', N'Phân tích dữ liệu', CAST(N'2025-02-01' AS Date), CAST(11200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (178, N'Uông Văn AA', CAST(N'1999-09-15' AS Date), N'Nam', N'Nam Định', N'069000019', N'a.uong@email.com', N'Thực tập sinh marketing', CAST(N'2024-10-15' AS Date), CAST(5300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (179, N'Phan Thị BB', CAST(N'1984-03-01' AS Date), N'Nữ', N'Hà Nội', N'091222020', N'bb.phan@mail.com', N'Kiểm toán viên', CAST(N'2023-03-01' AS Date), CAST(12200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (180, N'Lâm Văn CC', CAST(N'1997-07-18' AS Date), N'Nam', N'Bắc cạn', N'082333021', N'cclam@email.com', N'Nhân viên lễ tân', CAST(N'2024-11-30' AS Date), CAST(6900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (181, N'Trần Thị DD', CAST(N'1992-10-25' AS Date), N'Nữ', N'Thanh Hóa', N'933444022', N'ddtran@email.com', N'Chuyên viên nhân sự', CAST(N'2022-07-10' AS Date), CAST(9800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (182, N'Đỗ Văn EE', CAST(N'1987-01-10' AS Date), N'Nam', N'Hà Nội', N'096555023', N'eedo@email.com', N'Nhân viên kinh doanh', CAST(N'2025-01-01' AS Date), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (183, N'Nguyễn Thị FF', CAST(N'1995-05-03' AS Date), N'Nữ', N'Hòa Bình', N'945666024', N'ffnguyen@email.com', N'Nhân viên kỹ thuật', CAST(N'2023-04-20' AS Date), CAST(10200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (184, N'Lê Văn GG', CAST(N'1990-08-20' AS Date), N'Nam', N'Hà Nội', N'092677025', N'gge@email.com', N'Marketing executive', CAST(N'2021-09-01' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (185, N'Phạm Thị HH', CAST(N'1998-12-05' AS Date), N'Nữ', N'Hà Nội', N'090888026', N'hham@email.com', N'Nhân viên kho', CAST(N'2024-07-15' AS Date), CAST(7600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (186, N'Hoàng Văn II', CAST(N'1983-03-15' AS Date), N'Nam', N'Yên Bái', N'098999027', N'ioang@email.com', N'Trưởng phòng kinh doanh', CAST(N'2022-10-05' AS Date), CAST(14500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (187, N'Trần Thị JJ', CAST(N'1996-07-01' AS Date), N'Nữ', N'Quảng Ninh', N'019000028', N'tran@email.com', N'Phó phòng marketing', CAST(N'2024-12-10' AS Date), CAST(11200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (188, N'Vũ Văn KK', CAST(N'1991-10-18' AS Date), N'Nam', N'Hải Phòng', N'090111029', N'vu@eail.com', N'Nhân viên hành chính', CAST(N'2023-03-01' AS Date), CAST(7100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (189, N'Đặng Thị LL', CAST(N'1999-02-25' AS Date), N'Nữ', N'Hải Dương', N'031222030', N'dang@email.com', N'Quản lý dự án', CAST(N'2025-05-20' AS Date), CAST(13800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (190, N'Bùi Văn MM', CAST(N'1986-06-10' AS Date), N'Nam', N'Hải Phòng', N'062333031', N'mbui@email.com', N'Kiểm soát chất lượng', CAST(N'2022-08-01' AS Date), CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (191, N'Cao Thị NN', CAST(N'1994-11-22' AS Date), N'Nữ', N'Hà Nội', N'094344032', N'nao@email.com', N'Chuyên viên tài chính', CAST(N'2024-01-15' AS Date), CAST(11800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (192, N'Mai Văn OO', CAST(N'1989-04-05' AS Date), N'Nam', N'Hà Nội', N'094555033', N'oo.mai@emaádl.com', N'Nhân viên nhập liệu', CAST(N'2023-06-10' AS Date), CAST(6500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (193, N'Lý Thị PP', CAST(N'1997-08-12' AS Date), N'Nữ', N'Hà Nội', N'090666034', N'pp@email.com', N'Trưởng nhóm kỹ thuật', CAST(N'2025-02-25' AS Date), CAST(15000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (194, N'Vương Văn QQ', CAST(N'1982-12-28' AS Date), N'Nam', N'Hà Nội', N'086777035', N'qq.uong@email.com', N'Phó phòng nhân sự', CAST(N'2021-11-01' AS Date), CAST(12500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (195, N'Ngô Thị RR', CAST(N'1995-03-03' AS Date), N'Nữ', N'Hà Nội', N'093788036', N'r.ngo@email.com', N'Nhân viên thống kê', CAST(N'2024-09-05' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (196, N'Phùng Văn SS', CAST(N'1990-07-15' AS Date), N'Nam', N'Bình Định', N'096899037', N'shung@email.com', N'Chuyên viên đào tạo', CAST(N'2022-03-10' AS Date), CAST(10500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (197, N'Trịnh Thị TT', CAST(N'1998-11-20' AS Date), N'Nữ', N'Hà Nội', N'09490038', N'trinh@email.com', N'Thư ký', CAST(N'2025-01-20' AS Date), CAST(6200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (198, N'Hồ Văn UU', CAST(N'1983-04-01' AS Date), N'Nam', N'Nam Định', N'092111039', N'uuo@email.com', N'Quản lý chi nhánh', CAST(N'2023-07-01' AS Date), CAST(16000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (199, N'Bạch Thị VV', CAST(N'1996-08-17' AS Date), N'Nữ', N'HCM', N'090122040', N'vvch@email.com', N'Nhân viên marketing online', CAST(N'2024-04-15' AS Date), CAST(9100000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (200, N'Sầm Văn WW', CAST(N'1991-12-03' AS Date), N'Nam', N'HCM', N'097233041', N'wwam@email.com', N'Thiết kế đồ họa', CAST(N'2022-09-20' AS Date), CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (201, N'Quách Thị XX', CAST(N'1999-05-10' AS Date), N'Nữ', N'HCM', N'09344042', N'xquach@email.com', N'Nhân viên lễ tân', CAST(N'2025-02-01' AS Date), CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (202, N'Uông Văn YY', CAST(N'1984-09-25' AS Date), N'Nam', N'Hà Nội', N'064555043', N'yuong@email.com', N'Chuyên viên mua hàng', CAST(N'2023-12-10' AS Date), CAST(9600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (203, N'Phan Thị ZZ', CAST(N'1997-01-01' AS Date), N'Nữ', N'Bắc Giang', N'095666044', N'zphan@email.com', N'Nhân viên bán vé', CAST(N'2024-08-25' AS Date), CAST(7400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (204, N'Lâm Văn AAA', CAST(N'1992-04-17' AS Date), N'Nam', N'Hà Nam', N'092777045', N'aaalam@email.com', N'Kỹ sư phần mềm', CAST(N'2022-05-01' AS Date), CAST(13000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (205, N'Trần Thị BBB', CAST(N'1987-08-28' AS Date), N'Nữ', N'Bắc Giang', N'0908046', N'bbbtran@email.com', N'Chuyên viên kiểm toán', CAST(N'2025-03-15' AS Date), CAST(11500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (206, N'Mai Thị K', CAST(N'1992-08-12' AS Date), N'Nữ', N'Hà Nam', N'09776541', N'kmai@email.com', N'Thực tập sinh', CAST(N'2025-01-05' AS Date), CAST(5000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (207, N'Trịnh Thị Quỳnh', CAST(N'1992-07-09' AS Date), N'Nữ', N'Hà Nam', N'09803456', N'quynhinh@gmail.com', N'Nhân viên hành chính', CAST(N'2023-08-10' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (208, N'Nguyễn Văn Lâm', CAST(N'1990-03-03' AS Date), N'Nam', N'Hà Nội', N'09913456', N'lamguyen@gmail.com', N'Nhân viên IT', CAST(N'2022-09-15' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (209, N'Phạm Thị Hồng', CAST(N'1995-06-11' AS Date), N'Nữ', N'TP.HCM', N'090212346', N'hongham@gmail.com', N'Chuyên viên tư vấn', CAST(N'2023-12-05' AS Date), CAST(8900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (210, N'Lê Văn Đạo', CAST(N'1989-10-22' AS Date), N'Nam', N'Đà Nẵng', N'091312456', N'daoe@gmail.com', N'Kỹ sư phần mềm', CAST(N'2021-07-20' AS Date), CAST(12300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (211, N'Hoàng Thị Nhung', CAST(N'1993-01-17' AS Date), N'Nữ', N'Quảng Trị', N'924123456', N'nhuhoang@gmail.com', N'Nhân viên kế toán', CAST(N'2022-05-11' AS Date), CAST(8600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (212, N'Ngô Văn Đức', CAST(N'1988-04-30' AS Date), N'Nam', N'Thái Nguyên', N'0325123456', N'ducngo@gmail.com', N'Quản trị hệ thống', CAST(N'2023-03-18' AS Date), CAST(11000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (213, N'Trần Thị Kim', CAST(N'1997-09-25' AS Date), N'Nữ', N'Ninh Bình', N'09123456', N'kimtran@gmail.com', N'Chuyên viên truyền thông', CAST(N'2024-04-04' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (214, N'Phan Văn Toàn', CAST(N'1991-12-01' AS Date), N'Nam', N'Bắc Giang', N'093123456', N'toanphan@gmail.com', N'Nhân viên kỹ thuật', CAST(N'2022-12-01' AS Date), CAST(9900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (215, N'Thái Thị Hòa', CAST(N'1994-08-06' AS Date), N'Nữ', N'Nam Định', N'096234885', N'hoathai@gmail.com', N'Chuyên viên đào tạo', CAST(N'2024-01-15' AS Date), CAST(10000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (216, N'Hà Văn Tùng', CAST(N'1987-11-29' AS Date), N'Nam', N'Lạng Sơn', N'09912346', N'tungha@gmail.com', N'Nhân viên vận hành', CAST(N'2021-11-01' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (217, N'Đinh Thị Hạnh', CAST(N'1996-02-18' AS Date), N'Nữ', N'Thanh Hóa', N'09008012367', N'hanhdinh@gmail.com', N'Nhân viên CSKH', CAST(N'2023-05-05' AS Date), CAST(8600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (218, N'Nguyễn Văn Bình', CAST(N'1992-05-23' AS Date), N'Nam', N'Tuyên Quang', N'09881123478', N'binhguyen@gmail.com', N'Bảo trì hệ thống', CAST(N'2022-08-10' AS Date), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (219, N'Phạm Thị Yến', CAST(N'1990-06-30' AS Date), N'Nữ', N'Bình Định', N'0902124889', N'yenm@gmail.com', N'Chuyên viên PR', CAST(N'2023-10-01' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (220, N'Lý Văn Khánh', CAST(N'1993-03-27' AS Date), N'Nam', N'Kiên Giang', N'091123490', N'khanhly@gmail.com', N'Thiết kế giao diện', CAST(N'2023-06-20' AS Date), CAST(10400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (221, N'Đỗ Thị Trang', CAST(N'1995-11-12' AS Date), N'Nữ', N'Hậu Giang', N'092413411', N'trangdo@gmail.com', N'Nhân viên nhân sự', CAST(N'2022-10-15' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (222, N'Cao Văn Bình', CAST(N'1989-08-14' AS Date), N'Nam', N'Bến Tre', N'093512334422', N'binhao@gmail.com', N'Kế toán trưởng', CAST(N'2021-03-01' AS Date), CAST(12500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (223, N'Trương Thị Linh', CAST(N'1996-01-04' AS Date), N'Nữ', N'Đồng Tháp', N'046123433', N'linhruong@gmail.com', N'Nhân viên chăm sóc KH', CAST(N'2024-03-01' AS Date), CAST(8500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (224, N'Bùi Văn Trí', CAST(N'1990-09-16' AS Date), N'Nam', N'Tây Ninh', N'09571233444', N'triui@gmail.com', N'Quản lý kỹ thuật', CAST(N'2022-12-20' AS Date), CAST(11400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (225, N'Trần Thị Mai', CAST(N'1994-04-09' AS Date), N'Nữ', N'An Giang', N'09681234525', N'mairan@gmail.com', N'Trợ lý Giám đốc', CAST(N'2024-01-05' AS Date), CAST(9900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (226, N'Nguyễn Văn Phú', CAST(N'1988-07-05' AS Date), N'Nam', N'Long An', N'09791234626', N'phguyen@gmail.com', N'Trưởng bộ phận IT', CAST(N'2021-05-10' AS Date), CAST(14000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (227, N'Lê Thị Hoa', CAST(N'1993-12-20' AS Date), N'Nữ', N'Hà Tĩnh', N'098012477', N'hole@gmail.com', N'Nhân viên bán hàng', CAST(N'2023-07-15' AS Date), CAST(8200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (228, N'Hoàng Văn Long', CAST(N'1992-10-03' AS Date), N'Nam', N'Phú Thọ', N'099113488', N'longhoang@gmail.com', N'Nhân viên tài chính', CAST(N'2022-09-25' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (229, N'Phạm Thị Dung', CAST(N'1991-01-25' AS Date), N'Nữ', N'Hòa Bình', N'09021234299', N'dungpham@gmail.com', N'Trợ lý hành chính', CAST(N'2023-04-01' AS Date), CAST(8600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (230, N'Trịnh Văn Khôi', CAST(N'1987-05-11' AS Date), N'Nam', N'Quảng Nam', N'091312340', N'khoi2rinh@gmail.com', N'Chuyên viên hệ thống', CAST(N'2022-07-01' AS Date), CAST(11800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (231, N'Nguyễn Thị Lệ', CAST(N'1993-03-21' AS Date), N'Nữ', N'Cần Thơ', N'0933123426', N'le2nguyen@gmail.com', N'Nhân viên thống kê', CAST(N'2023-11-10' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (232, N'Phạm Văn Định', CAST(N'1991-06-14' AS Date), N'Nam', N'Nghệ An', N'0942412456', N'dinh2ham@gmail.com', N'Thủ kho', CAST(N'2022-08-20' AS Date), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (233, N'Lê Thị Hằng', CAST(N'1996-12-05' AS Date), N'Nữ', N'Bình Dương', N'095512456', N'hangle@gmail.com', N'Nhân viên chăm sóc khách hàng', CAST(N'2024-05-30' AS Date), CAST(8600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (234, N'Hoàng Văn Kiên', CAST(N'1988-05-19' AS Date), N'Nam', N'Đồng Nai', N'096123456', N'kienhoang@gmail.com', N'IT Helpdesk', CAST(N'2023-07-01' AS Date), CAST(9800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (235, N'Ngô Thị Ngọc', CAST(N'1995-10-02' AS Date), N'Nữ', N'Hậu Giang', N'097723456', N'ngocgo@gmail.com', N'Marketing', CAST(N'2024-01-01' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (236, N'Bùi Văn Phong', CAST(N'1990-11-17' AS Date), N'Nam', N'Tây Ninh', N'098123456', N'phongbui@gmail.com', N'Nhân viên kỹ thuật', CAST(N'2023-06-01' AS Date), CAST(10500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (237, N'Vũ Thị Mai', CAST(N'1987-02-26' AS Date), N'Nữ', N'Bến Tre', N'099912456', N'maiu@gmail.com', N'Trưởng phòng nhân sự', CAST(N'2021-09-15' AS Date), CAST(13500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (238, N'Trần Văn Tiến', CAST(N'1992-08-08' AS Date), N'Nam', N'Hưng Yên', N'001123456', N'tienn@gmail.com', N'Nhân viên kho', CAST(N'2023-04-01' AS Date), CAST(7600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (239, N'Đặng Thị Yến', CAST(N'1994-09-30' AS Date), N'Nữ', N'Lào Cai', N'091123456', N'yeng@gmail.com', N'Thư ký', CAST(N'2025-01-10' AS Date), CAST(6700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (240, N'Cao Văn Trường', CAST(N'1991-12-15' AS Date), N'Nam', N'Sơn La', N'923123456', N'truongao@gmail.com', N'Bảo vệ', CAST(N'2023-11-20' AS Date), CAST(7000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (241, N'Phan Thị Hương', CAST(N'1990-04-25' AS Date), N'Nữ', N'Lâm Đồng', N'034123456', N'huonghan@gmail.com', N'Nhân viên hành chính', CAST(N'2022-10-01' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (242, N'Mai Văn Hoàn', CAST(N'1985-01-05' AS Date), N'Nam', N'Tuyên Quang', N'045123456', N'hoanai@gmail.com', N'Kiểm toán viên', CAST(N'2023-05-15' AS Date), CAST(11500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (243, N'Quách Thị Tuyết', CAST(N'1997-06-21' AS Date), N'Nữ', N'Phú Yên', N'096123456', N'tuyetquach@gmail.com', N'Chuyên viên nhân sự', CAST(N'2024-06-25' AS Date), CAST(9800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (244, N'Nguyễn Minh Hải', CAST(N'1989-03-11' AS Date), N'Nam', N'Hà Tĩnh', N'067123456', N'hainguyen@gmail.com', N'Phân tích dữ liệu', CAST(N'2022-07-01' AS Date), CAST(11000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (245, N'Trịnh Văn Hoàng', CAST(N'1993-12-29' AS Date), N'Nam', N'Quảng Ngãi', N'0978123456', N'hoanginh@gmail.com', N'Quản lý chất lượng', CAST(N'2021-12-10' AS Date), CAST(12500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (246, N'Đỗ Thị Bích', CAST(N'1996-07-06' AS Date), N'Nữ', N'Bạc Liêu', N'0989123456', N'bicho@gmail.com', N'Chuyên viên đào tạo', CAST(N'2024-03-05' AS Date), CAST(10200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (247, N'Lý Văn Cường', CAST(N'1991-09-18' AS Date), N'Nam', N'Quảng Bình', N'0990123456', N'cuongly@gmail.com', N'IT', CAST(N'2022-06-20' AS Date), CAST(12200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (248, N'Bạch Thị Thủy', CAST(N'1995-05-27' AS Date), N'Nữ', N'An Giang', N'0902134567', N'thuych@gmail.com', N'Marketing online', CAST(N'2023-09-01' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (249, N'Trần Quốc Việt', CAST(N'1992-01-14' AS Date), N'Nam', N'Vĩnh Long', N'0913145678', N'vietran@gmail.com', N'Thiết kế đồ họa', CAST(N'2024-02-15' AS Date), CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (250, N'Hồ Thị Hạnh', CAST(N'1998-11-02' AS Date), N'Nữ', N'Trà Vinh', N'0924156789', N'hanhho@gmail.com', N'Phó phòng tài chính', CAST(N'2025-03-01' AS Date), CAST(11700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (251, N'Ngô Văn Huy', CAST(N'1990-08-24' AS Date), N'Nam', N'Ninh Thuận', N'0935167890', N'huyngo@gmail.com', N'Trưởng nhóm kiểm toán', CAST(N'2021-10-01' AS Date), CAST(13500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (252, N'Đặng Thị Thanh', CAST(N'1994-03-18' AS Date), N'Nữ', N'Kon Tum', N'0946178901', N'thanhdang@gmail.com', N'Nhân viên kinh doanh', CAST(N'2023-11-10' AS Date), CAST(8100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (253, N'Cao Văn Hòa', CAST(N'1988-10-07' AS Date), N'Nam', N'Gia Lai', N'0957189012', N'hoaao@gmail.com', N'Nhân viên hỗ trợ', CAST(N'2023-06-25' AS Date), CAST(7700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (254, N'Bùi Thị Duyên', CAST(N'1993-01-31' AS Date), N'Nữ', N'Bình Thuận', N'0968190123', N'duyenbui@gmail.com', N'Nhân viên marketing', CAST(N'2024-01-20' AS Date), CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (255, N'Vương Minh Phát', CAST(N'1987-12-12' AS Date), N'Nam', N'Cà Mau', N'0979201234', N'phatuong@gmail.com', N'Chuyên viên tài chính', CAST(N'2023-02-01' AS Date), CAST(11600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (256, N'Lê Minh Quân', CAST(N'1990-08-22' AS Date), N'Nam', N'Bình Dương', N'0903001001', N'quanle@gmail.com', N'Kỹ sư thiết kế', CAST(N'2023-06-01' AS Date), CAST(10800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (257, N'Trần Thị Hương', CAST(N'1992-04-17' AS Date), N'Nữ', N'Bình Phước', N'0913001002', N'huongtran@gmail.com', N'Chuyên viên pháp lý', CAST(N'2022-03-12' AS Date), CAST(9900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (258, N'Nguyễn Văn Khoa', CAST(N'1989-02-09' AS Date), N'Nam', N'Cần Thơ', N'0923001003', N'khoaguyen@gmail.com', N'Nhân viên nghiên cứu', CAST(N'2021-11-09' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (259, N'Phan Thị Lệ', CAST(N'1996-12-28' AS Date), N'Nữ', N'Sóc Trăng', N'0933001004', N'lehan@gmail.com', N'Nhân viên hậu cần', CAST(N'2024-02-22' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (260, N'Đỗ Văn Tâm', CAST(N'1993-05-05' AS Date), N'Nam', N'Kon Tum', N'0943001005', N'tamo@gmail.com', N'Kỹ thuật viên phần mềm', CAST(N'2022-07-18' AS Date), CAST(10200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (261, N'Võ Thị Thu', CAST(N'1995-10-21' AS Date), N'Nữ', N'Nghệ An', N'0953001006', N'thu.vo@gmail.com', N'Nhân viên hành chính', CAST(N'2023-05-30' AS Date), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (262, N'Huỳnh Văn Sơn', CAST(N'1991-07-14' AS Date), N'Nam', N'Bạc Liêu', N'0963001007', N'son.huynh@gmail.com', N'Trưởng phòng kỹ thuật', CAST(N'2021-01-25' AS Date), CAST(12500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (263, N'Lý Thị Hồng', CAST(N'1990-09-30' AS Date), N'Nữ', N'Lâm Đồng', N'0973001008', N'hong.ly@gmail.com', N'Nhân viên kiểm toán', CAST(N'2022-08-10' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (264, N'Bùi Văn Đức', CAST(N'1987-11-11' AS Date), N'Nam', N'Tiền Giang', N'0983001009', N'duc.bui@gmail.com', N'Quản lý sản xuất', CAST(N'2020-12-05' AS Date), CAST(11200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (265, N'Bùi Văn huy', CAST(N'1997-11-11' AS Date), N'Nam', N'an Giang', N'0983771009', N'ducnii@gmail.com', N'Bán Hàng', CAST(N'2023-12-05' AS Date), CAST(112000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (266, N'Nguyễn Thị Hằng', CAST(N'1994-03-15' AS Date), N'Nữ', N'Quảng Bình', N'0993001010', N'hang.nguyen@gmail.com', N'Chuyên viên tuyển dụng', CAST(N'2023-06-10' AS Date), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (267, N'Phạm Văn Lâm', CAST(N'1988-01-01' AS Date), N'Nam', N'Hậu Giang', N'0904001011', N'lam.pham@gmail.com', N'Kỹ thuật điện', CAST(N'2021-04-04' AS Date), CAST(10100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (268, N'Trương Thị Bích', CAST(N'1992-02-02' AS Date), N'Nữ', N'Tây Ninh', N'0914001012', N'bich.truong@gmail.com', N'Chuyên viên đào tạo', CAST(N'2022-02-14' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (269, N'Cao Văn Phước', CAST(N'1993-12-12' AS Date), N'Nam', N'Bình Thuận', N'0924001013', N'phuoc.cao@gmail.com', N'Nhân viên bảo trì', CAST(N'2023-10-01' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (270, N'Lê Thị Thắm', CAST(N'1996-06-06' AS Date), N'Nữ', N'Bến Tre', N'0934001014', N'tham.le@gmail.com', N'Nhân viên thư viện', CAST(N'2023-09-15' AS Date), CAST(8500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (271, N'Thân Văn Kiệt', CAST(N'1989-03-23' AS Date), N'Nam', N'Trà Vinh', N'0944001015', N'kiet.than@gmail.com', N'Giám sát sản xuất', CAST(N'2022-11-01' AS Date), CAST(10900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (272, N'Nguyễn Thị Diễm', CAST(N'1995-01-18' AS Date), N'Nữ', N'Cà Mau', N'0954001016', N'diem.nguyen@gmail.com', N'Nhân viên kế hoạch', CAST(N'2024-03-20' AS Date), CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (273, N'Vũ Văn Thành', CAST(N'1990-10-10' AS Date), N'Nam', N'Hà Nội', N'0964001017', N'thanh.vu@gmail.com', N'Trưởng nhóm dự án', CAST(N'2021-08-08' AS Date), CAST(11500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (274, N'Tô Thị Liên', CAST(N'1993-07-19' AS Date), N'Nữ', N'Nam Định', N'0974001018', N'lien.to@gmail.com', N'Nhân viên báo cáo', CAST(N'2022-06-05' AS Date), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (275, N'Hồ Văn Nghĩa', CAST(N'1991-11-27' AS Date), N'Nam', N'Khánh Hòa', N'0984001019', N'nghia.ho@gmail.com', N'Chuyên viên nghiên cứu', CAST(N'2021-12-15' AS Date), CAST(9900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (276, N'Trần Thị Cúc', CAST(N'1994-08-08' AS Date), N'Nữ', N'An Giang', N'0994001020', N'cuc.tran@gmail.com', N'Kế toán thuế', CAST(N'2023-02-17' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (277, N'Lê Văn Hòa', CAST(N'1988-12-05' AS Date), N'Nam', N'Sơn La', N'0905001021', N'hoa.le@gmail.com', N'Nhân viên logistics', CAST(N'2022-01-25' AS Date), CAST(9600000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (278, N'Đinh Thị Dung', CAST(N'1995-09-15' AS Date), N'Nữ', N'Hưng Yên', N'0915001022', N'dung.dinh@gmail.com', N'Nhân viên tư vấn', CAST(N'2023-12-12' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (279, N'Phan Văn Sáng', CAST(N'1987-06-11' AS Date), N'Nam', N'Hải Dương', N'0925001023', N'sang.phan@gmail.com', N'Chuyên viên CNTT', CAST(N'2021-05-18' AS Date), CAST(11000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (280, N'Vũ Thị Minh', CAST(N'1992-03-03' AS Date), N'Nữ', N'Tuyên Quang', N'0935001024', N'minh.vu@gmail.com', N'Nhân viên pháp chế', CAST(N'2023-01-01' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (281, N'Trịnh Văn Lộc', CAST(N'1989-05-26' AS Date), N'Nam', N'Phú Yên', N'0945001025', N'loc.trinh@gmail.com', N'Trưởng phòng vận hành', CAST(N'2020-10-10' AS Date), CAST(13000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (282, N'Hoàng Thị Hà', CAST(N'1991-07-01' AS Date), N'Nữ', N'Hải Phòng', N'0955001026', N'ha.hoang@gmail.com', N'Nhân viên chăm sóc khách hàng', CAST(N'2022-04-04' AS Date), CAST(8900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (283, N'Tống Văn Quang', CAST(N'1993-04-14' AS Date), N'Nam', N'Bắc Ninh', N'0965001027', N'quang.tong@gmail.com', N'Quản lý dữ liệu', CAST(N'2023-09-09' AS Date), CAST(9900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (284, N'Ngô Thị Kiều', CAST(N'1996-01-11' AS Date), N'Nữ', N'Yên Bái', N'0975001028', N'kieu.ngo@gmail.com', N'Chuyên viên văn hóa doanh nghiệp', CAST(N'2022-03-30' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (285, N'Tạ Văn Duy', CAST(N'1990-02-28' AS Date), N'Nam', N'Hòa Bình', N'0985001029', N'duy.ta@gmail.com', N'Nhân viên kỹ thuật', CAST(N'2021-06-06' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (286, N'Mai Thị Tươi', CAST(N'1995-05-05' AS Date), N'Nữ', N'Lai Châu', N'0995001030', N'tuoi.mai@gmail.com', N'Chuyên viên sự kiện', CAST(N'2023-07-07' AS Date), CAST(8800000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (287, N'Bùi Văn Hưng', CAST(N'1988-06-22' AS Date), N'Nam', N'Bình Dương', N'0906001031', N'hung.bui@gmail.com', N'Kỹ sư cơ khí', CAST(N'2021-09-09' AS Date), CAST(10200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (288, N'Nguyễn Thị Nga', CAST(N'1993-03-10' AS Date), N'Nữ', N'Quảng Ngãi', N'0916001032', N'nga.nguyen@gmail.com', N'Nhân viên phân tích', CAST(N'2022-08-12' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (289, N'Đoàn Văn Phú', CAST(N'1987-12-25' AS Date), N'Nam', N'Hà Tĩnh', N'0926001033', N'phu.doan@gmail.com', N'Kỹ thuật viên bảo trì', CAST(N'2020-11-17' AS Date), CAST(9200000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (290, N'Lê Thị Trang', CAST(N'1994-04-01' AS Date), N'Nữ', N'Quảng Trị', N'0936001034', N'trang.le@gmail.com', N'Chuyên viên chăm sóc khách hàng', CAST(N'2023-03-21' AS Date), CAST(8900000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (291, N'Phạm Văn Bảo', CAST(N'1990-08-30' AS Date), N'Nam', N'Ninh Bình', N'0946001035', N'bao.pham@gmail.com', N'Nhân viên kiểm định', CAST(N'2021-07-01' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (292, N'Trịnh Thị Quỳnh', CAST(N'1992-10-18' AS Date), N'Nữ', N'Long An', N'0956001036', N'quynhtrinh@gmail.com', N'Chuyên viên nhân sự', CAST(N'2023-01-20' AS Date), CAST(9100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (293, N'Tống Văn Tiến', CAST(N'1989-01-15' AS Date), N'Nam', N'Lào Cai', N'0966001037', N'tien.tong@gmail.com', N'Nhân viên kho', CAST(N'2022-05-05' AS Date), CAST(8700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (294, N'Hoàng Thị Mai', CAST(N'1996-12-03' AS Date), N'Nữ', N'Bắc Kạn', N'0976001038', N'mai.hoang@gmail.com', N'Chuyên viên tiếp thị', CAST(N'2023-08-16' AS Date), CAST(9000000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (295, N'Nguyễn Văn Duy', CAST(N'1991-09-27' AS Date), N'Nam', N'Hà Nội', N'0986001039', N'duy.nguyen@gmail.com', N'Chuyên viên tài chính', CAST(N'2020-10-30' AS Date), CAST(9700000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (296, N'Cao Văn Lực', CAST(N'1990-01-19' AS Date), N'Nam', N'Bắc Ninh', N'0949001065', N'luc.cao@gmail.com', N'Nhân viên nghiên cứu thị trường', CAST(N'2022-03-03' AS Date), CAST(9400000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (297, N'Trương Thị Huyền', CAST(N'1995-04-04' AS Date), N'Nữ', N'Hà Nam', N'0959001066', N'huyen.truong@gmail.com', N'Chuyên viên bảo hiểm', CAST(N'2023-03-03' AS Date), CAST(9100000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (298, N'Đỗ Văn Lợi', CAST(N'1989-06-30' AS Date), N'Nam', N'Hòa Bình', N'0969001067', N'loi.do@gmail.com', N'Nhân viên vận hành máy', CAST(N'2021-07-07' AS Date), CAST(9300000.00 AS Decimal(10, 2)))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (299, N'Vũ Thị Oanh', CAST(N'1994-09-09' AS Date), N'Nữ', N'Ninh Thuận', N'0979001068', N'oanh.vu@gmail.com', N'Nhân viên phân tích kinh doanh', CAST(N'2023-05-15' AS Date), CAST(9500000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [GioiTinh], [DiaChi], [SDT], [Email], [ChucVu], [NgayVaoLam], [Luong]) VALUES (300, N'Đặng Thị Loan', CAST(N'1994-02-02' AS Date), N'Nữ', N'Vĩnh Phúc', N'0924123421', N'loan.dang@gmail.com', N'Nhân viên phân tích dữ liệu', CAST(N'2024-05-01' AS Date), CAST(10100000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuKiemKho] ON 

INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (1, 1, CAST(N'2025-04-22T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa định kỳ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (2, 2, CAST(N'2025-04-17T20:44:08.500' AS DateTime), N'Kiểm tra số lượng hàng hóa sau nhập kho')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (3, 3, CAST(N'2025-04-12T20:44:08.500' AS DateTime), N'Kiểm kê đột xuất')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (4, 4, CAST(N'2025-04-07T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa sắp hết hạn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (5, 5, CAST(N'2025-04-02T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa cuối tháng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (6, 6, CAST(N'2025-03-28T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa bị lỗi')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (7, 7, CAST(N'2025-03-23T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa theo yêu cầu')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (8, 8, CAST(N'2025-03-18T20:44:08.500' AS DateTime), N'Kiểm tra số lượng hàng hóa sau bán')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (9, 9, CAST(N'2025-03-13T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đặc biệt')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (10, 10, CAST(N'2025-03-08T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa tồn kho')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (11, 11, CAST(N'2025-03-03T20:44:08.500' AS DateTime), N'Kiểm kê hàng thực phẩm tươi')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (12, 12, CAST(N'2025-02-26T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đông lạnh')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (13, 13, CAST(N'2025-02-21T20:44:08.500' AS DateTime), N'Kiểm kê hàng gia dụng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (14, 14, CAST(N'2025-02-16T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ uống')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (15, 15, CAST(N'2025-02-11T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa văn phòng phẩm')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (16, 16, CAST(N'2025-02-06T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa mỹ phẩm')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (17, 17, CAST(N'2025-02-01T20:44:08.500' AS DateTime), N'Kiểm kê hàng thời trang')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (18, 18, CAST(N'2025-01-27T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa điện tử')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (19, 19, CAST(N'2025-01-22T20:44:08.500' AS DateTime), N'Kiểm kê hàng thực phẩm đóng hộp')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (20, 20, CAST(N'2025-01-17T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ chơi')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (21, 21, CAST(N'2025-01-12T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa chăm sóc cá nhân')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (22, 22, CAST(N'2025-01-07T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ dùng bếp')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (23, 23, CAST(N'2025-01-02T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa tẩy rửa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (24, 24, CAST(N'2024-12-28T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa thực phẩm chay')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (25, 25, CAST(N'2024-12-23T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa nhập khẩu')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (26, 26, CAST(N'2024-12-18T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ uống có cồn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (27, 27, CAST(N'2024-12-13T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ dùng trẻ em')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (28, 28, CAST(N'2024-12-08T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ dùng thú cưng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (29, 29, CAST(N'2024-12-03T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa trang trí')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (30, 30, CAST(N'2024-11-28T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa thể thao')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (31, 31, CAST(N'2024-11-23T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa sức khỏe')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (32, 32, CAST(N'2024-11-18T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa thực phẩm hữu cơ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (33, 33, CAST(N'2024-11-13T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa rau sạch')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (34, 34, CAST(N'2024-11-08T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa nước suối')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (35, 35, CAST(N'2024-11-03T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa bánh kẹo')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (36, 36, CAST(N'2024-10-29T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa sữa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (37, 37, CAST(N'2024-10-24T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa mì gói')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (38, 38, CAST(N'2024-10-19T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa snack')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (39, 39, CAST(N'2024-10-14T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa dầu ăn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (40, 40, CAST(N'2024-10-09T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa nước chấm')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (41, 41, CAST(N'2024-10-04T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa trà cà phê')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (42, 42, CAST(N'2024-09-29T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa bia rượu')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (43, 43, CAST(N'2024-09-24T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa khăn giấy')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (44, 44, CAST(N'2024-09-19T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa gạo')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (45, 45, CAST(N'2024-09-14T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa nước ép')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (46, 46, CAST(N'2024-09-09T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đặc sản')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (47, 47, CAST(N'2024-09-04T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa sữa chua')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (48, 48, CAST(N'2024-08-30T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa thực phẩm nhanh')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (49, 49, CAST(N'2024-08-25T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa gia vị')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (50, 50, CAST(N'2024-08-20T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa nước tăng lực')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (51, 51, CAST(N'2024-08-15T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa vitamin')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (52, 52, CAST(N'2024-08-10T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ nhựa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (53, 53, CAST(N'2024-08-05T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa mứt Tết')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (54, 54, CAST(N'2024-07-31T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa bánh chưng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (55, 55, CAST(N'2024-07-26T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa tương cà')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (56, 56, CAST(N'2024-07-21T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa rượu vang')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (57, 57, CAST(N'2024-07-16T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa bình sữa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (58, 58, CAST(N'2024-07-11T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa nước mắm')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (59, 59, CAST(N'2024-07-06T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa hạt dưa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (60, 60, CAST(N'2024-07-01T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa sữa chua uống')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (61, 61, CAST(N'2024-06-26T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa nồi áp suất')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (62, 62, CAST(N'2024-06-21T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa cải xanh')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (63, 63, CAST(N'2024-06-16T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa nước ép dứa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (64, 64, CAST(N'2024-06-11T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa cà phê')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (65, 65, CAST(N'2024-06-06T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa dầu gội')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (66, 66, CAST(N'2024-06-01T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa kem đánh răng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (67, 67, CAST(N'2024-05-27T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ chơi trẻ em')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (68, 68, CAST(N'2024-05-22T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ gia dụng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (69, 69, CAST(N'2024-05-17T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ điện')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (70, 70, CAST(N'2024-05-12T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ đông lạnh')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (71, 71, CAST(N'2024-05-07T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa thực phẩm tươi')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (72, 72, CAST(N'2024-05-02T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ uống có cồn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (73, 73, CAST(N'2024-04-27T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ dùng học tập')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (74, 74, CAST(N'2024-04-22T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa mỹ phẩm nam')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (75, 75, CAST(N'2024-04-17T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa thực phẩm chay')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (76, 76, CAST(N'2024-04-12T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ dùng bếp')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (77, 77, CAST(N'2024-04-07T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ vệ sinh')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (78, 78, CAST(N'2024-04-02T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ chăm sóc trẻ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (79, 79, CAST(N'2024-03-28T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ dùng thú cưng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (80, 80, CAST(N'2024-03-23T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ trang trí')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (81, 81, CAST(N'2024-03-18T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ thể thao')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (82, 82, CAST(N'2024-03-13T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ điện tử nhỏ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (83, 83, CAST(N'2024-03-08T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ dùng văn phòng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (84, 84, CAST(N'2024-03-03T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ ăn vặt')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (85, 85, CAST(N'2024-02-27T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ uống không cồn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (86, 86, CAST(N'2024-02-22T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ chăm sóc tóc')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (87, 87, CAST(N'2024-02-17T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ dùng cá nhân')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (88, 88, CAST(N'2024-02-12T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa thực phẩm nhập khẩu')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (89, 89, CAST(N'2024-02-07T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ dùng y tế')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (90, 90, CAST(N'2024-02-02T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ chăm sóc da')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (91, 91, CAST(N'2024-01-28T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ dùng nấu ăn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (92, 92, CAST(N'2024-01-23T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ dùng dã ngoại')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (93, 93, CAST(N'2024-01-18T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ dùng ngủ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (94, 94, CAST(N'2024-01-13T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ dùng tắm')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (95, 95, CAST(N'2024-01-08T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ dùng làm đẹp')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (96, 96, CAST(N'2024-01-03T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ dùng gia đình')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (97, 97, CAST(N'2023-12-29T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ dùng thời trang')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (98, 98, CAST(N'2023-12-24T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ dùng công nghệ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (99, 99, CAST(N'2023-12-19T20:44:08.500' AS DateTime), N'Kiểm kê hàng hóa đồ dùng giải trí')
GO
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (100, 100, CAST(N'2023-12-14T20:44:08.500' AS DateTime), N'Kiểm tra hàng hóa đồ dùng sức khỏe')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (101, 1, CAST(N'2025-04-22T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa định kỳ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (102, 2, CAST(N'2025-04-17T20:44:45.490' AS DateTime), N'Kiểm tra số lượng hàng hóa sau nhập kho')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (103, 3, CAST(N'2025-04-12T20:44:45.490' AS DateTime), N'Kiểm kê đột xuất')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (104, 4, CAST(N'2025-04-07T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa sắp hết hạn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (105, 5, CAST(N'2025-04-02T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa cuối tháng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (106, 6, CAST(N'2025-03-28T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa bị lỗi')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (107, 7, CAST(N'2025-03-23T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa theo yêu cầu')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (108, 8, CAST(N'2025-03-18T20:44:45.490' AS DateTime), N'Kiểm tra số lượng hàng hóa sau bán')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (109, 9, CAST(N'2025-03-13T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đặc biệt')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (110, 10, CAST(N'2025-03-08T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa tồn kho')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (111, 11, CAST(N'2025-03-03T20:44:45.490' AS DateTime), N'Kiểm kê hàng thực phẩm tươi')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (112, 12, CAST(N'2025-02-26T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đông lạnh')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (113, 13, CAST(N'2025-02-21T20:44:45.490' AS DateTime), N'Kiểm kê hàng gia dụng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (114, 14, CAST(N'2025-02-16T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ uống')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (115, 15, CAST(N'2025-02-11T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa văn phòng phẩm')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (116, 16, CAST(N'2025-02-06T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa mỹ phẩm')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (117, 17, CAST(N'2025-02-01T20:44:45.490' AS DateTime), N'Kiểm kê hàng thời trang')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (118, 18, CAST(N'2025-01-27T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa điện tử')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (119, 19, CAST(N'2025-01-22T20:44:45.490' AS DateTime), N'Kiểm kê hàng thực phẩm đóng hộp')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (120, 20, CAST(N'2025-01-17T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ chơi')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (121, 21, CAST(N'2025-01-12T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa chăm sóc cá nhân')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (122, 22, CAST(N'2025-01-07T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ dùng bếp')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (123, 23, CAST(N'2025-01-02T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa tẩy rửa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (124, 24, CAST(N'2024-12-28T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa thực phẩm chay')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (125, 25, CAST(N'2024-12-23T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa nhập khẩu')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (126, 26, CAST(N'2024-12-18T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ uống có cồn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (127, 27, CAST(N'2024-12-13T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ dùng trẻ em')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (128, 28, CAST(N'2024-12-08T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ dùng thú cưng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (129, 29, CAST(N'2024-12-03T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa trang trí')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (130, 30, CAST(N'2024-11-28T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa thể thao')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (131, 31, CAST(N'2024-11-23T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa sức khỏe')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (132, 32, CAST(N'2024-11-18T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa thực phẩm hữu cơ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (133, 33, CAST(N'2024-11-13T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa rau sạch')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (134, 34, CAST(N'2024-11-08T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa nước suối')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (135, 35, CAST(N'2024-11-03T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa bánh kẹo')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (136, 36, CAST(N'2024-10-29T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa sữa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (137, 37, CAST(N'2024-10-24T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa mì gói')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (138, 38, CAST(N'2024-10-19T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa snack')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (139, 39, CAST(N'2024-10-14T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa dầu ăn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (140, 40, CAST(N'2024-10-09T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa nước chấm')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (141, 41, CAST(N'2024-10-04T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa trà cà phê')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (142, 42, CAST(N'2024-09-29T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa bia rượu')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (143, 43, CAST(N'2024-09-24T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa khăn giấy')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (144, 44, CAST(N'2024-09-19T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa gạo')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (145, 45, CAST(N'2024-09-14T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa nước ép')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (146, 46, CAST(N'2024-09-09T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đặc sản')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (147, 47, CAST(N'2024-09-04T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa sữa chua')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (148, 48, CAST(N'2024-08-30T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa thực phẩm nhanh')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (149, 49, CAST(N'2024-08-25T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa gia vị')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (150, 50, CAST(N'2024-08-20T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa nước tăng lực')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (151, 51, CAST(N'2024-08-15T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa vitamin')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (152, 52, CAST(N'2024-08-10T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ nhựa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (153, 53, CAST(N'2024-08-05T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa mứt Tết')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (154, 54, CAST(N'2024-07-31T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa bánh chưng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (155, 55, CAST(N'2024-07-26T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa tương cà')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (156, 56, CAST(N'2024-07-21T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa rượu vang')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (157, 57, CAST(N'2024-07-16T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa bình sữa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (158, 58, CAST(N'2024-07-11T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa nước mắm')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (159, 59, CAST(N'2024-07-06T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa hạt dưa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (160, 60, CAST(N'2024-07-01T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa sữa chua uống')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (161, 61, CAST(N'2024-06-26T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa nồi áp suất')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (162, 62, CAST(N'2024-06-21T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa cải xanh')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (163, 63, CAST(N'2024-06-16T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa nước ép dứa')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (164, 64, CAST(N'2024-06-11T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa cà phê')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (165, 65, CAST(N'2024-06-06T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa dầu gội')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (166, 66, CAST(N'2024-06-01T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa kem đánh răng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (167, 67, CAST(N'2024-05-27T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ chơi trẻ em')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (168, 68, CAST(N'2024-05-22T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ gia dụng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (169, 69, CAST(N'2024-05-17T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ điện')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (170, 70, CAST(N'2024-05-12T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ đông lạnh')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (171, 71, CAST(N'2024-05-07T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa thực phẩm tươi')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (172, 72, CAST(N'2024-05-02T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ uống có cồn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (173, 73, CAST(N'2024-04-27T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ dùng học tập')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (174, 74, CAST(N'2024-04-22T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa mỹ phẩm nam')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (175, 75, CAST(N'2024-04-17T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa thực phẩm chay')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (176, 76, CAST(N'2024-04-12T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ dùng bếp')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (177, 77, CAST(N'2024-04-07T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ vệ sinh')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (178, 78, CAST(N'2024-04-02T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ chăm sóc trẻ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (179, 79, CAST(N'2024-03-28T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ dùng thú cưng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (180, 80, CAST(N'2024-03-23T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ trang trí')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (181, 81, CAST(N'2024-03-18T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ thể thao')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (182, 82, CAST(N'2024-03-13T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ điện tử nhỏ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (183, 83, CAST(N'2024-03-08T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ dùng văn phòng')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (184, 84, CAST(N'2024-03-03T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ ăn vặt')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (185, 85, CAST(N'2024-02-27T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ uống không cồn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (186, 86, CAST(N'2024-02-22T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ chăm sóc tóc')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (187, 87, CAST(N'2024-02-17T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ dùng cá nhân')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (188, 88, CAST(N'2024-02-12T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa thực phẩm nhập khẩu')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (189, 89, CAST(N'2024-02-07T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ dùng y tế')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (190, 90, CAST(N'2024-02-02T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ chăm sóc da')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (191, 91, CAST(N'2024-01-28T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ dùng nấu ăn')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (192, 92, CAST(N'2024-01-23T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ dùng dã ngoại')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (193, 93, CAST(N'2024-01-18T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ dùng ngủ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (194, 94, CAST(N'2024-01-13T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ dùng tắm')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (195, 95, CAST(N'2024-01-08T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ dùng làm đẹp')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (196, 96, CAST(N'2024-01-03T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ dùng gia đình')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (197, 97, CAST(N'2023-12-29T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ dùng thời trang')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (198, 98, CAST(N'2023-12-24T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ dùng công nghệ')
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (199, 99, CAST(N'2023-12-19T20:44:45.490' AS DateTime), N'Kiểm kê hàng hóa đồ dùng giải trí')
GO
INSERT [dbo].[PhieuKiemKho] ([MaPhieuKK], [MaNV], [NgayKiemKho], [MoTa]) VALUES (200, 100, CAST(N'2023-12-14T20:44:45.490' AS DateTime), N'Kiểm tra hàng hóa đồ dùng sức khỏe')
SET IDENTITY_INSERT [dbo].[PhieuKiemKho] OFF
GO
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (1, N'Tivi Samsung Smart 4K 55 inch', 1, 1, N'Chiếc', CAST(8000000.00 AS Decimal(10, 2)), CAST(12000000.00 AS Decimal(10, 2)), 133, NULL, N'Tivi thông minh màn hình lớn')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (2, N'Nồi cơm điện Sharp 1.8L', 2, 2, N'Chiếc', CAST(300000.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)), 130, NULL, N'Nồi cơm điện dung tích lớn')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (3, N'Mì gói Hảo Hảo', 3, 3, N'Thùng', CAST(60000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)), 267, CAST(N'2025-07-30' AS Date), N'Mì ăn liền phổ biến')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (4, N'Áo sơ mi nam trắng', 4, 4, N'Chiếc', CAST(150000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), 88, NULL, N'Áo sơ mi công sở')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (5, N'Sách Đắc Nhân Tâm', 5, 5, N'Cuốn', CAST(50000.00 AS Decimal(10, 2)), CAST(80000.00 AS Decimal(10, 2)), 201, NULL, N'Sách self-help nổi tiếng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (6, N'Ô tô đồ chơi điều khiển', 6, 6, N'Chiếc', CAST(200000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 90, NULL, N'Ô tô điều khiển từ xa')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (7, N'Kem chống nắng Sunplay SPF50+', 7, 7, N'Chai', CAST(80000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), 153, CAST(N'2026-03-15' AS Date), N'Kem chống nắng hiệu quả')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (8, N'Bút bi Thiên Long', 8, 8, N'Hộp', CAST(25000.00 AS Decimal(10, 2)), CAST(40000.00 AS Decimal(10, 2)), 350, NULL, N'Bút bi chất lượng tốt')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (9, N'Giày đá bóng Adidas', 9, 9, N'Đôi', CAST(500000.00 AS Decimal(10, 2)), CAST(800000.00 AS Decimal(10, 2)), 129, NULL, N'Giày đá bóng chuyên nghiệp')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (10, N'Bàn chải đánh răng Oral-B', 10, 10, N'Cây', CAST(20000.00 AS Decimal(10, 2)), CAST(35000.00 AS Decimal(10, 2)), 340, NULL, N'Bàn chải đánh răng mềm')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (11, N'Laptop Dell XPS 13', 11, 11, N'Chiếc', CAST(15000000.00 AS Decimal(10, 2)), CAST(20000000.00 AS Decimal(10, 2)), 77, NULL, N'Laptop cao cấp, hiệu năng mạnh')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (12, N'Máy giặt LG Inverter 9kg', 12, 12, N'Chiếc', CAST(5000000.00 AS Decimal(10, 2)), CAST(7500000.00 AS Decimal(10, 2)), 70, NULL, N'Máy giặt tiết kiệm điện')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (13, N'Nước ngọt Coca-Cola 1.5L', 13, 13, N'Thùng', CAST(120000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), 208, CAST(N'2025-12-31' AS Date), N'Nước ngọt giải khát phổ biến')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (14, N'Quần jeans nam Levi’s', 14, 14, N'Chiếc', CAST(400000.00 AS Decimal(10, 2)), CAST(600000.00 AS Decimal(10, 2)), 101, NULL, N'Quần jeans thời trang')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (15, N'Sách Nhà Giả Kim', 15, 15, N'Cuốn', CAST(60000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), 163, NULL, N'Tiểu thuyết nổi tiếng thế giới')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (16, N'Xe đẩy đồ chơi trẻ em', 16, 16, N'Chiếc', CAST(150000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), 125, NULL, N'Xe đẩy đồ chơi an toàn')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (17, N'Sữa rửa mặt Cetaphil 500ml', 17, 17, N'Chai', CAST(200000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), 118, CAST(N'2026-06-30' AS Date), N'Sữa rửa mặt dịu nhẹ')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (18, N'Vở học sinh 200 trang', 188, 18, N'Cuốn', CAST(15000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), 548, NULL, N'Vở học sinh chất lượng cao')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (19, N'Găng tay bóng chày Wilson', 19, 19, N'Đôi', CAST(300000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)), 115, NULL, N'Găng tay bóng chày chuyên dụng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (20, N'Kem đánh răng Colgate 180g', 20, 20, N'Tuýp', CAST(30000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), 295, CAST(N'2026-01-15' AS Date), N'Kem đánh răng bảo vệ răng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (21, N'Máy xay sinh tố Philips', 21, 21, N'Chiếc', CAST(600000.00 AS Decimal(10, 2)), CAST(900000.00 AS Decimal(10, 2)), 60, NULL, N'Máy xay đa năng, bền bỉ')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (22, N'Điện thoại iPhone 14 Pro', 21, 22, N'Chiếc', CAST(20000000.00 AS Decimal(10, 2)), CAST(27000000.00 AS Decimal(10, 2)), 25, NULL, N'Điện thoại cao cấp, camera sắc nét')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (23, N'Bánh quy Cosy 500g', 23, 23, N'Hộp', CAST(50000.00 AS Decimal(10, 2)), CAST(80000.00 AS Decimal(10, 2)), 180, CAST(N'2025-10-20' AS Date), N'Bánh quy thơm ngon')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (24, N'Áo khoác nữ Uniqlo', 24, 24, N'Chiếc', CAST(300000.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)), 70, NULL, N'Áo khoác thời trang, ấm áp')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (25, N'Sách Lược Sử Thời Gian', 25, 25, N'Cuốn', CAST(80000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), 100, NULL, N'Sách khoa học hấp dẫn')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (26, N'Búp bê Barbie thời trang', 26, 26, N'Chiếc', CAST(100000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), 90, NULL, N'Búp bê thời trang cho trẻ em')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (27, N'Nước hoa Dior Sauvage 100ml', 27, 27, N'Chai', CAST(1500000.00 AS Decimal(10, 2)), CAST(2000000.00 AS Decimal(10, 2)), 40, NULL, N'Nước hoa nam cao cấp')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (28, N'Bút chì Faber-Castell', 28, 28, N'Hộp', CAST(20000.00 AS Decimal(10, 2)), CAST(35000.00 AS Decimal(10, 2)), 400, NULL, N'Bút chì chất lượng cao')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (29, N'Túi thể thao Nike', 29, 29, N'Chiếc', CAST(250000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), 60, NULL, N'Túi thể thao bền, tiện dụng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (30, N'Sữa tắm Dove 1L', 30, 30, N'Chai', CAST(100000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), 120, CAST(N'2026-04-30' AS Date), N'Sữa tắm dưỡng ẩm da')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (31, N'Tủ lạnh Samsung 300L', 31, 31, N'Chiếc', CAST(7000000.00 AS Decimal(10, 2)), CAST(10000000.00 AS Decimal(10, 2)), 35, NULL, N'Tủ lạnh tiết kiệm điện')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (32, N'Bánh mì sandwich Kinh Đô', 32, 32, N'Gói', CAST(25000.00 AS Decimal(10, 2)), CAST(40000.00 AS Decimal(10, 2)), 200, CAST(N'2025-09-15' AS Date), N'Bánh mì mềm thơm')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (33, N'Váy maxi nữ thời trang', 33, 33, N'Chiếc', CAST(200000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 80, NULL, N'Váy maxi nhẹ nhàng, thanh lịch')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (34, N'Sách Hài Hước Một Chút', 34, 34, N'Cuốn', CAST(40000.00 AS Decimal(10, 2)), CAST(70000.00 AS Decimal(10, 2)), 130, NULL, N'Sách hài hước giải trí')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (35, N'Đồ chơi xếp hình LEgo 500 mảnh', 35, 35, N'Hộp', CAST(300000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)), 70, NULL, N'Xếp hình sáng tạo cho trẻ')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (36, N'Son môi L’Oreal Paris', 36, 36, N'Thỏi', CAST(120000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), 100, CAST(N'2026-02-28' AS Date), N'Son môi màu sắc thời thượng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (37, N'Tẩy bút chì Pelikan', 37, 37, N'Cục', CAST(10000.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), 600, NULL, N'Tẩy sạch, không để lại vết')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (38, N'Nước tẩy trang Bioderma 500ml', 38, 38, N'Chai', CAST(250000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 80, CAST(N'2026-05-31' AS Date), N'Nước tẩy trang dịu nhẹ')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (39, N'Máy pha cà phê De’Longhi', 39, 39, N'Chiếc', CAST(2000000.00 AS Decimal(10, 2)), CAST(3000000.00 AS Decimal(10, 2)), 20, NULL, N'Máy pha cà phê chuyên nghiệp')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (40, N'Sữa tươi Vinamilk 1L', 40, 40, N'Hộp', CAST(20000.00 AS Decimal(10, 2)), CAST(35000.00 AS Decimal(10, 2)), 250, CAST(N'2025-11-30' AS Date), N'Sữa tươi nguyên chất')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (41, N'Áo thun nam Zara', 41, 41, N'Chiếc', CAST(100000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), 100, NULL, N'Áo thun nam thời trang')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (42, N'Sách Tư Duy Nhanh Và Chậm', 42, 42, N'Cuốn', CAST(90000.00 AS Decimal(10, 2)), CAST(140000.00 AS Decimal(10, 2)), 110, NULL, N'Sách tâm lý học nổi tiếng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (43, N'Bộ đồ chơi nấu ăn trẻ em', 43, 43, N'Bộ', CAST(150000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), 85, NULL, N'Đồ chơi nấu ăn an toàn')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (44, N'Mặt nạ dưỡng da Innisfree', 44, 44, N'Miếng', CAST(15000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), 300, CAST(N'2026-03-31' AS Date), N'Mặt nạ dưỡng da tự nhiên')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (45, N'Bút mực Parker', 45, 45, N'Cây', CAST(500000.00 AS Decimal(10, 2)), CAST(800000.00 AS Decimal(10, 2)), 50, NULL, N'Bút mực cao cấp')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (46, N'Giày chạy bộ asics', 46, 46, N'Đôi', CAST(600000.00 AS Decimal(10, 2)), CAST(900000.00 AS Decimal(10, 2)), 60, NULL, N'Giày chạy bộ êm ái')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (47, N'Xà phòng rửa tay Lifebuoy 500ml', 47, 47, N'Chai', CAST(40000.00 AS Decimal(10, 2)), CAST(60000.00 AS Decimal(10, 2)), 150, CAST(N'2026-07-31' AS Date), N'Xà phòng diệt khuẩn')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (48, N'Máy hút bụi Dyson', 48, 48, N'Chiếc', CAST(4000000.00 AS Decimal(10, 2)), CAST(6000000.00 AS Decimal(10, 2)), 25, NULL, N'Máy hút bụi không dây mạnh mẽ')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (49, N'Kẹo dẻo Haribo 200g', 49, 49, N'Gói', CAST(30000.00 AS Decimal(10, 2)), CAST(50000.00 AS Decimal(10, 2)), 200, CAST(N'2025-12-15' AS Date), N'Kẹo dẻo trái cây ngon')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (50, N'Áo len nữ H&M', 50, 50, N'Chiếc', CAST(200000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 80, NULL, N'Áo len ấm áp, thời trang')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (51, N'Sách Bố Già', 51, 51, N'Cuốn', CAST(70000.00 AS Decimal(10, 2)), CAST(110000.00 AS Decimal(10, 2)), 120, NULL, N'Tiểu thuyết kinh điển')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (52, N'Đồ chơi robot biến hình', 52, 52, N'Chiếc', CAST(250000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), 70, NULL, N'Robot biến hình thú vị')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (53, N'Toner Thayers 355ml', 53, 53, N'Chai', CAST(150000.00 AS Decimal(10, 2)), CAST(220000.00 AS Decimal(10, 2)), 90, CAST(N'2026-04-30' AS Date), N'Toner dưỡng da không cồn')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (54, N'Bộ bút màu 24 màu Crayola', 54, 54, N'Hộp', CAST(80000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), 200, NULL, N'Bút màu an toàn cho trẻ')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (55, N'Bóng đá Mitre', 55, 55, N'Quả', CAST(150000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), 100, NULL, N'Bóng đá chất lượng cao')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (56, N'Sữa dưỡng thể Nivea 400ml', 56, 56, N'Chai', CAST(100000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), 120, CAST(N'2026-06-30' AS Date), N'Sữa dưỡng thể dưỡng ẩm')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (57, N'Loa Bluetooth JBL Flip 5', 57, 57, N'Chiếc', CAST(1500000.00 AS Decimal(10, 2)), CAST(2000000.00 AS Decimal(10, 2)), 40, NULL, N'Loa Bluetooth âm thanh chất lượng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (58, N'Bánh snack Lay’s 100g', 58, 58, N'Gói', CAST(15000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), 300, CAST(N'2025-10-31' AS Date), N'Bánh snack giòn tan')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (59, N'Quần short nam Adidas', 59, 59, N'Chiếc', CAST(200000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 90, NULL, N'Quần short thể thao thoải mái')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (60, N'Sách Sapiens', 60, 60, N'Cuốn', CAST(100000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), 110, NULL, N'Sách lịch sử nhân loại')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (61, N'Bộ đồ chơi bác sĩ trẻ em', 61, 61, N'Bộ', CAST(200000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 80, NULL, N'Đồ chơi bác sĩ an toàn')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (62, N'Serum The Ordinary Niacinamide', 62, 62, N'Chai', CAST(200000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), 100, CAST(N'2026-05-31' AS Date), N'Serum dưỡng da hiệu quả')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (63, N'Bút highlighter Stabilo', 63, 63, N'Cây', CAST(20000.00 AS Decimal(10, 2)), CAST(35000.00 AS Decimal(10, 2)), 250, NULL, N'Bút highlighter màu sắc tươi sáng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (64, N'Mũ bóng chày Nike', 64, 64, N'Chiếc', CAST(150000.00 AS Decimal(10, 2)), CAST(250000.00 AS Decimal(10, 2)), 80, NULL, N'Mũ bóng chày thời trang')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (65, N'Nước súc miệng Listerine 500ml', 65, 65, N'Chai', CAST(80000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), 150, CAST(N'2026-03-31' AS Date), N'Nước súc miệng diệt khuẩn')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (66, N'Máy lọc không khí Xiaomi', 66, 66, N'Chiếc', CAST(2000000.00 AS Decimal(10, 2)), CAST(3000000.00 AS Decimal(10, 2)), 30, NULL, N'Máy lọc không khí thông minh')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (67, N'Trà xanh C2 500ml', 67, 67, N'Thùng', CAST(90000.00 AS Decimal(10, 2)), CAST(140000.00 AS Decimal(10, 2)), 200, CAST(N'2025-11-15' AS Date), N'Trà xanh giải khát')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (68, N'Áo khoác gió Columbia', 68, 68, N'Chiếc', CAST(500000.00 AS Decimal(10, 2)), CAST(800000.00 AS Decimal(10, 2)), 60, NULL, N'Áo khoác gió chống thấm')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (69, N'Sách 7 Thói Quen Hiệu Quả', 69, 69, N'Cuốn', CAST(80000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), 100, NULL, N'Sách phát triển bản thân')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (70, N'Bộ đồ chơi siêu nhân', 70, 70, N'Bộ', CAST(250000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), 70, NULL, N'Đồ chơi siêu nhân hấp dẫn')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (71, N'Kem dưỡng ẩm CeraVe 340g', 71, 71, N'Hũ', CAST(250000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 80, CAST(N'2026-07-31' AS Date), N'Kem dưỡng ẩm cho da khô')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (72, N'Bút gel Muji', 72, 72, N'Cây', CAST(20000.00 AS Decimal(10, 2)), CAST(35000.00 AS Decimal(10, 2)), 300, NULL, N'Bút gel mực mịn')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (73, N'Gậy bóng chày Louisville', 73, 73, N'Cây', CAST(400000.00 AS Decimal(10, 2)), CAST(600000.00 AS Decimal(10, 2)), 50, NULL, N'Gậy bóng chày chất lượng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (74, N'Sữa rửa tay Method 300ml', 74, 74, N'Chai', CAST(60000.00 AS Decimal(10, 2)), CAST(90000.00 AS Decimal(10, 2)), 120, CAST(N'2026-04-30' AS Date), N'Sữa rửa tay tự nhiên')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (75, N'Tai nghe Sony WH-1000XM5', 75, 75, N'Chiếc', CAST(5000000.00 AS Decimal(10, 2)), CAST(7000000.00 AS Decimal(10, 2)), 20, NULL, N'Tai nghe chống ồn cao cấp')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (76, N'Bánh trung thu Kinh Đô', 76, 76, N'Hộp', CAST(200000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), 100, CAST(N'2025-09-30' AS Date), N'Bánh trung thu truyền thống')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (77, N'Áo polo nam Lacoste', 77, 77, N'Chiếc', CAST(300000.00 AS Decimal(10, 2)), CAST(500000.00 AS Decimal(10, 2)), 80, NULL, N'Áo polo cao cấp')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (78, N'Sách Harry Potter', 78, 78, N'Cuốn', CAST(120000.00 AS Decimal(10, 2)), CAST(180000.00 AS Decimal(10, 2)), 120, NULL, N'Tiểu thuyết giả tưởng nổi tiếng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (79, N'Đồ chơi máy bay điều khiển', 79, 79, N'Chiếc', CAST(300000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)), 60, NULL, N'Máy bay điều khiển từ xa')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (80, N'Sữa tắm Olay 650ml', 80, 80, N'Chai', CAST(90000.00 AS Decimal(10, 2)), CAST(140000.00 AS Decimal(10, 2)), 100, CAST(N'2026-06-30' AS Date), N'Sữa tắm dưỡng da mềm mại')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (81, N'Máy ảnh Canon EOS M50', 81, 81, N'Chiếc', CAST(8000000.00 AS Decimal(10, 2)), CAST(11000000.00 AS Decimal(10, 2)), 15, NULL, N'Máy ảnh mirrorless chất lượng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (82, N'Nước tăng lực Red Bull 250ml', 82, 82, N'Thùng', CAST(150000.00 AS Decimal(10, 2)), CAST(220000.00 AS Decimal(10, 2)), 150, CAST(N'2025-12-31' AS Date), N'Nước tăng lực mạnh mẽ')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (83, N'Quần tây nam Canifa', 83, 83, N'Chiếc', CAST(250000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), 90, NULL, N'Quần tây công sở lịch lãm')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (84, N'Sách Thinking, Fast and Slow', 84, 84, N'Cuốn', CAST(100000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), 110, NULL, N'Sách tâm lý học sâu sắc')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (85, N'Bộ đồ chơi xây dựng', 85, 85, N'Bộ', CAST(200000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 80, NULL, N'Đồ chơi xây dựng sáng tạo')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (86, N'Son dưỡng môi Burt’s Bees', 86, 86, N'Thỏi', CAST(80000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), 150, CAST(N'2026-05-31' AS Date), N'Son dưỡng môi tự nhiên')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (87, N'Bút bi Pilot', 87, 87, N'Cây', CAST(15000.00 AS Decimal(10, 2)), CAST(25000.00 AS Decimal(10, 2)), 400, NULL, N'Bút bi mực đều')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (88, N'Bóng rổ Spalding', 88, 88, N'Quả', CAST(200000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 70, NULL, N'Bóng rổ chất lượng cao')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (89, N'Nước rửa chén Seventh Generation', 89, 89, N'Chai', CAST(70000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), 120, CAST(N'2026-04-30' AS Date), N'Nước rửa chén thân thiện môi trường')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (90, N'Máy in HP LaserJet', 90, 90, N'Chiếc', CAST(3000000.00 AS Decimal(10, 2)), CAST(4500000.00 AS Decimal(10, 2)), 20, NULL, N'Máy in laser hiệu quả')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (91, N'Sữa chua Vinamilk 100g', 91, 91, N'Hộp', CAST(5000.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(10, 2)), 500, CAST(N'2025-11-30' AS Date), N'Sữa chua bổ dưỡng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (92, N'Áo blazer nữ Mango', 92, 92, N'Chiếc', CAST(400000.00 AS Decimal(10, 2)), CAST(600000.00 AS Decimal(10, 2)), 60, NULL, N'Áo blazer thời trang công sở')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (93, N'Sách The Alchemist', 93, 93, N'Cuốn', CAST(60000.00 AS Decimal(10, 2)), CAST(100000.00 AS Decimal(10, 2)), 130, NULL, N'Tiểu thuyết truyền cảm hứng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (94, N'Đồ chơi tàu hỏa trẻ em', 94, 94, N'Bộ', CAST(250000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), 70, NULL, N'Đồ chơi tàu hỏa thú vị')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (95, N'Kem dưỡng da Neutrogena 50ml', 95, 95, N'Hũ', CAST(200000.00 AS Decimal(10, 2)), CAST(300000.00 AS Decimal(10, 2)), 90, CAST(N'2026-06-30' AS Date), N'Kem dưỡng da dịu nhẹ')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (96, N'Bút chì màu Prismacolor', 96, 96, N'Hộp', CAST(300000.00 AS Decimal(10, 2)), CAST(450000.00 AS Decimal(10, 2)), 100, NULL, N'Bút chì màu chuyên nghiệp')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (97, N'Vợt cầu lông Yonex', 97, 97, N'Cây', CAST(500000.00 AS Decimal(10, 2)), CAST(800000.00 AS Decimal(10, 2)), 50, NULL, N'Vợt cầu lông chất lượng')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (98, N'Sữa tắm Palmolive 750ml', 98, 98, N'Chai', CAST(80000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), 120, CAST(N'2026-05-31' AS Date), N'Sữa tắm thơm mát')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (99, N'Đồng hồ thông minh Apple Watch', 99, 99, N'Chiếc', CAST(6000000.00 AS Decimal(10, 2)), CAST(9000000.00 AS Decimal(10, 2)), 25, NULL, N'Đồng hồ thông minh cao cấp')
INSERT [dbo].[SanPham] ([MasP], [TenSP], [MaLoaiSP], [MaNCC], [DonViTinh], [GiaNhap], [GiaBan], [SoLuongTonKho], [HanSuDung], [MoTa]) VALUES (100, N'Bánh gạo Orion 200g', 100, 100, N'Gói', CAST(20000.00 AS Decimal(10, 2)), CAST(35000.00 AS Decimal(10, 2)), 200, CAST(N'2025-11-15' AS Date), N'Bánh gạo giòn ngon')
GO
ALTER TABLE [dbo].[HoaDonBan] ADD  DEFAULT (getdate()) FOR [NgayBan]
GO
ALTER TABLE [dbo].[HoaDonBan] ADD  DEFAULT ((0)) FOR [DiemSuDung]
GO
ALTER TABLE [dbo].[HoaDonNhap] ADD  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[KhachHang] ADD  DEFAULT ((0)) FOR [DiemTichLuy]
GO
ALTER TABLE [dbo].[PhieuKiemKho] ADD  DEFAULT (getdate()) FOR [NgayKiemKho]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [SoLuongTonKho]
GO
ALTER TABLE [dbo].[ChiTietHDBan]  WITH CHECK ADD FOREIGN KEY([MaHDBan])
REFERENCES [dbo].[HoaDonBan] ([MaHDBan])
GO
ALTER TABLE [dbo].[ChiTietHDBan]  WITH CHECK ADD FOREIGN KEY([MasP])
REFERENCES [dbo].[SanPham] ([MasP])
GO
ALTER TABLE [dbo].[ChiTietHDNhap]  WITH CHECK ADD FOREIGN KEY([MaHDNhap])
REFERENCES [dbo].[HoaDonNhap] ([MaHDNhap])
GO
ALTER TABLE [dbo].[ChiTietHDNhap]  WITH CHECK ADD FOREIGN KEY([MasP])
REFERENCES [dbo].[SanPham] ([MasP])
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai]  WITH CHECK ADD FOREIGN KEY([MaKM])
REFERENCES [dbo].[KhuyenMai] ([MaKM])
GO
ALTER TABLE [dbo].[ChiTietKhuyenMai]  WITH CHECK ADD FOREIGN KEY([MasP])
REFERENCES [dbo].[SanPham] ([MasP])
GO
ALTER TABLE [dbo].[ChiTietPhieuKiemKho]  WITH CHECK ADD FOREIGN KEY([MaPhieuKK])
REFERENCES [dbo].[PhieuKiemKho] ([MaPhieuKK])
GO
ALTER TABLE [dbo].[ChiTietPhieuKiemKho]  WITH CHECK ADD FOREIGN KEY([MasP])
REFERENCES [dbo].[SanPham] ([MasP])
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuKiemKho]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[ChiTietHDBan]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietHDBan]  WITH CHECK ADD CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[ChiTietHDBan]  WITH CHECK ADD CHECK  (([ThanhTien]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietHDNhap]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietHDNhap]  WITH CHECK ADD CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[ChiTietHDNhap]  WITH CHECK ADD CHECK  (([ThanhTien]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietPhieuKiemKho]  WITH CHECK ADD CHECK  (([SoLuongThucTe]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietPhieuKiemKho]  WITH CHECK ADD CHECK  (([SoLuongHeThong]>=(0)))
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD CHECK  (([DiemSuDung]>=(0)))
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD CHECK  (([TongTien]>=(0)))
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD CHECK  (([TongTien]>=(0)))
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD CHECK  (([PhanTramGiamGia]>=(0) AND [PhanTramGiamGia]<=(100)))
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD CHECK  (([GioiTinh]=N'Nữ' OR [GioiTinh]=N'Nam'))
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD CHECK  (([Luong]>(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([GiaBan]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([GiaNhap]>=(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([SoLuongTonKho]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[sp_ApDungKhuyenMaiChoSanPham]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------apdung khuyen cho san pham
create procedure [dbo].[sp_ApDungKhuyenMaiChoSanPham] (
    @MaKM int,
    @DanhSachMasP varchar(MAX) -- Chuỗi các MasP cách nhau bởi dấu phẩy
)
as
begin
    -- Kiểm tra mã khuyến mãi có tồn tại
    IF NOT EXISTS (select 1 from KhuyenMai where MaKM = @MaKM)
    begin
        RAISERROR('Mã khuyến mãi không tồn tại.', 16, 1);
        return;
    end

    -- Tách chuỗi MasP thành các giá trị riêng lẻ
    DECLARE @MasPTach int;
    DECLARE @DanhSachMasPTach TABLE (MasP int);

    WHILE LEN(@DanhSachMasP) > 0
    begin
        IF CHARINDEX(',', @DanhSachMasP) > 0
        begin
            select @MasPTach = CasT(SUBSTRING(@DanhSachMasP, 1, CHARINDEX(',', @DanhSachMasP) - 1) as int);
            SET @DanhSachMasP = SUBSTRING(@DanhSachMasP, CHARINDEX(',', @DanhSachMasP) + 1, LEN(@DanhSachMasP));
        end
        ELSE
        begin
            select @MasPTach = CasT(@DanhSachMasP as int);
            SET @DanhSachMasP = '';
        end

        IF ISNUMERIC(@MasPTach) = 1 AND EXISTS (select 1 from SanPham where MasP = CasT(@MasPTach as int))
        begin
            IF NOT EXISTS (select 1 from ChiTietKhuyenMai where MaKM = @MaKM AND MasP = CasT(@MasPTach as int))
            begin
                insert into ChiTietKhuyenMai (MaKM, MasP)
                VALUES (@MaKM, CasT(@MasPTach as int));
            end
        end
        ELSE IF ISNUMERIC(@MasPTach) = 0 AND LEN(LTRIM(RTRIM(@MasPTach))) > 0
        begin
            RAISERROR('Mã sản phẩm không hợp lệ: %s', 16, 1, @MasPTach);
            return;
        end
        ELSE IF NOT EXISTS (select 1 from SanPham where MasP = CasT(@MasPTach as int)) AND ISNUMERIC(@MasPTach) = 1
        begin
            RAISERROR('Mã sản phẩm không tồn tại: %s', 16, 1, @MasPTach);
            return;
        end
    end
end;

GO
/****** Object:  StoredProcedure [dbo].[sp_LaySanPhamTheoLoai]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


------------ lấy theo san pham theo loai
create procedure [dbo].[sp_LaySanPhamTheoLoai] (
    @MaLoaiSP int
)
as
begin
    IF EXISTS (select 1 from LoaiSanPham where MaLoaiSP = @MaLoaiSP)
    begin
        select sp.*
        from SanPham sp
        where sp.MaLoaiSP = @MaLoaiSP;
    end
    ELSE
    begin
        RAISERROR('Mã loại sản phẩm không tồn tại.', 16, 1);
        return;
    end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayThongTinHoaDonBan]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------sp_LayThongTinHoaDonBan-------------
create procedure [dbo].[sp_LayThongTinHoaDonBan] (
    @MaHDBan int
)
as
begin
    select
        hdb.MaHDBan,
        nv.HoTen as TenNhanVien,
        kh.HoTen as TenKhachHang,
        hdb.NgayBan,
        ct.MasP,
        sp.TenSP,
        ct.SoLuong,
        ct.DonGia,
        ct.ThanhTien,
        hdb.TongTien,
        hdb.DiemSuDung
    from HoaDonBan hdb
    INNER JOIN NhanVien nv on hdb.MaNV = nv.MaNV
    INNER JOIN KhachHang kh on hdb.MaKH = kh.MaKH
    INNER JOIN ChiTietHDBan ct on hdb.MaHDBan = ct.MaHDBan
    INNER JOIN SanPham sp on ct.MasP = sp.MasP
    where hdb.MaHDBan = @MaHDBan;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemNhanVien]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------ThemNhanVien-------------
create procedure [dbo].[sp_ThemNhanVien] (
    @HoTen nvarchar(255),
    @NgaySinh date,
    @GioiTinh nvarchar(10),
    @DiaChi nvarchar(255),
    @SDT varchar(20),
    @Email varchar(255),
    @ChucVu nvarchar(50),
    @NgayVaoLam date,
    @Luong DECIMAL(10, 2)
)
as
begin
    IF NOT EXISTS (select 1 from NhanVien where SDT = @SDT)
    begin
        IF @Email IS NULL OR NOT EXISTS (select 1 from NhanVien where Email = @Email)
        begin
            insert into NhanVien (HoTen, NgaySinh, GioiTinh, DiaChi, SDT, Email, ChucVu, NgayVaoLam, Luong)
            VALUES (@HoTen, @NgaySinh, @GioiTinh, @DiaChi, @SDT, @Email, @ChucVu, @NgayVaoLam, @Luong);
        end
        ELSE
        begin
            RAISERROR('Email đã tồn tại.', 16, 1);
            return;
        end
    end
    ELSE
    begin
        RAISERROR('Số điện thoại đã tồn tại.', 16, 1);
        return;
    end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemSanPhamTheoTen]    Script Date: 4/22/2025 8:47:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------TimKiemSanPhamTheoTen-------------
create procedure [dbo].[sp_TimKiemSanPhamTheoTen] (
    @TenSP nvarchar(255)
)
as
begin
    select *
    from SanPham
    where TenSP LIKE N'%' + @TenSP + N'%';
end
GO
USE [master]
GO
ALTER DATABASE [QLCHTL] SET  READ_WRITE 
GO
