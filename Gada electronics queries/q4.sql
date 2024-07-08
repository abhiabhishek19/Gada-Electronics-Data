-- Q 4  Calculate the average number of events per user to understand user engagement.

SELECT AVG(event_count) AS avg_events_per_user
FROM (
    SELECT user_id, COUNT(event_id) AS event_count
    FROM events
    GROUP BY user_id
) AS user_events;
