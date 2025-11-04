## Basic Joins

[1378. Replace Employee ID With The Unique Identifier](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT COALESCE(U.unique_id, NULL) AS unique_id, E.name
FROM Employees AS E 
LEFT JOIN EmployeeUNI AS U ON U.id = E.id
```

[1068. Product Sales Analysis I](https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT P.product_name, S.year, S.price
FROM Sales AS S
INNER JOIN Product AS P ON P.product_id = S.product_id
```

[1581. Customer Who Visited but Did Not Make Any Transactions](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT V.customer_id, COUNT(*) AS count_no_trans
FROM Visits AS V
LEFT JOIN Transactions AS T ON T.visit_id = V.visit_id
WHERE T.visit_id IS NULL
GROUP BY V.customer_id
```

[197. Rising Temperature](https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT w1.id
FROM Weather w1
JOIN Weather w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature
```

[1661. Average Time of Process per Machine](https://leetcode.com/problems/average-time-of-process-per-machine/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT machine_id, ROUND(SUM(time)/COUNT(*), 3) AS processing_time
FROM (
SELECT a1.machine_id, a1.process_id, (a2.timestamp - a1.timestamp) AS time
FROM Activity a1
JOIN Activity a2 ON a1.process_id = a2.process_id AND a1.machine_id = a2.machine_id
AND a1.activity_type = 'start' AND a2.activity_type = 'end'
) AS X
GROUP BY machine_id
```

[577. Employee Bonus](https://leetcode.com/problems/employee-bonus/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT E.name, B.bonus
FROM Employee AS E
LEFT JOIN Bonus AS B ON B.empId  = E.empId
WHERE B.bonus < 1000 OR B.bonus IS NULL
```

[1280. Students and Examinations](https://leetcode.com/problems/students-and-examinations/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT S.student_id, S.student_name, sub.subject_name, COUNT(E.student_id) AS attended_exams
FROM Students AS S
CROSS JOIN Subjects AS sub 
LEFT JOIN Examinations AS E ON E.student_id = S.student_id
AND sub.subject_name = E.subject_name
GROUP BY S.student_id, sub.subject_name
ORDER BY S.student_id, sub.subject_name
```

[570. Managers with at Least 5 Direct Reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT E.name
FROM Employee AS E
INNER JOIN (
SELECT managerId, COUNT(*) AS no_reports
FROM Employee
WHERE managerId IS NOT NULL
GROUP BY managerId
) AS X ON X.managerId = E.id AND X.no_reports >= 5
```

[1934. Confirmation Rate](https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT S.user_id,
ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END), 2) AS confirmation_rate
FROM Signups AS S
LEFT JOIN Confirmations AS C ON C.user_id = S.user_id
GROUP BY S.user_id
```
