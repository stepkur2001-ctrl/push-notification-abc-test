SELECT 
    "group",
    AVG(opened) AS open_rate
FROM (
    SELECT 
        u.user_id,
        u."group",
        CASE WHEN COUNT(e.event_id) > 0 THEN 1 ELSE 0 END AS opened
    FROM users u
    LEFT JOIN events e ON u.user_id = e.user_id
    GROUP BY u.user_id, u."group"
)
GROUP BY "group";
