SELECT num_tweets AS tweet_bucket, COUNT(*) AS users_num
FROM (
SELECT user_id, COUNT(*) AS num_tweets
FROM tweets
WHERE EXTRACT(YEAR FROM tweet_date) = 2022
GROUP BY user_id
) AS X
GROUP BY num_tweets
