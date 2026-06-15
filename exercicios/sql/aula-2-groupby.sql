-- =====================================================
-- MÓDULO 1 — SQL: A Linguagem dos Dados
-- Aula 2: GROUP BY, HAVING, AGREGAÇÃO
-- Base: Northwind (SQLite)
-- Autora: Patricia Vasconcelos
-- Data: Junho/2026
-- =====================================================


-- -----------------------------------------------------
-- QUERY 1 — Pedidos por país
-- Pergunta: Quantos pedidos por país?
-- Tabela: Orders
-- Resultado: 21 linhas retornadas. EUA lideram com 2.328 pedidos.
-- -----------------------------------------------------
SELECT   ShipCountry,
         COUNT(*) AS TotalPedidos
FROM     Orders
GROUP BY ShipCountry
ORDER BY TotalPedidos DESC;


-- -----------------------------------------------------
-- QUERY 2 — Clientes por país
-- Pergunta: Quantos clientes por país ?
-- Tabela: Customers
-- Resultado: 10 linhas
-- Comparativo com a query 1: Os EUA têm 13 clientes, totalizando 2.328 pedidos (média de 179 por cliente)
-- -----------------------------------------------------
SELECT Country, count(*) AS TotalClientes
FROM Customers
GROUP BY Country
ORDER BY TotalClientes DESC
LIMIT 10;


-- -----------------------------------------------------
-- QUERY 3 — Média e preço máximo por categoria de produto
-- Pergunta: Qual categoria tem o produto mais caro? Qual tem a maior média de preço?
-- Tabela: Products
-- Resultado: 8 linhas. A categoria 1 tem o produto mais caro, enquanto a categoria 6, tem a maior média de preço

-- -----------------------------------------------------
SELECT CategoryID, 
	count(*) AS TotalProdutos,
	round(AVG(UnitPrice), 2) AS PrecoMedio,
	MAX(UnitPrice) AS PrecoMaximo
FROM Products
GROUP BY CategoryID
ORDER BY PrecoMedio DESC;


-- -----------------------------------------------------
-- QUERY 4 — Grupos com mais de 500 pedidos
-- Pergunta: Quantos países sobraran? 
-- Tabela: Orders
-- Resultado: 11 linhas. 10 países tiveram menos de 500 pedidos.
-- Insight: 1 linha por pedido, não por cliente
--          → GROUP BY necessário para contar por país
-- -----------------------------------------------------
SELECT ShipCountry, 
	count(*) AS TotalPedidos
FROM Orders
GROUP BY ShipCountry
HAVING count(*) > 500
ORDER BY TotalPedidos DESC;


-- -----------------------------------------------------
-- QUERY 5 — Pedidos por colaborador e país
-- Pergunta: Quantos pedidos os colaboradores de cada país atenderam?
-- Tabela: Order
-- Resultado: 9 linhas. EUA e UK tiveram o maior número de pedidos por colaborador.
-- -----------------------------------------------------
SELECT EmployeeID, ShipCountry,
	COUNT(OrderID) AS TotalPedidos
FROM Orders
GROUP BY EmployeeID
HAVING count(*) >2
ORDER BY ShipCountry DESC;

-- =====================================================
-- PRÓXIMO: Aula 3 — JOIN
-- =====================================================
