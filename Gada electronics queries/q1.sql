 -- Q-1 Determine which products are the most frequently purchased to inform inventory management and marketing strategies.

SELECT p.product_id, p.brand, COUNT(e.event_id) AS total_purchases
FROM events e
JOIN products p ON e.product_id = p.product_id
WHERE e.event_type = 'purchase'
GROUP BY p.product_id, p.brand;
