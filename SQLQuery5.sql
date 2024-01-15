IF EXISTS (SELECT * FROM sys.databases WHERE Name='Example5')
     DROP DATABASE ExampleEX5
GO 
CREATE DATABASE ExampleEX5
GO 
USE ExampleEX5 
GO 
--Tao bang lop hoc 
CREATE TABLE LopHoc(
     MaLopHoc INT PRIMARY KEY IDENTITY,
	 TenLopHoc VARCHAR(10)
)
DROP TABLE LopHoc;
GO
--Tao bang Sinh Vien co khoa ngoai la cot MaLopHoc, noi voi bang LopHoc
CREATE TABLE SinhVien(
     MaSV INT PRIMARY KEY,
	 TenSV VARCHAR(40),
	 MaLopHoc INT,
	 CONSTRAINT fk FOREIGN KEY (MaLopHoc) REFERENCES LopHoc (MaLopHoc)
)
DROP TABLE SinhVien;
GO 
INSERT INTO SinhVien(MaSV, TenSV, MaLopHoc) VALUES (1,'Minh', 12);
SELECT * FROM SinhVien
GO 
--Tao bang SanPham voi mot cot NULL, mot cot NOT NULL
CREATE TABLE SanPham (
    MaSP INT NOT NULL,
	TenSP VARCHAR(40) NULL
)
GO
--Tao bang voi thuoc tinh default cho cot Price
CREATE TABLE StoreProduct (
     ProductID INT NOT NULL,
	 Name VARCHAR(40) NOT NULL,
	 Price money NOT NULL DEFAULT (100)
)

--Thu kiem tra xem gia tri default co duoc su dung hay khong 
INSERT INTO StoreProduct (ProductID, Name) VALUES (111, 'Rivets') 
GO 
--Tao bang ContactPhone voi thuoc tinh IDENTITY
CREATE TABLE ContactPhone (
     Person_ID INT IDENTITY(500,1) NOT NULL,
	 MobileNumber bigint NOT NULL
)
GO 
--Tao cot nhan dang duy nhat tong the 
CREATE TABLE CellularPhone(
     Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
	 PersonName varchar(60) NOT NULL
)
--Chen mot record vao 
INSERT INTO CellularPhone (PersonName) VALUES ('William Smith')
GO 
--Kiem tra gia tri cua cot Person_ID tu dong sinh
SELECT * FROM CellularPhone
GO
--Tao bang ContactPhone voi cot MobileNumber co thuoc tinh UNIQUE
CREATE TABLE ContactPhone2 (
     Person_ID INT PRIMARY KEY,
	 MobileNumber bigint UNIQUE,
	 ServiceProvider varchar(30),
	 LandlineNumber bigint UNIQUE
)
--Chen 2 ban ghi co gia tri giong nhau o mot cot MobileNumber va LanlieNumber de quan sat loi
INSERT INTO ContactPhone2 values (101, 983345674, 'Hutch', NULL)
INSERT INTO ContactPhone2 values (102, 983345674, 'Alex', NULL)
GO
--Tao bang PhoneExpenses co mot CHECT o cot Amount 
CREATE TABLE PhoneExpenses (
     Expense_ID INT PRIMARY KEY,
	 MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone2 (MobileNumber),
	 Amount bigint CHECK (Amount >0)
)
SELECT * FROM PhoneExpenses 
GO
--Chinh sua cot trong bang
ALTER TABLE ContactPhone2
ALTER COLUMN SevrviceProvider VARCHAR(45)
GO
--Xoa cot trong bang
ALTER TABLE ContactPhone2
DROP COLUMN ServiceProvider
GO 
--Them mot rang buoc vao bang
ALTER TABLE ContactPhone2 ADD CONSTRAINT CHK_RC CHECK (RentalCharges >0)
GO
--Xoa mot rang buoc
ALTER TABLE Person.ContactPhone2
DROP CONSTRAINT CHK_RC
    
