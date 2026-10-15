CREATE DATABASE retail_sales_analysis;

USE retail_sales_analysis;

-- 1. Overall Sales KPIs
-- Summary of total revenue, units sold, unique orders, and customers.
SELECT
    ROUND(SUM(Revenue), 2) AS TotalRevenue,
    SUM(Quantity) AS TotalUnits,
    COUNT(DISTINCT Invoice) AS TotalOrders,
    COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM clean_sales_base;


-- 2. Monthly Sales Trend
-- Shows monthly revenue and units sold over time.
SELECT
    MonthStart,
    ROUND(SUM(Revenue), 2) AS MonthlyRevenue,
    SUM(Quantity) AS MonthlyUnitss
FROM clean_sales_base
GROUP BY MonthStart, Year, Month
ORDER BY Year, Month;

-- 3. Top Products by Revenue
-- Identifies the top 10 products generating the highest revenue.
SELECT
    StockCode,
    Description,
    ROUND(SUM(Revenue), 2) AS TotalRevenue
FROM clean_sales_base
GROUP BY StockCode, Description
ORDER BY TotalRevenue DESC
LIMIT 10;


-- 4. Top Products by Units Sold
-- Identifies the top 10 products based on total units sold.
SELECT
    StockCode,
    Description,
    SUM(Quantity) AS TotalUnits
FROM clean_sales_base
GROUP BY StockCode, Description
ORDER BY TotalUnits DESC
LIMIT 10;

-- 5. Sales by Country
-- Compares revenue and units sold across the top 10 countries.
SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS TotalRevenue,
    SUM(Quantity) AS TotalUnits
FROM clean_sales_base
GROUP BY Country
ORDER BY TotalRevenue DESC
LIMIT 10;
