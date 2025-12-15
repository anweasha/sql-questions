WITH Temp AS (
  SELECT r.employee_id, e.name, 
  LAG(r.rating) OVER (PARTITION BY r.employee_id ORDER BY review_date) AS prev, 
  r.rating, r.review_date,  
  LEAD(r.rating) OVER (PARTITION BY r.employee_id ORDER BY review_date) AS next,
  ROW_NUMBER() OVER (PARTITION BY r.employee_id ORDER BY r.review_date DESC) AS rn
  FROM performance_reviews AS r
  JOIN employees AS e ON r.employee_id = e.employee_id
)

SELECT employee_id, name, (next - prev) AS improvement_score
FROM Temp
WHERE rn = 2 AND prev IS NOT NULL AND next IS NOT NULL 
AND prev < rating AND rating < next
ORDER BY improvement_score DESC, name
