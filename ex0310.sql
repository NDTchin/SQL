CREATE DATABASE Ex0301
GO
USE Ex0301 
GO 
DROP TABLE Category ;
CREATE TABLE Category(
     ID INT PRIMARY KEY,
	 NAME VARCHAR(10)
)
SELECT * FROM Category
INSERT INTO Category(ID, NAME) VALUES (111, 'Ao')
INSERT INTO Category(ID, NAME) VALUES (222, 'QUAN')
INSERT INTO Category(ID, NAME) VALUES (333, 'VAY')
INSERT INTO Category(ID, NAME) VALUES (444, 'GIAY')
GO
CREATE TABLE ProductC(
     ID INT PRIMARY KEY IDENTITY,
	 NAME VARCHAR(10),
	 PRICE INT,
	 cat_id INT,
	 CONSTRAINT fk FOREIGN KEY (cat_id) REFERENCES Category(ID)
)
SELECT * FROM ProductC
INSERT INTO ProductC(NAME, PRICE, cat_id) VALUES ( 'QUANBO', 100, 2)
DROP TABLE ProductC ;



CREATE TABLE NhanVien (
     MaNV INT PRIMARY KEY NOT NULL,
	 TenNV	VARCHAR(50),
	 DiaChi VARCHAR(100) 
)

SELECT * FROM NhanVien
INSERT INTO NhanVien(MaNV,TenNV, DiaChi) VALUES ( 1,N'	Nguyen Van A', N'123 Duong A, TP.HCM')
INSERT INTO NhanVien(MaNV,TenNV, DiaChi) VALUES ( 2,N'	TRAN THI B', N'456 Duong B, TP.HN')
INSERT INTO NhanVien(MaNV,TenNV, DiaChi) VALUES ( 3,N'	LE VAN C', N'789 Duong C, TP.DN')


CREATE TABLE PhanCongCongViec (
     ID INT PRIMARY KEY NOT NULL,
	 MaNV INT,
	 CongViec VARCHAR(50),
	 CONSTRAINT fk_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
DROP TABLE PhanCongCongViec
SELECT * FROM PhanCongCongViec
INSERT INTO PhanCongCongViec(ID,MaNV, CongViec) VALUES ( 101,1,N'QUAN LY DU AN A' )
INSERT INTO PhanCongCongViec(ID,MaNV, CongViec) VALUES ( 102,2,N'KE TOAN' )
INSERT INTO PhanCongCongViec(ID,MaNV, CongViec) VALUES ( 103,3,N'PHAT TRIEN PHAN MEM' )




USE AdventureWorks2019
--Lấy ra dữ liệu của bảng Contact có ContactID>= 00 và ContactID<=200
SELECT * FROM Person.ContactType
WHERE ContactTypeID >= 5 AND ContactTypeID <= 10
--Lấy ra dữ liệu của bảng Contact có ContactID trong khoảng [100, 200]
SELECT * FROM Person.ContactType 
WHERE ContactTypeID BETWEEN 10 AND 20
--Lấy ra những Contact có LastName kết thúc bởi ký tự e
SELECT * FROM Person.ContactType
WHERE Name LIKE '%r'
--Lấy ra những Contact có LastName bắt đầu bởi ký tự R hoặc A kết thúc bởi ký tự e
SELECT * FROM Person.ContactType
WHERE Name LIKE '[RA]%e'
--Lấy ra những Contact có LastName có 4 ký tự bắt đầu bởi ký tự R hoặc A kết thúc bởi ký tự e
SELECT * FROM Person.ContactType
WHERE Name LIKE '[RA]__e'
--Sử dụng INNER JOIN
SELECT Person.Contact.*
FROM Person.Contact INNER JOIN HumanResources.Employee ON
Person.Contact.ContactID=HumanResources.Employee.ContactID
SELECT Title, COUNT(*) [Title Number]
FROM Person.Contact 
GROUP BY ALL Title
--GROUP BY với HAVING: mệnh đề HAVING sẽ lọc kết quả trong lúc được gộp nhóm
SELECT Title, COUNT(*) [Title Number]
FROM Person.Contact
GROUP BY ALL Title
HAVING Title LIKE 'Mr%'




CREATE TABLE PhongBan (
     MaPB VARCHAR(7) PRIMARY KEY,
	 TenPB NVARCHAR(50)
)
SELECT * FROM PhongBan
INSERT INTO PhongBan (MaPB, TenPB) VALUES ('A123',N'Phong1')
INSERT INTO PhongBan (MaPB, TenPB) VALUES ('A456',N'Phong2')
INSERT INTO PhongBan (MaPB, TenPB) VALUES ('A789',N'Phong3')
INSERT INTO PhongBan (MaPB, TenPB) VALUES ('B123',N'Phong4')
INSERT INTO PhongBan (MaPB, TenPB) VALUES ('B456',N'Phong5')

CREATE TABLE NhanVien (
      MaNV VARCHAR(7) PRIMARY KEY,
	  TenNV NVARCHAR(50),
	  NgaySinh Datetime,
	  SoCMND char(9),
	  GioiTinh Char(1),
	  DiaChi NVARCHAR(100),
	  NgayVaoLam Datetime,
	  MaPB VARCHAR (7),
	  CONSTRAINT fk_MaPB FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)
)
DROP TABLE NhanVien
SELECT * FROM NhanVien
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, SoCMND, GioiTinh, DiaChi, NgayVaoLam, MaPB) VALUES ('C123', N'Nguyen A', '2002-12-19', '123456', 'M', N'VP', '2024-01-08', 'B123')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, SoCMND, GioiTinh, DiaChi, NgayVaoLam, MaPB) VALUES ('C111', N'Nguyen B', '2002-12-19', '456123', 'F', N'HN', '2024-01-08', 'B456')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, SoCMND, GioiTinh, DiaChi, NgayVaoLam, MaPB) VALUES ('C333', N'Nguyen C', '2002-12-19', '246135', 'F', N'DN', '2024-01-08', 'A123')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, SoCMND, GioiTinh, DiaChi, NgayVaoLam, MaPB) VALUES ('C222', N'Nguyen D', '2002-12-19', '135246', 'M', N'DL', '2024-01-08', 'A456')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, SoCMND, GioiTinh, DiaChi, NgayVaoLam, MaPB) VALUES ('C321', N'Nguyen E', '2002-12-19', '012345', 'M', N'HCM', '2024-01-08', 'A789')

