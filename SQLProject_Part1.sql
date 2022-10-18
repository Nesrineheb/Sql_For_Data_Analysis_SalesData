SHOW tables; #Afficher les tables de la bdd en cours
desc sales; #decrir les champs de la table sales ainsi que les details de chaque chapms

SELECT * from sales; #lister tous les lignes de la table

#lister des champs precis de la table
SELECT SaleDate,Amount,Customers from sales; 
SELECT Customers,Amount,GeoID from sales;

 #Ajouter des champs de calculs dans SELECT
Select SaleDate,Amount,boxes,Amount/boxes from sales;
 #Ajouter un nom a la colonne issue d'un calculs dans SELECT
Select SaleDate,Amount,boxes,Amount/boxes 'Amount per boxes'from sales;
Select SaleDate,Amount,boxes,Amount/boxes  as Amountperboxes from sales;
Select SaleDate,Amount,boxes,Amount/boxes as 'Amount per boxes'from sales;

#Ajouter des conditions dans SELECT
 Select * from Sales 
 where Amount>10000;

#ORDER BY dans sql
Select * from Sales 
where Amount>10000
order by Amount;
 
#order in decending
Select * from Sales 
where Amount>10000
order by Amount DESC;
 
#order in decending multiple sort criteria
Select * from Sales 
where geoid='g1'
order by PID,Amount DESC;

#where caluse 
Select * from sales
Where Amount>10000 and saledate >= '2022-01-01';

#where caluse extrair l'annee
Select SaleDate,amount from sales
where amount>10000 and year(SaleDate)=2022
Order by amount desc;

#filtrer par un interval (entre condtion)
Select * from sales
where boxes>0 and boxes<=50;

#les deux valeurs dans le beteen seront inclus dans la condtion
Select * from sales
where boxes between 0 and 50;

#Extrair le jour d'apres la date 
Select saledate,amount,boxes, weekday(saledate) AS dayofweek
From sales
where dayofweek=4;

#Utiliser plusieurs tables



Select * from people;

Select * from people where team='delish' or team='jucies';

#Utiliser in clause
Select * from people where team in ('delish','jucies');

#Utiliser Pattern matching  [like operator] 

	#les noms qui commence par B
	Select * from people where Salesperson like 'B%';
    
    #les noms qui ont la lettre B n'importe ou pas seulement le debut
	Select * from people where Salesperson like '%B%';
    
Select * from sales;
#Cases in sql
Select saledate,amount,
	   case 	when amount < 1000 then 'under 1 K'
				when amount< 5000 then 'under 5 K'
				when amount<10000 then 'under 5 k'
			else '10 K or more'
	   end as 'Amount category'
From sales;



