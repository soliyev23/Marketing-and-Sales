USE AdventureWorks2022
SELECT  
		pp.MakeFlag,
		pp.Color,

		ssh.SalesOrderID, 
		ssh.OrderDate, 
		ssh.OnlineOrderFlag,

		sst.Name, 
		sst.CountryRegionCode, 
		sst.Group_P, 

		ssh.SubTotal, 
		ssh.TaxAmt, 
		ssh.Freight,
		ssh.TotalDue,

		ssd.UnitPrice

INTO marketin_sales_table
FROM Sales.SalesOrderDetail AS ssd
LEFT JOIN Sales.SalesOrderHeader AS ssh
ON ssh.SalesOrderID = ssd.SalesOrderID

INNER JOIN Sales.SalesTerritory AS sst
ON ssh.TerritoryID = sst.TerritoryID

INNER JOIN Production.Product AS pp
ON pp.ProductID = ssd.ProductID;
