--SELECT ssh.OrderDate, ssh.ShipDate, ssh.ShipMethodID, ssh.TerritoryID, ssh.CustomerID, ssh.CreditCardApprovalCode, ssh.OnlineOrderFlag, 
--	ssh.ShipToAddressID, 
--  ssh.BillToAddressID, ssd.OrderQty, ssd.UnitPrice, ssd.UnitPriceDiscount, ssh.TotalDue
--FROM Sales.SalesOrderHeader AS ssh
--INNER JOIN Sales.SalesOrderDetail AS ssd
--ON ssh.SalesOrderID = ssd.SalesOrderID


--SELECT COUNT(*)
--FROM features_table
--WHERE CreditCardApprovalCode IS NULL;


--WITH ModePerTerritory AS (
--    SELECT 
--        TerritoryID,
--        CreditCardApprovalCode,
--        ROW_NUMBER() OVER (PARTITION BY TerritoryID ORDER BY COUNT(*) DESC) AS rn
--    FROM [features_table]
--    WHERE CreditCardApprovalCode IS NOT NULL
--    GROUP BY TerritoryID, CreditCardApprovalCode
--)
--SELECT TerritoryID, CreditCardApprovalCode
--FROM ModePerTerritory
--WHERE rn = 1;


--WITH ModePerTerritory AS (
--    SELECT 
--        TerritoryID,
--        CreditCardApprovalCode,
--        ROW_NUMBER() OVER (PARTITION BY TerritoryID ORDER BY COUNT(*) DESC) AS rn
--    FROM [features_table]
--    WHERE CreditCardApprovalCode IS NOT NULL
--    GROUP BY TerritoryID, CreditCardApprovalCode
--)
--UPDATE ft
--SET ft.CreditCardApprovalCode = (
--    SELECT mpt.CreditCardApprovalCode
--    FROM ModePerTerritory mpt
--    WHERE mpt.TerritoryID = ft.TerritoryID AND mpt.rn = 1
--)
--FROM [features_table] ft
--WHERE ft.CreditCardApprovalCode IS NULL;

