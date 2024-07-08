-- Q 7  Find the top 3 best-selling products in each category. 

WITH RankedProducts AS (
    SELECT 
        p.product_id, 
        p.category_id, 
        p.brand, 
        ROW_NUMBER() OVER (PARTITION BY p.category_id ORDER BY COUNT(e.event_id) DESC) AS rankING
    FROM events e
    JOIN products p ON e.product_id = p.product_id
    WHERE e.event_type = 'purchase'
    GROUP BY p.product_id, p.category_id, p.brand
)
SELECT product_id, category_id, brand
FROM RankedProducts
WHERE rankING < 3;
