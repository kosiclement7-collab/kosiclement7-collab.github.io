# Sales Performance SQL Data Analysis

## Project Overview

This project analyzes sales data using SQL to identify revenue trends, product performance, customer spending patterns, and category performance.

The analysis demonstrates practical SQL skills including data aggregation, filtering, grouping, sorting, date analysis, and business KPI calculations.

---

## Business Objective

The objective of this project is to answer important business questions such as:

- What is the total revenue?
- How many orders were made?
- How many units were sold?
- What is the average order value?
- Which products generate the most revenue?
- Which products sell the most units?
- Which category generates the most revenue?
- Which customers spend the most?
- How does revenue change over time?

---

## Dataset

The dataset contains sales transaction information including:

| Column | Description |
|---|---|
| order_id | Unique order identification number |
| order_date | Date of the order |
| customer_name | Customer name |
| product | Product purchased |
| category | Product category |
| quantity | Number of units purchased |
| unit_price | Price per unit |
| total_sales | Total value of the order |

---

## Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Orders | 15 |
| Total Units Sold | 50 |
| Total Revenue | ₦6,122,000 |
| Average Order Value | ₦408,133.33 |

---

## SQL Analysis

### 1. Total Revenue

```sql
SELECT SUM(total_sales) AS total_revenue
FROM sales;SELECT SUM(quantity) AS total_units_sold
FROM sales;SELECT
    product,
    SUM(total_sales) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;SELECT
    category,
    SUM(total_sales) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;SELECT
    strftime('%Y-%m', order_date) AS month,
    SUM(total_sales) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;SELECT
    product,
    SUM(quantity) AS units_sold
FROM sales
GROUP BY product
ORDER BY units_sold DESC;Key Insights
Product Performance
The Laptop is one of the strongest revenue-generating products in the dataset.
The Mouse has the highest sales volume, with 15 units sold.
Category Performance
Electronics is the strongest revenue-generating category.
Sales Volume
The business recorded 50 units sold across 15 orders.
Customer Value
Customer-level analysis can be used to identify high-value customers and understand spending patterns.
Revenue Performance
The business generated ₦6,122,000 in total revenue, with an average order value of ₦408,133.33.
Business Recommendations
Focus marketing efforts on high-performing products such as laptops and monitors.
Maintain sufficient inventory for products with high sales volume, especially mouse.
Investigate opportunities to increase sales of lower-performing products.
Use customer spending data to identify high-value customers for targeted promotions.
Monitor monthly revenue trends to identify periods of strong and weak performance.