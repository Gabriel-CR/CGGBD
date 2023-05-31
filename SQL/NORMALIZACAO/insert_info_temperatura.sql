CREATE TABLE info_temperatura (
	id_station serial,
	dmin float,
	dmax float,
	tmin float,
	tmax float,
	dewp float,
	data date,
	hora Time with Time Zone,
	CONSTRAINT reference_station
        FOREIGN KEY (id_station)
        REFERENCES station (id)
);

insert into info_temperatura (id_station, dmin, dmax, tmin, tmax, dewp, data, hora)
(
	SELECT	S.id, N.dmin, N.dmax, N.tmin, N.tmax, N.dewp, N.data, N.hora
	FROM	central_west AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_temperatura (id_station, dmin, dmax, tmin, tmax, dewp, data, hora)
(
	SELECT	S.id, N.dmin, N.dmax, N.tmin, N.tmax, N.dewp, N.data, N.hora
	FROM	north AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_temperatura (id_station, dmin, dmax, tmin, tmax, dewp, data, hora)
(
	SELECT	S.id, N.dmin, N.dmax, N.tmin, N.tmax, N.dewp, N.data, N.hora
	FROM	north_heast AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_temperatura (id_station, dmin, dmax, tmin, tmax, dewp, data, hora)
(
	SELECT	S.id, N.dmin, N.dmax, N.tmin, N.tmax, N.dewp, N.data, N.hora
	FROM	south AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_temperatura (id_station, dmin, dmax, tmin, tmax, dewp, data, hora)
(
	SELECT	S.id, N.dmin, N.dmax, N.tmin, N.tmax, N.dewp, N.data, N.hora
	FROM	south_heast AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);