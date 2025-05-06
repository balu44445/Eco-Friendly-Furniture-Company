#1.List of Customers and Their Orders:
SELECT C.FirstName, C.LastName, P.Name AS ProductName, OD.Quantity, OD.UnitPrice
FROM Customer C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Product P ON OD.ProductID = P.ProductID;

#2.Customer Search for Products:
SELECT p.Name AS ProductName, p.Description, p.Price
FROM Product p
WHERE p.Name LIKE '%Table%' OR p.Description LIKE '%Chair%';

#3.List salespersons and their total sales amount:
SELECT s.SalesPersonID, s.Name, SUM(od.Quantity * od.UnitPrice) AS TotalSalesAmount
FROM Salesperson s
LEFT JOIN Orders o ON s.SalesPersonID = o.SalesPersonID
LEFT JOIN `OrderDetails` od ON o.OrderID = od.OrderID
GROUP BY s.SalesPersonID;

#4.Calculate commission for each salesperson:
SELECT o.SalesPersonID, s.Name, SUM(od.Quantity * od.UnitPrice) AS
 TotalSales, s.CommissionRate, (SUM(od.Quantity * od.UnitPrice) * s.CommissionRate) AS Commission
FROM Orders o
JOIN Salesperson s ON o.SalesPersonID = s.SalesPersonID
JOIN `OrderDetails` od ON o.OrderID = od.OrderID
GROUP BY o.SalesPersonID;
 
#5.List product sales by color:
SELECT p.Name AS ProductName, pc.Color, SUM(od.Quantity) AS TotalQuantitySold
FROM Product p
JOIN ProductColors pc ON p.ProductID = pc.ProductID
JOIN `OrderDetails` od ON p.ProductID = od.ProductID
GROUP BY p.Name, pc.Color;
SELECT p.Name AS ProductName, pc.Color,od.Quantity AS TotalQuantitySold,od.OrderID,od.ProductID,od.Color
FROM Product p
JOIN ProductColors pc ON p.ProductID = pc.ProductID
JOIN `OrderDetails` od ON p.ProductID = od.ProductID;


#6.Check Quantity status for a specific product:
SELECT p.Name, ps.ProductSize, pm.MaterialType, SUM(od.Quantity) AS TotalQuantity
FROM Product p
LEFT JOIN ProductSizes ps ON p.ProductID = ps.ProductID
LEFT JOIN ProductMaterials pm ON p.ProductID = pm.ProductID
LEFT JOIN `OrderDetails` od ON p.ProductID = od.ProductID
WHERE p.ProductID = 32
GROUP BY p.Name, ps.ProductSize, pm.MaterialType;

#7.update salesperson for a specific store:
UPDATE Orders
SET SalesPersonID = 249
WHERE StoreNumber = 2;

#8.Update store for a specific store:
UPDATE Store
SET StoreName = 'Hicksville'
WHERE StoreNumber = 3;

#9.List customers who made purchases exceeding a certain amount:
SELECT C.FirstName, C.LastName, SUM(OD.Quantity * OD.UnitPrice) AS TotalPurchases
FROM Customer C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
LEFT JOIN OrderDetails OD ON O.OrderID = OD.OrderID
GROUP BY C.CustomerID
HAVING TotalPurchases > 100;

#10.Retrieve all products along with their types and categories.
SELECT p.Name AS ProductName, pt.Description AS ProductType, p.CategoryID
FROM Product p
LEFT JOIN ProductType pt ON p.ProductType = pt.`ProductType Code`;

#11.Retrive all Product with their MaterialType
SELECT p.ProductID, p.Name, pm.MaterialType 
FROM Product p 
LEFT JOIN ProductMaterials pm ON p.ProductID = pm.ProductID;
#12.Count the number of times each product has been used with each material: 
SELECT ProductID, MaterialType, COUNT(*) as Count 
FROM ProductMaterials 
GROUP BY ProductID, MaterialType;







#Stored Procedure

#stored procedure that updates the salesperson for a specific store:

DELIMITER //
CREATE PROCEDURE UpdateSalespersonForStore (IN new_salesperson_id INT, IN store_number INT)
BEGIN
  UPDATE Orders
  SET SalesPersonID = 250
  WHERE StoreNumber = 3;
END//
DELIMITER ;




