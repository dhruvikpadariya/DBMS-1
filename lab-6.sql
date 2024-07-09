-----#############lab 6 ##########-----------
--Implement SQL In-built functions (Math, String, and Date Functions)
----------Math functions
---################################Part-A:----------------


--1.Display the result of 5 multiply by 30.
select 30*5

--2.Find out the absolute value of -25, 25, -50 and 50.
select abs(-25),abs(25),abs(-50),abs(50)

--3.Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
select CEILING(25.2),CEILING(25.7),CEILING(-25.2)

--4.Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
select FLOOR(25.2),FLOOR(25.7),FLOOR(-25.2)

--5.Find out remainder of 5 divided 2 and 5 divided by 3.
select 5%2,5%3

--6.Find out value of 3 raised to 2nd power and 4 raised 3rd power.
select POWER(3,2),POWER(4,3)

--7.Find out the square root of 25, 30 and 50.
select SQRT(25),SQRT(30),SQRT(50)

--8.Find out the square of 5, 15, and 25.
select SQUARE(5),SQUARE(15),SQUARE(25)

--9.Find out the value of PI.
Select PI()

--10.Find out round value of 157.732 for 2, 0 and -2 decimal points.
select ROUND(157.732,2),ROUND(157.732,0),ROUND(157.732,-2)

--11.Find out exponential value of 2 and 3.
select EXP(2),EXP(3)

--12.Find out logarithm having base e of 10 and 2.
select LOG(10),LOG(2)

--13.Find out logarithm having base b having value 10 of 5 and 100.
select LOG10(5),LOG10(100)

--14.Find sine, cosine and tangent of 3.1415.
select SIN(3.1415),COS(3.1415),TAN(3.1415)

--15.Find sign of -25, 0 and 25.
select SIGN(-25),SIGN(0),SIGN(25)

--16.Generate random number using function.
select RAND()


--#######################  Part B  ####################-------:
--Create and Insert the following records in the Emp_Master table. 

create table Emp_Master
(EmpNo	int,
EmpName	varchar(50),
JoiningDate	datetime,
Salary	int,
Commission	int,
City varchar(50),
DeptCode varchar(50))

INSERT INTO Emp_Master VALUES(101, 'Keyur', '2002-1-5', 12000.00, 4500, 'Rajkot', '3@g')
INSERT INTO Emp_Master VALUES(102, 'Hardik', '2004-2-15', 14000.00, 2500, 'Ahmedabad', '3@')
INSERT INTO Emp_Master VALUES(103, 'Kajal', '2006-3-14', 15000.00, 3000, 'Baroda', '3-GD')
INSERT INTO Emp_Master VALUES(104, 'Bhoomi', '2005-6-23', 12500.00, 1000, 'Ahmedabad', '1A3D')
INSERT INTO Emp_Master VALUES(102, 'Harmit', '2004-2-15', 14000.00, 2000, 'Rajkot', '312A')

--1.Display the result of Salary plus Commission.
select Salary+Commission from Emp_Master

--2.Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
select CEILING(55.2),CEILING(35.7),CEILING(-55.2)

--3.Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
select floor(55.2),floor(35.7),floor(-55.2)

--4.Find out remainder of 55 divided 2 and 55 divided by 3.
select 55%2,55%3

--5.Find out value of 23 raised to 2nd power and 14 raised 3rd power.
select POWER(23,2),POWER(14,3)


-----------################### PART C #############---------------

--1.Find out the square root of 36, 49 and 81.
select SQRT(36),SQRT(49),SQRT(81)

--2.Find out the square of 3, 9, and 12.
select SQUARE(3),SQUARE(9),SQUARE(12)

--3.Find out round value of 280.8952 for 2, 0 and -2 decimal points.
select ROUND(280.8952,2),ROUND(280.8952,0),ROUND(280.8952,-2)

--4.Find sine, cosine and tangent of 4.2014.
select SIN(4.2014),COS(4.2014),TAN(4.2014)

--5.Find sign of -55, 0 and 95.
select SIGN(-55),SIGN(0),SIGN(95)


---------##########String functions##############-------------------
----############################### Part-A ########################----

--1.Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank
select LEN(null),LEN('hello'),len('')

