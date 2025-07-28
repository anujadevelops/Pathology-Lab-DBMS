-- DDL: Create And Insert
CREATE DATABASE Pathology_lab;
USE Pathology_lab;

CREATE TABLE Patients(
	Patient_Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) ,
    Age INT CHECK (age > 0),
    Gender ENUM('Male', 'Female', 'Other'),
    Contact_Number VARCHAR(15),
    Address VARCHAR(255),
    Registration_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Tests(
    Test_Id INT AUTO_INCREMENT PRIMARY KEY,
    Test_Name VARCHAR(100),
    Test_Cost DECIMAL(10, 2) CHECK (test >= 0),
    Description TEXT,
    Sample_Type Enum('Blood', 'Urine', 'Tissue', 'Other'),
    Normal_Range VARCHAR(100)
);

CREATE TABLE Doctors(
    Doctor_Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Department_Name VARCHAR(100) NOT NULL,
    Phone_Number VARCHAR(15),
    Salary DECIMAL(10, 2),
    Hire_Date DATE
);

CREATE TABLE Results(
    Patient_Id INT,
    Test_Id INT,
    Result_Value VARCHAR(100),
    Result_Date DATE,
    Interpretation TEXT,
    PRIMARY KEY (Patient_Id, Test_Id),
    FOREIGN KEY (Patient_Id) REFERENCES Patients(Patient_Id),
	FOREIGN KEY (Test_Id) REFERENCES Tests(Test_Id)
);

CREATE TABLE Receptionists(
    Receptionist_Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Phone_Number VARCHAR(15),
    Salary DECIMAL(10, 2),
    Hire_Date DATE
);

ALTER TABLE Doctors
ADD COLUMN Patient_Id INT,
ADD CONSTRAINT Patient_Id
FOREIGN KEY (Patient_Id) REFERENCES Patients(Patient_Id);

ALTER TABLE Patients AUTO_INCREMENT = 10000;
ALTER TABLE Tests AUTO_INCREMENT = 100;
ALTER TABLE Doctors AUTO_INCREMENT = 1000;
ALTER TABLE Receptionists AUTO_INCREMENT = 1;

-- DML:Insert And Update
-- Insert into Patients
INSERT INTO Patients (Name, Age, Gender, Contact_Number, Address)VALUES 
('Anjali Sharma', 28, 'Female', '9876543210', 'Pune, Maharashtra'),
('Rahul Verma', 35, 'Male', '9123456789', 'Mumbai, Maharashtra'),
('Sneha Patil', 22, 'Female', '9988776655', 'Nashik, Maharashtra'),
('Amit Singh', 40, 'Male', '9871234560', 'Nagpur, Maharashtra'),
('Ritika Joshi', 30, 'Female', '9832145698', 'Thane, Maharashtra');

-- Insert into Tests
INSERT INTO Tests (Test_Name, Test_Cost, Description, Sample_Type, Normal_Range)VALUES
('Complete Blood Count', 500.00, 'Measures components of blood', 'Blood', '4.5-11 x10^9/L'),
('Urine Culture', 800.00, 'Detects bacteria in urine', 'Urine', 'No Growth'),
('Liver Function Test', 1200.00, 'Checks liver health', 'Blood', '7-56 U/L'),
('Biopsy', 3500.00, 'Examines tissue sample', 'Tissue', 'No Malignancy'),
('Thyroid Profile', 1000.00, 'Evaluates thyroid function', 'Blood', '0.4-4.0 mIU/L');

-- Insert into Doctors
INSERT INTO Doctors (Name, Department_Name, Phone_Number, Salary, Hire_Date, Patient_Id)VALUES
('Dr. Meera Kulkarni', 'Pathology', '9874563210', 75000.00, '2022-01-15', 10000),
('Dr. Rajesh Iyer', 'Microbiology', '9812345678', 70000.00, '2021-12-01', 10001),
('Dr. Swati Deshmukh', 'Radiology', '9898989898', 80000.00, '2023-03-10', 10002),
('Dr. Anil Joshi', 'Oncology', '9753102468', 95000.00, '2020-05-25', 10003),
('Dr. Snehal Apte', 'Endocrinology', '9988776654', 72000.00, '2022-11-20', 10004);

