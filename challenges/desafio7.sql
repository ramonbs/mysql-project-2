SELECT 
    a.artist_name AS artista,
    al.album_name AS album,
    COUNT(af.artist_id) AS pessoas_seguidoras
FROM
    SpotifyClone.artist AS a
        INNER JOIN
    SpotifyClone.albums AS al ON a.id = al.artist_id
        INNER JOIN
    SpotifyClone.artist_followers AS af ON a.id = af.artist_id
GROUP BY artista , album
ORDER BY pessoas_seguidoras DESC , artista , album;