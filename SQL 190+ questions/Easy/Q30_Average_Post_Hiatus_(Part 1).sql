SELECT user_id, EXTRACT(DAY FROM MAX(post_date) - MIN(post_date)) AS days_between
FROM posts WHERE user_id IN (
  SELECT user_id FROM posts
  WHERE EXTRACT(YEAR FROM post_date) = 2021
  GROUP BY user_id HAVING COUNT(*) >= 2
)
GROUP BY user_id
ORDER BY days_between
