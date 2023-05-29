select * 
from central_west
limit 100

select prov, temp, data
from central_west as cw
where extract(month from cw.data) between 1 and 12
	and cw.temp between 35.0 and 90.0
	
	
\\ SEM A FUNCÃO ROUND
select 
cw.prov as estados_central_west,
n.prov as estados_north, 
nh.prov as estados_north_heast, 
s.prov as estados_south, 
sh.prov as estados_south_heast,
extract(year from cw.data) as ano_cw, 
extract(year from n.data) as ano_n, 
extract(year from nh.data) as ano_nh, 
extract(year from s.data) as ano_s, 
extract(year from sh.data) as ano_sh,
extract(month from cw.data) as mes_cw,
extract(month from n.data) as mes_n, 
extract(month from nh.data) as mes_nh, 
extract(month from s.data) as mes_s, 
extract(month from sh.data) as mes_sh,
avg(cw.temp) as media_temp_cw,
avg(n.temp) as media_temp_n, 
avg(nh.temp) as media_temp_nh,
avg(s.temp) as media_temp_s, 
avg(sh.temp) as media_temp_sh 
from 
central_west as cw 
join north as n on cw.temp = n.temp
join north_heast as nh on cw.temp = nh.temp
join south as s on cw.temp = s.temp
join south_heast as sh on cw.temp = sh.temp
where 
cw.temp between 0.0 and 90.0
	and n.temp between 0.0 and 90.0
	and nh.temp between 0.0 and 90.0
	and s.temp between 0.0 and 90.0
	and sh.temp between 0.0 and 90.0
group by estados_central_west, ano_cw, mes_cw, estados_north, ano_n, mes_n, estados_north_heast, ano_nh, mes_nh, estados_south, ano_s, mes_s, estados_south_heast, ano_sh, mes_sh;

\\ COM A FUNCAO ROUND

select prov,extract(year from data) as ano, extract(month from data) as mes, ROUND(
	(SELECT prov,extract(year from data) as ano, extract(month from data) as mes, avg(temp) as media
	FROM central_west
	where temp between 35.0 and 90.0
	group by prov, ano, mes),2) as media_temp
from central_west
where temp between 35.0 and 90.0
group by prov, ano, mes;


SELECT ROUND(3.566756, 2);
	
	
