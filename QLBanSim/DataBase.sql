﻿USE MASTER
GO
DROP DATABASE QLBANSIM_DAOHIEN
GO
CREATE DATABASE QLBANSIM_DAOHIEN
GO
USE QLBANSIM_DAOHIEN
GO
CREATE TABLE NHAMANG (
	MANM VARCHAR(10) PRIMARY KEY,
	TENNM NVARCHAR(50), 
	GHICHU NVARCHAR(50),
	
)
GO
CREATE TABLE LOAISIM(
	MALOAI VARCHAR(10) PRIMARY KEY,
	TENLOAI NVARCHAR(50),
	GHICHU NVARCHAR(50),
)
GO

CREATE TABLE SIM(
	MASIM VARCHAR(10)PRIMARY KEY,
	MALOAI VARCHAR(10) FOREIGN KEY(MALOAI) REFERENCES  LOAISIM (MALOAI),
	MANM VARCHAR(10) FOREIGN KEY(MANM) REFERENCES  NHAMANG (MANM),
	SDT CHAR(10),
	GIA INT CHECK (GIA >= 0),
)	
GO
CREATE TABLE NHANVIEN(
	MANV CHAR(10) PRIMARY KEY, 
	HOTEN NVARCHAR(50) NOT NULL, 
	NAMSINH DATETIME CHECK (YEAR(NAMSINH)< YEAR(GETDATE())),
	GIOITINH NVARCHAR(3) CHECK (GIOITINH='NAM' OR GIOITINH=N'NỮ'),
	DIACHI NVARCHAR(50) NOT NULL,	
)
GO
	

CREATE TABLE KHACHHANG
	(
		MAKH CHAR(10) PRIMARY KEY, --Khóa Chính
		TENKH NVARCHAR(50) NOT NULL,
		DIACHI NVARCHAR(30) NOT NULL,
		SDT CHAR(10) ,
	)

GO	

CREATE TABLE DONHANG
	(
		MADONHANG CHAR(10) PRIMARY KEY, 
		MAKH CHAR(10) FOREIGN KEY(MAKH) REFERENCES  KHACHHANG(MAKH) ON DELETE CASCADE ON UPDATE CASCADE,
		MANV CHAR(10) FOREIGN KEY(MANV) REFERENCES  NHANVIEN(MANV) ON DELETE CASCADE ON UPDATE CASCADE,
		NGAYMUA DATETIME,	
		
	)
GO	
CREATE TABLE CTIET_DONHANG
	(

		MADONHANG CHAR(10) NOT NULL FOREIGN KEY(MADONHANG) REFERENCES  DONHANG(MADONHANG) ON DELETE CASCADE ON UPDATE CASCADE,
		MASIM VARCHAR(10) NOT NULL, FOREIGN KEY(MASIM) REFERENCES  SIM(MASIM) ON DELETE CASCADE ON UPDATE CASCADE,
		PRIMARY KEY(MADONHANG,MASIM)
	)
GO


--NHẬP BẢNG
--NHÀ MẠNG
	INSERT INTO NHAMANG( MANM, TENNM, GHICHU)
	VALUES('VT', 'VIETTEL', '')
	INSERT INTO NHAMANG( MANM, TENNM, GHICHU)
	VALUES('MOBI', 'MOBIFONE', '')
	INSERT INTO NHAMANG( MANM, TENNM, GHICHU)
	VALUES('VINA', 'VINAPHONE', '')
	INSERT INTO NHAMANG( MANM, TENNM, GHICHU)
	VALUES('VNMOBI', 'VIETNAMMOBI', '')
	SELECT *FROM NHAMANG



