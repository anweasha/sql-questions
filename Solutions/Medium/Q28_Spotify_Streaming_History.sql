SELECT user_id, song_id, SUM(song_plays) AS song_plays
FROM (
SELECT user_id, song_id, song_plays FROM songs_history
UNION ALL
SELECT user_id, song_id, COUNT(listen_time) AS song_plays
FROM songs_weekly WHERE listen_time < '08/05/2022'
GROUP BY user_id, song_id
) AS x
GROUP BY user_id, song_id
ORDER BY song_plays DESC
