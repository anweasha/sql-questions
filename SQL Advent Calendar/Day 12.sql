WITH Temp AS (
  SELECT DATE(m.sent_at) AS message_date, u.user_name, COUNT(m.message_id) AS num_messages,
  DENSE_RANK() OVER (PARTITION BY DATE(m.sent_at) ORDER BY COUNT(m.message_id) DESC) AS rn
  FROM npn_users AS u
  JOIN npn_messages AS m ON u.user_id = m.sender_id
  GROUP BY message_date, u.user_name
)
SELECT message_date, user_name, num_messages
FROM Temp
WHERE rn = 1