--LOẠI SIM
	INSERT INTO LOAISIM( MALOAI, TENLOAI, GHICHU)VALUES('L01', N'TAM HOA', '')
	INSERT INTO LOAISIM( MALOAI, TENLOAI, GHICHU)
	VALUES('L02', N'TỨ QUÝ', '')
	INSERT INTO LOAISIM( MALOAI, TENLOAI, GHICHU)
	VALUES('L03', N'NGŨ QUÝ', '')
	INSERT INTO LOAISIM( MALOAI, TENLOAI, GHICHU)
	VALUES('L04', N'LỤC QUÝ', '')
	INSERT INTO LOAISIM( MALOAI, TENLOAI, GHICHU)
	VALUES('L05', N'TAXI', '')
	INSERT INTO LOAISIM( MALOAI, TENLOAI, GHICHU)
	VALUES('L06', N'LỘC PHÁT', '')
	INSERT INTO LOAISIM( MALOAI, TENLOAI, GHICHU)
	VALUES('L07', N'THẦN TÀI', '')
	INSERT INTO LOAISIM( MALOAI, TENLOAI, GHICHU)
	VALUES('L08', N'< 500 NGHÌN', '')
	INSERT INTO LOAISIM( MALOAI, TENLOAI, GHICHU)
	VALUES('L09', N'500 - 1 TRIỆU', '')
	INSERT INTO LOAISIM( MALOAI, TENLOAI, GHICHU)
	VALUES('L10', N'> 1 TRIỆU', '')
	SELECT *FROM LOAISIM



--SIM 

	INSERT INTO SIM( MASIM, MALOAI, MANM,SDT,GIA)VALUES('VT01', 'L02', 'VT', '0345679999',1500000)
	INSERT INTO SIM( MASIM, MALOAI, MANM,SDT,GIA)
	VALUES('VT02', 'L03', 'VT', '0976599999',1700000)
	INSERT INTO SIM( MASIM, MALOAI, MANM,SDT,GIA)
	VALUES('VT03', 'L04', 'VT', '0919555555',2800000)
	INSERT INTO SIM( MASIM, MALOAI, MANM,SDT,GIA)
	VALUES('MOBI01', 'L01', 'MOBI', '0775431222',600000)
	INSERT INTO SIM( MASIM, MALOAI, MANM,SDT,GIA)
	VALUES('VINA01', 'L05', 'VINA', '0825989998',5000000)
	INSERT INTO SIM( MASIM, MALOAI, MANM,SDT,GIA)
	VALUES('VINA02', 'L05', 'VINA', '0824797779',4000000)
	INSERT INTO SIM( MASIM, MALOAI, MANM,SDT,GIA)
	VALUES('VNMOBI01', 'L03', 'VNMOBI', '0925444421',700000)
	INSERT INTO SIM( MASIM, MALOAI, MANM,SDT,GIA)
	VALUES('VNMOBI02', 'L04', 'VNMOBI', '0345678911',1700000)
	INSERT INTO SIM( MASIM, MALOAI, MANM,SDT,GIA)
	VALUES('VT04', 'L04', 'VT', '0944000000',4000000)
	INSERT INTO SIM( MASIM, MALOAI, MANM,SDT,GIA)
	VALUES('MOBI02', 'L04', 'VT', '0933444444',1600000)
	SELECT *FROM SIM

