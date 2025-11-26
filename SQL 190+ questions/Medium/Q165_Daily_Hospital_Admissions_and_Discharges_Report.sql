WITH add AS (
SELECT join_date::date AS date, COUNT(entry_id) AS joins
FROM admissions
GROUP BY date
),
exit AS (
SELECT exit_date::date AS date, COUNT(entry_id) AS exits
FROM exits
GROUP BY date
)

SELECT COALESCE(a.date, e.date)::varchar AS date, 
COALESCE(a.joins, 0) AS joins, COALESCE(e.exits, 0) AS exits,
(COALESCE(a.joins, 0) - COALESCE(e.exits, 0)) AS net,
(SUM(COALESCE(a.joins, 0) - COALESCE(e.exits, 0)) OVER (ORDER BY COALESCE(a.date, e.date)))::int AS cumulative_net
FROM add AS a
FULL JOIN exit AS e ON a.date = e.date
ORDER BY date
