-- Q 5 Determine how many unique users have made at least one purchase.

SELECT COUNT(DISTINCT user_id) AS purchasing_users
FROM events
WHERE event_type = 'purchase'; 