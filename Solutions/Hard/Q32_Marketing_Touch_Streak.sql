WITH Temp AS (
  SELECT m.contact_id, c.email,
  LAG(EXTRACT(WEEK FROM m.event_date)) OVER (PARTITION BY m.contact_id ORDER BY m.event_date) AS prev,
  EXTRACT(WEEK FROM m.event_date) AS curr,
  LEAD(EXTRACT(WEEK FROM m.event_date)) OVER (PARTITION BY m.contact_id ORDER BY m.event_date) AS next
  FROM marketing_touches AS m 
  JOIN crm_contacts AS c ON m.contact_id = c.contact_id 
  AND m.contact_id IN (
  SELECT contact_id FROM marketing_touches
  WHERE event_type = 'trial_request'
  )
)
SELECT DISTINCT email
FROM Temp
WHERE prev IS NOT NULL AND prev + 1 = curr AND curr + 1 = next
