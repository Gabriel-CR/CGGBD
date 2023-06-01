-- Temperatura máxima em cada local
--  usar latitude e longitude
--  usar gráfico do brasil

-- Informações de um determinado local

-- Informações de um determinado local em um determinado periodo

-- Temperatura mais alta do estado
SELECT	ST.state, (
	SELECT	MAX(I.tmax)
	FROM	station AS S JOIN info_temperatura AS I ON S.id = I.id_station
	WHERE	ST.state = S.state
) AS temperatura
FROM	station AS ST
GROUP BY ST.state
ORDER BY temperatura;

-- Quais os meses com maiores temperaturas em cada estado

