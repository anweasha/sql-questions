SELECT DISTINCT salary AS second_highest_salary
FROM (
SELECT *, RANK() OVER (ORDER BY salary DESC) AS rn
FROM employee
) AS X
WHERE rn = 2
