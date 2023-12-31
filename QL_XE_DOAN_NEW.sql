Create Database QL_Xe_DoAn
Go
USE [QL_Xe_DoAn]
GO
/****** Object:  Table [dbo].[HangXe]    Script Date: 12/29/2022 12:40:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangXe](
	[MaHang] [nvarchar](50) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
 CONSTRAINT [PK_HangXe] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/29/2022 12:40:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaKH] [nvarchar](50) NULL,
	[MaXe] [nvarchar](50) NULL,
	[MaNV] [nchar](10) NULL,
	[MANCC] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/29/2022 12:40:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](50) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[MaXe] [nvarchar](50) NULL,
	[NgayMua] [date] NULL,
	[HanBH] [date] NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 12/29/2022 12:40:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MANCC] [nvarchar](50) NOT NULL,
	[TENNCC] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[MANCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/29/2022 12:40:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[SDT] [int] NULL,
	[DiaChi] [nvarchar](1000) NULL,
	[ChucVu] [nvarchar](50) NULL,
	[MatKhau] [nchar](10) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xe]    Script Date: 12/29/2022 12:40:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xe](
	[MaXe] [nvarchar](50) NOT NULL,
	[TenXe] [nvarchar](50) NULL,
	[LoaiXe] [nvarchar](50) NULL,
	[MaHang] [nvarchar](50) NULL,
	[DonGia] [int] NULL,
	[NgayNhap] [date] NULL,
	[PhanKhoi] [nvarchar](50) NULL,
	[MauXe] [nvarchar](50) NULL,
 CONSTRAINT [PK_Xe] PRIMARY KEY CLUSTERED 
(
	[MaXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NHACUNGCAP] FOREIGN KEY([MANCC])
REFERENCES [dbo].[NHACUNGCAP] ([MANCC])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NHACUNGCAP]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Xe] FOREIGN KEY([MaXe])
REFERENCES [dbo].[Xe] ([MaXe])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Xe]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_Xe] FOREIGN KEY([MaXe])
REFERENCES [dbo].[Xe] ([MaXe])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_Xe]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_HangXe] FOREIGN KEY([MaHang])
REFERENCES [dbo].[HangXe] ([MaHang])
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_HangXe]
GO
---------------------------------------Nhập liệu--------------------------------------------
-- HANG XE
insert into HangXe
values
('HD', 'Honda'),
('YMH', 'Yamaha'),
('SYM', 'SYM'),
('SZK', 'Suzuki'),
('DCT', 'Ducati'),
('KWSK', 'Kawasaki')
go

-- XE
set dateformat dmy
insert into Xe
values
-- Honda
('HV', N'Xe máy Honda Vision', N'Xe tay ga', 'HD', 32400000, '12/12/2012', '100cc', N'Đen'),
('HS', N'Xe máy Honda Sonic', N'Xe tay ga', 'HD', 65490000, '12/12/2012', '100cc', N'Đen'),
('HAB', N'Xe máy Honda Air Blade', N'Xe tay ga', 'HD', 45247000, '12/12/2012', '100cc', N'Đen'),
('HW', N'Xe máy Honda Wave RSX', N'Xe tay ga', 'HD', 25000000, '12/12/2012', '100cc', N'Đen'),
('HL', N'Xe máy Honda Lead', N'Xe tay ga', 'HD', 36990000, '12/12/2012', '100cc', N'Đen'),
('HSH', N'Xe máy Honda SH Mode', N'Xe tay ga', 'HD', 129770000, '12/12/2012', '100cc', N'Đen'),
('HWX', N'Xe máy Honda Winner X', N'Xe tay ga', 'HD', 39000000, '12/12/2012', '100cc', N'Đen'),
-- Yamaha
('YJ', N'Xe máy Yamaha Janus', N'Xe số', 'YMH', 29800000, '12/12/2012', '100cc', N'Đen'),
('YE', N'Xe máy Yamaha Exciter', N'Xe số', 'YMH', 47600000, '12/12/2012', '100cc', N'Đen'),
('YS', N'Xe máy Yamaha Sirius', N'Xe số', 'YMH', 24500000, '12/12/2012', '100cc', N'Đen'),
('YX', N'Xe máy yamaha xsr', N'Xe số', 'YMH', 79000000, '12/12/2012', '100cc', N'Đen'),
--  SYM
('SYMA', N'xe máy ANGELA 50', N'Xe số', 'SYM', 17500000, '12/12/2012', '100cc', N'Đen'),
('SYMG', N'xe máy GALAXY 50', N'Xe số', 'SYM', 17300000, '12/12/2012', '100cc', N'Đen'),
('SYMS', N'xe máy STAR SR 125 EFI', N'Xe số', 'SYM', 52400000, '12/12/2012', '100cc', N'Đen'),
('SYMR', N'xe máy STAR SR 170', N'Xe số', 'SYM', 28700000, '12/12/2012', '100cc', N'Đen'),
('SYME', N'xe máy ELEGANT 110', N'Xe số', 'SYM', 17300000, '12/12/2012', '100cc', N'Đen'),
('SYMP', N'xe máy PASSING 50', N'Xe số', 'SYM', 23700000, '12/12/2012', '100cc', N'Đen'),
-- Suzuki
('SZKR', N'xe máy Suzuki Raider Fi', N'Xe côn', 'SZK', 49190000, '12/12/2012', '100cc', N'Đen'),
('SZKS', N'xe máy Suzuki Satria', N'Xe côn', 'SZK', 49990000, '12/12/2012', '100cc', N'Đen'),
('SZKG', N'xe máy Suzuki GD110', N'Xe côn', 'SZK', 29490000, '12/12/2012', '100cc', N'Đen'),
('SZKF', N'xe Suzuki GIXXER SF 250', N'Xe côn', 'SZK', 125900000, '12/12/2012', '100cc', N'Đen'),
('SZKV', N' Suzuki V-STROM 1000', N'Xe côn', 'SZK', 419000000, '12/12/2012', '100cc', N'Đen'),
-- Ducati
('DCTS', N'xe máy Ducati Scrambler Sixty2', N'Xe côn', 'DCT', 661745000, '12/12/2012', '100cc', N'Đen'),
('DCTC', N'xe máy Ducati Scrambler Cafe Racer', N'Xe côn', 'DCT', 649206000, '12/12/2012', '100cc', N'Đen'),
('DCTV', N'xe máy Ducati Multistrada V2', N'Xe côn', 'DCT', 990000000, '12/12/2012', '100cc', N'Đen'),
('DCTX', N'xe máy Ducati Diavel XDiavel', N'Xe côn', 'DCT', 1570000000, '12/12/2012', '100cc', N'Đen'),
('DCTP', N'xe máy Ducati Panigale V4', N'Xe côn', 'DCT', 1000000000, '12/12/2012', '100cc', N'Đen'),
('DCTM', N'xe máy Ducati Monster 937', N'Xe côn', 'DCT', 853123000, '12/12/2012', '100cc', N'Đen'),
('DCTH', N'xe máy Ducati Hypermotard 950', N'Xe côn', 'DCT', 818888000, '12/12/2012', '100cc', N'Đen'),
-- Kawasaki
('KZP', N'Kawasaki Z125 PRO', N'Xe côn', 'KWSK', 61587000, '12/12/2012', '100cc', N'Đen'),
('KNT', N'Kawasaki Ninja 250', N'Xe côn', 'KWSK', 122678000, '12/12/2012', '100cc', N'Đen'),
('KZNI', N'Kawasaki Z900', N'Xe côn', 'KWSK', 39676000, '12/12/2012', '100cc', N'Đen'),
('KZTE', N'Kawasaki Z1000', N'Xe côn', 'KWSK', 543210000, '12/12/2012', '100cc', N'Đen'),
('KNH', N'Kawasaki Ninja H2', N'Xe côn', 'KWSK', 1299999999, '12/12/2012', '100cc', N'Đen'),
('KNZ', N'Kawasaki Ninja ZX10-R', N'Xe côn', 'KWSK', 876543210, '12/12/2012', '100cc', N'Đen'),
('KVS', N'Kawasaki Vulcan S', N'Xe côn', 'KWSK', 345678000, '12/12/2012', '100cc', N'Đen'),
('KNZX', N'Kawasaki Ninja ZX-25R', N'Xe côn', 'KWSK', 191282000, '12/12/2012', '100cc', N'Đen'),
('KVSI', N'Kawasaki Versys 650', N'Xe côn', 'KWSK', 288399000, '12/12/2012', '100cc', N'Đen')
go
select * from KhachHang
-- KHACH HANG
set dateformat DMY
insert into KhachHang
values
('KH01', N'Nguyễn Lê Hữu Thắng',N'Nam', '01/01/2002', 'HAB', '1/2/2020', '1/2/2030', '123'),
('KH03', N'Trần Đình Trung Tín',N'Nam', '01/01/2002', 'KNH', '2/1/2022', '2/1/2032', '456'),
('KH04', N'Hồ Thanh Tùng',N'Nam', '01/01/2002', 'SYMA', '6/11/2019', '6/11/2024', '789'),
('KH05', N'Nguyễn Phương Việt',N'Nam', '01/01/2002', 'DCTP', '11/11/2011', '11/11/2031', '1233'),
('KH06', N'Nguyễn Việt Hoàng',N'Nam', '01/01/2002', 'YE', '1/2/2013', '1/2/2015', '1234'),
('KH07', N'Bảo Huy',N'Nam', '01/01/2002', 'SZKV', '10/10/2010', '10/10/2020', '1235'),
('KH08', N'Nguyễn Mẫn Đạt',N'Nam', '01/01/2002', 'KZTE', '22/11/2017', '22/11/2027', '999')
go

--nha cung cap
insert into NHACUNGCAP
values
('NCC01', N'Nhà Tùng'),
('NCC02', N'Nhà Thắng'),
('NCC03', N'Nhà Việt'),
('NCC04', N'Nhà Người Ta')
go
--Nhân viên
insert into NhanVien
values
('NV001', N'Nguyễn Thùy Trang', N'Nữ', 0785233698, N'35 Hòa Bình', N'Quản lý', 'QL001'),
('NV002', N'Trần Mạnh Cường', N'Nam', 0772563124, N'216 Lũy Bán Bích', N'Nhân viên', 'NV002'),
('NV003', N'Nguyễn Quốc Thái', N'Nam', 0932885987, N'752 Cách Mạng Tháng 8', N'Nhân viên', 'NV003'),
('NV004', N'Nguyễn Thị Huyền', N'Nữ', 0908552369, N'35D Lạc Long Quân', N'Nhân viên', 'NV004'),
('NV005', N'Lê Minh Bảo', N'Nam', 0378240061, N'118 Tô Hiến Thành', N'Nhân viên', 'NV005')
go
---- HOA DON
insert into HoaDon
values
('HD01','KH01','HAB', 'NV001', 'NCC01', 1, 10000000, 10000000)
go

select * from HangXe
select * from Xe
select * from KhachHang
Select * From HoaDon
select * from NHACUNGCAP
Select * From NhanVien
-- Honda
--Yamaha
--SYM
--Suzuki
--Ducati
--Kawasaki
--Đăng nhập--
Go
CREATE PROC [dbo].[DangNhap]
@Username nvarchar(20),
@Password nvarchar(20)
as
begin
    if exists (select * from NhanVien where MaNV = @Username and MATKHAU = @Password )
        select 1 as code
    else if exists (select * from KhachHang where MaKH = @Username and MATKHAU = @Password )
        select 2 as code
    else select 0 as code
end

Select Sum(ThanhTien) From HoaDon