SELECT 
    customer_unique_id,
    order_purchase_timestamp,
    COUNT(*) AS order_count
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY customer_unique_id, order_purchase_timestamp
HAVING COUNT(*) > 1
ORDER BY order_count DESC;

-- i have found that there are 290 customers has the same order purshase date for more than 1 order, which is not possible. I will investigate more to find out the root cause of this issue.
-- I think it could be a quality issue with the data, and I will check the source of the data to see if there are any issues with the data collection process. I will also check if there are any duplicates in the data, and if so, I will remove them to ensure that the data is accurate and reliable for analysis.

