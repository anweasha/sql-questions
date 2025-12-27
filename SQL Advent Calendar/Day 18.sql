SELECT DISTINCT subject, FIRST_VALUE(score) OVER (PARTITION BY subject ORDER BY quiz_date) AS first_score,
FIRST_VALUE(score) OVER (PARTITION BY subject ORDER BY quiz_date DESC) AS last_score
FROM daily_quiz_scores
ORDER BY subject
