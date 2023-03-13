-- CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.
-- Write a query to find the total sales of drugs for each manufacturer. Round your answer to the closest million, and report your results in descending order of total sales.
SELECT manufacturer, CONCAT('$', ROUND(SUM(total_sales)/1000000), ' million') AS sales_mil FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC;