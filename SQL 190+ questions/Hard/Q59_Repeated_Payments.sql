WITH Temp AS (
  SELECT transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp AS curr,
  LEAD(transaction_timestamp) OVER (PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp) AS next 
  FROM transactions
)
SELECT COUNT(*) AS payment_count
FROM Temp 
WHERE next IS NOT NULL AND EXTRACT(EPOCH FROM (next - curr))/60 <= 10
