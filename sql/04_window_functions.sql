-- Ранжирование: кто открыл уведомление первым в каждой группе

SELECT 
    e.event_id,
    e.user_id,
    u."group",
    e.event_date,
    ROW_NUMBER() OVER (PARTITION BY u."group" ORDER BY e.event_date) AS open_rank_in_group
FROM events e
JOIN users u ON e.user_id = u.user_id
ORDER BY u."group", open_rank_in_group;

-- Накопительная сумма открытий по дням внутри каждой группы

SELECT 
    u."group",
    e.event_date,
    COUNT(*) AS opens_that_day,
    SUM(COUNT(*)) OVER (PARTITION BY u."group" ORDER BY e.event_date) AS cumulative_opens
FROM events e
JOIN users u ON e.user_id = u.user_id
GROUP BY u."group", e.event_date
ORDER BY u."group", e.event_date;
