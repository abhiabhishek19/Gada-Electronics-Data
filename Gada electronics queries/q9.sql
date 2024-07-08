-- Q 9 - Analyze the distribution of events across different product categories.

SELECT c.category_code, COUNT(e.event_id) AS event_count
FROM events e
JOIN products p ON e.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_code;