--2.Display your name in lower & upper case.
select LOWER('Dhruvik'),UPPER('Dhruvik')

--3.Display first three characters of your name.
select SUBSTRING('Darshan University',1,3)

--4.Display 3rd to 10th character of your name.
select SUBSTRING('Darshan University',3,10)

--5.Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
select REPLACE('abc123efg',123,'XYZ'),REPLACE('abcabc','c',5)

--6.Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.
select ASCII('a'),ASCII('A'),ASCII('z'),ASCII('Z'),ASCII(0),ASCII(9)

--7.Write a query to display character based on number 97, 65,122,90,48,57.
select CHAR(97),CHAR(65),CHAR(122),CHAR(90),CHAR(48),CHAR(57)

--8.Write a query to remove spaces from left of a given string ‘	hello world	‘.
select LTRIM('   hello world    ')

--9.Write a query to remove spaces from right of a given string ‘	hello world		‘.
select RTRIM('   hello world    ')

--10.Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
select LEFT('SQL Server',4),RIGHT('SQL Server',5)

--11.Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).
select CONVERT(decimal,'1234.56')	
Select CAST ('1234.56' as float) as 'Cast' 

--12.Write a query to convert a float 10.58 to integer (Use cast and convert function).
select CAST(10.58 as int)
select CONVERT(int,10.58)

--13.Put 10 space before your name using function.
select SPACE(10) + 'Darshan University'

--14.Combine two strings using + sign as well as CONCAT ().
--Using + Sign: 
Select ('Darshan' + 'University') as 'using +'  
--Using CONCAT (): 
Select CONCAT('Darshan', 'Univeristy') "using CONCAT()"  

--15.Find reverse of “Darshan”.
select REVERSE('Darshan')

--16.Repeat your name 3 times.
select REPLICATE('Darshan',3)

-----------------PART B---------------------------------------

--1.Find the length of FirstName and LastName columns.
select LEN(FirstName),LEN(LastName) from Student

--2.Display FirstName and LastName columns in lower & upper case.
select LOWER(FirstName),lower(LastName),upper(FirstName),upper(LastName) from Student

--3.Display first three characters of FirstName column.
select SUBSTRING(FirstName,1,3) from Student

--4.Display 3rd to 10th character of Website column.
select SUBSTRING(Website,3,10) from Student

--5.Write a query to display first 4 & Last 5 characters of Website column.
select LEFT(Website,4),RIGHT(Website,5) from Student


-------------------part C----------------------------
--1.Put 10 space before FirstName using function.
select space(10)+FirstName from Student

--2.Combine FirstName and LastName columns using + sign as well as CONCAT ().
select FirstName+LastName as 'using sign' from Student
select CONCAT(FirstName,Lastname) as 'using concat' from Student

--3.Combine all columns using + sign as well as CONCAT ().
select FirstName+LastName+CAST(StuID as varchar)+Website+City+Address as 'using sign' from Student
select concat(FirstName,LastName,StuID,Website,City,Address) as 'using concat' from Student

--4.Find reverse of FirstName column.
select REVERSE(FirstName) from Student

--5.Repeat FirstName column 3 times
select REPLICATE(FirstName,3) from Student

--6.Give the Names which contains 5 characters.
select FirstName from Student where FirstName like '_____'

--7. Combine the result as <FirstName> Lives in <City>.
SELECT CONCAT(FirstName,' LIVES IN ',City) FROM Student

--8. Combine the result as Student_ID of < FirstName > is <StuID> .
SELECT CONCAT(FirstName,' is ',StuID) FROM Student



----------------------Date Functions---------------------------
---###################part A ###############-----------------



--1. Write a query to display the current date & time. Label the column Today_Date. 
Select GETDATE() AS 'TODAY_DATE' 

--2. Write a query to find new date after 365 day with reference to today. 
Select GETDATE() + 365 

--3. Display the current date in a format that appears as may 5 1994 12:00AM. 
Select CONVERT(VARCHAR, GETDATE()) 

--4. Display the current date in a format that appears as 03 Jan 1995. 
Select CONVERT(VARCHAR, GETDATE(),106) 

--5. Display the current date in a format that appears as Jan 04, 96. 
Select CONVERT(VARCHAR(20), GETDATE(),7) 

