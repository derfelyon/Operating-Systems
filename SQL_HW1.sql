# Yonatan Derfel(205570989) , Amit Koren(313288284)
USE world ;
SELECT  * FROM country ;
SELECT  * FROM city ;
SELECT  * FROM countrylanguage ;
#"\*q1*\"
SELECT  continent FROM country ;
SELECT  count(continent) FROM country ;
#There are 239 continents
#"\*q2*\"
SELECT Name , continent FROM  country 
WHERE continent = "South America" ;
SELECT count(Name) FROM  country 
WHERE continent = "South America" ;
# ther are 14 countries in South America
#"\*q3*\"
select Name , LifeExpectancy FROM country
order by LifeExpectancy DESC
limit 10 ;
#"\*q4*\"
SELECT  Name,Language ,Percentage, city.CountryCode 
FROM countrylanguage
JOIN city on countrylanguage.CountryCode = city.CountryCode
GROUP BY CountryCode
having Percentage = 100;
#"\*q5*\"
#1
select CountryCode, Language, max(Percentage)
from countrylanguage
GROUP BY CountryCode
order by Percentage desc;
# THERE ARE 9 country where its entire population speak only this language
#2
SELECT distinct count(Language)
from (
select CountryCode, Language, max(Percentage)
from countrylanguage
GROUP BY CountryCode
order by Percentage desc) AS EL ;
# There are 233 such languages
#"\*q6*\"
select Name, IndepYear 
from country
where IndepYear < 1990 and IndepYear > 1979 ;
#"\*q7*\"
select Name, Population
from city
order by Population asc
limit 5;
#"\*q8*\"
select Name 
FROM country
where Continent = "South America" or Continent = "north America" and GovernmentForm != "republic";
#"\*q9*\"
#1
select count(Name) 
from (
select Name,IndepYear
from country 
WHERE IndepYear IS null) as kj;
# 47 countries are not independent
#2
select IndepYear 
FROM country 
where IndepYear not between 0 and 2000;  
# strange IndepYear value
#"\*q10*\"
select Name
from country 
where Population >100000000 and GovernmentForm ="Constitutional Monarchy";
#"\*q11*\"
USE sakila ;
#a 12 tables 
#b 
select first_name,last_name from staff 
where first_name IS not null;
#c
select title from film
where length > 180




