## Advanced Select and Joins

[1731. The Number of Employees Which Report to Each Employee](https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT E.employee_id, E.name, X.reports_count, X.average_age
FROM Employees AS E
JOIN (
SELECT reports_to, COUNT(DISTINCT employee_id) AS reports_count, ROUND(AVG(age)) AS average_age
FROM Employees
WHERE reports_to IS NOT NULL
GROUP BY reports_to
HAVING COUNT(DISTINCT employee_id) >= 1
) AS X ON X.reports_to = E.employee_id
ORDER BY E.employee_id
```

[1789. Primary Department for Each Employee](https://leetcode.com/problems/primary-department-for-each-employee/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT employee_id, department_id
FROM (
SELECT *, COUNT(employee_id) OVER(PARTITION BY employee_id) AS rn
FROM Employee
) AS X
WHERE rn = 1 OR primary_flag = 'Y'
```

[610. Triangle Judgement](https://leetcode.com/problems/triangle-judgement/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT *,
CASE WHEN ((x+y>z) AND (y+z>x) AND (z+x>y)) IS TRUE THEN 'Yes' ELSE 'No' END AS triangle
FROM Triangle
```

[180. Consecutive Numbers](https://leetcode.com/problems/consecutive-numbers/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT DISTINCT l1.num AS ConsecutiveNums 
FROM Logs l1, logs l2, logs l3
WHERE l1.num = l2.num AND l2.num = l3.num
AND l1.id = l2.id - 1 AND l2.id = l3.id - 1
```

[1164. Product Price at a Given Date](https://leetcode.com/problems/product-price-at-a-given-date/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT DISTINCT product_id, 
COALESCE(FIRST_VALUE (CASE WHEN change_date <= '2019-08-16' THEN new_price END) OVER (PARTITION BY product_id ORDER BY CASE WHEN change_date <= '2019-08-16' THEN change_date END DESC), 10) AS price
FROM Products
```

[1204. Last Person to Fit in the Bus](https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
With Total AS (
  SELECT person_name, turn,
  SUM(weight) OVER(ORDER BY turn) AS total_weight
  FROM Queue
)
SELECT person_name
FROM Total
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1
```

[1907. Count Salary Categories](https://leetcode.com/problems/count-salary-categories/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT "Low Salary" AS category,
COUNT(CASE WHEN income < 20000 THEN 1 END) AS accounts_count
FROM Accounts

UNION ALL

SELECT "Average Salary" AS category,
COUNT(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 END) AS accounts_count
FROM Accounts

UNION ALL

SELECT "High Salary" AS category,
COUNT(CASE WHEN income > 50000 THEN 1 END) AS accounts_count
FROM Accounts
```
