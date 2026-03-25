# Chinook SQL Business Analysis

## 1. Project Objective
This project analyses sales and customer data from a digital music store (Chinook database) to understand:

- Which countries and customers generate the most revenue
- Which products (tracks, genres, artists) drive revenue
- What patterns exist in customer purchasing behaviour

The goal is to generate actionable business insights that could help increase revenue, as well as improve marketing focus and customer retention.

### 1.1. Dataset
The Chinook database simulates a digital music store and includes:

- Customers
- Invoices (orders)
- InvoiceLine (individual purchases)
- Tracks
- Genres
- Artists

Relationships between these tables allow for analysis across customers, regions, products, and transactions.

### 1.2 Tools Used
- SQL (SQLite)
- DBeaver

## 2. Key Analysis & Insights
The analysis below answers the primary business questions outlined in the project objective.

### 2.1. Revenue by Country
Aggregated total revenue by billing country to identify key markets.
The USA generates the highest revenue, followed by Canada and France.
Revenue is heavily concentrated in North America, suggesting that market size and customer base are key drivers of revenue.

### 2.2. Revenue by Customer
Calculated total revenue per customer to identify high-value individuals.
Top customers are distributed across multiple countries, not just the USA.
This suggests that while the USA leads overall revenue, high-value customers exist globally.

### 2.3. Revenue by Genre
Analysed total revenue, units sold, and average price per genre.
Rock is the dominant genre in both revenue and sales volume.
Revenue differences are driven by purchase volume rather than pricing, as most tracks are priced similarly.

### 2.4. Revenue by Country and Genre
Combined geographic and product analysis to identify genre preferences by country.
Rock consistently performs well across multiple countries, indicating broad global appeal.
Some variation exists, but overall genre preferences are relatively consistent across markets.

### 2.5. Customer Purchasing Behaviour
Analysed order frequency, total spend, and average order value per customer.
Customers tend to generate higher revenue through repeat purchases rather than significantly higher spend per order.
This indicates that purchase frequency is a key driver of customer value.












