WITH Temp AS (
SELECT searches, GENERATE_SERIES(1, num_users)
FROM search_frequency
)
SELECT ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY searches)::decimal, 1) AS median
FROM Temp
