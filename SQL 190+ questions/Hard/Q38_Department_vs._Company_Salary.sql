WITH Temp AS (
  SELECT AVG(amount) AS company_avg
  FROM salary
  WHERE payment_date BETWEEN '03/01/2024' AND '03/31/2024'
)

SELECT e.department_id,
TO_CHAR(s.payment_date, 'MM-YYYY') AS payment_date,
CASE WHEN (SELECT company_avg FROM Temp) > AVG(s.amount) THEN 'lower'
WHEN (SELECT company_avg FROM Temp) < AVG(s.amount) THEN 'higher'
ELSE 'same' END AS comparison
FROM employee AS e
JOIN salary AS s ON e.employee_id = s.employee_id
AND s.payment_date BETWEEN '03/01/2024' AND '03/31/2024'
GROUP BY e.department_id, s.payment_date
