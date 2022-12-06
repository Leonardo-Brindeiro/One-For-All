SELECT 
  MIN(a.valor_plano) AS faturamento_minimo,
  MAX(a.valor_plano) AS faturamento_maximo,
  ROUND(AVG(a.valor_plano), 2) AS faturamento_medio,
  SUM(a.valor_plano) AS faturamento_total
FROM SpotifyClone.planos AS a
INNER JOIN SpotifyClone.usuarios AS b
ON a.plano_id = b.plano_id;