 -- Q 6 Identify users who have not made any purchases to target them with marketing campaigns

SELECT u.user_id, u.user_session
FROM users u
LEFT JOIN events e ON u.user_id = e.user_id AND e.event_type = 'purchase'
WHERE e.event_id IS NULL;
