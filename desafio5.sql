SELECT a.cancao AS cancao,
COUNT(a.cancoes_id) AS reproducoes
FROM SpotifyClone.cancoes AS a
INNER JOIN SpotifyClone.reproducao AS b
ON b.cancoes_id = a.cancoes_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;