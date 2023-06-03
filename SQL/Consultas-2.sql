-- Umidade minima e maxima de um local em um intervalo de datas 2017 a 2023 

SELECT S.state, (SELECT max(hmax)
		FROM station as st join info_umidade as iu on st.id = iu.id_station
		WHERE iu.data between '2017-12-20' and '2023-05-30'
				and st.state = S.state), (
		SELECT min(hmin)
		FROM station as st join info_umidade as iu on st.id = iu.id_station
		WHERE iu.data between '2017-12-20' and '2023-05-30'
				and st.state = S.state
				and hmin <> -9999)
FROM station as S
WHERE  S.state = 'CE'
GROUP BY S.state;


-- Listar as cidades no CE com a maior temperatura e temperatura minima em um intervalo de datas
SELECT nh.wsnm, max(nh.tmax), min(nh.tmin), nh.data
FROM station as st join north_heast as nh on st.region = nh.region
WHERE nh.prov = 'CE' and
	nh.data between '2021-01-01' and '2022-12-31' and
	nh.tmin <> -9999
GROUP BY nh.wsmn, nh.data;

-- Listar as cidades com valor elevação ordenado em ordem descrecente com sua temperatura max e min 

SELECT st.station, st.height, max(nh.tmax), min(nh.tmin), nh.data
FROM station as st join info_temperatura as nh on st.id = nh.id_station
WHERE st.state = 'CE' and
	nh.data between '2021-01-01' and '2022-12-31' and
	nh.tmin <> -9999
GROUP BY st.station, st.height, nh.data
ORDER BY st.height DESC;

-- Listar as cidades no CE que tiveram a temperatura de 35 graus ou mais e quantas vezes aconteceu 

SELECT nh.wsnm, COUNT(nh.wsnm)
FROM station as st join north_heast as nh on st.region = nh.region
WHERE nh.prov = CE and
	nh.temp = 35;


-- Listar as cidades no CE que tiveram a maior velocidade de ventos e a data que aconteceu

SELECT nh.wsnm, max(nh.wdsp), nh.data
FROM station as st join north_heast as nh on st.region = nh.region
WHERE nh.prov = 'CE'
GROUP BY nh.wsnm, nh.data
ORDER BY nh.wdsp DESC;

