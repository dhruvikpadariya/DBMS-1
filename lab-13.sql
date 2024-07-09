--------------------------------------------lab 13-----------------------------------------------
-------################################# PART A #################----------------


SELECT * FROM CITY

INSERT INTO CITY VALUES (1, 'Rajkot', 360005, 'Good');
INSERT INTO CITY VALUES (2, 'Surat', 335009, 'Very Good');
INSERT INTO CITY VALUES (3, 'Baroda', 390001, 'Awesome');
INSERT INTO CITY VALUES (4, 'Jamnagar', 361003, 'Smart');
INSERT INTO CITY VALUES (5, 'Junagadh', 362229, 'Historic');
INSERT INTO CITY VALUES (6, 'Morvi', 363641, 'Ceramic');


-------------------------------------------------------------

INSERT INTO VILLAGE VALUES (101, 'Raiya', 1);
INSERT INTO VILLAGE VALUES (102, 'Madhapar', 1);
INSERT INTO VILLAGE VALUES (103, 'Dodka', 3);
INSERT INTO VILLAGE VALUES (104, 'Falla', 4);
INSERT INTO VILLAGE VALUES (105, 'Bhesan', 5);
INSERT INTO VILLAGE VALUES (106, 'Dhoraji', 5);

SELECT * FROM VILLAGE

-------------------------------------

--1. Display all the villages of Rajkot city. 
SELECT V.Name FROM VILLAGE V 
JOIN CITY C 
ON V.CityID = C.CityID 
WHERE C.Name = 'Rajkot';

--2. Display city along with their villages & pin code.
SELECT C.Name AS City, C.Pincode, V.Name AS Village FROM CITY C 
LEFT JOIN VILLAGE V 
ON C.CityID = V.CityID 
ORDER BY C.Name, V.Name;

--3. Display the city having more than one village.
SELECT  c.Name, COUNT(V.CityID) FROM City C
JOIN Village V
ON C.CityID=V.CityID 
GROUP BY C.Name
HAVING COUNT(v.CityID)>1

--4. Display the city having no village.
SELECT  C.Name FROM City C
LEFT OUTER JOIN Village V
ON C.CityID=V.CityID
GROUP BY C.Name 
HAVING COUNT(V.CityID) = 0

--5. Count the total number of villages in each city.
SELECT  C.Name, COUNT(V.VID)  FROM City C
LEFT OUTER JOIN Village V
ON C.CityID=V.CityID 
GROUP BY C.Name 

--6. Count the number of cities having more than one village
SELECT COUNT(*) FROM ( 
	SELECT C.Name, COUNT(V.VID) AS TOTAL FROM City C 
	JOIN Village V
	ON C.CityID = V.CityID 
	GROUP BY C.Name 
) AS T 
WHERE TOTAL > 1 


--1.Do not allow SPI more than 10 
--2. Do not allow Bklog less than 0. 
--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified. 
CREATE TABLE STU_MASTER (
    Rno INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Branch VARCHAR(50) DEFAULT 'General',
    SPI DECIMAL(4, 2) CHECK (SPI <= 10),
    Bklog INT CHECK (Bklog >= 0)
);
 
INSERT INTO STU_MASTER VALUES(101, 'Raju', 'CE', 8.80, 0)
INSERT INTO STU_MASTER VALUES(102, 'Amit', 'CE', 2.20, 3)
INSERT INTO STU_MASTER VALUES(103, 'Sanjay', 'ME', 1.50, 6)
INSERT INTO STU_MASTER VALUES(104, 'Neha', 'EC', 7.65, 0)
INSERT INTO STU_MASTER VALUES(105, 'Meera', 'EE', 5.52, 2)
INSERT INTO STU_MASTER VALUES(106, 'Mahesh', DEFAULT, 4.50, 3)

--4. Try to update SPI of Raju from 8.80 to 12. 
UPDATE STU_MASTER SET SPI = 20
WHERE Rno = 101;

--5. Try to update Bklog of Neha from 0 to -1. 
UPDATE STU_MASTER
SET Bklog = -1
WHERE Rno = 104


----------############## PART B ######################-------------

