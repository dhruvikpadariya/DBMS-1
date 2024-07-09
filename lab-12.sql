-------------------------lab 12 -----------------------

select * from PERSON

--------------------------------------------

select * from DEPT

----------------------------------------

------###########################PART A ########################----------

--1.	Find all persons with their department name & code.
Select p.PersonName,d.DepartmentName,d.DepartmentCode From PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID


--2.	Find the person's name whose department is in C-Block.
Select p.PersonName From PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
Where d.Location = 'C-Block'

--3.	Retrieve person name, salary & department name who belongs to Jamnagar city.
Select p.PersonName,p.Salary,d.DepartmentName From PERSON p
join DEPT d
on p.DepartmentID=d.DepartmentID
Where City = 'Jamnagar'

--4.	Retrieve person name, salary & department name who does not belong to Rajkot city.
Select p.PersonName,p.Salary,d.DepartmentName From PERSON p
join DEPT d
on p.DepartmentID=d.DepartmentID
Where p.City != 'Rajkot'


--5.	Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.
Select p.PersonName From PERSON p
join DEPT d
on p.DepartmentID=d.DepartmentID
Where p.JoiningDate > '1-Aug-2001' and d.DepartmentName = 'Civil'


--6.	Find details of all persons who belong to the computer department.
Select p.* From PERSON p
join DEPT d
on p.DepartmentID=d.DepartmentID
Where d.DepartmentName = 'Computer' 


--7.	Display all the person's name with the department whose joining date difference with the current date is more than 365 days.
SELECT p.PersonName, d.DepartmentName FROM PERSON p
JOIN DEPT d 
ON p.DepartmentID = d.DepartmentID
WHERE DATEDIFF(DAY, p.JoiningDate, GETDATE()) > 365;


--8.	Find department wise person counts.
Select d.DepartmentName, Count(p.PersonName) as Total_Person From PERSON p
join DEPT d
on p.DepartmentID=d.DepartmentID
group by d.DepartmentName

--9.	Give department wise maximum & minimum salary with department name.
Select d.DepartmentName, MIN(p.Salary) as Mini , MAX(p.Salary)As Maxi  From PERSON p
join DEPT d
on p.DepartmentID=d.DepartmentID
group by d.DepartmentName

--10.	Find city wise total, average, maximum and minimum salary.
Select p.City,SUM(p.Salary)as Total , AVG(p.Salary) as Average, MIN(p.Salary) as Mini , MAX(p.Salary)As Maxi  From PERSON p
join DEPT d
on p.DepartmentID=d.DepartmentID
group by p.City

--11.	Find the average salary of a person who belongs to Ahmedabad city.
Select AVG(p.Salary) as Average From PERSON p
join DEPT d
on p.DepartmentID=d.DepartmentID
Where p.City = 'Ahmedabad'

--12.	Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)
Select CONCAT(p.PersonName,' Lives in ' , p.City ,' and works in ' , d.DepartmentName , ' Department.') From PERSON p
join DEPT d
on p.DepartmentID=d.DepartmentID


-----######################### PART B #########################----------

--1.	Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column)
Select CONCAT(p.PersonName,' earns ' , Cast(p.Salary as varchar),' from ' , d.DepartmentName , ' Department monthly.') as Average From PERSON p
join DEPT d
on p.DepartmentID=d.DepartmentID

--2.	Find city & department wise total, average & maximum salaries.
Select p.City,d.DepartmentName,SUM(p.Salary)as Total , AVG(p.Salary) as Average, MAX(p.Salary)As Maxi  From PERSON p
join DEPT d
on p.DepartmentID=d.DepartmentID
group by p.City,d.DepartmentName


--3.	Find all persons who do not belong to any department.
Select p.PersonName From PERSON p
left join DEPT d
on p.DepartmentID=d.DepartmentID
Where p.DepartmentID is NULL

--4.	Find all departments whose total salary is exceeding 100000.
Select d.DepartmentName,SUM(p.Salary) From PERSON p
left join DEPT d
on p.DepartmentID=d.DepartmentID
group by d.DepartmentName
having SUM(p.Salary) > 100000

--########################### Part C #########################


--1.	List all departments who have no person.
SELECT d.DepartmentID, d.DepartmentName FROM PERSON p
left outer JOIN DEPT d
ON p.DepartmentID= d.DepartmentID
WHERE p.DepartmentID not in (Select  p.DepartmentID From PERSON p);

--2.	List out department names in which more than two persons are working.
SELECT d.DepartmentName FROM PERSON p
JOIN DEPT d
ON p.DepartmentID= d.DepartmentID
group by d.DepartmentName 
having COUNT(p.DepartmentID) >2

--3.	Give a 10% increment in the computer department employee’s salary. (Use Update)
UPDATE PERSON SET Salary = Salary * 0.1
WHERE DepartmentId = (SELECT DepartmentId FROM DEPT WHERE DepartmentName = 'Computer')
