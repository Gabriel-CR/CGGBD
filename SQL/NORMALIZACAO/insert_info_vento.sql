CREATE TABLE info_vento (
	id_station serial,
	wdsp float,
	gust float,
	wdct float,
	data date,
	hora Time with Time Zone,
	CONSTRAINT reference_station
        FOREIGN KEY (id_station)
        REFERENCES station (id)
);

insert into info_vento (id_station, wdsp, gust, wdct, data, hora)
(
	SELECT	S.id, N.wdsp, N.gust, N.wdct, N.data, N.hora
	FROM	central_west AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_vento (id_station, wdsp, gust, wdct, data, hora)
(
	SELECT	S.id, N.wdsp, N.gust, N.wdct, N.data, N.hora
	FROM	north AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_vento (id_station, wdsp, gust, wdct, data, hora)
(
	SELECT	S.id, N.wdsp, N.gust, N.wdct, N.data, N.hora
	FROM	north_heast AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_vento (id_station, wdsp, gust, wdct, data, hora)
(
	SELECT	S.id, N.wdsp, N.gust, N.wdct, N.data, N.hora
	FROM	south AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);

insert into info_vento (id_station, wdsp, gust, wdct, data, hora)
(
	SELECT	S.id, N.wdsp, N.gust, N.wdct, N.data, N.hora
	FROM	south_heast AS N LEFT JOIN station AS S ON N.inme = S.station_code
	WHERE	S.id IS NOT NULL
);











