CREATE TABLE info_outras (
	id_station serial,
	prcp float,
	gbrd int,
	data date,
	hora Time with Time Zone,
	CONSTRAINT reference_station
        FOREIGN KEY (id_station)
        REFERENCES station (id)
);

insert into info_outras (id_station, prcp, gbrd, data, hora)
(
	SELECT	S.id, N.prcp, N.gbrd, N.data, N.hora
	FROM	central_west AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_outras (id_station, prcp, gbrd, data, hora)
(
	SELECT	S.id, N.prcp, N.gbrd, N.data, N.hora
	FROM	north AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_outras (id_station, prcp, gbrd, data, hora)
(
	SELECT	S.id, N.prcp, N.gbrd, N.data, N.hora
	FROM	north_heast AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_outras (id_station, prcp, gbrd, data, hora)
(
	SELECT	S.id, N.prcp, N.gbrd, N.data, N.hora
	FROM	south AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_outras (id_station, prcp, gbrd, data, hora)
(
	SELECT	S.id, N.prcp, N.gbrd, N.data, N.hora
	FROM	south_heast AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);











