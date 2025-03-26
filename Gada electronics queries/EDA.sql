
-- To get the latest and the oldest date of events
SELECT MIN(event_time) AS earliest_date, MAX(event_time) AS latest_date  FROM events;
-- to get the idea of our product price range 
SELECT AVG(price) AS avg_price, MIN(price) AS min_price, MAX(price) AS max_price FROM products;
-- Number of events per category
SELECT c.category_code, COUNT(e.event_id) AS event_count
FROM events e
JOIN products p ON e.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_code;
-- Number of events per month
SELECT DATE_FORMAT(event_time, '%Y-%m') AS event_month, COUNT(*) AS event_count
FROM events
GROUP BY event_month
ORDER BY event_month;
-- Running total of events per day
SELECT DATE(event_time) AS event_date, COUNT(*) AS daily_events,
       SUM(COUNT(*)) OVER (ORDER BY DATE(event_time)) AS cumulative_events
FROM events
GROUP BY event_date;
-- Event activity by user 
SELECT user_id, COUNT(event_id) AS total_events
FROM events
GROUP BY user_id
ORDER BY total_events DESC;
-- Percentage of events per category
SELECT c.category_code, COUNT(e.event_id) AS event_count,
       (COUNT(e.event_id) / (SELECT COUNT(*) FROM events) * 100) AS percentage
FROM events e
JOIN products p ON e.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_code;

-- Number of purchases per month
SELECT DATE_FORMAT(event_time, '%Y-%m') AS pur_per_month, COUNT(user_id) AS purchases
FROM events
where event_type = 'purchase'
GROUP BY pur_per_month;


--  Count of product listings per category
SELECT c.category_code, COUNT(p.product_id) AS total_products
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_code;
-- Top 5 Most active hours
SELECT HOUR(event_time) AS event_hour, COUNT(*) AS total_events
FROM events
GROUP BY event_hour
ORDER BY total_events DESC
LIMIT 5;


-- Ranking products by event count
SELECT p.product_id, COUNT(e.event_id) AS event_count
FROM events e
JOIN products p ON e.product_id = p.product_id
GROUP BY p.product_id
ORDER BY event_count DESC
LIMIT 10;


-- Identifying the most popular product categories by users
SELECT c.category_id, COUNT(DISTINCT e.user_id) AS unique_users
FROM events e
JOIN products p ON e.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_id
ORDER BY unique_users DESC;


SELECT user_id, MAX(event_time) AS last_event_time
FROM events
GROUP BY user_id;