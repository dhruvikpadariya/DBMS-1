-----############ lab 7 #######-----------
------------- PART A ------------------

create table Emp
(EID	int,
EName	varchar(50),
Department	varchar(50),
Salary	int,
JoiningDate	date,
City varchar(50))

INSERT INTO Emp VALUES (101, 'Rahul', 'Admin', 56000, '1-Jan-90', 'Rajkot');
INSERT INTO Emp VALUES (102, 'Hardik', 'IT', 18000, '25-Sep-90', 'Ahmedabad');
INSERT INTO Emp VALUES (103, 'Bhavin', 'HR', 25000, '14-May-91', 'Baroda');
INSERT INTO Emp VALUES (104, 'Bhoomi', 'Admin', 39000, '8-Feb-91', 'Rajkot');
INSERT INTO Emp VALUES (105, 'Rohit', 'IT', 17000, '23-Jul-90', 'Jamnagar');
INSERT INTO Emp VALUES (106, 'Priya', 'IT', 9000, '18-Oct-90', 'Ahmedabad');
INSERT INTO Emp VALUES (107, 'Bhoomi', 'HR', 34000, '25-Dec-91', 'Rajkot');

select * from Emp

---##################part A ###############--------------------

--1.Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
select MAX(Salary) as 'Maximum',MIN(Salary) as 'Minimum' from Emp 

--2.Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively.
select sum(Salary) as 'Total_Sal',AVG(Salary) as 'Average_Sal' from Emp

--3.Find total number of employees of EMPLOYEE table.
select count(EName) as 'total Emp' from Emp

--4.Find highest salary from Rajkot city.
select MAX(Salary) as 'Maximum' from Emp where City='Rajkot'

--5.Give maximum salary from IT department.
select MAX(Salary) as 'Maximum' from Emp where Department='IT'

--6.Count employee whose joining date is after 8-feb-91.
select count(EName) as 'total Emp' from Emp where JoiningDate>'8-feb-91'

--7.Display average salary of Admin department.
select AVG(Salary) as 'Avg' from Emp where Department='Admin'

--8.Display total salary of HR department.
select SUM(Salary) from Emp where Department='HR'

--9.Count total number of cities of employee without duplication.
select COUNT(Distinct City) from Emp 

--10.Count unique departments.
select COUNT(Distinct Department) from Emp

--11.Give minimum salary of employee who belongs to Ahmedabad.
select MIN(Salary) from Emp where City='Ahmedabad'

--12.Find city wise highest salary.
select City,MAX(Salary) from Emp
group by City

--13.Find department wise lowest salary.
select Department,MIN(Salary) from Emp
group by Department

--14.Display city with the total number of employees belonging to each city.
select city,count(EName) from Emp
group by City

--15.Give total salary of each department of EMP table.
select Department,sum(Salary) from Emp
group by Department

--16.Give average salary of each department of EMP table without displaying the respective department name.
select avg(Salary) from Emp
group by Department


-----------------------------################ PART  B ##############------------

--1.Count the number of employees living in Rajkot.
select count(EName) from Emp where City='Rajkot'

--2.Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
select MAX(Salary) - MIN(Salary) as 'DIFFERENCE' from Emp

--3.Display the total number of employees hired before 1st January, 1991.
select count(EName) from Emp where JoiningDate<'1-Jan-91'


-----------######################### PART C ######################----------------

--1.Count the number of employees living in Rajkot or Baroda.
select count(EName) from Emp where City='Rajkot' or City='Baroda'

--2.Display the total number of employees hired before 1st January, 1991 in IT department.
select count(EName) from Emp where JoiningDate<'1-Jan-91' and Department='IT'

--3.Find the Joining Date wise Total Salaries.
select JoiningDate,SUM(Salary) from Emp
group by JoiningDate

--4.Find the Maximum salary department & city wise in which city name starts with ‘R’.
select Department,City,max(Salary) from Emp
where City like 'R%'
group by Department,City



