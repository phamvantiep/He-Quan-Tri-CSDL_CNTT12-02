--TẠO BẢNG
--1. Trước khi tạo bảng cần xác định
-- + Bảng tạo ra với mục đích gì?
-- + Bảng gồm những trường (cột) nào?
-- + Trường nào làm khóa chính?
-- + Bảng có quan hệ với bảng khác?
-- + Có ràng buộc - yêu cầu khác cho các cột?
--2. Cú pháp
--	CREATE TABLE tên_bảng
--	(
--		tên_cột_1	kiểu_dữ_liệu	[RBTV],
--		tên_cột_2	kiểu_dữ_liệu	[RBTV],
--		...
--		tên_cột_n	kiểu_dữ_liệu	[RBTV]
--	)
CREATE DATABASE QuanLyNhanSu
GO
USE QuanLyNhanSu
GO
CREATE TABLE PhongBan
(
	MaPhong VARCHAR(10) PRIMARY KEY,
	TenPhong NVARCHAR(50),
	DienThoai VARCHAR(15)
)

--3. Các loại ràng buộc
--3.1. Ràng buộc CHECK
-- Được sử dụng nhằm chỉ định điều kiện hợp lệ
-- khi nhập dữ liệu cho bảng
-- Cú pháp:	
--	[CONSTRAINT tên_ràng_buộc] CHECK (điều_kiện)
USE QuanLyNhanSu
GO
CREATE TABLE NhanVien
(
	MaNV VARCHAR(10),
	HoTen NVARCHAR(30),
	Tuoi INT CONSTRAINT c_Tuoi CHECK (Tuoi>=18 AND Tuoi<=60)
)

--3.2. Ràng buộc NOT NULL
-- Được sử dụng khi bắt buộc phải nhập giá trị cho cột khi thêm dữ liệu vào bảng
-- Cú pháp: tên_cột	 kiểu_dữ_liệu   NOT NULL
USE QuanLyNhanSu
GO
CREATE TABLE ChucVu
(	
	MaChucVu VARCHAR(10) NOT NULL,
	TenChucVu NVARCHAR(50) NOT NULL,
	GhiChu NVARCHAR(100)
)

--3.3 Ràng buộc PRIMARY KEY
-- Được sử dụng để định nghĩa khóa chính của bảng
USE QuanLyNhanSu
GO
CREATE TABLE HocVan
(
	MaHV VARCHAR(10) PRIMARY KEY,
	TenHV NVARCHAR(50) NOT NULL,
	GhiChu NVARCHAR(100)
)

--3.4 Ràng buộc UNIQUE
-- Được sử dụng khi quy định một cột nào đó có giá trị
-- duy nhất trên từng dòng
-- Cú pháp: [CONSTRAINT tên_ràng_buộc]  UNIQUE  [(danh_sách_cột)]
--Ví dụ:
USE QuanLyNhanSu
GO
CREATE TABLE TinhThanh
(
	MaTinh VARCHAR(10) PRIMARY KEY,
	TenTinh NVARCHAR(30) UNIQUE,
	GhiChu NVARCHAR(100)
)

--3.5. Ràng buộc FOREIGN KEY
-- Để đảm bảo việc nhập dữ liệu cho cột nào đó phù hợp tham chiếu
-- tới 1 bảng quan hệ khác.
-- Cú pháp:
-- [CONSTRAINT tên_ràng_buộc] FOREIGN KEY ([ds_cột])
-- REFERENCES tên_bảng_tham_chiếu(ds_cột_tham_chiếu)
USE QuanLyNhanSu
GO
CREATE TABLE NhanVien
(
	MaNV VARCHAR(10),
	HoTen NVARCHAR(30),
	Tuoi INT CONSTRAINT c_Tuoi CHECK (Tuoi>=18 AND Tuoi<=60),
	MaPhong VARCHAR(10) FOREIGN KEY REFERENCES PhongBan(MaPhong)
)

--3.6 Ràng buộc IDENTITY
-- Được sử dụng khi muốn 1 cột nào đó tự động tăng giá trị khi
-- thêm 1 bản ghi vào bảng
-- Cú pháp: [CONSTRAINT tên_ràng_buộc] IDENTITY [(start, step)]
USE QuanLyNhanSu
GO
CREATE TABLE QuanHuyen
(
	Id INT IDENTITY(1,1),
	MaQH VARCHAR(10) PRIMARY KEY,
	TenQH NVARCHAR(50) NOT NULL
)
