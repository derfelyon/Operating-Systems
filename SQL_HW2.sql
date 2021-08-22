# Yonatan Derfel(205570989) , Amit Koren(313288284)
USE world ;
#/*Q1*/
# Total Population as average 
SELECT Name,Population FROM country
order by Population desc;
#/*Q2*/
SELECT SUM(Population) AS " Total poplation"
FROM country 
order by Population desc;
#/*Q3*/
# assuming if Percentage = 0 the languages is not spoken 
SELECT distinct count(Language) 
FROM countrylanguage
where Percentage > 0;
#/*Q4*/
SELECT Continent , count(NAME)  FROM country 
group by Continent ;
#/*Q5*/
SELECT distinct CountryCode,count(Language) FROM countrylanguage 
where Percentage > 0
group by  CountryCode ;
#/*Q6*/
SELECT distinct CountryCode,count(Language) FROM countrylanguage 
where Percentage > 0 
group by  CountryCode 
having count(Language) > 10;
#/*Q7*/
SELECT distinct CountryCode,count(Language) FROM countrylanguage 
where Percentage > 0 
group by  CountryCode 
order by count(Language) desc
limit  5 ;
#/*Q8*/
USE sakila ;
SELECT address , phone 
FROM address
WHERE phone like "177%";
#/*Q9*/
USE `classicmodels`;
##A##
SELECT firstName , count(orderNumber) as " Total orders",sum(amount) as " Total payment"
FROM employees
JOIN customers
ON employees.employeeNumber = customers.salesRepEmployeeNumber
JOIN orders
ON  customers.customerNumber =  orders.customerNumber
JOIN payments
ON  customers.customerNumber = payments.customerNumber
WHERE jobTitle ='Sales Rep' 
group by employeeNumber 
order by sum(amount) desc ;
##B##
SELECT orderNumber ,customerName ,phone,employeeNumber as 'sales representative' ,reportsTo as 'sales manager' ,sum(amount) as 'Total amount',comments,status
FROM employees
JOIN customers
ON employees.employeeNumber = customers.salesRepEmployeeNumber
JOIN orders
ON  customers.customerNumber =  orders.customerNumber
JOIN payments
ON  customers.customerNumber = payments.customerNumber
WHERE status ='Disputed'
group by orderNumber
order by sum(amount) desc ;
##C##
SELECT year(paymentDate),SUM(amount)
FROM payments
group by year(paymentDate)
order by SUM(amount) desc;
#/*10*/
## crateing the table 
create database myworld;
use myworld ;
CREATE TABLE country (
  Code CHAR(3),
    Name CHAR(52),
  Continent ENUM('eurpe','asia'),
  PRIMARY KEY  (Code));
  
  
  CREATE TABLE countrylanguage (
  CountryCode CHAR(3),
    Language CHAR(52),
  IsOfficial ENUM('T','F'),
  PRIMARY KEY  (Language));

## inserting to table 

INSERT into myworld.country ( code,Name,Continent)
select code,Name,Continent
from world.country 
where Name  = 'Israel' ;

INSERT into myworld.countrylanguage (CountryCode,Language,IsOfficial)
select CountryCode,Language,IsOfficial
from world.countrylanguage  
where CountryCode ='ISR' ;

select * from country;
select * from countrylanguage;








