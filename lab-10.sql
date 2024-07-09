----------- lab 10--------------------------

create table STUDENT_INFO
(RNo int,Name varchar(50),Branch varchar(50),SPI float ,Bklog int)INSERT INTO STUDENT_INFO VALUES (101, 'Raju', 'CE', 8.80, 0);
INSERT INTO STUDENT_INFO VALUES (102, 'Amit', 'CE', 2.20, 3);
INSERT INTO STUDENT_INFO VALUES (103, 'Sanjay', 'ME', 1.50, 6);
INSERT INTO STUDENT_INFO VALUES (104, 'Neha', 'EC', 7.65, 1);
INSERT INTO STUDENT_INFO VALUES (105, 'Meera', 'EE', 5.52, 2);
INSERT INTO STUDENT_INFO VALUES (106, 'Mahesh', 'EC', 4.50, 3);

select * from STUDENT_INFO

-----------------------------------------------
----##################### PART A ######################---------------------


--1.	Create a View Personal with all columns.
Create View Personal
As
Select * From STUDENT_INFO

--2.	Create a View Student_Details having columns Name, Branch & SPI. 
Create View Student_Details 
As 
Select Name,Branch,SPI  
From STUDENT_INFO

--3.	Create a View AcademicData having columns RNo, Name, Branch.
Create View AcademicData 
As 
Select RNo, Name, Branch From STUDENT_INFO

--4.	Create a View Student_ bklog having all columns but students whose bklog more than 2.
Create View Student_bklogs
As 
Select * From STUDENT_INFO
Where Bklog > 2

--5.	Create a View Student_Pattern having RNo, Name & Branch columns in which Name consists of four letters.
Create View Student_Pattern  
As  
Select RNo, Name, Branch From STUDENT_INFO
Where Name Like '____'

--6.	Insert a new record to AcademicData View. (107, Meet, ME)
INSERT INTO AcademicData  
Select 107, 'Meet', 'ME' 

--7.	Update the branch of Amit From CE to ME in Student_Details View.
UPDATE Student_Details SET Branch='ME'  
Where Name='Amit' And Branch='CE'

--8.	Delete a student whose roll number is 104 From AcademicData View.
DELETE From AcademicData
Where RNo=104



-- ################# Part B ################

--1.	Create a View that displays information of all students whose spi is above 8.5.
Create View [SPIAbove8.5] 
As 
Select * From STUDENT_INFO Where SPI>8.5 

--2.	Create a View that displays 0 backlog students.
Create View ZeroBklog 
As 
Select * From STUDENT_INFO Where Bklog=0 

--3.	Create a View ComputerView that displays CE branch data only.
Create View ComputerView 
As 
Select * From STUDENT_INFO
Where Branch = 'CE'

-- ################## Part C #####################

--1.	Create a View Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.
Create View Result_EC
As
Select Name,SPI From STUDENT_INFO
Where SPI <5
and Branch = 'EC'

--2.	Update the result of student MAHESH to 4.90 in Result_EC View.
Update Result_EC Set SPI = 4.9
Where Name = 'Mahesh'

--3.	Create a View Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having bklogs more than 5.
Create View Stu_Bklog 
As
Select RNo, Name , Bklog From STUDENT_INFO
Where Name like 'M%' 
and Bklog > 5

--4.	Drop ComputerView form the databAse.
Drop View ComputerView 