CREATE TABLE LuongDA (
      MaDA VARCHAR(8),
      MaNV VARCHAR(7),
	  PRIMARY KEY (MaDA, MaNV),
	  CONSTRAINT fk_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
	  NgayNhan Datetime,
	  SoTien Money,
	  CONSTRAINT SoTien CHECK (SoTien > 0)
)
DROP TABLE LuongDA
SELECT * FROM LuongDA
INSERT INTO LuongDA (MaDA, MaNV, NgayNhan, SoTien) VALUES ( 'T001', 'C123', '2024-01-08' , 300000.000)
INSERT INTO LuongDA (MaDA, MaNV, NgayNhan, SoTien) VALUES ( 'C123', 'C123', '2024-01-08' , 300000.000)
INSERT INTO LuongDA (MaDA, MaNV, NgayNhan, SoTien) VALUES ( 'T002', 'C111', '2024-01-08' , 300000.000)
INSERT INTO LuongDA (MaDA, MaNV, NgayNhan, SoTien) VALUES ( 'T003', 'C333', '2024-01-08' , 300000.000)
INSERT INTO LuongDA (MaDA, MaNV, NgayNhan, SoTien) VALUES ( 'T004', 'C321', '2024-01-08' , 300000.000)


--3.Hien thi nhung nhan vien co gioi tinh 'F'
SELECT * FROM NhanVien
WHERE GioiTinh LIKE 'F' 
--4.Hien thi tat ca du an, moi du an tren 1 dong
SELECT MaDA FROM LuongDA 
SELECT MaDA, COUNT(*) [C123]
FROM LuongDA
GROUP BY ALL MaDA
HAVING MaDA LIKE 'C123'




CREATE TABLE DonDH (
    MSDH INT PRIMARY KEY,
    NguoiDH VARCHAR(255),
    DiaChi VARCHAR(255),
    Dienthoai VARCHAR(15),
    NgayDH DATE
)
SELECT * FROM DonDH
INSERT INTO DonDH (MSDH, NguoiDH, DiaChi, Dienthoai, NgayDH) VALUES (123, 'Nguyen Van An', '111 Nguyen Trai, Thanh Xuan, HN', 987654321, '2009-11-18')
INSERT INTO DonDH (MSDH, NguoiDH, DiaChi, Dienthoai, NgayDH) VALUES (124, 'Nguyen Van B', '222 Nguyen Trai, Thanh Xuan, HN', 123456789, '2009-11-18')

CREATE TABLE DSDonDH (
    STT INT PRIMARY KEY,
    MSDH INT,
    TenHang VARCHAR(255),
    MotaHang VARCHAR(255),
    Donvi VARCHAR(50),
    Gia DECIMAL(10, 2),
    SoLuong INT,
    ThanhTien DECIMAL(10, 2),
    FOREIGN KEY (MSDH) REFERENCES DonDH(MSDH)
)
SELECT * FROM DSDonDH
DROP TABLE DSDonDH
INSERT INTO DSDonDH(STT, MSDH, TenHang, MotaHang, Donvi, Gia, SoLuong, ThanhTien) 
       VALUES (1, 123, 'May Tinh T450', 'May nhap moi', 'Chiec', 1000, 1, 1000),
              (2, 123, 'Đien Thoai Nokia5670', 'Đien thoai đang hot', 'Chiec', 200, 2, 400),
              (3, 123, 'May In Samsung 450', 'May in đang e', 'Chiec', 100, 1, 100);
INSERT INTO DSDonDH(STT, MSDH, TenHang, MotaHang, Donvi, Gia, SoLuong, ThanhTien) 
       VALUES (4, 124, 'May Tinh ', 'May nhap moi', 'Chiec', 1000, 3, 3000),
              (5, 124, 'Đien Thoai ', 'Đien thoai đang hot', 'Chiec', 300, 2, 600),
              (6, 124, 'May In ', 'May in đang e', 'Chiec', 100, 3, 300);


--4.a. Liet ke ds khach mua hang
SELECT DISTINCT NguoiDH FROM DonDH
--4.b. Liet ke ds sp
SELECT DISTINCT TenHang FROM DSDonDH
--4.c Liet ke ds don dat hang
SELECT * FROM DonDH
--5.a Liet ke khach hang theo thu tu alphabet
SELECT NguoiDH FROM DonDH
ORDER BY NguoiDH ASC;
--5.b Liệt kê danh sách sản phẩm của cửa hàng theo thứ tự giá giảm dần
SELECT TenHang, Gia FROM DSDonDH
ORDER BY Gia DESC;
--5.c 