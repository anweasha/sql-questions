## Subqueries

[1978. Employees Whose Manager Left the Company](https://leetcode.com/problems/employees-whose-manager-left-the-company/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT employee_id
FROM Employees
WHERE salary < 30000 AND manager_id NOT IN (
SELECT employee_id FROM Employees
) AND manager_id IS NOT NULL
ORDER BY employee_id
```

[626. Exchange Seats](https://leetcode.com/problems/exchange-seats/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT CASE WHEN (id%2!=0) AND id+1 IN (SELECT id FROM Seat) THEN id+1
WHEN (id%2=0) THEN id-1 
ELSE id END AS id,
student
FROM Seat
ORDER BY id
```

[1341. Movie Rating](https://leetcode.com/problems/movie-rating/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
(SELECT U.name as results
FROM Users AS U
JOIN (
SELECT user_id, COUNT(DISTINCT movie_id) AS num
FROM MovieRating
GROUP BY user_id
) AS R ON R.user_id = U.user_id
ORDER BY R.num DESC, U.name ASC
LIMIT 1)

UNION ALL

(SELECT M.title as results
FROM Movies AS M
JOIN (
SELECT movie_id, AVG(rating) AS avg_rating
FROM MovieRating
WHERE LEFT(created_at, 7) = '2020-02'
GROUP BY movie_id
) AS R on R.movie_id = M.movie_id
ORDER BY R.avg_rating DESC, M.title ASC
LIMIT 1)
```

[1321. Restaurant Growth](https://leetcode.com/problems/restaurant-growth/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT v.visited_on, SUM(amount) AS amount,
ROUND((SUM(amount)/7), 2) AS average_amount
FROM (SELECT DISTINCT visited_on FROM Customer) AS v 
JOIN Customer AS c
ON c.visited_on BETWEEN DATE_SUB(v.visited_on, INTERVAL 6 DAY) AND v.visited_on
GROUP BY v.visited_on
HAVING COUNT(DISTINCT c.visited_on) = 7
ORDER BY v.visited_on
```

[602. Friend Requests II: Who Has the Most Friends](https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT DISTINCT id, SUM(num) AS num
FROM (
(SELECT DISTINCT accepter_id AS id, COUNT(accepter_id) AS num
FROM RequestAccepted
GROUP BY accepter_id)
UNION ALL
(SELECT DISTINCT requester_id AS id, COUNT(requester_id) AS num
FROM RequestAccepted
GROUP BY requester_id)
) AS X
GROUP BY id
ORDER BY num DESC
LIMIT 1
```

[585. Investments in 2016](https://leetcode.com/problems/investments-in-2016/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT ROUND(SUM(tiv_2016), 2) as tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
SELECT tiv_2015 FROM Insurance
GROUP BY tiv_2015
HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
SELECT lat, lon FROM Insurance
GROUP BY lat, lon
HAVING COUNT(*) = 1
)
```
[185. Department Top Three Salaries](https://leetcode.com/problems/department-top-three-salaries/description/?envType=study-plan-v2&envId=top-sql-50) (Hard)

```sql
SELECT dept AS Department, name AS Employee, salary AS Salary 
FROM (
SELECT d.id, d.name AS dept, e.name, e.salary,
DENSE_RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
FROM Employee AS e
JOIN Department AS d ON e.departmentId = d.id
) AS X WHERE rnk <= 3
```
