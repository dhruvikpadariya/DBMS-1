--Lab 3	Perform SQL queries for Select into and Update
--Select into Operation
--Create table as per following.


--------------part A ------------------

CREATE TABLE Cricket
(Name varchar(50),
City varchar(50),
Age int)

INSERT INTO Cricket (Name, City, Age) VALUES ('Sachin Tendulkar', 'Mumbai', 30);
INSERT INTO Cricket (Name, City, Age) VALUES ('Rahul Dravid', 'Bombay', 35);
INSERT INTO Cricket (Name, City, Age) VALUES ('M. S. Dhoni', 'Jharkhand', 31);
INSERT INTO Cricket (Name, City, Age) VALUES ('Suresh Raina', 'Gujarat', 30);


--1.	Create table Worldcup from cricket with all the columns and data. 
SELECT * INTO Worldcup
FROM CRICKET;

--2.	Create table T20 from cricket with first two columns with no data.
SELECT NAME, CITY INTO T20 FROM CRICKET WHERE 1=2

--3.	Create table IPL From Cricket with No Data
SELECT * INTO IPL FROM CRICKET WHERE 1<>1


-- ############## PART B ###############

create table Employee
(Name varchar(50),	
City varchar(50),
Age int)

INSERT INTO Employee VALUES ('Jay Patel', 'Rajkot', 30);
INSERT INTO Employee VALUES ('Rahul Dave', 'Baroda', 35);
INSERT INTO Employee VALUES ('Jeet Patel', 'Surat', 31);
INSERT INTO Employee VALUES ('Vijay Raval', 'Rajkot', 30);

--1.	Create table Employee_detail from Employee with all the columns and data. 
SELECT * INTO Employee_detail 
FROM Employee ;

--2.	Create table Employee_data from Employee with first two columns with no data.
SELECT Name, City INTO Employee_data  FROM Employee WHERE 1=2

--3.	Create table Employee_info from Employee with no Data
SELECT * INTO Employee_info FROM Employee  WHERE 1<>1



-- ########### PART C #############

--1.	Insert the Data into Employee_info from Employee Whose CITY is Rajkot
INSERT INTO Employee_info (Name,City,Age)
SELECT Name,City,Age FROM Employee
WHERE CITY = 'Rajkot';

--2.	Insert the Data into Employee_info from Employee Whose age is more than 32
INSERT INTO Employee_info (Name,City,Age)
SELECT Name,City,Age FROM Employee
WHERE Age > 32;




-- --------------------Update Operation

-- ############ Part A #########

--1.	Update deposit amount of all customers from 3000 to 5000.
Update DEPOSIT SET AMOUNT=5000
WHERE AMOUNT=3000

--2.	Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table) 
Update BORROW SET BNAME = 'C.G.ROAD'
WHERE BNAME = 'VRCE' AND  CNAME='ANIL'

--3.	Update Account No of SANDIP to 111 & Amount to 5000. 
UPDATE DEPOSIT SET AMOUNT =5000,ACTNO=111
WHERE CNAME='SANDIP'

--4.	Update amount of KRANTI to 7000.
UPDATE DEPOSIT SET AMOUNT=7000
WHERE CNAME='KRANTI'

--5.	Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table)
UPDATE BRANCH SET BNAME = 'ANDHERI WEST'
WHERE BNAME = 'ANDHERI'

--6.	Update branch name of MEHUL to NEHRU PALACE.
UPDATE DEPOSIT SET BNAME = 'NEHRU PALACE'
WHERE CNAME ='MEHUL'

--7.	Update deposit amount of all depositors to 5000 whose account no between 103 & 107.
UPDATE DEPOSIT SET AMOUNT = 5000
WHERE ACTNO BETWEEN 103 AND 107

--8.	Update ADATE of ANIL to 1-4-95
UPDATE DEPOSIT SET ADATE ='1995-01-04'
WHERE CNAME='ANIL'

--9.	Update the amount of MINU to 10000.
UPDATE DEPOSIT SET AMOUNT=10000
WHERE CNAME ='MINU'

--10.	Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96
UPDATE DEPOSIT SET AMOUNT=5000,ADATE='1996-01-04'
WHERE CNAME='PRAMOD'


-- ############### PART B  ###########

--1.	Give 10% Increment in Loan Amount.
UPDATE BORROW SET AMOUNT = AMOUNT +AMOUNT*0.10

--2.	Customer deposits additional 20% amount to their account, update the same. 
UPDATE DEPOSIT SET AMOUNT = AMOUNT*0.2



-- ################ PART C ################

--1.	Update amount of loan no 321 to NULL.
update BORROW SET AMOUNT=NULL
WHERE LOANNO = 321

--2.	Update branch name of KRANTI to NULL (Use Borrow Table)
UPDATE BORROW SET BNAME=NULL
WHERE CNAME = 'KRANTI'

--3.	Display the name of borrowers whose amount is NULL.
SELECT * FROM BORROW
WHERE AMOUNT = NULL

--4.	Display the Borrowers whose having branch.
SELECT * FROM BORROW
WHERE BNAME IS NOT NULL

--5.	Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481.
UPDATE BORROW SET AMOUNT=5000,BNAME = 'VRCE' , CNAME='Darshan'
WHERE LOANNO = 481

--6.	Update the Deposit table and set the date to 01-01-2021 for all the borrowers which amount is less than 2000.
UPDATE DEPOSIT SET ADATE = '2021-01-01'
WHERE AMOUNT < 2000

--7.	Update the date to NULL & Branch name to �ANDHERI whose Account No is 110.
UPDATE DEPOSIT SET ADATE = NULL , BNAME = 'ANDHERI'
WHERE ACTNO = 110
