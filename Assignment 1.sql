CREATE DATABASE Faculty;
USE Faculty;

CREATE TABLE Departments(
Student_ID INT NOT NULL,
Department_Name VARCHAR(55) NOT NULL,
Lecturer_LastName VARCHAR(55),
Location_ID INT
);

EXEC sp_rename 'Departments.Student_ID', 'Name', 'COLUMN';

SELECT * FROM Departments

INSERT INTO Departments (Name, Department_Name, Lecturer_LastName, Location_ID)
VALUES (134563, 'Computer Science', 'Dewa', 1300);
INSERT INTO Departments (Name, Department_Name, Lecturer_LastName, Location_ID)
VALUES (343234, 'Data Science', 'Pravesh', 2100);
INSERT INTO Departments (Name, Department_Name, Lecturer_LastName, Location_ID)
VALUES (345621, 'Applied Mathematics', 'Christopher', 2100);
INSERT INTO Departments (Name, Department_Name, Lecturer_LastName, Location_ID)
VALUES (467231, 'Artificial Intelligence', 'Buthelezi', 4311);
INSERT INTO Departments (Name, Department_Name, Lecturer_LastName, Location_ID)
VALUES (452113, 'Robotics', 'Mamabolo', 2100);
INSERT INTO Departments (Name, Department_Name, Lecturer_LastName, Location_ID)
VALUES (345673, 'Physiscs', 'Shingange', 4300);

SELECT Lecturer_LastName FROM Departments


CREATE DATABASE Employment;
USE Employment;

CREATE TABLE Employees (
    Employment_ID VARCHAR(4),
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Salary INT
);

INSERT INTO Employees (Employment_ID, Fname, Lname, Salary)
VALUES
('0011', 'Dumisani', 'Magwaza', 6500),
('0123', 'John', 'Smith', 14050),
('0212', 'Piet', 'Bothma', 23500),
('0023', 'Thapelo', 'Malatji', 9800),
('0321', 'Vaisdevan', 'Naicker', 12000);

SELECT Lname, salary FROM Employees
WHERE salary > 12000;

SELECT Lname, Employment_ID FROM Employees
WHERE Employment_ID = '0212';

SELECT Lname, salary FROM Employees
WHERE salary NOT BETWEEN 8000 AND 15000;

CREATE TABLE Managers (
    EmployeeID INT,
    DepartmentName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID VARCHAR(4),
    Salary INT,
    HireDate DATE
);

INSERT INTO Managers (EmployeeID, DepartmentName, LastName, DepartmentID, Salary, HireDate)
VALUES
(1, 'Accounting', 'Ndlovu', '0011', 12400, '2012-01-01'),
(2, 'Education', 'Pravesh', '0017', 32500, '2018-10-30'),
(3, 'Data Science', 'Dewa', '0022', 23450, '2009-04-06'),
(4, 'Healthy Sciences', 'Naicker', '0021', 16800, '2015-06-28'),
(5, 'Architecture', 'Naidoo', '0032', 19440, '2018-07-01'),
(6, 'Computer Science', 'Zuma', '0022', 21600, '2018-06-30'),
(7, 'Electronics', 'Vilakazi', '0024', 24800, '2014-09-01'),
(8, 'Physics', 'Motaung', '0024', 23500, '2020-08-01');

ALTER TABLE Managers
ADD HireDateText VARCHAR(20);

UPDATE Managers
SET HireDateText = FORMAT(HireDate, 'dd MM yyyy');

ALTER TABLE Managers
DROP COLUMN HireDate

EXEC sp_rename 'Managers.HireDateText', 'HireDate', 'COLUMN';


SELECT * FROM Managers

SELECT LastName, DepartmentID FROM Managers
WHERE DepartmentID IN ('0022', '0024')
ORDER BY LastName;

SELECT LastName AS Employee, Salary AS [Monthly Salary] FROM Managers
WHERE Salary BETWEEN 15000 AND 22000
AND RIGHT(DepartmentID, 2) IN ('21', '24');

SELECT LastName, HireDate FROM Managers
WHERE HireDate LIKE '%2018';


SELECT LastName, Salary, HireDate FROM Managers
WHERE Salary > 20500
ORDER BY Salary DESC, LastName DESC;

