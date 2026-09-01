SELECT 
    "group", 
    COUNT(*) AS n_users
FROM users
GROUP BY "group";
