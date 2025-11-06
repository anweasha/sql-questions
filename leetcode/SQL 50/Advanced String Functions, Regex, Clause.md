## Advanced String Functions / Regex / Clause

[1667. Fix Names in a Table](https://leetcode.com/problems/fix-names-in-a-table/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT user_id, CONCAT(UPPER(LEFT(name,1)), LOWER(SUBSTR(name,2))) AS name
FROM Users
ORDER BY user_id
```

[1527. Patients With a Condition](https://leetcode.com/problems/patients-with-a-condition/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%'
```

[196. Delete Duplicate Emails](https://leetcode.com/problems/delete-duplicate-emails/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
DELETE p1 FROM Person AS p1
JOIN Person AS p2
ON p1.email = p2.email AND p1.id > p2.id
```

[176. Second Highest Salary](https://leetcode.com/problems/second-highest-salary/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT (
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1
) AS SecondHighestSalary
```

[1484. Group Sold Products By The Date](https://leetcode.com/problems/group-sold-products-by-the-date/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT sell_date, COUNT(DISTINCT product) AS num_sold, 
GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products 
FROM Activities
GROUP BY sell_date
ORDER BY sell_date
```

[1327. List the Products Ordered in a Period](https://leetcode.com/problems/list-the-products-ordered-in-a-period/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT p.product_name, SUM(o.unit) AS unit
FROM Orders AS o
JOIN Products AS p ON o.product_id = p.product_id
WHERE LEFT(o.order_date, 7) = '2020-02'
GROUP BY o.product_id
HAVING SUM(o.unit) >= 100
```

[1517. Find Users With Valid E-Mails](https://leetcode.com/problems/find-users-with-valid-e-mails/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT *
FROM Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$'
```
