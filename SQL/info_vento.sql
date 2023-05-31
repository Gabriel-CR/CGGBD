-- INFO_VENTO {
-- 	vento velocidade horaria (m/s)
-- 	vento rajada maxima (m/s)
-- 	vento direcao horaria (gr) (° (gr))
-- }

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
)



