--Part 1 --

--1.What is the capital of country X ? (Accept X from user)
mysql> select city.name from city inner join country on city.ID = country.capital where country.name = 'Sweden';
+-----------+
| name      |
+-----------+
| Stockholm |
+-----------+
1 row in set (0.00 sec)

--Prepare capital--
mysql> prepare capital from 
'select city.name from city inner join country on city.ID = country.capital where country.name =?';

-- where lower(country.name) = lower(?) you can use lower for sensitive case


mysql> set @a = 'finland';
Query OK, 0 rows affected (0.00 sec)

mysql> execute capital using @a;
+------------------------+
| name                   |
+------------------------+
| Helsinki [Helsingfors] |
+------------------------+
1 row in set (0.00 sec)

mysql> set @b = 'China';
Query OK, 0 rows affected (0.00 sec)

mysql> execute capital using @b;
+--------+
| name   |
+--------+
| Peking |
+--------+
1 row in set (0.00 sec)

--2.List all the languages spoken in the region Y (Accept Y from user)

--This is my logic
--First think about SELECT & INNER JOIN
mysql> SELECT DISTINCT(countrylanguage.Language) from countrylanguage inner join country on 
countrylanguage.CountryCode = country.code where country.Region = 'Polynesia';

mysql> SELECT DISTINCT(countrylanguage.Language) from countrylanguage inner join country on
    countrylanguage.CountryCode = country.code where lower(country.Region) = lower('Polynesia');
+----------------+
| Language       |
+----------------+
| English        |
| Samoan         |
| Tongan         |
| Maori          |
| Niue           |
| Pitcairnese    |
| Chinese        |
| French         |
| Tahitian       |
| Tokelau        |
| Kiribati       |
| Tuvalu         |
| Futuna         |
| Wallis         |
| Samoan-English |
+----------------+
15 rows in set (0.01 sec)

--If you not write DISTINCT--
mysql> SELECT countrylanguage.Language from countrylanguage inner join country on countrylanguage.CountryCode = country.code where country.Region = 'Polynesia';
+----------------+
| Language       |
+----------------+
| English        |
| Samoan         |
| Tongan         |
| English        |
| Maori          |
| English        |
| Niue           |
| Pitcairnese    |
| Chinese        |
| French         |
| Tahitian       |
| English        |
| Tokelau        |
| English        |
| Tongan         |
| English        |
| Kiribati       |
| Tuvalu         |
| Futuna         |
| Wallis         |
| English        |
| Samoan         |
| Samoan-English |
+----------------+
23 rows in set (0.00 sec)

--Then, I put SELECT command after prepare
--** This is my answer for Q2 
mysql> prepare languages from 'SELECT countrylanguage.Language, country.Name
from countrylanguage 
inner join country 
on countrylanguage.CountryCode = country.code where country.Region = ?';
Query OK, 0 rows affected (0.00 sec)
Statement prepared

mysql> set @a = 'Southern Europe';
Query OK, 0 rows affected (0.00 sec)

mysql> execute languages using @a;
+----------------+-------------------------------+
| Language       | Name                          |
+----------------+-------------------------------+
| Albaniana      | Albania                       |
| Greek          | Albania                       |
| Macedonian     | Albania                       |
| Catalan        | Andorra                       |
| French         | Andorra                       |
| Portuguese     | Andorra                       |
| Spanish        | Andorra                       |
| Serbo-Croatian | Bosnia and Herzegovina        |
| Basque         | Spain                         |
| Catalan        | Spain                         |
| Galecian       | Spain                         |
| Spanish        | Spain                         |
| Arabic         | Gibraltar                     |
| English        | Gibraltar                     |
| Greek          | Greece                        |
| Turkish        | Greece                        |
| Serbo-Croatian | Croatia                       |
| Slovene        | Croatia                       |
| Albaniana      | Italy                         |
| French         | Italy                         |
| Friuli         | Italy                         |
| German         | Italy                         |
| Italian        | Italy                         |
| Romani         | Italy                         |
| Sardinian      | Italy                         |
| Slovene        | Italy                         |
| Albaniana      | Macedonia                     |
| Macedonian     | Macedonia                     |
| Romani         | Macedonia                     |
| Serbo-Croatian | Macedonia                     |
| Turkish        | Macedonia                     |
| English        | Malta                         |
| Maltese        | Malta                         |
| Portuguese     | Portugal                      |
| Italian        | San Marino                    |
| Hungarian      | Slovenia                      |
| Serbo-Croatian | Slovenia                      |
| Slovene        | Slovenia                      |
| Italian        | Holy See (Vatican City State) |
| Albaniana      | Yugoslavia                    |
| Hungarian      | Yugoslavia                    |
| Macedonian     | Yugoslavia                    |
| Romani         | Yugoslavia                    |
| Serbo-Croatian | Yugoslavia                    |
| Slovak         | Yugoslavia                    |
+----------------+-------------------------------+
45 rows in set (0.00 sec)

