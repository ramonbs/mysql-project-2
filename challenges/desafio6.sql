SELECT 
    ROUND(MIN(p.plan_value), 2) AS faturamento_minimo,
    ROUND(MAX(p.plan_value), 2) AS faturamento_maximo,
    ROUND(AVG(p.plan_value), 2) AS faturamento_medio,
    ROUND(SUM(p.plan_value), 2) AS faturamento_total
FROM
    SpotifyClone.plans AS p
        INNER JOIN
    SpotifyClone.users AS u ON p.id = u.plan_id;