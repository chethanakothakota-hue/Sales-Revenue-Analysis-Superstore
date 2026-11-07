SELECT * FROM superstore WHERE ROWNUM <= 10;

SELECT SUM(sales) AS total_sales FROM superstore;

SELECT SUM(profit) AS total_profit FROM superstore;

SELECT COUNT(DISTINCT order_id) AS total_orders FROM superstore;

SELECT SUM(quantity) AS total_quantity FROM superstore;

SELECT AVG(sales) AS average_sales FROM superstore;

SELECT MAX(sales) AS highest_sales FROM superstore;

SELECT MIN(sales) AS lowest_sales FROM superstore;

SELECT category, SUM(sales) AS total_sales
FROM superstore
GROUP BY category;

SELECT region, SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;
-- 11. Sales by Category and Sub-Category
SELECT category, sub_category, SUM(sales) AS total_sales
FROM superstore
GROUP BY category, sub_category
ORDER BY total_sales DESC;

-- 12. Top 10 Best-Selling Products
SELECT *
FROM (
    SELECT product_name, SUM(sales) AS total_sales
    FROM superstore
    GROUP BY product_name
    ORDER BY total_sales DESC
)
WHERE ROWNUM <= 10;

-- 13. Sales by Segment
SELECT segment, SUM(sales) AS total_sales
FROM superstore
GROUP BY segment;

-- 14. Profit by Category
SELECT category, SUM(profit) AS total_profit
FROM superstore
GROUP BY category;

-- 15. Top 10 Customers by Sales
SELECT *
FROM (
    SELECT customer_name, SUM(sales) AS total_sales
    FROM superstore
    GROUP BY customer_name
    ORDER BY total_sales DESC
)
WHERE ROWNUM <= 10;

-- 16. Monthly Sales
SELECT TO_CHAR(order_date, 'YYYY-MM') AS month,
       SUM(sales) AS total_sales
FROM superstore
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY month;

-- 17. Loss-Making Products
SELECT product_name, SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit;

-- 18. Sales by State
SELECT state, SUM(sales) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC;

-- 19. Orders by Shipping Mode
SELECT ship_mode, COUNT(DISTINCT order_id) AS total_orders
FROM superstore
GROUP BY ship_mode;

-- 20. Average Discount by Category
SELECT category, AVG(discount) AS average_discount
FROM superstore
GROUP BY category;