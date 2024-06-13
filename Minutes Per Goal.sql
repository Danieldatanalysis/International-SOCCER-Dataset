select * 
from SoccerDB.dbo.results

select * 
from SoccerDB.dbo.goalscorers

delete from SoccerDB.dbo.goalscorers
where [minute] is null


select a.[minute],tournament,datepart(year,a.[date]) as year
into minutegoal

from SoccerDB.dbo.goalscorers a inner join SoccerDB.dbo.results b on a.date  =  b.date

order by [minute] desc



select [minute],year
from minutegoal
where year >= 1960
order by [minute] desc



select minute,count(minute) as minutecount
from minutegoal
where year >= 1960
group by minute 
order by minutecount desc