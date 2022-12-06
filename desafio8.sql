SELECT (a.artista) AS artista,
b.album AS album

FROM
  SpotifyClone.artistas AS a
  
INNER JOIN
  SpotifyClone.albuns AS b 
  ON b.artista_id = a.artista_id

HAVING artista="Elis Regina"
ORDER BY album ASC;