WITH Temp AS (
  SELECT user_id, 
  LAG(EXTRACT(YEAR FROM filing_date)) OVER (PARTITION BY user_id ORDER BY filing_date) AS prev_yr,
  EXTRACT(YEAR FROM filing_date) AS curr_yr, 
  LEAD(EXTRACT(YEAR FROM filing_date)) OVER (PARTITION BY user_id ORDER BY filing_date) AS next_yr,
  product
  FROM filed_taxes
  WHERE product LIKE 'TurboTax%'
)
SELECT DISTINCT user_id
FROM Temp 
WHERE prev_yr = curr_yr - 1 AND next_yr = curr_yr + 1
