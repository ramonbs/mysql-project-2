SELECT DISTINCT
    COUNT(s.song_name) AS cancoes,
	COUNT(DISTINCT ar.artist_name) AS artistas,
    COUNT(DISTINCT a.album_name) AS albuns
FROM
    SpotifyClone.songs AS s
        INNER JOIN
    SpotifyClone.albums AS a ON s.albums_id = a.id
        INNER JOIN
    SpotifyClone.artist AS ar ON a.artist_id = ar.id;