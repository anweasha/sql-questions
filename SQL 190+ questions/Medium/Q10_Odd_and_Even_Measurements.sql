WITH X AS (
SELECT measurement_time::date AS measurement_day, measurement_value,
ROW_NUMBER() OVER (PARTITION BY DATE(measurement_time) ORDER BY measurement_time) AS rn
FROM measurements
)
SELECT measurement_day,
SUM(CASE WHEN rn%2 != 0 THEN measurement_value END) AS odd_sum,
SUM(CASE WHEN rn%2 = 0 THEN measurement_value END) AS even_sum
FROM X
GROUP BY measurement_day
