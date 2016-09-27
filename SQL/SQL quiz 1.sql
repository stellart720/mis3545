use AdventureWorks2012;

/*a.	Show First name and last name of employees whose job title is ¡°Sales Representative¡±, ranking from oldest to youngest. You may use HumanResources.Employee table and Person.Person table. */
SELECT P.FirstName, P.LastName, E.BirthDate
FROM HumanResources.Employee as E
JOIN Person.Person as P
ON E.BusinessEntityID = P.BusinessEntityID
WHERE E.JobTitle = 'Sales Representative'
ORDER BY E.BirthDate;


/*b.	Find out all the products which sold more than $5000 in total. Show product ID and name and total amount collected after selling the products. You may use LineTotal from Sales.SalesOrderDetail table and Production.Product table. */

SELECT S.ProductID, P.Name,SUM(S.LineTotal) as TotalSale
FROM Sales.SalesOrderDetail as S
JOIN  Production.Product as P 
ON S.ProductID = P.ProductID
GROUP BY S.ProductID, P.Name
HAVING SUM(S.LineTotal)>5000;


/*c.	Show BusinessEntityID, territory name and SalesYTD of all sales persons whose SalesYTD is greater than $500,000, regardless of whether they are assigned a territory. You may use Sales.SalesPerson table and Sales.SalesTerritory table. (16 rows)
*/

SELECT st.Name AS Territory, sp.businessentityid, sp.SalesYTD
FROM Sales.SalesTerritory st 
RIGHT OUTER JOIN Sales.SalesPerson sp
ON st.TerritoryID = sp.TerritoryID 
where sp.SalesYTD > $500000;


/*d.	Show the sales order ID of those orders in the year 2005 of which the total due is great than the average total due of all the orders of the same year. */

select SalesOrderID, TotalDue
from sales.SalesOrderHeader
where Year(OrderDate)=2008
and TotalDue>
(select avg(TotalDue)
from sales.SalesOrderHeader
where Year(OrderDate)=2008
) 