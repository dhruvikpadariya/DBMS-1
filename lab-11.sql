------------------- lab 11-----------------------------------------

create table Stu_Info
(Rno int,
Name varchar(50),
Branch varchar(50))

---------------------------------------------

select * from Result

------------------------------------------------------------

create table EMPLOYEE_MASTER
(EmployeeNo varchar(50),
Name varchar(50),
ManagerNo varchar(50))


INSERT INTO EMPLOYEE_MASTER VALUES ('E01', 'Tarun', NULL);
INSERT INTO EMPLOYEE_MASTER VALUES ('E02', 'Rohan', 'E02');
INSERT INTO EMPLOYEE_MASTER VALUES ('E03', 'Priya', 'E01');
INSERT INTO EMPLOYEE_MASTER VALUES ('E04', 'Milan', 'E03');
INSERT INTO EMPLOYEE_MASTER VALUES ('E05', 'Jay', 'E01');
INSERT INTO EMPLOYEE_MASTER VALUES ('E06', 'Anjana', 'E04');

select * from EMPLOYEE_MASTER
-----------------------------------------------------------------------


-- ---------------############### Part A ################----------------------

--1.	Combine information from student and result table using cross join or Cartesian product.
Select *  From Stu_Info
CROSS JOIN Result 


--2.	Perform inner join on Student and Result tables.
Select * From Stu_Info s
inner join Result r
on  s.Rno = r.Rno

--3.	Perform the left outer join on Student and Result tables.
Select * From Stu_Info s
left outer join Result r
on s.Rno = r.Rno

--4.	Perform the right outer join on Student and Result tables.
Select * From Stu_Info s
Right outer join Result r
on s.Rno = r.Rno

--5.	Perform the full outer join on Student and Result tables. 
Select * From Stu_Info s
Full outer join Result r
on s.Rno = r.Rno

--6.	Display Rno, Name, Branch and SPI of all students.
Select s.Rno , s.Name ,s.Branch , r.SPI From Stu_Info s
join Result r
on s.Rno = r.Rno

--7.	Display Rno, Name, Branch and SPI of CE branch’s student only.
SELECT s.Rno, s.Name, s.Branch, r.SPI FROM Stu_Info s
JOIN Result r 
ON s.Rno = r.Rno
WHERE s.Branch = 'CE';

--8.	Display Rno, Name, Branch and SPI of other than EC branch’s student only.
SELECT s.Rno, s.Name, s.Branch, r.SPI FROM Stu_Info s
JOIN Result r 
ON s.Rno = r.Rno
WHERE s.Branch != 'EC';

--9.	Display average result of each branch.
SELECT s.Branch, AVG(r.SPI) AS Average_SPI FROM Stu_Info s
JOIN Result r 
ON s.Rno = r.Rno
GROUP BY s.Branch;

--10.	Display average result of CE and ME branch.
SELECT s.Branch, AVG(r.SPI) AS Average_SPI FROM Stu_Info s
JOIN Result r 
ON s.Rno = r.Rno
Where s.Branch in ('CE','ME')
GROUP BY s.Branch;


--#################### Part B ##################

--1.	Display average result of each branch and sort them in ascending order by SPI.
 SELECT s.Branch, AVG(r.SPI) FROM Stu_Info s
JOIN Result r 
ON s.Rno = r.Rno
GROUP BY s.Branch
order by Avg(r.SPI)

--2.	Display highest SPI from each branch and sort them in descending order.
SELECT s.Branch, MAX(r.SPI) AS Highest_SPI FROM Stu_Info s
JOIN Result r 
ON s.Rno = r.Rno
GROUP BY s.Branch
ORDER BY Highest_SPI DESC;

----------############################ Part-C ######################---------------------

--1.	Retrieve the names of employee along with their manager’s name from the Employee table.
SELECT s1.Name AS EmployeeName, s2.Name AS ManagerName FROM EMPLOYEE_MASTER s1
LEFT JOIN EMPLOYEE_MASTER s2 
ON s1.EmployeeNo = s2.ManagerNo;