--3.Find the number of cities in which language Z is spoken (Accept Z from user)
--This is my logic, I use COUNT to find number of all cities. 

mysql> SELECT COUNT(city.name) FROM city INNER JOIN countrylanguage on
    -> countrylanguage.CountryCode = city.CountryCode where Language = 'English';

+------------------+
| COUNT(city.name) |
+------------------+
|              823 |
+------------------+
1 row in set (0.00 sec)

--** Here is my answer, Finally I use prepare** 
mysql> prepare number from 'SELECT COUNT(city.name) FROM city INNER JOIN countrylanguage 
on countrylanguage.CountryCode = city.CountryCode where Language= ?';
Query OK, 0 rows affected (0.00 sec)
Statement prepared

mysql> set @a = 'French';
Query OK, 0 rows affected (0.00 sec)

mysql> execute number using @a;
+------------------+
| COUNT(city.name) |
+------------------+
|              467 |
+------------------+
1 row in set (0.00 sec)


--4.List all the continents with the number of languages spoken in each continent
mysql> SELECT Continent, COUNT(countrylanguage.language) from country inner join countrylanguage on 
countrylanguage.CountryCode = country.code group by Continent;
--Same result COUNT(1) & COUNT(countrylanguage.language)
mysql> SELECT Continent, COUNT(1) from country inner join countrylanguage on 
countrylanguage.CountryCode = country.code group by Continent;
+---------------+----------+
| Continent     | count(1) |
+---------------+----------+
| Asia          |      239 |
| Europe        |      202 |
| North America |      109 |
| Africa        |      310 |
| Oceania       |       82 |
| South America |       42 |
+---------------+----------+
6 rows in set (0.00 sec)

mysql> SELECT Continent, COUNT(DISTINCT(countrylanguage.language)) from country inner join countrylanguage on
    countrylanguage.CountryCode = country.code group by Continent;
+---------------+-------------------------------------------+
| Continent     | COUNT(DISTINCT(countrylanguage.language)) |
+---------------+-------------------------------------------+
| Asia          |                                       138 |
| Europe        |                                        62 |
| North America |                                        43 |
| Africa        |                                       215 |
| Oceania       |                                        43 |
| South America |                                        21 |
+---------------+-------------------------------------------+
6 rows in set (0.02 sec)

--5.For the country given as input, is there any countries that 
--have the same official language
--is in the same region
--If yes, display those countries.
--If no, display TRUE or FALSE

mysql> prepare samelanguage from 'SELECT country.Code, country.Name, country.Region , countrylanguage.Language  
FROM country inner join countrylanguage  on country.Code = countrylanguage.CountryCode 
AND countrylanguage.isOfficial=\'T\' inner join (SELECT country.Code, country.Name, country.Region , countrylanguage.Language  
FROM country inner join countrylanguage  on country.Code = countrylanguage.CountryCode AND countrylanguage.isOfficial=\'T\' 
WHERE country.Name=?) as countryalias on countryalias.Region = country.Region AND countryalias.Language = countrylanguage.Language';
Query OK, 0 rows affected (0.00 sec)
Statement prepared

mysql> set @a = 'Sweden';
Query OK, 0 rows affected (0.00 sec)

mysql> execute samelanguage using @a;
+------+---------+------------------+----------+
| Code | Name    | Region           | Language |
+------+---------+------------------+----------+
| FIN  | Finland | Nordic Countries | Swedish  |
| SWE  | Sweden  | Nordic Countries | Swedish  |
+------+---------+------------------+----------+
2 rows in set (0.00 sec)

mysql> set @b ='Finland';
Query OK, 0 rows affected (0.00 sec)

mysql> execute samelanguage using @b;
+------+---------+------------------+----------+
| Code | Name    | Region           | Language |
+------+---------+------------------+----------+
| FIN  | Finland | Nordic Countries | Finnish  |
| FIN  | Finland | Nordic Countries | Swedish  |
| SWE  | Sweden  | Nordic Countries | Swedish  |
+------+---------+------------------+----------+
3 rows in set (0.00 sec)