--KHÁCH HÀNG
	INSERT INTO KHACHHANG( MAKH, TENKH,DIACHI,SDT)
	VALUES('KH01', N'BÙI BẢO TRANG', N'HÀ NỘI','0123456789')
	INSERT INTO KHACHHANG( MAKH, TENKH,DIACHI,SDT)
	VALUES('KH02', N'NGUYỄN THỊ HẢI YẾN', N'HÒA BÌNH','0123456788')
	INSERT INTO KHACHHANG( MAKH,  TENKH,DIACHI,SDT)
	VALUES('KH03', N'CẤN THỊ BÍCH NGỌC', N'HÀ NỘI','0123456787')
	INSERT INTO KHACHHANG( MAKH,  TENKH,DIACHI,SDT)
	VALUES('KH04', N'CẤN THỊ TUYẾT MAI', N'HƯNG YÊN','0123496789')
	INSERT INTO KHACHHANG( MAKH,  TENKH,DIACHI,SDT)
	VALUES('KH05', N'CẤN XUÂN TIẾN', N'HÀ NỘI','0183456789')
	INSERT INTO KHACHHANG( MAKH,  TENKH,DIACHI,SDT)
	VALUES('KH06', N'ĐÕ AN PHÚ', N'HẢI DƯƠNG','0123457789')
	INSERT INTO KHACHHANG( MAKH,  TENKH,DIACHI,SDT)
	VALUES('KH07',  N'ĐÀO THỊ HÀ', N'HÀ NỘI','0167456789')
	INSERT INTO KHACHHANG( MAKH,  TENKH,DIACHI,SDT)
	VALUES('KH08',  N'ĐÀO VĂN HOẠT', N'PHÚ THỌ','0123459989')
	INSERT INTO KHACHHANG( MAKH,  TENKH,DIACHI,SDT)
	VALUES('KH09',  N'ĐÀO THỊ HIÊN', N'HÀ NỘI','0126856789')
	INSERT INTO KHACHHANG( MAKH,  TENKH,DIACHI,SDT)
	VALUES('KH10',  N'ĐỖ THANH TÔN', N'NGHỆ AN','0123456789')
	SELECT *FROM KHACHHANG

--NHÂN VIÊN
	INSERT INTO NHANVIEN ( MANV, HOTEN, NAMSINH,GIOITINH,DIACHI)
	VALUES ('NV001',N'VŨ QUANG CƯỜNG', '2002-10-9', N'NAM',N'HẢI DƯƠNG')
	INSERT INTO NHANVIEN ( MANV, HOTEN, NAMSINH,GIOITINH,DIACHI)
	VALUES ('NV002',N'NGUYỄN HOÀNG LONG', '2002-11-7', N'NAM',N'YÊN MỸ')
	INSERT INTO NHANVIEN ( MANV, HOTEN, NAMSINH,GIOITINH,DIACHI)
	VALUES ('NV003',N'TRẦN THỊ NGỌC LƯƠNG', '2002-7-9', N'NỮ',N'TIÊN LỮ')
	INSERT INTO NHANVIEN ( MANV, HOTEN, NAMSINH,GIOITINH,DIACHI)
	VALUES ('NV004',N'TRẦN THỊ NGỌC', '2002-5-8', N'NỮ',N'TIÊN LỮ')
	INSERT INTO NHANVIEN ( MANV, HOTEN, NAMSINH,GIOITINH,DIACHI)
	VALUES ('NV005',N'TRẦN THỊ NGỌC LINH', '2002-9-3', N'NỮ',N'TIÊN LỮ')
	INSERT INTO NHANVIEN ( MANV, HOTEN, NAMSINH,GIOITINH,DIACHI)
	VALUES ('NV006',N'NGUYỄN MINH KHÔI', '1998-5-8', N'NAM',N'THÀNH CÔNG')
	INSERT INTO NHANVIEN ( MANV, HOTEN, NAMSINH,GIOITINH,DIACHI)
	VALUES ('NV007',N'ĐỖ NHƯ NGHĨA', '1999-5-8', N'NAM',N'YÊN MỸ')
	INSERT INTO NHANVIEN ( MANV, HOTEN, NAMSINH,GIOITINH,DIACHI)
	VALUES ('NV008',N'TRẦN THỊ NGỌC', '2002-1-8', N'NỮ',N'TIÊN LỮ')
	INSERT INTO NHANVIEN ( MANV, HOTEN, NAMSINH,GIOITINH,DIACHI)
	VALUES ('NV009',N'ĐÀO ĐÌNH QUYẾT', '2002-9-8', N'NAM',N'THÁI BÌNH')
	INSERT INTO NHANVIEN ( MANV, HOTEN, NAMSINH,GIOITINH,DIACHI)
	VALUES ('NV010',N'CẤN CÔNG CƯỜNG', '1997-7-20', N'NAM',N'HÀ NỘI')
	SELECT *FROM NHANVIEN

