#join queries

select * from sales;
Select *  from people;

#filtrer les ids des clients ensuite afficher leurs informations en utilisant la requette join
Select s.saledate,s.amount ,p.Salesperson,s.SPID,p.SPID
from sales s
join people p on p.SPID=s.SPID;

#utiliser la requette join plus specifiquement la plus utilisee dans le domaine de business est LEFT JOIN
Select s.saledate,s.amount ,s.PID,pr.product
from sales s
left join products pr on pr.pid=s.PID;

#join multiple table 
Select s.saledate,s.amount,p.Salesperson,p.SPID,s.SPID,pr.product,p.team
from sales s
join people p on p.SPID=s.SPID
join products pr on pr.pid=s.PID;

#conditions with join
Select s.saledate,s.amount,p.Salesperson,p.SPID,s.SPID,pr.product,p.team
from sales s
join people p on p.SPID=s.SPID
join products pr on pr.pid=s.PID
where s.amount< 500
and p.Team='Delish';

#people don't belong to any team
Select s.saledate,s.amount,p.Salesperson,p.SPID,s.SPID,pr.product,p.team
from sales s
join people p on p.SPID=s.SPID
join products pr on pr.pid=s.PID
where s.amount< 500
and p.Team is null;

#dans la table sont sous forme blank du blanc donc pas en null
Select s.saledate,s.amount,p.Salesperson,p.SPID,s.SPID,pr.product,p.team
from sales s
join people p on p.SPID=s.SPID
join products pr on pr.pid=s.PID
where s.amount< 500
and p.Team ='';

#En ajoutant a celle precedente la condition que les personnes sont de l'inde ou la nouvelle zelande
Select s.saledate,s.amount,p.Salesperson,p.SPID,s.SPID,pr.product,p.team
from sales s
join people p on p.SPID=s.SPID
join products pr on pr.pid=s.PID
join geo g on g.geoid=s.geoid
where s.amount< 500
and p.Team =''
and g.Geo in ('New Zeland','India')
order by saledate;

#utiliser group by 


