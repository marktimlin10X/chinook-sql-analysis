WITH customer_revenue AS 
	(
	SELECT
        c.CustomerId,
        c.Country,
        SUM(i.Total) AS customer_revenue
    FROM Customer c
    LEFT JOIN Invoice i
        ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId, c.Country
    )
-- customer count and average customer revenue per country
SELECT
    Country,
    COUNT(*) AS customer_count,
    ROUND(AVG(customer_revenue), 2) AS average_customer_revenue
FROM customer_revenue
GROUP BY Country
ORDER BY customer_count DESC;