--ĐƠN HÀNG
	INSERT INTO DONHANG( MADONHANG, MAKH, MANV,NGAYMUA)
	VALUES('DH01', 'KH01', 'NV001','2021-9-3')
	INSERT INTO DONHANG( MADONHANG, MAKH, MANV,NGAYMUA)
	VALUES('DH02', 'KH02', 'NV002','2022-10-9')
	INSERT INTO DONHANG( MADONHANG, MAKH, MANV,NGAYMUA)
	VALUES('DH03', 'KH03', 'NV003','2022-11-3')
	INSERT INTO DONHANG( MADONHANG, MAKH, MANV,NGAYMUA)
	VALUES('DH04', 'KH04', 'NV004','2021-12-4')
	INSERT INTO DONHANG( MADONHANG, MAKH, MANV,NGAYMUA)
	VALUES('DH05', 'KH05', 'NV005','2022-9-8')
	INSERT INTO DONHANG( MADONHANG, MAKH, MANV,NGAYMUA)
	VALUES('DH06', 'KH06', 'NV006','2021-9-13')
	INSERT INTO DONHANG( MADONHANG, MAKH, MANV,NGAYMUA)
	VALUES('DH07', 'KH07', 'NV007','2021-5-3')
	INSERT INTO DONHANG( MADONHANG, MAKH, MANV,NGAYMUA)
	VALUES('DH08', 'KH08', 'NV008','2022-8-3')
	INSERT INTO DONHANG( MADONHANG, MAKH, MANV,NGAYMUA)
	VALUES('DH09', 'KH09', 'NV009','2021-9-10')
	INSERT INTO DONHANG( MADONHANG, MAKH, MANV,NGAYMUA)
	VALUES('DH10', 'KH10', 'NV010','2021-10-3')
	SELECT *FROM DONHANG
--CHI TIẾT ĐƠN HÀNG	
	INSERT INTO CTIET_DONHANG( MADONHANG, MASIM)
	VALUES('DH01', 'MOBI02')
	INSERT INTO CTIET_DONHANG( MADONHANG, MASIM)
	VALUES('DH02', 'VT04')
	INSERT INTO CTIET_DONHANG( MADONHANG, MASIM)
	VALUES('DH03', 'VNMOBI02')
	INSERT INTO CTIET_DONHANG( MADONHANG, MASIM)
	VALUES('DH04', 'VNMOBI01')
	INSERT INTO CTIET_DONHANG( MADONHANG, MASIM)
	VALUES('DH05', 'VINA02')
	INSERT INTO CTIET_DONHANG( MADONHANG, MASIM)
	VALUES('DH06', 'VINA01')
	INSERT INTO CTIET_DONHANG( MADONHANG, MASIM)
	VALUES('DH07', 'MOBI01')
	INSERT INTO CTIET_DONHANG( MADONHANG, MASIM)
	VALUES('DH08', 'VT03')
	INSERT INTO CTIET_DONHANG( MADONHANG, MASIM)
	VALUES('DH09', 'VT01')
	INSERT INTO CTIET_DONHANG( MADONHANG, MASIM)
	VALUES('DH10', 'VT02')

	SELECT *FROM CTIET_DONHANG

	-----
	SELECT *FROM CTIET_DONHANG
	SELECT *FROM DONHANG
	SELECT *FROM NHANVIEN
	SELECT *FROM KHACHHANG
	SELECT *FROM SIM
	SELECT *FROM LOAISIM
	SELECT *FROM NHAMANG
	--Tạo login
exec sp_addlogin kh2,'123'
exec sp_addlogin kh3,'123'
exec sp_addlogin kh4,'123'
exec sp_addlogin kh5,'123'
exec sp_addlogin kh6,'123'

--Tạo user
Exec sp_adduser kh6,us5
Exec sp_adduser kh2,us1
exec sp_adduser kh3,us2
Exec sp_adduser kh4,us3
exec sp_adduser kh5,us4

--Tạo role
Exec sp_addrole R1

--Thêm các user vào role
exec sp_addrolemember R1,us1
exec sp_addrolemember R1,us2
exec sp_addrolemember R1,us3
exec sp_addrolemember R1,us4
exec sp_addrolemember R1,us5

--Cấp phát quyền
GRANT SELECT, INSERT, UPDATE ON NHAMANG TO us1
GRANT SELECT, INSERT, UPDATE ON LOAISIM TO us1
GRANT SELECT, INSERT, UPDATE ON SIM TO us1
GRANT SELECT, INSERT, UPDATE ON KHACHHANG TO us1
GRANT SELECT, INSERT, UPDATE ON NHANVIEN TO us2
GRANT SELECT, INSERT, UPDATE ON DONHANG TO us3
GRANT SELECT, INSERT, UPDATE ON CTIET_DONHANG TO us4

-- User thực hiện các quyền

--Thu hồi quyền các User
ReVoke SELECT, INSERT, UPDATE ON KHACHHANG TO us1
GO

-- Chỉ mục
CREATE NONCLUSTERED INDEX NCL_Hoten
On KHACHHANG(TENKH)
Create NONCLUSTERED INDEX NCLF_Hoten On KHACHHANG(TENKH) WITH PAD_INDEX,FILLFACTOR=30
-- Chỉ mục phức hợp
CREATE NONCLUSTERED INDEX NCL_DONHANG
On DONHANG(MADONHANG,MAKH)
go
CREATE NONCLUSTERED INDEX NCL_SIM
On SIM(MASIM,MALOAI,MANM)
go

sp_helpconstraint KHACHHANG
--Chỉ mục toàn văn
CREATE FULLTEXT CATALOG HT_cae
with accent_sensitivity = on
as default
go
CREATE FULLTEXT INDEX ON KHACHHANG (TENKH)
KEY INDEX PK__TB_Hocsi__27249A57EDD5F3AE on HT_cae

SELECT * FROM KHACHHANG
WHERE CONTAINS (TENKH, N'"Anh" or "Bắc" or "Cương"')

select * from KHACHHANG With(INDEX=NCLf_Hoten)
where TENKH like N'Nguyễn Văn An'

select * from KHACHHANG with (index = NCLf_Hoten)
where TENKH like N'Nguyễn%' 
GO
-- Tạo các view
--1
CREATE VIEW viewKhachHAng
AS SELECT * FROM KHACHHANG WHERE MAKH='KH01'
GO
SELECT * FROM viewKhachHAng
SELECT * FROM KHACHHANG
UPDATE viewKhachHAng SET DIACHI=N'Hải Dương' WHERE  MAKH='KH01'
Delete from viewhocsinh
GO

--2
CREATE VIEW viewNhanVien
AS SELECT * FROM NHANVIEN WHERE MANV='NV001'
GO
SELECT * FROM viewNhanVien
SELECT * FROM NHANVIEN
UPDATE viewNhanVien SET DIACHI=N'Hải Dương' WHERE  MAKH='NV001'
Delete from viewNhanVien

GO
--3
create view viewthongtinSimTheoLoai
as select S.*,LS.TENLOAI from SIM S,LOAISIM LS Where S.MALOAI=LS.MALOAI
GO
delete viewthongtinSimTheoLoai where MASIM='MOBI01'
update viewthongtinSimTheoLoai set GIA=1000000 where MASIM='MOBI02'
select * from viewthongtinSimTheoLoai
go
--4
create view viewthongtinSimTheoNhaMang
as select S.*, NM.TENNM from SIM S,NHAMANG NM Where S.MANM=NM.MANM
GO
delete viewthongtinSimTheoNhaMang where MASIM='MOBI01'
update viewthongtinSimTheoNhaMang set GIA=1000000 where MASIM='MOBI02'
select * from viewthongtinSimTheoNhaMang

	SELECT *FROM CTIET_DONHANG
	SELECT *FROM DONHANG
	SELECT *FROM NHANVIEN
	SELECT *FROM KHACHHANG
	SELECT *FROM SIM
	SELECT *FROM LOAISIM
	SELECT *FROM NHAMANG
