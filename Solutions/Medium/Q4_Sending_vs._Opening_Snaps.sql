SELECT ab.age_bucket,
ROUND(100.00 * SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent END) / 
SUM(CASE WHEN a.activity_type IN ('send', 'open') THEN a.time_spent END), 2)
AS send_perc,
ROUND(100.00 * SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent END) / 
SUM(CASE WHEN a.activity_type IN ('send', 'open') THEN a.time_spent END), 2)
AS open_perc
FROM activities AS a
JOIN age_breakdown AS ab ON a.user_id = ab.user_id
WHERE a.activity_type IN ('send', 'open')
GROUP BY ab.age_bucket
