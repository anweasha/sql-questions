## Select

[1757. Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan-v2&envId=top-sql-50) (Easy)
```sql
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y'
```

[584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL
```

[595. Big Countries](https://leetcode.com/problems/big-countries/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000
```

[1148. Article Views I](https://leetcode.com/problems/article-views-i/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT DISTINCT viewer_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY viewer_id 
```

[1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50) (Easy)

```sql
SELECT tweet_id FROM Tweets
WHERE CHAR_LENGTH(content) > 15
```
