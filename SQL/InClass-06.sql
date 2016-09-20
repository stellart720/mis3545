use AdventureWorks2012;

/*Activity 1. Using the HumanResource.Employee table, provide a count of the number of employees by job title.  The query should consider only current employees (the CurrentFlag must equal 1).  */
SELECT JobTitle, COUNT(BusinessEntityID) as Number
FROM HumanResources.Employee
WHERE CurrentFlag = 1
GROUP BY JobTitle;

/*In PPT: Having */
SELECT TerritoryID, OrderDate, Count(SalesOrderID) as Number, Sum(TotalDue) as Amt_Due
FROM Sales.SalesOrderHeader
WHERE OrderDate < '2007-01-01'
Group by TerritoryID, OrderDate
having sum(TotalDue) >= 5000
Order by Sum(TotalDue) DESC;

/*Activity 2. Modify the query you created in Activity 1 so that the output shows only those job titles for which there is more than 1 employee.  */
SELECT JobTitle, COUNT(BusinessEntityID) as Number
FROM HumanResources.Employee
WHERE CurrentFlag = 1
GROUP BY JobTitle
Having Count(BusinessEntityID) > 1
ORDER BY Count(BusinessEntityID) DESC;


/* IN PPT: without 'INNER JOIN'*/
SELECT s.SalesOrderID,
s.OrderQty,
s.UnitPrice,
s.LineTotal,
p.Name
FROM sales.SalesOrderDetail as s, production.product as p
WHERE s.ProductID=p.ProductID;

/*Inner Join*/
SELECT  s.SalesOrderID,
s.OrderQty,
s.UnitPrice,
s.LineTotal,
p.Name
FROM sales.SalesOrderDetail as s Inner Join production.product as p
on  s.ProductID=p.ProductID;

/*In PPT: Sequential JOINs*/
SELECT S.Name as store, PA.City, SP.Name as State, CR.Name as CountryRegion
FROM Sales.store as S JOIN Person.BusinessEntityAddress as A
on a.BusinessEntityID=s.BusinessEntityID
JOIN person.Address as PA
on A.AddressID =pa.AddressID
JOIN Person.StateProvince as SP
on SP.StateProvinceID = PA.stateProvinceID
JOIN Person.CountryRegion as CR
on CR.CountryRegionCode = SP.CountryRegionCode
ORDER BY S.Name;

/*Activity 3. For each product, show its ProductID and Name (FROM the ProductionProduct table) and the location of its inventory (FROM the Product.Location table) and amount of inventory held at that location (FROM the Production.ProductInventory table).*/
SELECT pp.ProductID, pp.Name as Product_Name,  PL.Name as Location, i.Quantity
FROM Production.Product as  pp
JOIN  Production.ProductInventory as i
ON pp.ProductID = i.ProductID
JOIN Production.Location as PL
On PL.LocationID = I.LocationID;


/*In PPT: Outer Join. Check out the bottom of the resuls. Compare the results with the results of INNER JOIN*/
SELECT s.SalesOrderID,
s.OrderQty,
p.ProductID,
p.Name
FROM sales.SalesOrderDetail as s
RIGHT OUTER JOIN production.product as p
ON s.ProductID=p.ProductID;



/*Activity 4. Find the product model IDs that have no product associated with them.  
To do this, first do an outer join between the Production.Product table and the Production.ProductModel table in such a way that the ID from the ProductModel table always shows, even if there is no product associate with it.  
Then, add a WHERE clause to specify that the ProductID IS NULL 
*/

