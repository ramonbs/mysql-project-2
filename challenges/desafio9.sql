SELECT 
    COUNT(s.song_name) AS musicas_no_historico
FROM
    SpotifyClone.users AS u
        INNER JOIN
    SpotifyClone.historic_reproduction AS hr ON u.id = hr.user_id
        INNER JOIN
    SpotifyClone.songs AS s ON hr.music_id = s.id
WHERE
    u.user_name LIKE '_arb%'
GROUP BY u.user_name;
