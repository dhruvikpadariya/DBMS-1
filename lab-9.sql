---------############ lab 8 ###########-------------------
--------------Sub Queries--------------------------------------------
create table Stu_Detail
( Rno	int,
Name	varchar(50),
City	varchar(50),
DID int)

insert into Stu_Detail values(101,'Raju','Rajkot',10)
insert into Stu_Detail values(102,'Amit','Ahmedabad',20)
insert into Stu_Detail values(103,'Sanjay','Baroda',40)
insert into Stu_Detail values(104,'Neha','Rajkot',20)
insert into Stu_Detail values(105,'Meera','Ahmedabad',30)
insert into Stu_Detail values(106,'Mahesh','Baroda',10)

select * from Stu_Detail

---------------------------------------------------------------------

create table Academic
(Rno int,
SPI float,
Bklog int)

insert into Academic values(101,8.8,0)
insert into Academic values(102,9.2,2)
insert into Academic values(103,7.6,1)
insert into Academic values(104,8.2,4)
insert into Academic values(105,7.0,2)
insert into Academic values(106,8.9,3)

select * from Academic

----------------------------------------------------------------------------------------

create table Department
(DID int,
DName varchar(50))

insert into Department values(10,'Computer')
insert into Department values(20,'Electrical')
insert into Department values(30,'Mechanical')
insert into Department values(40,'Civil')

select * from Department

------------------------------------------------------------------------------

-------- ###################### part A ############################-----------------------

--1.	Display details of students who are From computer department.
Select * From Stu_Detail
where DID = (
    Select DID
    From Department
    where DName = 'Computer'
);

--2.	Displays name of students whose SPI is more than 8.
Select Name From Stu_detail
where Rno IN  (Select Rno From Academic where SPI > 8);

--3.	Display details of students of computer department who belongs to Rajkot city.
Select *  From Stu_detail
where City = 'Rajkot ' and DID = (Select DID From Department where Dname = 'Computer');

--4.	Find total number of students of electrical department.
Select COUNT(Rno) From Stu_detail
where DID = (Select DID From Department where DName = 'Electrical');

--5.	Display name of student who is having maximum SPI.
Select Name From Stu_detail
where Rno = (Select Rno From Academic where SPI = (Select MAX(SPI) From Academic));

--6.	Display details of students having more than 1 backlog.
Select * From Stu_detail
where Rno in  (Select Rno From Academic where Bklog >1)



------------################ Part B ###################-----------------------

--1.	Display name of students who are either From computer department or From mechanical department.
Select Name From Stu_detail
where DID in (Select DID From Department where DName in ('Computer','Mechanical'));

--2.	Display name of students who are in same department as 102 studying in.
Select Name From Stu_detail
where DID in (Select DID From Stu_detail where Rno =102);



--################### Part-C #################

-- 1.	Display name of students whose SPI is more than 9 and who is From electrical department.
Select Name From Stu_detail
where Rno in (Select Rno From Academic where SPI > 9) and DID = (Select DID From Department where DName = 'Electrical')

-- 2.	Display name of student who is having second highest SPI.
Select Name From Stu_detail
where Rno = (Select Rno From Academic where SPI = (Select MAX(SPI) From Academic where SPI < (Select MAX(SPI) From Academic)))

-- 3.	Display city names whose students branch wise SPI is 9.2.
Select Distinct City From Stu_detail
where Rno IN (Select Rno From Academic where SPI = 9.2)
AND DID IN (Select DID From Stu_detail where Rno IN (Select Rno From Academic where SPI = 9.2));


--------------------------------------------------------------------------------------------------------------------------------
------------------------------SET Operators-------------------------------
--######################################### Part-A##########################################-----

create table Computer
(RollNo	int,
Name varchar(50))

insert into Computer values(101,'Ajay')
insert into Computer values(109,'Haresh')
insert into Computer values(115,'Manish')

select * from Computer

------------------------------------------------------------

create table Electrical
(RollNo	int,
Name varchar(50))

insert into Electrical values(105,'Ajay')
insert into Electrical values(107,'Mahesh')
insert into Electrical values(115,'Manish')

select * from Electrical


--------------------------------

--1.	Display name of students who is either in Computer or in Electrical.
Select Name From Computer
UNION
Select Name From Electrical;

--2.	Display name of students who is either in Computer or in Electrical including duplicate data.
Select Name From Computer
UNION ALL
Select Name From Electrical;

--3.	Display name of students who is in both Computer and Electrical.
Select Name From Computer
INTERSECT
Select Name From Electrical;

--4.	Display name of students who are in Computer but not in Electrical.
Select Name From Computer
EXCEPT
Select Name From Electrical;

--5.	Display name of students who are in Electrical but not in Computer.
Select Name From Electrical
EXCEPT
Select Name From Computer;

--6.	Display all the details of students who are either in Computer or in Electrical.
Select RollNo, Name From Computer
UNION
Select RollNo, Name From Electrical;

--7.	Display all the details of students who are in both Computer and Electrical.
Select RollNo, Name From Computer
INTERSECT
Select RollNo,Name From Electrical



---########################## part B ##################----------------------

create table Emp_DATA
(EID int,
Name varchar(50))

insert into Emp_DATA values(1,'Ajay')
insert into Emp_DATA values(9,'Haresh')
insert into Emp_DATA values(5,'Manish')

select * from Emp_DATA
 ---------------------------------------------------------
 create table Customer
(CID int,
Name varchar(50))

insert into Customer values(5,'Ajay')
insert into Customer values(7,'Mahesh')
insert into Customer values(5,'Manish')

select * from Customer

---------------------------

--1.	Display name of persons who is either Employee or Customer.
Select Name From Emp_DATA
UNION
Select Name From Customer;

--2.	Display name of persons who is either Employee or Customer including duplicate data.
Select Name From Emp_DATA
UNION ALL
Select Name From Customer;


--3.	Display name of persons who is both Employee as well as Customer.
Select Name From Emp_DATA
INTERSECT
Select Name From Customer;

--4.	Display name of persons who are Employee but not Customer.
Select Name From Emp_DATA
EXCEPT
Select Name From Customer;

--5.	Display name of persons who are Customer but not Employee.
Select Name From Customer
EXCEPT
Select Name From Emp_DATA;

-----------###################### PART C ####################--------------------------

--1.	Perform all the queries of Part-B but display ID and Name columns instead of Name only.

--1.	Display name of persons who is either Employee or Customer.
Select EID AS ID, Name From Emp_DATA
UNION
Select CID AS ID, Name From Customer


--2.	Display name of persons who is either Employee or Customer including duplicate data.
Select EID AS ID, Name From Emp_DATA
UNION ALL
Select CID AS ID, Name From Customer;

--3.	Display name of persons who is both Employee as well as Customer.
Select EID AS ID, Name From Emp_DATA
INTERSECT
Select CID AS ID, Name From Customer

--4.	Display name of persons who are Employee but not Customer.
Select EID AS ID, Name From Emp_DATA
EXCEPT
Select CID AS ID, Name From Customer

--5.	Display name of persons who are Customer but not Employee.
Select CID AS ID, Name From Customer
EXCEPT
Select EID AS ID, Name From Emp_DATA
