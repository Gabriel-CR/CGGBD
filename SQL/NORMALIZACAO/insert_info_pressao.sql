CREATE TABLE info_pressao (
	id_station serial,
	smin float,
	smax float,
	stp float,
	data date,
	hora Time with Time Zone,
	CONSTRAINT reference_station
        FOREIGN KEY (id_station)
        REFERENCES station (id)
);

insert into info_pressao (id_station, smin, smax, stp, data, hora)
(
	SELECT	S.id, N.smin, N.smax, N.stp, N.data, N.hora
	FROM	central_west AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_pressao (id_station, smin, smax, stp, data, hora)
(
	SELECT	S.id, N.smin, N.smax, N.stp, N.data, N.hora
	FROM	north AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_pressao (id_station, smin, smax, stp, data, hora)
(
	SELECT	S.id, N.smin, N.smax, N.stp, N.data, N.hora
	FROM	north_heast AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_pressao (id_station, smin, smax, stp, data, hora)
(
	SELECT	S.id, N.smin, N.smax, N.stp, N.data, N.hora
	FROM	south AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_pressao (id_station, smin, smax, stp, data, hora)
(
	SELECT	S.id, N.smin, N.smax, N.stp, N.data, N.hora
	FROM	south_heast AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);