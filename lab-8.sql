-----------####################### LAB 8 #######################--------------------------

create table Sales_Data
(Region	varchar(50),
Product	varchar(50),
Sales_Amount int,
Year int)

INSERT INTO Sales_Data VALUES ('North America', 'Watch', 1500, 2023);
INSERT INTO Sales_Data VALUES ('Europe', 'Mobile', 1200, 2023);
INSERT INTO Sales_Data VALUES ('Asia', 'Watch', 1800, 2023);
INSERT INTO Sales_Data VALUES ('North America', 'TV', 900, 2024);
INSERT INTO Sales_Data VALUES ('Europe', 'Watch', 2000, 2024);
INSERT INTO Sales_Data VALUES ('Asia', 'Mobile', 1000, 2024);
INSERT INTO Sales_Data VALUES ('North America', 'Mobile', 1600, 2023);
INSERT INTO Sales_Data VALUES ('Europe', 'TV', 1500, 2023);
INSERT INTO Sales_Data VALUES ('Asia', 'TV', 1100, 2024);
INSERT INTO Sales_Data VALUES ('North America', 'Watch', 1700, 2024);

select * from Sales_Data

----------####################### PART A ##############---------------------

--1.Display Total Sales Amount by Region.
select Region,sum(Sales_Amount) from Sales_Data
group by Region

--2.Display Average Sales Amount by Product
select Product,avg(Sales_Amount) from Sales_Data
group by Product

--3.Display Maximum Sales Amount by Year
select Year,max(Sales_Amount) from Sales_Data
group by Year

--4.Display Minimum Sales Amount by Region and Year
select Region,Year,min(Sales_Amount) from Sales_Data
group by Region,Year

--5.Count of Products Sold by Region
select Region,count(Product) from Sales_Data
group by Region

--6.Display Sales Amount by Year and Product
select Product,Year,min(Sales_Amount) from Sales_Data
group by Product,Year

--7.Display Regions with Total Sales Greater Than 5000
select Region,sum(Sales_Amount) from Sales_Data
group by Region
having sum(Sales_Amount)>5000

--8.Display Products with Average Sales Less Than 10000
select Product,avg(Sales_Amount) from Sales_Data
group by Product
having avg(Sales_Amount)<10000

--9.Display Years with Maximum Sales Exceeding 500
select Year,max(Sales_Amount) from Sales_Data
group by Year
having max(Sales_Amount)>500

--10.Display Regions with at Least 3 Distinct Products Sold.
select Region from Sales_Data
group by Region
having COUNT(distinct Product)>=3

--11.Display Years with Minimum Sales Less Than 1000
select Year,min(Sales_Amount) from Sales_Data
group by Year
having min(Sales_Amount)<1000

--12.Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount
select Region,sum(Sales_Amount) from Sales_Data
where Year=2023
group by Region
order by sum(Sales_Amount)


------#################### PART B ####################-----------------


--1.Display Count of Orders by Year and Region, Sorted by Year and Region
Select Year,Region,SUM(Sales_Amount) From Sales_Data
Group by Year, Region 
Order by Year,Region 

--2.Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region
select Region,max(Sales_Amount) from Sales_Data
group by Region
having max(Sales_Amount)>1000
order by Region

--3.Display Years with Total Sales Amount Less Than 1000, Sorted by Year Descending
Select Year , Sum(Sales_Amount) From Sales_Data
Group by Year
having SUM(Sales_Amount) >1000
order by Year desc

--4.Display Top 3 Regions by Total Sales Amount in Year 2024
Select Top 3 Region,SUM(Sales_Amount) From Sales_Data
where Year = 2024
group by Region
order by SUM(Sales_Amount) desc

------------################## PART C ##############-----------------

--1.Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name
Select Product , AVG(Sales_Amount) From Sales_Data
Group by Product
Having AVG(Sales_Amount) between 1000 and 2000
order by Product

--2.Display Years with More Than 5 Orders from Each Region
Select Region,Count(Year) From Sales_Data
group by Region,Year
Having COUNT(Year) >5

--3.Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
Select Region ,AVG(Sales_Amount) From Sales_Data
Where Year = 2023 
group by Region,Sales_Amount
Having AVG(Sales_Amount) > 1500
order by Sales_Amount desc

--4. Find out region wise duplicate product.
select Region,Product from Sales_Data
group by Region,Product

--5. Find out region wise highest sales amount.
select Region from Sales_Data
group by Region
having Sales_Amount=MAX(Sales_Amount)