--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09. 
Select DATEDIFF(MONTH,'2008-12-31','2009-03-31') 

--7. Write a query to find out total number of years between 25-Jan-12 and 14-Sep-10. 
Select DATEDIFF(YEAR, '2012/01/25','2010/09/14') 

--8. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30. 
Select DATEDIFF(HOUR, '2012-01-25 07:00', '2012-01-26 10:30') 

--9. Write a query to extract Day, Month, Year from given date 12-May-16. 
Select DAY('2016/05/12'), MONTH('2016/05/12'), YEAR('2016/05/12') 

--10. Write a query that adds 5 years to current date. 
Select DATEADD(YEAR, 5, GETDATE())
--or--
select GETDATE() + YEAR(5)

--11. Write a query to subtract 2 months from current date. 
Select DATEADD(month, -2, GETDATE()) 

--12. Extract month from current date using datename () and datepart () function. 
Select DATENAME(MONTH,GETDATE()) 
Select DATEPART(MONTH, GETDATE()) 

--13. Write a query to find out last date of current month. 
Select EOMONTH(GETDATE()) 

--14. Calculate your age in years and months. 
Select DATEDIFF(YEAR,'2002-01-25',GETDATE()) 
Select DATEDIFF(MONTH,'2002-01-25',GETDATE()) 

------------------###################### PART B #############-------------
create table Emp_detail 
(EmpNo	int,
EmpName	 varchar(50),
JoiningDate	date,
Salary	int,
City varchar(50))

INSERT INTO Emp_detail VALUES(101, 'Keyur', '2002-1-15', 12000.00, 'Rajkot')
INSERT INTO Emp_detail VALUES(102, 'Hardik', '2004-2-15', 14000.00, 'Ahmedabad')
INSERT INTO Emp_detail VALUES(103, 'Kajal', '2006-3-14', 15000.00, 'Baroda')
INSERT INTO Emp_detail VALUES(104, 'Bhoomi', '2005-6-23', 1250.00,'Ahmedabad')
INSERT INTO Emp_detail VALUES(102, 'Harmit', '2004-2-15', 14000.00,'Rajkot')
INSERT INTO Emp_detail VALUES(105, 'Jay', '2007-6-12', 12000.00,'Surat')

select * from Emp_detail


--1.	Write a query to find new date after 365 day with reference to JoiningDate.
SELECT cast(JOININGDATE as datetime)+ 365 FROM Emp_detail

--2.	Display the JoiningDate in a format that appears as may 5 1994 12:00AM.
SELECT CONVERT(VARCHAR,JOININGDATE) FROM Emp_detail

--3.	Display the JoiningDate in a format that appears as 03 Jan 1995.
SELECT CONVERT(VARCHAR,JOININGDATE,106)FROM Emp_detail

--4.	Display the JoiningDate in a format that appears as Jan 04, 96.
SELECT CONVERT(VARCHAR(20),JOININGDATE,7) FROM Emp_detail

--5.	Write a query to find out total number of months between JoiningDate and 31-Mar-09.
SELECT DATEDIFF(MONTH,JOININGDATE,'2009-03-31')FROM Emp_detail

--6.	Write a query to find out total number of years between JoiningDate and 14-Sep-10.
SELECT DATEDIFF(YEAR,JOININGDATE,'2010-09-14')FROM Emp_detail

----------############## PART C ###########################-----------------

--1.	Write a query to extract Day, Month, Year from JoiningDate.
SELECT DAY(JOININGDATE),MONTH(JOININGDATE),YEAR(JOININGDATE) FROM Emp_detail

--2.	Write a query that adds 5 years to JoiningDate.
Select DATEADD(YEAR, 5, JOININGDATE) FROM Emp_detail

--3.	Write a query to subtract 2 months from JoiningDate.
Select DATEADD(YEAR, -2, JOININGDATE) FROM Emp_detail

--4.	Extract month from JoiningDate using datename () and datepart () function.
Select DATENAME(MONTH,JOININGDATE)  FROM Emp_detail
Select DATEPART(MONTH, JOININGDATE) FROM Emp_detail

--5.	Calculate your age in years and months
 Select DATEDIFF(YEAR,'2002-01-25',GETDATE())
Select DATEDIFF(MONTH,'2002-01-25',GETDATE())




