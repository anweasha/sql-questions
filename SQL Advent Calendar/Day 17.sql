SELECT *, CASE WHEN noise_level < 50 THEN 'Calm' ELSE 'Chaotic' END AS Category
FROM evening_tasks
