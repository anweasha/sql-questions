WITH Temp AS (
  SELECT policy_holder_id, call_date,
  LEAD(call_date) OVER (PARTITION BY policy_holder_id ORDER BY call_date) AS next_call
  FROM callers
)
SELECT COUNT(DISTINCT policy_holder_id) AS policy_holder_count
FROM Temp 
WHERE next_call - call_date <= INTERVAL '7 days'
