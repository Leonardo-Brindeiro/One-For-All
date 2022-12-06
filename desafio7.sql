SELECT a.artista AS artista,
b.album AS album,
COUNT(c.usuario_id) AS seguidores
FROM
  SpotifyClone.artistas AS a
  
INNER JOIN
  SpotifyClone.albuns AS b 
  ON b.artista_id = a.artista_id
  
INNER JOIN
  SpotifyClone.seguidores AS c
ON c.artista_id = b.artista_id

GROUP BY album_id	
ORDER BY seguidores DESC, artista ASC, album ASC;