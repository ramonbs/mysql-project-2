SELECT 
    s.song_name AS cancao,
    COUNT(hr.music_id) AS reproducoes
FROM
    SpotifyClone.historic_reproduction AS hr
        INNER JOIN
    SpotifyClone.songs AS s ON music_id = s.id
GROUP BY s.song_name
ORDER BY reproducoes DESC, s.song_name ASC
LIMIT 2;