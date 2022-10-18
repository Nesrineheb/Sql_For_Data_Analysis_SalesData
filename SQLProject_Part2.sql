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

#utiliser group by  like a pivot table in excel
SELECT geoid,sum(amount)
from sales
group by geoid;

SELECT geoid,sum(amount) ,avg(amount),sum(boxes) 
from sales
group by geoid;
	#group by along with join
SELECT g.geo,sum(amount) ,avg(amount),sum(boxes) 
from sales s
join geo g on s.GeoID=g.GeoID
group by g.geo;
	#group by along with multiple join
select pr.category,p.team,sum(boxes),sum(amount)
from sales s
join people p on p.spid=s.spid
join products pr on pr.pid=s.pid
where p.team<>''
group by pr.category,p.team
order by pr.Category,p.team;

#total amount by product then show top 10 products
select pr.product,sum(s.amount) as 'Total amount'
from sales s
join products pr on pr.pid=s.pid
group by pr.Product
order by 'Total amount' desc
limit 10;





