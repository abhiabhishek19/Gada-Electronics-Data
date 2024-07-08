-- 	Q2 Identify the top 5 most popular brands based on the number of purchases.

SELECT p.brand, COUNT(e.event_id) AS purchase_count
FROM events e
JOIN products p ON e.product_id = p.product_id
WHERE e.event_type = 'purchase'
GROUP BY p.brand
ORDER BY purchase_count DESC
LIMIT 5;
