SELECT *, SUM(stories_shared) OVER (ORDER BY log_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM story_log
