use AdventureWorksDW2012;


/*a.	Show total online sales (sum of OrderQuantity), date and product name by every day by every product in 2006. */
select sum(OrderQuantity), FullDateAlternateKey, p.EnglishProductName
from dbo.FactInternetSales as s, dbo.DimDate as d, dbo.DimProduct as p
where s.orderdatekey = d.datekey 
and s.productkey = p.productkey and CalendarYear = 2006
group by FullDateAlternateKey, p.EnglishProductName
order by FullDateAlternateKey, p.EnglishProductName;



/*b.	Based on a, perform an OLAP operation: roll-up. Also, describe how the roll-up is performed in the comment block.*/

select sum(OrderQuantity) as totalQuantity, d.EnglishMonthName, p.EnglishProductName
from dbo.FactInternetSales as s, dbo.DimDate as d, dbo.DimProduct as p
where s.orderdatekey = d.datekey 
and s.productkey = p.productkey 
and CalendarYear = 2006
group by d.EnglishMonthName, p.EnglishProductName
order by d.EnglishMonthName, p.EnglishProductName;


/*b.	Based on a, perform an OLAP operation: slice. Also, describe how the slicing is performed in the comment block.*/

select sum(OrderQuantity), FullDateAlternateKey, p.EnglishProductName
from dbo.FactInternetSales as s, dbo.DimDate as d, dbo.DimProduct as p
where s.orderdatekey = d.datekey 
and s.productkey = p.productkey and CalendarYear = 2006
and EnglishProductName = 'Mountain-100 Black, 38'
group by FullDateAlternateKey, p.EnglishProductName
order by FullDateAlternateKey, p.EnglishProductName;

/*c.	Find out the relationship between quantity of orders and one character of customers (for example, the number of kids or cars.) You don’t need to show the equation, but you need to describe what relationship you want to discover in the comment block.*/
select sum(S.OrderQuantity) as Total_Order_Quantity, C.CommuteDistance
from dbo.FactInternetSales as S 
join dbo.DimCustomer as C
on S.customerkey = C.customerkey
group by C.CommuteDistance
order by sum(S.OrderQuantity) desc;