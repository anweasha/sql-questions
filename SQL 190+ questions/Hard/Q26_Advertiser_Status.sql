SELECT COALESCE(a.user_id, p.user_id) AS user_id,
CASE WHEN p.paid IS NULL THEN 'CHURN' 
WHEN (p.paid IS NOT NULL AND a.status IN ('NEW', 'EXISTING')) THEN 'EXISTING'
WHEN (p.paid IS NOT NULL AND a.status = 'CHURN') THEN 'RESURRECT'
WHEN (p.paid IS NOT NULL AND a.status IS NULL) THEN 'NEW'
ELSE 'EXISTING' END AS new_status
FROM advertiser AS a
FULL OUTER JOIN daily_pay AS p ON a.user_id = p.user_id
ORDER BY user_id
