SELECT EXTRACT(MONTH FROM curr.login_date) AS mth, COUNT(DISTINCT curr.user_id) AS reactivated_users
FROM user_logins AS curr
WHERE curr.user_id NOT IN (
SELECT prev.user_id
FROM user_logins AS prev 
WHERE curr.user_id = prev.user_id AND 
EXTRACT(MONTH FROM curr.login_date) = EXTRACT(MONTH FROM prev.login_date) + 1
)
GROUP BY EXTRACT(MONTH FROM curr.login_date)
