WITH Temp AS (
  SELECT e.employee_id, 
  COALESCE(COUNT(DISTINCT query_id), 0) AS unique_queries
  FROM employees AS e
  LEFT JOIN queries AS q ON e.employee_id = q.employee_id
  AND q.query_starttime >= '07/01/2023' AND q.query_starttime < '10/01/2023'
  GROUP BY e.employee_id
  ORDER BY e.employee_id
)
SELECT unique_queries, COUNT(employee_id) AS employee_count
FROM Temp
GROUP BY unique_queries
ORDER BY unique_queries
