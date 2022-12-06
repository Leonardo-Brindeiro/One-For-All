SELECT
  a.usuario,
  COUNT(c.usuario_id) AS qt_de_musicas_ouvidas,
  ROUND(SUM(b.duracao_segundos / 60), 2) AS total_minutos
FROM
  SpotifyClone.usuarios AS a
INNER JOIN
  SpotifyClone.reproducao AS c
  ON c.usuario_id = a.usuario_id
INNER JOIN
  SpotifyClone.cancoes AS b
ON c.cancoes_id = b.cancoes_id
GROUP BY a.usuario
ORDER BY a.usuario;