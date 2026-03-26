# Chinook SQL Business Analysis

## 1. Project Objective
This project analyses sales and customer data from a digital music store (Chinook database) to understand:

- Which countries and customers generate the most revenue
- Which products (tracks, genres, artists) drive revenue
- What patterns exist in customer purchasing behaviour

The goal is to generate actionable business insights that could help increase revenue, as well as improve marketing focus and customer retention.

### 1.1. Dataset
The Chinook database simulates a digital music store and includes the following tables:

<p align="left">
  <img src="images/chinook_schema.png" width="700"/>
</p>

Relationships between these tables allow for analysis across customers, regions, products, and transactions.

### 1.2 Tools Used
- SQL (SQLite)
- DBeaver

## 2. Key Analysis & Insights
The analysis below answers the primary business questions outlined in the project objective.

### 2.1. Revenue by Country
Which countries generate the highest total revenue?

#### SQL Query
  ```sql
  SELECT
      i.BillingCountry AS country,
      SUM(i.Total) AS total_revenue
  FROM Invoice AS i
  GROUP BY i.BillingCountry
  ORDER BY total_revenue DESC;
  ```
| country          | total_revenue |
|------------------|--------------|
| USA              | 523.06       |
| Canada           | 303.96       |
| France           | 195.10       |
| Brazil           | 190.10       |
| Germany          | 156.48       |

Revenue is highest in the USA, which generates significantly more than any other country. There is a noticeable drop after the top few countries, suggesting that most revenue comes from a small number of key markets. This could indicate strong performance in those regions, but also shows that revenue is not widely spread across all countries.

---
### 2.2. Revenue by Customer
Which customers generate the highest total revenue?

#### SQL Query
  ```sql
SELECT 
	c.FirstName || ' ' || c.LastName AS customer_name,
	c.Country,
	SUM(i.Total) AS revenue_per_customer
FROM Invoice AS i 
LEFT JOIN Customer AS c
ON i.CustomerId = c.CustomerId
GROUP BY customer_name, c.Country
ORDER BY revenue_per_customer DESC;
  ```
| customer_name             | Country          | revenue_per_customer |
|---------------------------|------------------|-------------|
| Helena Holý               | Czech Republic   | 49.62       |
| Richard Cunningham        | USA              | 47.62       |
| Luis Rojas                | Chile            | 46.62       |
| ...                       | ...              | ...         |
| Stanisław Wójcik          | Poland           | 37.62       |
| Steve Murray              | United Kingdom   | 37.62       |
| Puja Srivastava           | India            | 36.64       |

Top customers are distributed across multiple countries relatively evenly, not just the USA. This suggests that while the USA leads overall revenue, high-value customers exist globally.

---
### 2.3. Customer count by Country 
How big is the customer base in each country?

#### SQL Query
```sql
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
SELECT
    Country,
    COUNT(*) AS customer_count,
    ROUND(AVG(customer_revenue), 2) AS average_customer_revenue
FROM customer_revenue
GROUP BY Country
ORDER BY customer_count DESC;
```
| Country   | customer_count | avg_revenue |
|-------------------|---------------|-------------|
| USA               | 13            | 40.24       |
| Canada            | 8             | 37.99       |
| France            | 5             | 39.02       |
| Brazil            | 5             | 38.02       |
| Germany           | 4             | 39.12       |
| United Kingdom    | 3             | 37.62       |
| Portugal          | 2             | 38.62       |
| India             | 2             | 37.63       |
| Czech Republic    | 2             | 45.12       |
| Sweden            | 1             | 38.62       |
| ...         | ...            | ...       |
| Argentina         | 1             | 37.62       |

---
### 2.4. Revenue by Genre
Analysed total revenue, units sold, and average price per genre.
Rock is the dominant genre in both revenue and sales volume.
Revenue differences are driven by purchase volume rather than pricing, as most tracks are priced similarly.




### 2.5. Revenue by Country and Genre
Combined geographic and product analysis to identify genre preferences by country.
Rock consistently performs well across multiple countries, indicating broad global appeal.
Some variation exists, but overall genre preferences are relatively consistent across markets.




### 2.6. Customer Purchasing Behaviour
Analysed order frequency, total spend, and average order value per customer.
Customers tend to generate higher revenue through repeat purchases rather than significantly higher spend per order.
This indicates that purchase frequency is a key driver of customer value.












