sql-- ============================================================
-- AULA 3 — JOIN
-- ============================================================

-- Query 11
-- Pergunta: Qual o nome da empresa em cada pedido?
-- Tabelas: Orders, Customers
-- Resultado: OrderID + CompanyName + OrderDate + ShipCountry

SELECT  o.OrderID,
        c.CompanyName,
        o.OrderDate,
        o.ShipCountry
FROM    Orders    AS o
JOIN    Customers AS c ON o.CustomerID = c.CustomerID
LIMIT 15;

-- Query 12
-- Pergunta: Quais produtos pertencem a qual categoria?
-- Tabelas: Products, Categories
-- Resultado: 77 linhas — CategoryName resolvido via JOIN

SELECT  p.ProductName,
        p.UnitPrice,
        c.CategoryName
FROM    Products   AS p
JOIN    Categories AS c ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName, p.UnitPrice DESC;

-- Query 13
-- Pergunta: Quantos pedidos cada cliente fez?
-- Tabelas: Customers, Orders
-- Resultado: TOP — IT (335), B's Beverages (210)

SELECT   c.CompanyName,
         COUNT(o.OrderID) AS TotalPedidos
FROM     Customers AS c
JOIN     Orders    AS o ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
ORDER BY TotalPedidos DESC
LIMIT 10;

-- Query 14
-- Pergunta: Quais clientes nunca fizeram um pedido?
-- Tabelas: Customers, Orders (LEFT JOIN + IS NULL)
-- Resultado: 0 linhas — base integra, todos os clientes têm pedidos

SELECT    c.CompanyName,
          c.Country,
          o.OrderID
FROM      Customers AS c
LEFT JOIN Orders    AS o ON c.CustomerID = o.CustomerID
WHERE     o.OrderID IS NULL;

-- Query 15
-- Pergunta: Quais funcionários processaram mais pedidos e de qual país?
-- Tabelas: Employees, Orders
-- Resultado: Margaret (USA) lidera com 1.908

SELECT   e.FirstName,
         e.Country,
         COUNT(o.OrderID) AS TotalPedidos
FROM     Employees AS e
JOIN     Orders    AS o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.Country
ORDER BY TotalPedidos DESC;
