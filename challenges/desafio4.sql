SELECT 
    u.user_name AS pessoa_usuaria,
    IF(MAX(hr.date_historic) < '2020-12-31 23:59:59', 'Inativa', 'Ativa') AS status_pessoa_usuaria
FROM
    SpotifyClone.historic_reproduction AS hr
        INNER JOIN
    SpotifyClone.users AS u ON user_id = u.id
GROUP BY u.id, u.user_name
ORDER BY u.user_name ASC;