--1.Emp_details(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_details(Did, Dname)
--City_details(Cid, Cname)

CREATE TABLE City_details (
  Cid INT PRIMARY KEY,
  Cname VARCHAR(50) NOT NULL
);

CREATE TABLE Dept_details (
  Did INT PRIMARY KEY,
  Dname VARCHAR(50) NOT NULL
);

CREATE TABLE Emp_details (
  Eid INT PRIMARY KEY,
  Ename VARCHAR(50) NOT NULL,
  Did INT,
  Cid INT,
  Salary DECIMAL(10, 2) CHECK (Salary > 0),
  Experience INT CHECK (Experience >= 0),
  FOREIGN KEY (Did) REFERENCES Dept_details (Did),
  FOREIGN KEY (Cid) REFERENCES City_details (Cid)
);

--------------------------------- Insert Value -------------------------
INSERT INTO City_details VALUES (1, 'pqr');
INSERT INTO Dept_details VALUES (1, 'xyz');
INSERT INTO Emp_details  VALUES (1, 'abc', 1, 1, 5000.00, 5);

-- Insert data that violates validation
-- Salary cannot be negative
INSERT INTO Emp_details  VALUES (2, 'def', 1, 1, -1000.00, 5);

-- Experience cannot be negative
INSERT INTO Emp_details  VALUES (3, 'ghi', 1, 1, 6000.00, -2);

-- Did and Cid must exist in Dept_details and City_details table
INSERT INTO Emp_details  VALUES (4, 'jkl', 2, 2, 7000.00, 3);


---------------##################### PART C #################------------------

--1.	Emp(Eid, Ename, Did, Cid, Salary, Experience)
--	Dept(Did, Dname)
--	City(Cid, Cname, Did))
--	District(Did, Dname, Sid)
--	State(Sid, Sname, Cid)
--	Country(Cid, Cname)

CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL,
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country(Cid)
);

CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL,
    Sid INT,
    FOREIGN KEY (Sid) REFERENCES State(Sid)
);

CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL,
    Did INT,
    FOREIGN KEY (Did) REFERENCES District(Did)
);

CREATE TABLE Dept_info  (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

CREATE TABLE Emp_info  (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10,2) NOT NULL CHECK(Salary > 0),
    Experience INT NOT NULL CHECK(Experience >= 0),
    FOREIGN KEY (Did) REFERENCES Dept_info(Did),
    FOREIGN KEY (Cid) REFERENCES City_info(Cid)
);
--2.	Insert 5 records in each table.

---------- Insert into Country--------------
INSERT INTO Country VALUES (1, 'Country1')
INSERT INTO Country VALUES(2, 'Country2')
INSERT INTO Country VALUES(3, 'Country3')
INSERT INTO Country VALUES(4, 'Country4')
INSERT INTO Country VALUES(5, 'Country5');

-----------Insert into State-----------
INSERT INTO State VALUES (1, 'State1', 1)
INSERT INTO State VALUES (2, 'State2', 1)
INSERT INTO State VALUES (3, 'State3', 2)
INSERT INTO State VALUES (4, 'State4', 3)
INSERT INTO State VALUES (5, 'State5', 4)

--------------Insert into District----------------
INSERT INTO District VALUES (1, 'District1', 1)
INSERT INTO District VALUES (2, 'District2', 2)
INSERT INTO District VALUES (3, 'District3', 3)
INSERT INTO District VALUES (4, 'District4', 4)
INSERT INTO District VALUES (5, 'District5', 5);

-------------Insert into City_info--------------
INSERT INTO City_info VALUES (1, 'City1', 1)
INSERT INTO City_info VALUES(2, 'City2', 2)
INSERT INTO City_info VALUES(3, 'City3', 3)
INSERT INTO City_info VALUES(4, 'City4', 4)
INSERT INTO City_info VALUES(5, 'City5', 5);

-------Insert into Dept_info------------
INSERT INTO Dept_info values(1, 'Dept1')
INSERT INTO Dept_info values(2, 'Dept2')
INSERT INTO Dept_info values(3, 'Dept3')
INSERT INTO Dept_info values(4, 'Dept4')
INSERT INTO Dept_info values(5, 'Dept5')

-------------------Insert into Emp_info-------

INSERT INTO Emp_info Values(1, 'Employee1', 1, 1, 50000, 5)
INSERT INTO Emp_info Values(2, 'Employee2', 2, 2, 60000, 6)
INSERT INTO Emp_info Values(3, 'Employee3', 3, 3, 70000, 7)
INSERT INTO Emp_info Values(4, 'Employee4', 4, 4, 80000, 8)
INSERT INTO Emp_info Values(5, 'Employee5', 5, 5, 90000, 9)

--3.	Display employeename, departmentname, Salary, Experience, City, District, State and country of all employees.
SELECT 
    e.Ename AS EmployeeName,
    d.Dname AS DepartmentName,
    e.Salary,
    e.Experience,
    c.Cname AS City,
    dis.Dname AS District,
    s.Sname AS State,
    co.Cname AS Country FROM Emp_info e
JOIN Dept_info d 
ON e.Did = d.Did
JOIN City_info c 
ON e.Cid = c.Cid
JOIN District dis 
ON c.Did = dis.Did
JOIN State s 
ON dis.Sid = s.Sid
JOIN Country co 
ON s.Cid = co.Cid;

