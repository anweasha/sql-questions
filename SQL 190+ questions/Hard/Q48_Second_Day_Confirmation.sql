SELECT e.user_id
FROM emails AS e 
JOIN texts AS t ON e.email_id = t.email_id
AND e.signup_date = (t.action_date - INTERVAL '1 day')
