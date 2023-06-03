SELECT	ST.state, (
	SELECT	MAX(I.tmax)
	FROM	station AS S JOIN info_temperatura AS I ON S.id = I.id_station
	WHERE	ST.state = S.state
) AS temperatura
FROM	station AS ST
GROUP BY ST.state
ORDER BY temperatura;

SELECT n.wsnm
FROM station as s join info_temperatura as i on s.id = i.id_station join north_heast as n on s.region = n.region;