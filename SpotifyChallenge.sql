-- Let's break this question down into 3 steps:

-- Find the top 10 artists by rank along with the largest number of song appearances in the Top 10 of the global_song_rank table.
-- Rank the artists according to their number of song appearances in the previous step
-- Limit your results to the top 5 artists by their rank in the previous step.
WITH top_artists
AS (
SELECT artist_id,DENSE_RANK() OVER (ORDER BY song_count DESC) AS artist_rank
FROM (SELECT songs.artist_id, COUNT(songs.song_id) AS song_count 
FROM songs
JOIN global_song_rank on songs.song_id = global_song_rank.song_id
WHERE global_song_rank.rank <= 10
GROUP BY songs.artist_id) AS top_songs)
SELECT artists.artist_name, top_artists.artist_rank FROM top_artists
JOIN artists ON top_artists.artist_id = artists.artist_id
WHERE top_artists.artist_rank <= 5
ORDER BY artist_rank, artist_name;