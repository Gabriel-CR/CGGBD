-- dado uma latitude e longitude, calcula as 5 estações mais próximas e a sua distância
SELECT s.id, s.station, s.latitude, s.longitude,
    (6371 * ACOS(COS(RADIANS(-5.19812)) * COS(RADIANS(s.latitude)) * COS(RADIANS(-39.2962) - RADIANS(s.longitude)) + SIN(RADIANS(-5.19812)) * SIN(RADIANS(s.latitude)))) AS distance,
    (
        SELECT max(i.tmax)
        FROM station AS st JOIN info_temperatura AS i ON st.id = i.id_station
        WHERE i.id_station = s.id
    ) AS temperatura
FROM station s
ORDER BY distance ASC
LIMIT 5;
-- Execution Time: 5034.623 ms
CREATE INDEX idx_info_temperatura_id_station ON info_temperatura (id_station);
-- Execution Time: 829.491 ms
CREATE INDEX idx_cluster_id_station
    ON public.info_temperatura USING btree
    (id_station ASC NULLS LAST)
;

ALTER TABLE IF EXISTS public.info_temperatura
    CLUSTER ON idx_cluster_id_station;
-- Execution Time: 724.837 ms

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Precipitação em um local e ano
SELECT EXTRACT(MONTH FROM IO.data) AS mes, MAX(IO.prcp)
FROM station AS ST JOIN info_outras AS IO ON ST.id = IO.id_station
WHERE ST.state = 'CE'
    AND EXTRACT(YEAR FROM IO.data) = 2019
GROUP BY mes
ORDER BY mes;
-- Execution Time: 7398.300 ms
CREATE INDEX idx_info_outras_id_station ON info_outras (id_station);
CREATE INDEX idx_station_state ON station (state);
CREATE INDEX idx_info_outras_data ON info_outras (data);
-- Execution Time: 5880.638 ms

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
group by S.state;
-- Execution Time: 5141.621 ms
-- CREATE INDEX idx_info_temperatura_id_station ON info_temperatura (id_station);
-- CREATE INDEX idx_station_state ON station (state);
CREATE INDEX idx_info_temperatura_data ON info_temperatura (data);
CREATE INDEX idx_info_temperatura_tmin ON info_temperatura (tmin);
CREATE INDEX idx_info_temperatura_tmax ON info_temperatura (tmax);
-- Execution Time: 15.441 ms

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Temperatura mais alta do estado
SELECT	ST.state, (
	SELECT	MAX(I.tmax)
	FROM	station AS S JOIN info_temperatura AS I ON S.id = I.id_station
	WHERE	ST.state = S.state
) AS temperatura
FROM	station AS ST
GROUP BY ST.state
ORDER BY temperatura;
-- Execution Time: 1191380.735 ms
-- CREATE INDEX idx_station_state ON station (state);
-- CREATE INDEX idx_info_temperatura_id_station ON info_temperatura (id_station);
-- Execution Time: 1163322.930 ms

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Radiação solar por local, mes, ano
SELECT	EXTRACT(MONTH FROM IO.data) AS mes, MAX(IO.gbrd)
FROM	station AS ST
JOIN	info_outras AS IO ON ST.id = IO.id_station
WHERE	ST.state = 'BA'
    	AND EXTRACT(YEAR FROM IO.data) = 2019
GROUP BY mes
ORDER BY mes;
-- Execution Time: 8690.907 ms
-- CREATE INDEX idx_station_state ON station (state);
-- CREATE INDEX idx_info_outras_id_station ON info_outras (id_station);
-- CREATE INDEX idx_info_outras_data ON info_outras (data);
CREATE INDEX idx_info_outras_gbrd ON info_outras (gbrd);
-- Execution Time: 7001.513 ms


