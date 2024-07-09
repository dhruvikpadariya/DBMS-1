-----------------------Lab 4-------------------------
---###### Perform SQL queries for Alter, Delete, Truncate, and Drop---

-- ######################part A##############-----


-- ****************** ALTER OPERATION ***************


--1.	Add two more columns City VARCHAR (20) and Pincode INT.
ALTER TABLE DEPOSIT ADD CITY VARCHAR(20) , PINCODE INT

--2.	Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
ALTER TABLE DEPOSIT ALTER COLUMN CNAME VARCHAR(35)

--3.	Change the data type DECIMAL to INT in amount Column.
ALTER TABLE DEPOSIT ALTER COLUMN AMOUNT INT

--4.	Rename Column ActNo to ANO.
Sp_rename 'DEPOSIT.ACTNO','ANO','column'
--exce Sp_rename 'DEPOSIT.ACTNO','ANO'

--5.	Delete Column City from the DEPOSIT table.
ALTER TABLE DEPOSIT DROP COLUMN CITY

--6.	Change name of table DEPOSIT to DEPOSIT_DETAIL.
Sp_rename 'DEPOSIT','DEPOSIT_DETAIL'



--########## Part B:##################

--1.	Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
sp_rename 'DEPOSIT_DETAIL.ADATE', 'AOPENDATE', 'COLUMN';

--2.	Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
ALTER TABLE DEPOSIT_DETAIL  DROP COLUMN AOPENDATE

--3.	Rename Column CNAME to CustomerName.
Sp_rename 'DEPOSIT_DETAIL.CNAME', 'CustomerName', 'column';




-- ################ Part C #############---

create table Student_Detail
(Enrollment_No	VARCHAR(20),
Name	VARCHAR(25),
CPI	DECIMAL(5,2),
Birthdate	DATETIME
)

--1.	Add two more columns City VARCHAR (20) and Backlog INT.
Alter Table Student_Detail Add City varchar(20),Backlog int

--2.	Change the size of NAME column of student from VARCHAR (25) to VARCHAR (35).
Alter Table Student_Detail Alter column Name varchar(35)

--3.	Change the data type DECIMAL to INT in CPI Column.
Alter Table Student_Detail Alter column CPI int

--4.	Rename Column Enrollment_No to ENO.
sp_rename 'Student_Detail.Enrollment_No','ENO','column'

--5.	Delete Column City from the STUDENT table.
Alter Table Student_Detail Drop Column City

--6.	Change name of table STUDENT to STUDENT_MASTER.
sp_rename 'Student_Detail','STUDENT_MASTER'



-- ********** DELETE, Truncate, Drop Operation *************


-- ################ Part A #################


--1.	Delete all the records of DEPOSIT_DETAIL table having amount greater than and equals to 4000. 
Delete from DEPOSIT_DETAIL 
where Amount >= 4000

--2.	Delete all the accounts CHANDI BRANCH.
Delete From DEPOSIT_DETAIL 
Where BNAME = 'CHANDI BRANCH'

--3.	Delete all the accounts having account number (ANO) is greater than 105.
Delete From DEPOSIT_DETAIL
where ANO > 105

--4.	Delete all the records of Deposit_Detail table. (Use Truncate)
Truncate Table DEPOSIT_DETAIL

--5.	Remove Deposit_Detail table. (Use Drop)
Drop Table DEPOSIT_DETAIL



-- ############## Part B ###############

--1.	Delete all the records of Employee_MASTER table having salary greater than and equals to 14000. 
Delete From Employee_MASTER 
where  Salary >= 14000

--2.	Delete all the Employees who belongs to �RAJKOT� city.
Delete From Employee_MASTER 
Where City = 'Rajkot'

--3.	Delete all the Employees who joined after 1-1-2007.
Delete From Employee_MASTER 
where JoiningDate > '2007-01-01'

--4. Delete the records of Employees whose joining date is null and Name is not null.
Delete From Employee_MASTER 
where JoiningDate is null and EmpName is not null

--5. Delete the records of Employees whose salary is 50% of 20000.
Delete From Employee_MASTER 
where Salary=2000*0.5 

--6. Delete the records of Employees whose City Name is not empty
Delete From Employee_MASTER 
where City is  not null

--7.	Delete all the records of Employee_MASTER table. (Use Truncate)
Truncate Table Employee_MASTER 

--8.	Remove Employee_MASTER table. (Use Drop)
Drop Table Employee_MASTER 



-- ############### Part C ###############

--1.	Summarize Delete, Truncate and Drop


-- ^^^^^^^^^^^^^^^ Delete ^^^^^^^^^^^^^

--  USE FOR : Remove Specific Row From Table
--  SYNTAX : DELETE FROM table_name WHERE condition
--  
--  KEY POINTS :
--  	Remove Specific Row
--  	Support Where Condition
--  	Slower For Large database
--  	not reset auto increment
    
    
--   ^^^^^^^^^^^^  Truncate ^^^^^^^^^^^^
    
--  USE FOR : Remove all rows From Table (Empty all column)
--  SYNTAX : TRUNCATE TABLE table_name
--  
--  KEY POINTS :
--  	Remove All rows
--  	not support where condition 
--  	faster for large database
--  	reset auto increment
    
    
--   ^^^^^^^^^^^^^^ Drop ^^^^^^^^^^^^^^
    
--  USE FOR : Remove entire table
--  SYNTAX : DROP TABLE table_name
--  
--  KEY POINTS :
--  	Delete Table 
--  	not support where condition



----------------extra queries-------
--1. Delete acount holders who opened account before date '01-DEC-96'
-- DELETE FROM account_holders WHERE open_date < '01-DEC-1996';

--2. Remove branches who belongs to Bombay
--DELETE FROM branches WHERE city = 'Bombay';

--3. Remove city which are belongs to Madhuri and Pramod
--DELETE FROM cities WHERE customer_name IN ('Madhuri', 'Pramod');

--4. Remove customer name whose amount is 2000 to 7000 and loan number is 311
--DELETE FROM customers
--WHERE amount BETWEEN 2000 AND 7000 AND loan_number = 311;

--5. Remove customer whose city is BARODA
--DELETE FROM customers WHERE city = 'BARODA';

--6. Remove city which belongs to either Nehru Place,Chandi or Powai
--DELETE FROM cities WHERE city_name IN ('Nehru Place', 'Chandi', 'Powai');

--7. Remove all borrowers whose loanno is not between 205 to 321 (Use Between)
--DELETE FROM borrowers WHERE loanno NOT BETWEEN 205 AND 321;

--8. Remove branch name for which city is either Delhi or Banglore
--DELETE FROM branches WHERE city IN ('Delhi', 'Bangalore');

--9. Delete all the account number whose amount is divisible by 3 
--DELETE FROM accounts WHERE amount % 3 = 0;

--10. Delete all the borrowers whose loanno is even.
--DELETE FROM borrowers WHERE loanno % 2 = 0;

--11. Remove depositors whose adate is either 02-09-95 or 17-11-95 (Use In) 
--DELETE FROM depositors WHERE adate IN ('02-SEP-1995', '17-NOV-1995');

--12. Delete all the records of Branch table (Use Truncate)
--TRUNCATE TABLE branch;

--13. Remove customers table (Use DROP)
--DROP TABLE customers;

--14. Drop Branch table
--DROP TABLE branch;

--15. Remove Borrwers table
--DROP TABLE borrowers;
