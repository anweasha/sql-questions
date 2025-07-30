SELECT department_name, name, salary
FROM (
SELECT d.department_name, e.name, e.salary,
DENSE_RANK() OVER (PARTITION BY d.department_name ORDER BY salary DESC) AS rn
FROM employee AS e
JOIN department AS d ON e.department_id = d.department_id
GROUP BY d.department_name, e.name, e.salary
) AS X
WHERE rn <= 3
ORDER BY department_name, salary DESC, name
