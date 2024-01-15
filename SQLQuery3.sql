-- Sử dụng cơ sở dữ liệu AdventureWorks
USE AdventureWorks2019 
GO

SELECT * FROM HumanResources.Employee
SELECT * FROM HumanResources.Department WHERE DepartmentID > 15

SELECT DepartmentID, Name, GroupName FROM HumanResources.Department WHERE DepartmentID > 15
-- Khai báo biến
Go
DECLARE @depID INT  --Khai báo biến cục bộ tên là depID kiểu int
SELECT @depID=12   --Gắn giá trị cho biến hằng bằng 1 
SELECT DepartmentID, Name, GroupName FROM HumanResources.Department
                       WHERE DepartmentID >= @depID

Go 
USE Northwind
GO
SELECT * FROM Categories 
SELECT CategoryID, CategoryName, [Description] FROM Categories
SELECT EmployeeID, LastName, FirstName FROM Employees 
SELECT TOP 1 * FROM Employees

SElECT @@LANGUAGE --Hiển thị thông tin của biến toàn cục @@LANGUAGE, trả lại thông tin ngôn ngữ sử dụng tròn SQL sever
SELECT @@VERSION  --Hiển thị thông tin của biến toàn cục @@VERSION, trả lại thông tin về phiên bản SQL Sever 

Go
--Lấy tổng tất cả giá trị các bản ghi trường StadardCost thuộc bảng ProductCostHistory 
SELECT SUM(StandardCost) FROM Production.ProductCostHistory
--Tính giá trị trung bình của trường StadardCost thuộc bảng ProductCostHistory 
SELECT AVG(StandardCost) FROM Production.ProductCostHistory 
--Lấy ra giá trị lớn nhất của trường StandardCost tuộc bảng 
SELECT MAX(StandardCost) FROM Production.ProductCostHistory
--Đếm tổng số bản ghi trong bảng ProductPhoto 
SELECT COUNT(*) AS TotalRecords FROM Production.ProductionCostHistory
--Lấy ra ngày giờ hệ thống 
SELECT GETDATE()
--Lấy ra giờ hệ thống 
SELECT DATEPART(HH,GETDATE())
--Định dạng ngày dùng hàm Convert
SELECT CONVERT(VarChar(50), GETDATE(), 103)

--Lấy ra định danh của cơ sở dữ liệu 
SELECT DB_ID('AdventureWorks')


--Tạo cơ sở dữ liệu 
CREATE DATABASE EXAMPLE3

USE EXAMPLE3
--Tạo bảng trong cơ sở dữ liệu
CREATE TABLE Contacts
(MailID VARCHAR(20),
Name NTEXT, 
TelephoneNumber INT)
--Thêm 1 cột vào bảng đã có
ALTER TABLE Contacts ADD Address NVARCHAR(50)
--Thêm dữ liệu vào bảng Contacts: 
INSERT INTO Contacts values ('xeko@gmail.com',N'Nguyen Van A',9898998,N'Hà Nội')
INSERT INTO Contacts values ('lynka@gmail.com',N'Nguyen Van B',4329234,N'Hà Nội')
INSERT INTO Contacts values ('tranvanC@gmail.com',N'Nguyen Van C',905243524,N'Hà Nội')
INSERT INTO Contacts values ('vand@gmail.com',N'Nguyen Van D',4563576,N'Hà Nội')
--Lấy ra tất cả bản ghi trong bảng:
SELECT * FROM Contacts
--Xóa bản ghi 
DELETE FROM Contacts WHERE MailID='tranvanC@yahoo.com'
--Sửa bản ghi 
UPDATE Contacts SET Name=N'Nguyen Viet Anh' WHERE MailID='vand@gmail.com'
--Tạo login account để test 
CREATE LOGIN example3 WITH PASSWORD='123456'
--Tạo user từ login account vừa tạo 
CREATE USER example3 FROM LOGIN example3
--Hủy bỏ tất cả các quyền của user example3 trên bảng Contacts
REVOKE ALL ON Contacts FROM example3
--Gán quyền Select cho example3 trên bảng Contacts 
GRANT SELECT ON Contacts TO example3

