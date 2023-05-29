select * 
from north
limit 100;

-- Projeta a cidade e a temperatura: Usando como filtro o estado, data e hora(intervalo)
-- tirando dados não válidos
SELECT wsnm as cidade, data, hora, temp as temperatura
FROM north_heast
WHERE prov = 'CE'and
	data = '2020-01-01' and
	hora between '00:00:00-03:00' and '23:59:50-03:00' and
	temp <> -9999;
	
select * 
from north_heast
where wsnm = 'QUIXERAMOBIM';
