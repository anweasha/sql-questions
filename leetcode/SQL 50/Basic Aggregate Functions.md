## Basic Aggregate Functions

[620. Not Boring Movies](https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT *
FROM Cinema
WHERE (id%2 != 0) AND description NOT LIKE 'boring'
ORDER BY rating DESC
```

[1251. Average Selling Price](https://leetcode.com/problems/average-selling-price/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT P.product_id,
ROUND(COALESCE((SUM(P.price * U.units)/SUM(U.units)), 0), 2) AS average_price
FROM Prices AS P
LEFT JOIN UnitsSold AS U ON P.product_id = U.product_id AND 
U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY product_id
```

[1075. Project Employees I](https://leetcode.com/problems/project-employees-i/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT P.project_id, ROUND(AVG(E.experience_years), 2) AS average_years
FROM Project AS P
JOIN Employee AS E ON E.employee_id = P.employee_id
GROUP BY project_id
```

[1633. Percentage of Users Attended a Contest](https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT contest_id,
ROUND((COUNT(DISTINCT user_id)*100)/(SELECT COUNT(user_id) FROM Users), 2) AS percentage
FROM Register 
GROUP BY contest_id
ORDER BY percentage DESC, contest_id
```

[1211. Queries Quality and Percentage](https://leetcode.com/problems/queries-quality-and-percentage/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT query_name, ROUND(AVG(rating/position), 2) AS quality,
ROUND(AVG(CASE WHEN rating < 3 THEN 1 ELSE 0 END)*100, 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name
```

[1193. Monthly Transactions I](https://leetcode.com/problems/monthly-transactions-i/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT LEFT(trans_date, 7) AS month, country, COUNT(*) AS trans_count,
SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
SUM(amount) AS trans_total_amount, 
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country
```

[1174. Immediate Food Delivery II](https://leetcode.com/problems/immediate-food-delivery-ii/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
SELECT ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100, 2) AS immediate_percentage
FROM Delivery 
WHERE (customer_id, order_date) IN (
SELECT customer_id, MIN(order_date) AS order_date
FROM Delivery
GROUP BY customer_id
)
```

[550. Game Play Analysis IV](https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50) (Medium)

```sql
WITH first AS (
  SELECT player_id, MIN(event_date) AS first_login_date
  FROM Activity
  GROUP BY player_id
),
next AS (
  SELECT COUNT(DISTINCT a.player_id) as num_logins
  FROM Activity AS a
  JOIN first AS f ON a.player_id = f.player_id AND a.event_date = DATE_ADD(f.first_login_date, INTERVAL 1 DAY)
)

SELECT ROUND((SELECT num_logins FROM next)/(SELECT COUNT(player_id) FROM first), 2) AS fraction
```
