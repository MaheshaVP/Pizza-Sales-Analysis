SELECT SUM(total_price) AS Total_Revenue 
FROM pizza_sales;

Select * from pizza_sales;

select sum(total_price) / count(distinct order_id) as Average_Order_Value
from pizza_sales;

select sum(quantity) as Total_Pizz_Sold
from pizza_sales;

SELECT cast(cast(SUM(quantity) as decimal(10,2)) / 
cast(COUNT(DISTINCT order_id) as decimal(10,2)) as decimal(10,2)) AS Average_Orders
FROM pizza_sales;

SELECT DATENAME(DW, order_date) as Order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(dw, order_date);

SELECT DATENAME(month, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(month, order_date)
ORDER BY Total_Orders DESC;

SELECT pizza_category, sum(total_price) as Total_Sales,
round(SUM(total_price) * 100 / 
(select sum(total_price) from pizza_sales),2) AS sales_percentage
from pizza_sales
Group by pizza_category;

SELECT pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales,
cast(SUM(total_price) * 100 / 
(select sum(total_price) from pizza_sales where DATEPART(quarter, order_date) = 1) as decimal(10,2)) AS PCT
from pizza_sales
where DATEPART(quarter, order_date) = 1
Group by pizza_size
ORDER BY PCT desc;

SELECT TOP 5 pizza_name, SUM(total_price) as Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue desc;

SELECT TOP 5 pizza_name, SUM(total_price) as Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue asc;

SELECT TOP 5 pizza_name, SUM(quantity) as Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC;
