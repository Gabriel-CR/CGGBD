CREATE TABLE info_umidade (
	id_station serial,
	hmdy float,
	hmin int,
	hmax int,
	data date,
	hora Time with Time Zone,
	CONSTRAINT reference_station
        FOREIGN KEY (id_station)
        REFERENCES station (id)
);

insert into info_umidade (id_station, hmdy, hmin, hmax, data, hora)
(
	SELECT	S.id, N.hmdy, N.hmin, N.hmax, N.data, N.hora
	FROM	central_west AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_umidade (id_station, hmdy, hmin, hmax, data, hora)
(
	SELECT	S.id, N.hmdy, N.hmin, N.hmax, N.data, N.hora
	FROM	north AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_umidade (id_station, hmdy, hmin, hmax, data, hora)
(
	SELECT	S.id, N.hmdy, N.hmin, N.hmax, N.data, N.hora
	FROM	north_heast AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_umidade (id_station, hmdy, hmin, hmax, data, hora)
(
	SELECT	S.id, N.hmdy, N.hmin, N.hmax, N.data, N.hora
	FROM	south AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_umidade (id_station, hmdy, hmin, hmax, data, hora)
(
	SELECT	S.id, N.hmdy, N.hmin, N.hmax, N.data, N.hora
	FROM	south_heast AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);










