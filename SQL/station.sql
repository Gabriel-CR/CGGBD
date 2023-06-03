create table station (
	id serial primary key,
	station varchar,
	region varchar,
	state varchar,
	station_code varchar,
	first_date date,
	height float,
	longitude double precision,
	latitude double precision
);

insert into station (station, region, state, station_code, first_date, height, longitude, latitude)
(
	SELECT	station, region, state, station_code, first_date, height, longitude, latitude
	FROM	stations
);