--10 truy vấn nâng cao
--1
Declare @so_luong int
SELECT @so_luong= COUNT(MAKH) 
FROM KHACHHANG
WHERE DIACHI = N'HÀ NỘI'
print(@so_luong)
--2
Declare @so_luong int
SELECT @so_luong= COUNT(MANV) 
FROM NHANVIEN
WHERE GIOITINH = N'NAM'
print(@so_luong)
--3
Declare @so_luong int
SELECT @so_luong= COUNT(MANV) 
FROM NHANVIEN
WHERE GIOITINH = N'NỮ'
print(@so_luong)
--4
Declare @so_luong int
SELECT @so_luong= COUNT(MAKH) 
FROM KHACHHANG
WHERE DIACHI = N'HƯNG YÊN'
print(@so_luong)
--5
Declare @so_luong int
SELECT @so_luong= COUNT(MASIM) 
FROM SIM
WHERE GIA>700000 
print(@so_luong)
--6
Declare @so_luong int
SELECT @so_luong= COUNT(MASIM) 
FROM SIM
WHERE GIA <=1000000 
print(@so_luong)

--7
Declare @so_luong int
SELECT @so_luong= COUNT(MAKH) 
FROM KHACHHANG
WHERE DIACHI = N'HÀ NỘI'
If (@so_luong >=3)
SELECT *
 FROM KHACHHANG 
 WHERE DIACHI = N'HÀ NỘI'
Else 
SELECT * FROM KHACHHANG
--8
Select MANV,HOTEN,NAMSINH,'GIỚI TÍNH'=CASE Gioitinh
WHEN 'Nam' THEN 'Male' 
WHEN N'Nữ' THEN 'Female'
END
from NHANVIEN
--9
Select *,'Chú thích'=
Case When GIA>500000 Then N'SIM SỐ ĐẸP'
end
from SIM
go

--10 thủ tục

--1
create proc addSIM(	@MASIM VARCHAR(10),
	@MALOAI VARCHAR(10),
	@MANM VARCHAR(10),
	@SDT CHAR(10),
	@GIA INT )
as
Begin
	if @MASIM not in (Select MASIM from SIM)
		Begin
Insert into SIM values(@MASIM,@MALOAI,@MANM,@SDT,@GIA)
		End
	else
		print(N'Thêm sim không thành công')
End
go
--2

create proc udGiaSIM(	@MASIM VARCHAR(10),
	@GIA INT )
as
Begin
		if @MASIM in (Select MASIM from SIM)
		Begin
			UPDATE SIM SET GIA =@GIA WHERE MASIM=@MASIM
		End
	else
		print(N'Sửa sim không thành công')
End
go
--3
create proc deleteSIM(	@MASIM VARCHAR(10))
as
Begin
	if @MASIM in (Select MASIM from SIM)
		Begin
			DELETE FROM SIM WHERE MASIM=@MASIM
		End
	else
		print(N'Xóa sim không thành công')
End
go

--4
create proc addKhachHang(@MAKH CHAR(10),
		@TENKH NVARCHAR(50) ,
		@DIACHI NVARCHAR(30) ,
		@SDT CHAR(10))
as
Begin
	if @MAKH not in (Select MAKH from KHACHHANG)
		Begin
			Insert into KHACHHANG values(@MAKH,@TENKH,@DIACHI,@SDT)
		End
	else
		print(N'Thêm khách hàng không thành công')
End
go
--5

create proc udDiaChirKH(	@MAKH VARCHAR(10),
		@DIACHI NVARCHAR(30) )
as
Begin
		if @MAKH in (Select MAKH from KHACHHANG)
		Begin
			UPDATE KHACHHANG SET DIACHI =@DIACHI WHERE MAKH=@MAKH
		End
	else
		print(N'Sửa khách hàng không thành công')
