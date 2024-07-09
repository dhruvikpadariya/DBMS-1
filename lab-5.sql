-- ################ Lab 5 ############---------
--########################## PART A ################-------------

create table Student
(StuID	INT,
FirstName	VARCHAR(25),
LastName	VARCHAR(25),
Website	VARCHAR(50),
City	VARCHAR(25),
Address varchar(50)
)


INSERT INTO Student (StuID, FirstName, LastName, Website, City, Address) VALUES
(1011, 'Keyur', 'Patel', 'techonthenet.com', 'Rajkot', 'A-303 ''Vasant Kunj'', Rajkot'),
(1022, 'Hardik', 'Shah', 'digminecraft.com', 'Ahmedabad', '"Ram Krupa", Raiya Road'),
(1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'Raj bhavan plot, near garden'),
(1044, 'Bhoomi', 'Gajera', 'checkyourmath.com', 'Ahmedabad', '"Jig''s Home"'', Narol'),
(1055, 'Harmit', 'Mitel', '@me.darshan.com', 'Rajkot', 'B-55, Raj Residency'),
(1066, 'Ashok', 'Jani', NULL, 'Baroda', 'A502, Club House Building');

select * from Student


--1.Display the name of students whose name starts with �k�.
SELECT FirstName, LastName FROM Student 
WHERE FirstName LIKE 'K%';

--2.Display the name of students whose name consists of five characters.
SELECT FirstName, LastName FROM Student 
where FirstName like '_____'

--3.	Retrieve the first name & last name of students whose city name ends with a & contains six characters.
select FirstName , LastName From Student
where City like '_____a'

--4.	Display all the students whose last name ends with �tel�.
select * From Student
where LastName like '%tel'

--5.	Display all the students whose first name starts with �ha� & ends with�t�.
select * From Student
where FirstName like 'ha%t'

--6.	Display all the students whose first name starts with �k� and third character is �y�.
select * From Student 
where FirstName like 'k_y%'

--7.	Display the name of students having no website and name consists of five characters.
Select FirstName From Student 
Where Website is null And Firstname Like '_____' 

--8.	Display all the students whose last name consist of �jer�.  
Select * From Student 
Where LastName Like '%jer%'

--9.	Display all the students whose city name starts with either �r� or �b�.
select * From Student 
Where City Like 'r%' or City Like 'b%' 

--10.	Display all the name students having websites.
Select * From Student 
Where Website is not null 

--11.	Display all the students whose name starts from alphabet A to H.
select * From Student 
Where FirstName Like '[A-H] %' 

--12.	Display all the students whose name�s second character is vowel.
select * From Student 
Where FirstName Like '_[AEIOU]%' 

--13.	Display the name of students having no website and name consists of minimum five characters.
Select * From Student
Where Website is null and FirstName like '_____%'

--14.	Display all the students whose last name starts with �Pat�.  
select * from Student
where Lastname like 'Pat%'

--15.	Display all the students whose city name does not starts with �b�.
select * from Student 
where City not like 'b%'

-- ########################### Part B ######################-----

--1.	Display all the students whose name starts from alphabet A or H.
select * From Student 
Where FirstName Like '[A-H] %' 

--2.	Display all the students whose name�s second character is vowel and of and start with H.
Select * from Student 
Where Firstname like 'H[AEIOUaeiou]%'

--3.	Display all the students whose last name does not ends with �a�.
Select * From Student
Where Lastname not like '%a' 

--4.	Display all the students whose first name starts with consonant.
select * From Student
WHere Firstname not like '[AEIOUaeiou]%'

--5.	Display all the students whose website contains .net
select * From Student 
where Website is not null


-- ##################### Part C #######################---------------

--1.	Display all the students whose address consist of -.
Select * from Student 
where Address like '%-%'

--/////////////////////////////////////////////////
-- ///////////////////////////////////////////////
--2.	Display all the students whose address contains single quote or double quote.
SELECT * FROM Student
WHERE Address LIKE '%"%' OR Address LIKE '%''%'

--3.	Display all the students whose website contains @ name starts with j.
Select * From Student
Where Website like '%@%'
and FirstName like 'j%'

--4.	Display all the names whose are either four or five characters.
Select * From Student 
Where FirstName like  '____'
or FirstName like '_____'