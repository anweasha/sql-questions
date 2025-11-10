WITH Temp AS (
  SELECT EXTRACT(YEAR FROM call_date) AS yr, 
  EXTRACT(MONTH FROM call_date) AS mth, 
  COUNT(*) AS long_calls
  FROM callers
  WHERE call_duration_secs >= 300
  GROUP BY yr, mth
  ORDER BY yr, mth
)
SELECT yr, mth, 
ROUND(100.0 * (long_calls - (LAG(long_calls) OVER (ORDER BY yr, mth)))/(LAG(long_calls) OVER (ORDER BY yr, mth)), 1) AS long_calls_growth_pct
FROM Temp 
