select * 
from SoccerDB.dbo.goalscorers

select * 
from SoccerDB.dbo.results
alter table dani.dbo.results
drop column winners


with hattrick_heros as(
select [date],home_team,away_team,team,scorer,minute,scorers=row_number () over(partition by scorer,date order by scorer) 
from SoccerDB.dbo.goalscorers 
where DATEPART(YEAR,date) >=1960 and own_goal = 'FALSE') 
select scorer,scorers
into all_hatricks
from hattrick_heros
where scorers =3

select *
from all_hatricks

select  top 10 scorer,COUNT(scorer) as most_hatrick
from all_hatricks
group by scorer
order by most_hatrick desc

