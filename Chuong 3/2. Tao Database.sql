--TẠO DATABASE
--Cú pháp 1
--CREATE DATABASE tên_csdl
--Ví dụ
CREATE DATABASE BanHang
--Cú pháp 2
--CREATE DATABASE tên_csdl
--ON(
--	Name = tên_file_data,
--	FileName = đường_dẫn_file_data,
--	Size = kích_cỡ_csdl,
--	MaxSize = kích_cỡ_max_csdl,
--	Filegrowth = độ_tăng_csdl
--)
--LOG ON(
--	Name = tên_file_log,
--	FileName = đường_dẫn_file_log,
--	Size = kích_cỡ_file_log,
--	MaxSize = kích_cỡ_max_file_log,
--	Filegrowth = độ_tăng_file_log
--)

--Ví dụ:
CREATE DATABASE CuaHangMayTinh
ON(
	Name = CuaHangMayTinh_Data,
	FileName = 'D:\CuaHangMayTinh_Data.mdf',
	Size = 20MB,
	MaxSize = 1000MB,
	Filegrowth = 10%
)
LOG ON(
	Name = CuaHangMayTinh_Log,
	FileName = 'D:\CuaHangMayTinh_Log.ldf',
	Size = 5MB,
	MaxSize = 500MB,
	Filegrowth = 10%
)