SELECT e.employee_id, e.name AS employee_name
FROM employee AS e 
INNER JOIN employee AS m ON e.manager_id = m.employee_id 
AND e.salary > m.salary
