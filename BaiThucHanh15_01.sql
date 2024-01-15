CREATE DATABASE BTTHSQL
GO
USE BTTHSQL 
GO 
CREATE TABLE DepartmentTable(
    DepartID INT PRIMARY KEY,
    DepartName VARCHAR(50) not null,
    Description VARCHAR(100) not null
)
SELECT * FROM DepartmentTable


CREATE TABLE Employee(
    EmpCode CHAR(6) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Birthday SMALLDATETIME NOT NULL,
    Gender BIT DEFAULT 1,
    Address VARCHAR(100),
    DepartID INT,
	Salary MONEY,
	CONSTRAINT fk_DepartID FOREIGN KEY (DepartID) REFERENCES DepartmentTable (DepartID),
)
SELECT * FROM Employee


--3.Insert into above tables
INSERT INTO DepartmentTable (DepartID, DepartName, Description) 
VALUES 
    (12, 'DEV', 'Là những lập trình viên hay kỹ sư phần mềm .'),
    (02, 'Tester', 'Là những người kiểm tra chất lượng phần mềm.'),
	(19, 'BA', 'Là là cầu nối giữ KH với phòng ban của tổ chức.');

INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartID, Salary) 
VALUES 
    ('C12190', 'Chin', 'NDT', '2002-12-19', 0, '123 Ha Noi', 12, 66000.00),
    ('C19122', 'Chin', 'KVD', '2002-12-19', 1, '456 Ha Noi', 02, 88000.00),
	('C19124', 'NDT', 'Chin', '2002-12-19', 0, '789 Ha Noi', 19, 88000.00);

--4.Increase the salary for all employees by 10%
UPDATE Employee
SET Salary = Salary * 1.10;


--5.Salary > 0
ALTER TABLE Employee
ADD CONSTRAINT CHK_Salary CHECK (Salary > 0);
