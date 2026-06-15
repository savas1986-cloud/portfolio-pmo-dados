-- =====================================================
-- MÓDULO 1 — SQL: A Linguagem dos Dados
-- Aula 1: SELECT, WHERE, ORDER BY, LIMIT
-- Base: Northwind (SQLite)
-- Autora: Patricia Vasconcelos
-- Data: Junho/2026
-- =====================================================


-- -----------------------------------------------------
-- QUERY 1 — Exploração inicial da tabela Customers
-- Pergunta: Quais colunas existem na tabela Customers?
-- Tabela: Customers
-- Resultado: 10 linhas retornadas
-- -----------------------------------------------------
SELECT *
FROM   Customers
LIMIT  10;


-- -----------------------------------------------------
-- QUERY 2 — Clientes da Alemanha
-- Pergunta: Quais clientes estão na Alemanha?
-- Tabela: Customers
-- Resultado: 11 linhas
-- Erro corrigido: CustomerName → CompanyName
-- -----------------------------------------------------
SELECT CustomerID,
       CompanyName,
       City
FROM   Customers
WHERE  Country = 'Germany'
ORDER BY CompanyName ASC;


-- -----------------------------------------------------
-- QUERY 3 — Produtos caros com estoque disponível
-- Pergunta: Produtos acima de $20 com estoque > 0?
-- Tabela: Products
-- Resultado: 33 linhas
-- Produto mais caro: Côte de Blaye — $263,50
-- -----------------------------------------------------
SELECT ProductName,
       UnitPrice,
       UnitsInStock
FROM   Products
WHERE  UnitPrice    > 20
  AND  UnitsInStock > 0
ORDER BY UnitPrice DESC;


-- -----------------------------------------------------
-- QUERY 4 — Pedidos para EUA ou Brasil
-- Pergunta: Pedidos enviados para EUA ou Brasil?
-- Tabela: Orders
-- Resultado: 4.011 linhas
-- Insight: 1 linha por pedido, não por cliente
--          → GROUP BY necessário para contar por país
-- -----------------------------------------------------
SELECT OrderID,
       CustomerID,
       ShipCountry
FROM   Orders
WHERE  ShipCountry = 'USA'
   OR  ShipCountry = 'Brazil'
ORDER BY ShipCountry;


-- -----------------------------------------------------
-- QUERY 5 — Funcionários nos EUA (exploração livre)
-- Pergunta: Quais colaboradores estão alocados nos EUA?
-- Tabela: Employees
-- Resultado: 5 colaboradores
-- Destaque: tabela nova explorada por iniciativa própria
-- -----------------------------------------------------
SELECT FirstName,
       Title,
       Country
FROM   Employees
WHERE  Country = 'USA'
ORDER BY Title;


-- =====================================================
-- PRÓXIMO: Aula 2 — GROUP BY e Agregações
-- COUNT · SUM · AVG · MAX · MIN
-- =====================================================