End
go
--6
create proc deleteKhachHang(	@MAKH VARCHAR(10))
as
Begin
	if @MAKH in (Select MAKH from KHACHHANG)
		Begin
			DELETE FROM KHACHHANG WHERE MAKH=@MAKH
		End
	else
		print(N'Xóa khách hàng không thành công')
End
go
--7
create proc timKhachHangTheoMa(@MAKH VARCHAR(10))
as
Begin
	if @MAKH in (Select MAKH from KHACHHANG)
		Begin
			Select * from KHACHHANG where MAKH=@MAKH
		End
	else
		print(N'Khách hàng không tồn tại')
End
go
--8
create proc timKhachHangTheoTen(@TENKH NVARCHAR(50))
as
Begin
	Select * from KHACHHANG where TENKH like '%'+@TENKH+'%'
End
go
--9
create proc tongNV
as
Begin
	select COUNT(MANV)as 'Tổng số NV' from NHANVIEN
end
GO
--FUNCTION
--1
create function getAllNhanVien() 
returns table
as 
	return SELECT * FROM NHANVIEN
select * from getAllNhanVien()
--2
create function getAllKhachHang() 
returns table
as 
	return SELECT * FROM KHACHHANG
--3
create function getKhachHangTheoMa(@MAKH varchar(10)) 
returns table
as 
	return SELECT * FROM KHACHHANG WHERE MAKH=@MAKH
--4
create function getNhanVienTheoMa(@MANV varchar(10)) 
returns table
as 
	return SELECT * FROM NHANVIEN WHERE MANV=@MANV
--5
drop function getSLTheoQueQuan(@quequan nvarchar(20))
returns int
as
begin
	Declare @so_luong int
	SELECT @so_luong= COUNT(MAKH) FROM KHACHHANG WHERE DIACHI = @quequan

	return @so_luong
end
select * FROM getSLTheoQueQuan('KH01')
GO


--After Trigger 
--1
create trigger tgaddNhanVien
On NHANVIEN
after Insert
as
begin 
	if exists (Select * from inserted a where DIACHI=N'HƯNG YÊN')
	begin
		print N'Nhân viên không được địa chỉ Hưng Yên'
		rollback tran
	end
end
GO
--2
create trigger tgrmNhanVien
on NHANVIEN
after delete
as
begin
	if exists(Select * from deleted,DONHANG where DONHANG.MANV=deleted.MANV)
	Begin
		rollback tran
	end
	
end
GO
--3
create trigger tgaddSIM
on SIM
after insert
as
Begin
	if exists(Select * from inserted s where DATALENGTH(s.SDT)<10 AND DATALENGTH(s.SDT)>11)
	Begin 
		rollback tran
	end
end

--instead of trigger
--4
create trigger tgrmSIM
on SIM
instead of delete 
as
Begin
	if exists(Select * from deleted,CTIET_DONHANG where SIM.MASIM=CTIET_DONHANG.MASIM)
	Begin
		rollback tran
	end
End
--5
create trigger tgaddSIMTrung
on SIM
instead of insert
as
Begin
	if exists(Select * from inserted s,SIM l where s.MASIM=l.MASIM)
	Begin 
		rollback tran
	end
end
--6
create trigger tgaddNhanVien
On NHANVIEN
instead of Insert
as
begin 
	if exists (Select * from inserted a where DIACHI=N'HƯNG YÊN')
	begin
		print N'Nhân viên không được địa chỉ Hưng Yên'
		rollback tran
	end
end
go
--trigger dây chuyền
--7
create trigger tgrmSIM
On SIM
for delete
as
Begin
	alter table CTIET_DONHANG nocheck constraint all
	delete from CTIET_DONHANG where CTIET_DONHANG.MASIM= (select MASIM from deleted)
	alter table CTIET_DONHANG check constraint all
end
GO
