/* Some data exploration */

SELECT * 
FROM sales.transactions
LEFT JOIN sales.markets 
ON sales.transactions.market_code = sales.markets.markets_code
WHERE sales.markets.markets_name = "Mumbai";


/* The amount of revenue in 2019 */

select SUM(sales.transactions.sales_amount) 
FROM sales.transactions 
INNER JOIN (sales.date) 
ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2019;


/* On va calculer le revenue générer par le client Nomad Stores en USD*/

SELECT SUM(sales.transactions.sales_amount)
FROM sales.transactions
INNER JOIN sales.customers
ON sales.transactions.customer_code = sales.customers.customer_code
WHERE sales.customers.custmer_name = 'Nomad Stores'
AND sales.transactions.currency = "USD";


