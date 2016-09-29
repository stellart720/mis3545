use AdventureWorksDW2012;

/*Employees whose birthday is in Feburary*/
SELECT *
FROM DimEmployee
WHERE Month(BirthDate) = 2;

/*who are the Sales Representatives whose birthday is in Feburary?*/
SELECT *
FROM DimEmployee
WHERE Month(BirthDate) = 2
AND Title = 'Sales Representative';

/*List all the sales processed by these Sales Representatives */
SELECT s.*, e.FirstName, e.LastName
FROM FactResellerSales as s 
JOIN DimEmployee as e
ON s.EmployeeKey = e.EmployeeKey
WHERE Month(e.BirthDate) = 2
AND e.Title = 'Sales Representative';


/*who is a better sales representative that was born in Feburary?*/
SELECT sum(s.SalesAmount), e.FirstName, e.LastName
FROM FactResellerSales as s 
JOIN DimEmployee as e
ON s.EmployeeKey = e.EmployeeKey
WHERE Month(e.BirthDate) = 2
AND e.Title = 'Sales Representative'
GROUP BY e.FirstName, e.LastName;




/*total Amount of off-line sales in Massachusetts*/


/*Sales Amount of Internet Sales in 1st quarter each year in each country*/