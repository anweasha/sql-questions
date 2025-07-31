WITH international AS (
SELECT p.caller_id, c.country_id, p.receiver_id, r.country_id
FROM phone_calls AS p  
LEFT JOIN phone_info AS c ON p.caller_id = c.caller_id
LEFT JOIN phone_info AS r ON p.receiver_id = r.caller_id
WHERE c.country_id != r.country_id
)
SELECT ROUND(100.0 * (SELECT COUNT(*) FROM international) / COUNT(*), 1)
AS international_call_pct
FROM phone_calls
