-- q-10 Identify users who have multiple sessions to understand user behavior and session patterns. 

SELECT user_id, COUNT(DISTINCT user_session) AS session_count
FROM events
GROUP BY user_id
HAVING session_count > 1;
