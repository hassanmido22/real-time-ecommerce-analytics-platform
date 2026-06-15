# real-time-ecommerce-analytics-platform

## quality checks

i have found that the same customer with different order ids has the same order purshase dates
using this query

SELECT 
    customer_unique_id,
    order_purchase_timestamp,
    COUNT(*) AS order_count
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY customer_unique_id, order_purchase_timestamp
HAVING COUNT(*) > 1
ORDER BY order_count DESC

