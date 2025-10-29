WITH june AS (
  SELECT DISTINCT user_id
  FROM user_actions
  WHERE EXTRACT(MONTH FROM event_date) = 6
),
july AS (
  SELECT DISTINCT user_id
  FROM user_actions
  WHERE EXTRACT(MONTH FROM event_date) = 7
) 

SELECT 7 AS month, COUNT(*) AS monthly_active_users
FROM june AS jn 
INNER JOIN july AS jl ON jn.user_id = jl.user_id