-- Insert into Results
INSERT INTO Results (Patient_Id, Test_Id, Result_Value, Result_Date, Interpretation)VALUES
(10000, 100, '5.2 x10^9/L', '2025-07-01', 'Normal WBC count'),
(10001, 101, 'E. coli detected', '2025-07-02', 'Positive infection'),
(10002, 102, '45 U/L', '2025-07-03', 'Normal liver function'),
(10003, 103, 'Benign', '2025-07-04', 'Non-cancerous tissue'),
(10004, 104, '2.5 mIU/L', '2025-07-05', 'Within normal range');

-- Insert into Receptionists
INSERT INTO Receptionists (Name, Phone_Number, Salary, Hire_Date)VALUES
('Priya Desai', '9811122233', 30000.00, '2023-01-10'),
('Ravi Shah', '9822233344', 28000.00, '2022-06-20'),
('Ankita Bhosale', '9833344455', 31000.00, '2024-02-15'),
('Suresh Pawar', '9844455566', 29000.00, '2023-09-05'),
('Neha Jadhav', '9855566677', 30500.00, '2021-10-30');

UPDATE Doctors
SET SALARY = Salary * 1.10
WHERE Patient_Id=10001 AND 10004;

-- TCL:
COMMIT;

-- DCL:
CREATE USER 'Jay' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE ON e.Results TO Jay;

-- DQL
SELECT *FROM Patients;
SELECT *FROM Tests;
SELECT *FROM Doctors;
SELECT *FROM Results;
SELECT *FROM Receptionists;

-- Arithmetic Operators 
SELECT Test_Name, Test_Cost + 50 AS Cost_in_next_1_years, Test_Cost * 2 AS Cost_in_next_3_years FROM Tests;

-- Logical Operators
SELECT Name,Age,Gender FROM Patients WHERE Age > 30 AND Gender = 'Female';

-- Relational Operators 
SELECT Name,Age From Patients WHERE Age >=30;

-- String Function
SELECT CONCAT(Name, ' - ', Address) AS Patient_Info FROM Patients;

-- Aggregate Function
SELECT AVG(Salary) AS Average_Doctor_Salary FROM Doctors;

-- Date and Time Function
SELECT Name, DATEDIFF(CURDATE(), Registration_Date) AS Days_Since_Registration FROM Patients;

-- Group by department and order by average salary descending
SELECT Department_Name, AVG(Salary) AS Avg_Salary
FROM Doctors
GROUP BY Department_Name
ORDER BY Avg_Salary DESC;

-- Joins
-- Inner Join
SELECT p.Name, t.Test_Name, r.Result_Value 
FROM Patients p
JOIN Results r ON p.Patient_Id = r.Patient_Id
JOIN Tests t ON r.Test_Id = t.Test_Id;

-- Left Join
SELECT p.Name, r.Result_Value 
FROM Patients p
LEFT JOIN Results r ON p.Patient_Id = r.Patient_Id;

-- Right Join
SELECT r.Result_Value, t.Test_Name 
FROM Results r
RIGHT JOIN Tests t ON r.Test_Id = t.Test_Id;

-- Full Outer Join
SELECT p.Name, r.Result_Value
FROM Patients p
LEFT JOIN Results r ON p.Patient_Id = r.Patient_Id
UNION
SELECT p.Name, r.Result_Value
FROM Patients p
RIGHT JOIN Results r ON p.Patient_Id = r.Patient_Id;

-- Self Join
SELECT d1.Name AS Doctor1, d2.Name AS Doctor2, d1.Department_Name
FROM Doctors d1
JOIN Doctors d2 ON d1.Department_Name = d2.Department_Name AND d1.Doctor_Id < d2.Doctor_Id;

-- View: Create a summary of test results
CREATE VIEW Patient_Test_Summary AS
SELECT p.Name AS Patient_Name, t.Test_Name, r.Result_Value
FROM Patients p
JOIN Results r ON p.Patient_Id = r.Patient_Id
JOIN Tests t ON r.Test_Id = t.Test_Id;

-- Conditional Statement: Age group classification
SELECT Name,
  CASE 
    WHEN Age < 18 THEN 'Child'
    WHEN Age BETWEEN 18 AND 60 THEN 'Adult'
    ELSE 'Senior'
  END AS Age_Group
FROM Patients;

-- Implicit Cursor 
SELECT Name, Salary 
FROM Doctors 
WHERE Salary > 70000;

-- UNION
SELECT Name FROM Patients
UNION
SELECT Name FROM Doctors;

-- INTERSECT 
SELECT Name FROM Patients
WHERE Name IN (SELECT Name FROM Doctors);
