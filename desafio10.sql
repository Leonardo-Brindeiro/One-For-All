SELECT a.cancao AS nome,
COUNT(b.cancoes_id) AS reproducoes
FROM
  SpotifyClone.cancoes AS a
  
INNER JOIN
  SpotifyClone.reproducao AS b 
  ON b.cancoes_id = a.cancoes_id

INNER JOIN
SpotifyClone.usuarios AS c
ON  b.usuario_id = c.usuario_id
AND (c.plano_id = 1 OR c.plano_id = 4 )

GROUP BY nome
ORDER BY nome;
