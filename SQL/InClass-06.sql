use AdventureWorks2012;

/*Activity 1. Using the HumanResource.Employee table, provide a count of the number of employees by job title.  The query should consider only current employees (the CurrentFlag must equal 1).  */
SELECT JobTitle, COUNT(BusinessEntityID) AS Number
FROM HumanResources.Employee
WHERE CurrentFlag = 1
GROUP BY JobTitle;


/*Activity 2. Modify the query you created in Activity 1 so that the output shows only those job titles for which there is more than 1 employee.  */
SELECT JobTitle, COUNT(BusinessEntityID) AS Number
FROM HumanResources.Employee
WHERE CurrentFlag = 1
GROUP BY JobTitle
Having Count(BusinessEntityID) > 1
ORDER BY Count(BusinessEntityID) DESC;


/*Activity 3. For each product, show its ProductID and Name (FROM the ProductionProduct table) and the location of its inventory (FROM the Product.Location table) and amount of inventory held at that location (FROM the Production.ProductInventory table).*/
SELECT pp.ProductID, pp.Name AS Product_Name,  PL.Name AS Location, i.Quantity
FROM Production.Product AS  pp
JOIN  Production.ProductInventory AS i
ON pp.ProductID = i.ProductID
JOIN Production.Location AS PL
On PL.LocationID = I.LocationID;



/*Activity 4. Find the product model IDs that have no product associated with them.  
To do this, first do an outer join between the Production.Product table and the Production.ProductModel table in such a way that the ID FROM the ProductModel table always shows, even if there is no product associate with it.  
Then, add a WHERE clause to specify that the ProductID IS NULL 
*/

SELECT m.ProductModelID, m.Name AS model_name,  p.ProductID,  p.Name AS product_name
FROM Production.ProductModel AS m
left outer join Production.Product AS p
ON p.ProductModelID=m.ProductModelID
WHERE p.ProductID is null;
