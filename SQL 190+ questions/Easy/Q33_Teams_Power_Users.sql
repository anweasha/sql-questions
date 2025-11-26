SELECT sender_id, COUNT(*) AS message_count 
FROM messages
WHERE sent_date >= '08/01/2022' AND sent_date < '09/01/2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2
