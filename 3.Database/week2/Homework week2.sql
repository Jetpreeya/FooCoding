--Part 1 --

--1.What is the capital of country X ? (Accept X from user)

mysql> prepare cities from 'select ci.name from city ci inner join country co on 
ci.countrycode = co.code where lower(co.name) = ?';
Query OK, 0 rows affected (0.00 sec)
Statement prepared 

mysql> set @a = 'thailand';
Query OK, 0 rows affected (0.00 sec)

mysql> execute cities using @a;
+-------------------+
| name              |
+-------------------+
| Bangkok           |
| Nonthaburi        |
| Nakhon Ratchasima |
| Chiang Mai        |
| Udon Thani        |
| Hat Yai           |
| Khon Kaen         |
| Pak Kret          |
| Nakhon Sawan      |
| Ubon Ratchathani  |
| Songkhla          |
| Nakhon Pathom     |
+-------------------+
12 rows in set (0.00 sec)


--2.List all the languages spoken in the region Y (Accept Y from user)

--This is my logic
--First think about SELECT & INNER JOIN
mysql> SELECT countrylanguage.Language from countrylanguage inner join country on 
countrylanguage.CountryCode = country.code where Region = 'Polynesia';
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
mysql> prepare languages from 'SELECT countrylanguage.Language from countrylanguage inner join country 
on countrylanguage.CountryCode = country.code where Region = ?';
Query OK, 0 rows affected (0.00 sec)
Statement prepared

mysql> set @a = 'Southern Europe';
Query OK, 0 rows affected (0.00 sec)

mysql> execute languages using @a;
+----------------+
| Language       |
+----------------+
| Albaniana      |
| Greek          |
| Macedonian     |
| Catalan        |
| French         |
| Portuguese     |
| Spanish        |
| Serbo-Croatian |
| Basque         |
| Catalan        |
| Galecian       |
| Spanish        |
| Arabic         |
| English        |
| Greek          |
| Turkish        |
| Serbo-Croatian |
| Slovene        |
| Albaniana      |
| French         |
| Friuli         |
| German         |
| Italian        |
| Romani         |
| Sardinian      |
| Slovene        |
| Albaniana      |
| Macedonian     |
| Romani         |
| Serbo-Croatian |
| Turkish        |
| English        |
| Maltese        |
| Portuguese     |
| Italian        |
| Hungarian      |
| Serbo-Croatian |
| Slovene        |
| Italian        |
| Albaniana      |
| Hungarian      |
| Macedonian     |
| Romani         |
| Serbo-Croatian |
| Slovak         |
+----------------+
45 rows in set (0.00 sec)


--3.Find the number of cities in which language Z is spoken (Accept Z from user)
--This is my logic
--First , use Inner join to find that Am I write correct command ? 
mysql> SELECT city.name FROM city INNER JOIN country on city.countryCode = country.Code 
INNER JOIN countrylanguage on countrylanguage.CountryCode = country.code 
where Language = 'English';

--Then, I use COUNT to find number of all cities
mysql> SELECT COUNT(city.name) FROM city INNER JOIN country on 
city.countryCode = country.Code INNER JOIN countrylanguage on 
countrylanguage.CountryCode = country.code where Language = 'English'; 
+------------------+
| COUNT(city.name) |
+------------------+
|              823 |
+------------------+

--** Here is my answer, Finally I use prepare** 
mysql> prepare number from 'SELECT COUNT(city.name) FROM city INNER JOIN country 
on city.countryCode = country.Code INNER JOIN countrylanguage on 
countrylanguage.CountryCode = country.code where Language = ?';
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
mysql> SELECT Continent, count(1) from country inner join countrylanguage on 
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


--5.For the country given as input, 
--is there any countries that 
--1.have the same official language
--2.is in the same region
-- If yes, display those countries.
-- If no, display TRUE or FALSE

mysql> prepare number from 'SELECT country.Code, country.Name, country.Region , countrylanguage.Language
FROM country inner join countrylanguage on country.Code = countrylanguage.CountryCode where country.Name = ?';
   
mysql> set @a = 'Finland';
Query OK, 0 rows affected (0.00 sec)

mysql> set @b = 'Sweden';
Query OK, 0 rows affected (0.00 sec)

mysql> execute number using @a;
+------+---------+------------------+----------+
| Code | Name    | Region           | Language |
+------+---------+------------------+----------+
| FIN  | Finland | Nordic Countries | Estonian |
| FIN  | Finland | Nordic Countries | Finnish  |
| FIN  | Finland | Nordic Countries | Russian  |
| FIN  | Finland | Nordic Countries | Saame    |
| FIN  | Finland | Nordic Countries | Swedish  |
+------+---------+------------------+----------+
5 rows in set (0.00 sec)

mysql> execute number using @b;
+------+--------+------------------+---------------------------+
| Code | Name   | Region           | Language                  |
+------+--------+------------------+---------------------------+
| SWE  | Sweden | Nordic Countries | Arabic                    |
| SWE  | Sweden | Nordic Countries | Finnish                   |
| SWE  | Sweden | Nordic Countries | Norwegian                 |
| SWE  | Sweden | Nordic Countries | Southern Slavic Languages |
| SWE  | Sweden | Nordic Countries | Spanish                   |
| SWE  | Sweden | Nordic Countries | Swedish                   |
+------+--------+------------------+---------------------------+
6 rows in set (0.00 sec)

mysql> SELECT IF(@a = @b, "TRUE", "FALSE");
+------------------------------+
| IF(@a = @b, "TRUE", "FALSE") |
+------------------------------+
| FALSE                        |
+------------------------------+
1 row in set (0.00 sec) 


-- Check If --
mysql> set @a = 'England';
Query OK, 0 rows affected (0.00 sec)

mysql> set @b = 'England';
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT IF(@a = @b, "TRUE", "FALSE");
+------------------------------+
| IF(@a = @b, "TRUE", "FALSE") |
+------------------------------+
| TRUE                         |
+------------------------------+
1 row in set (0.00 sec)
