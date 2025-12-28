SELECT SUM(paper_used_meters) AS total_wrapping_paper
FROM holiday_orders
WHERE CASE WHEN gift_wrap = 'true' THEN 1 WHEN gift_wrap = 1 THEN 1 ELSE 0 END = 1 
AND delivery_status = 'Delivered'
