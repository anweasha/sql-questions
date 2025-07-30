SELECT * FROM (
SELECT a.artist_name,
DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS artist_rank
FROM artists AS a
JOIN songs AS s ON a.artist_id = s.artist_id
JOIN global_song_rank AS g ON s.song_id = g.song_id AND g.rank <= 10
GROUP BY a.artist_name
) AS X
WHERE artist_rank <= 5
