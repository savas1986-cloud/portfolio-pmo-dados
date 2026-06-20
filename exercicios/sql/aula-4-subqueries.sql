-- ============================================================
-- AULA 4 — SUBQUERIES
-- ============================================================

-- Query 16
-- Pergunta: Quais produtos custam acima da média geral de preço?
-- Média: $28,87 — Resultado: 25 produtos

SELECT ProductName, UnitPrice
FROM   Products
WHERE  UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice DESC;

-- Query 17
-- Pergunta: Quais empresas fizeram mais de 200 pedidos?
-- Tabelas: Customers, Orders (subquery com IN)
-- Resultado: 4 empresas (B's Beverages, Gourmet Lanchonetes, LILA, Ricardo)

SELECT CompanyName, Country
FROM   Customers
WHERE  CustomerID IN (
    SELECT CustomerID FROM Orders
    GROUP BY CustomerID
    HAVING COUNT(*) > 200
);

-- Query 18
-- Pergunta: Qual a média geral de pedidos por cliente?
-- Subquery no FROM — Resultado: 175,07 pedidos/cliente

SELECT AVG(TotalPedidos) AS MediaPedidosPorCliente
FROM (
    SELECT CustomerID, COUNT(*) AS TotalPedidos
    FROM   Orders
    GROUP BY CustomerID
) AS resumo;

-- Query 19
-- Pergunta: Quais funcionários processaram mais pedidos que a média?
-- Subquery aninhada no HAVING — Resultado: Margaret, Nancy, Janet

SELECT   e.FirstName, e.Country,
         COUNT(o.OrderID) AS TotalPedidos
FROM     Employees AS e
JOIN     Orders    AS o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.Country
HAVING   COUNT(o.OrderID) > (
    SELECT AVG(pedidos_por_func)
    FROM (
        SELECT COUNT(*) AS pedidos_por_func
        FROM   Orders
        GROUP BY EmployeeID
    ) AS sub
)
ORDER BY TotalPedidos DESC;

-- Query 20
-- Pergunta: Quais produtos, e de qual categoria, têm preço acima da média geral?
-- JOIN + subquery no WHERE — Resultado: 25 produtos com categoria

SELECT p.ProductName,
       c.CategoryName,
       p.UnitPrice
FROM   Products   AS p
JOIN   Categories AS c ON p.CategoryID = c.CategoryID
WHERE  p.UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY p.UnitPrice DESC;
