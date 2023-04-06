SELECT 
    u.user_name AS pessoa_usuaria,
    COUNT(*) AS musicas_ouvidas,
    ROUND(SUM(s.song_duration/60), 2) AS total_minutos
FROM
    SpotifyClone.users AS u
        INNER JOIN
    SpotifyClone.historic_reproduction AS hr ON u.id = hr.user_id
        INNER JOIN
    SpotifyClone.songs AS s ON hr.music_id = s.id
GROUP BY u.user_name
ORDER BY u.user_name;