-- dado uma latitude e longitude, calcula as 5 estações mais próximas e a sua distância
SELECT s.station, s.latitude, s.longitude,
    (6371 * ACOS(COS(RADIANS(lat)) * COS(RADIANS(s.latitude)) * COS(RADIANS(long) - RADIANS(s.longitude)) + SIN(RADIANS(lat)) * SIN(RADIANS(s.latitude)))) AS distance
FROM station s
CROSS JOIN (SELECT -5.19812 AS lat, -39.2962 AS long) AS user_loc
ORDER BY distance ASC
LIMIT 5;

-- Precipitação em um local e ano
SELECT EXTRACT(MONTH FROM IO.data) AS mes, MAX(IO.prcp)
FROM station AS ST
JOIN info_outras AS IO ON ST.id = IO.id_station
WHERE ST.state = 'CE'
    AND EXTRACT(YEAR FROM IO.data) = 2019
GROUP BY mes
ORDER BY mes

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

-- Radiação solar por local, mes, ano
SELECT	EXTRACT(MONTH FROM IO.data) AS mes, MAX(IO.gbrd)
FROM	station AS ST
JOIN	info_outras AS IO ON ST.id = IO.id_station
WHERE	ST.state = 'BA'
    	AND EXTRACT(YEAR FROM IO.data) = 2019
GROUP BY mes
ORDER BY mes
