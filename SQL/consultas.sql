-- Temperatura máxima em cada local
--  usar latitude e longitude
--  usar gráfico do brasil

-- Informações de um determinado local

-- Temperatura mínima e máxima de um local
SELECT	
	S.state, (
		select	max(tmax)
		from	station AS ST JOIN info_temperatura AS IT ON ST.id = IT.id_station
		where	IT.data = '2017-12-20' AND
				ST.state = S.state
	), (
		select	min(tmin)
		from	station AS ST JOIN info_temperatura AS IT ON ST.id = IT.id_station
		where	IT.data = '2017-12-20' AND
				ST.state = S.state AND
				tmin <> -9999
	)
FROM	station AS S
WHERE	S.state = 'CE'
group by S.state

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
