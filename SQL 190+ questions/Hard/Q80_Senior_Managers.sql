SELECT manager_name, COUNT(emp_id) AS direct_reportees
FROM employees
WHERE emp_id IN (SELECT manager_id FROM employees)
AND manager_id IN (SELECT emp_id FROM employees)
GROUP BY manager_name
ORDER BY direct_reportees DESC
