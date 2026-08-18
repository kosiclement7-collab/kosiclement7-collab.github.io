-- SALES PERFORMANCE SQL DATA ANALYSIS
-- Author: Chukwu Clement
-- Database: SQLite

-- 1. CREATE TABLE
CREATE TABLE sales (
    order_id INTEGER,
    order_date TEXT,
    customer_name TEXT,
    product TEXT,
    category TEXT,
    quantity INTEGER,
    unit_price REAL,
    total_sales REAL
);

-- 2. INSERT DATA
INSERT INTO sales
(order_id, order_date, customer_name, product, category, quantity, unit_price, total_sales)
VALUES
(1001, '2026-01-05', 'John Ade', 'Laptop', 'Electronics', 2, 450000, 900000),
(1002, '2026-01-07', 'Mary James', 'Mouse', 'Accessories', 5, 12000, 60000),
(1003, '2026-01-10', 'David Okafor', 'Keyboard', 'Accessories', 3, 18000, 54000),
(1004, '2026-01-12', 'Grace Peter', 'Monitor', 'Electronics', 2, 250000, 500000),
(1005, '2026-01-15', 'Michael Obi', 'Office Chair', 'Furniture', 4, 150000, 600000),
(1006, '2026-01-18', 'Sarah Bello', 'Laptop', 'Electronics', 1, 450000, 450000),
(1007, '2026-01-20', 'Daniel Musa', 'Printer', 'Electronics', 2, 180000, 360000),
(1008, '2026-01-23', 'Esther Paul', 'Desk', 'Furniture', 3, 120000, 360000),
(1009, '2026-01-25', 'Samuel James', 'Mouse', 'Accessories', 10, 12000, 120000),
(1010, '2026-01-28', 'Blessing Eze', 'Monitor', 'Electronics', 3, 250000, 750000),
(1011, '2026-02-02', 'Chris Uche', 'Laptop', 'Electronics', 2, 450000, 900000),
(1012, '2026-02-05', 'Jennifer Ali', 'Keyboard', 'Accessories', 6, 18000, 108000),
(1013, '2026-02-08', 'Emeka Nnamdi', 'Office Chair', 'Furniture', 2, 150000, 300000),
(1014, '2026-02-11', 'Peace John', 'Printer', 'Electronics', 1, 180000, 180000),
(1015, '2026-02-15', 'Frank David', 'Desk', 'Furniture', 4, 120000, 480000);

-- 3. KEY PERFORMANCE INDICATORS

-- Total revenue
SELECT SUM(total_sales) AS total_revenue
FROM sales;

-- Total units sold
SELECT SUM(quantity) AS total_units_sold
FROM sales;

-- Total orders
SELECT COUNT(order_id) AS total_orders
FROM sales;

-- Average order value
SELECT ROUND(AVG(total_sales), 2) AS average_order_value
FROM sales;

-- Highest-value order
SELECT order_id, customer_name, product, quantity, total_sales
FROM sales
ORDER BY total_sales DESC
LIMIT 1;

-- 4. REVENUE BY PRODUCT
SELECT
    product,
    SUM(total_sales) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

-- 5. REVENUE BY CATEGORY
SELECT
    category,
    SUM(total_sales) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

-- 6. TOP CUSTOMERS
SELECT
    customer_name,
    SUM(total_sales) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC;

-- 7. MONTHLY REVENUE
SELECT
    strftime('%Y-%m', order_date) AS month,
    SUM(total_sales) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 8. BEST-SELLING PRODUCTS BY QUANTITY
SELECT
    product,
    SUM(quantity) AS units_sold
FROM sales
GROUP BY product
ORDER BY units_sold DESC;

-- 9. REVENUE CONTRIBUTION BY PRODUCT
SELECT
    product,
    SUM(total_sales) AS total_revenue,
    ROUND(
        SUM(total_sales) * 100.0 /
        (SELECT SUM(total_sales) FROM sales),
        2
    ) AS revenue_percentage
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;

-- 10. ORDERS BY CATEGORY
SELECT
    category,
    COUNT(order_id) AS number_of_orders
FROM sales
GROUP BY category
ORDER BY number_of_orders DESC;

-- 11. AVERAGE ORDER VALUE BY CATEGORY
SELECT
    category,
    ROUND(AVG(total_sales), 2) AS average_order_value
FROM sales
GROUP BY category
ORDER BY average_order_value DESC;

-- 12. PRODUCT PERFORMANCE WITHIN CATEGORIES
SELECT
    category,
    product,
    SUM(total_sales) AS total_revenue
FROM sales
GROUP BY category, product
ORDER BY category, total_revenue DESC;

-- 13. DAILY SALES PERFORMANCE
SELECT
    strftime('%d', order_date) AS day,
    SUM(total_sales) AS daily_revenue
FROM sales
GROUP BY day
ORDER BY daily_revenue DESC;

-- 14. FINAL KPI SUMMARY
SELECT
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    SUM(total_sales) AS total_revenue,
    ROUND(AVG(total_sales), 2) AS average_order_value,
    MAX(total_sales) AS highest_order_value,
    MIN(total_sales) AS lowest_order_value
FROM sales;

-- VERIFIED KPI RESULTS FROM THE DATABASE:
-- Total orders: 15
-- Total units sold: 50
-- Total revenue: ₦6,122,000
-- Average order value: ₦408,133.33
-- Best-selling product by quantity: Mouse (15 units)

-- PROJECT SUMMARY
-- This project analyzes sales performance using SQL.
-- It covers revenue, order volume, product performance,
-- category performance, customer spending and monthly trends.
