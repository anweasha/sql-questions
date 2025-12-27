SELECT log_date, mischief_score - (LAG(mischief_score) OVER (ORDER BY log_date)) AS diff_in_score
FROM grinch_mischief_log
