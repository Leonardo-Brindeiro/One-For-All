SELECT 
	a.usuario AS usuario,
	IF (MAX(YEAR(b.data_reproducao)) > 2020, 'Usuário ativo', 'Usuário inativo')
AS status_usuario
FROM SpotifyClone.reproducao AS b
JOIN SpotifyClone.usuarios AS a
ON a.usuario_id = b.usuario_id
GROUP BY usuario
ORDER BY usuario;

