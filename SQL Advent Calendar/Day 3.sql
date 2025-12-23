WITH Temp AS (
  SELECT target_name, prank_description, evilness_score,
  ROW_NUMBER() OVER (PARTITION BY target_name ORDER BY evilness_score DESC, created_at DESC) AS rn
  FROM grinch_prank_ideas
)
SELECT target_name, prank_description, evilness_score
FROM Temp 
WHERE rn = 1
