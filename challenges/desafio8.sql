SELECT 
	a.artist_name AS artista,
    al.album_name AS album
FROM
    SpotifyClone.artist AS a
INNER JOIN 
	SpotifyClone.albums AS al ON a.id = al.artist_id
WHERE a.artist_name = "Elis Regina"
ORDER BY al.album_name;