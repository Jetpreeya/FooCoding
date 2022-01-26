--Part 1 --

--1.What is the capital of country X ? (Accept X from user)

mysql> prepare capital from 'select ci.name from city ci inner join country co on ci.countrycode = co.code where co.name =?' ;
Query OK, 0 rows affected (0.00 sec)
Statement prepared 

mysql> set @a = 'finland';
Query OK, 0 rows affected (0.00 sec)

mysql> execute capital using @a;
+------------------------+
| name                   |
+------------------------+
| Helsinki [Helsingfors] |
| Espoo                  |
| Tampere                |
| Vantaa                 |
| Turku [Åbo]            |
| Oulu                   |
| Lahti                  |
+------------------------+
7 rows in set (0.00 sec)

--2.List all the languages spoken in the region Y (Accept Y from user)

--This is my logic
--First think about SELECT & INNER JOIN
mysql> SELECT countrylanguage.Language , country.Name, country.Region from countrylanguage inner join country on 
countrylanguage.CountryCode = country.code where Region = 'Polynesia';
+----------------+-------------------+-----------+
| Language       | Name              | Region    |
+----------------+-------------------+-----------+
| English        | American Samoa    | Polynesia |
| Samoan         | American Samoa    | Polynesia |
| Tongan         | American Samoa    | Polynesia |
| English        | Cook Islands      | Polynesia |
| Maori          | Cook Islands      | Polynesia |
| English        | Niue              | Polynesia |
| Niue           | Niue              | Polynesia |
| Pitcairnese    | Pitcairn          | Polynesia |
| Chinese        | French Polynesia  | Polynesia |
| French         | French Polynesia  | Polynesia |
| Tahitian       | French Polynesia  | Polynesia |
| English        | Tokelau           | Polynesia |
| Tokelau        | Tokelau           | Polynesia |
| English        | Tonga             | Polynesia |
| Tongan         | Tonga             | Polynesia |
| English        | Tuvalu            | Polynesia |
| Kiribati       | Tuvalu            | Polynesia |
| Tuvalu         | Tuvalu            | Polynesia |
| Futuna         | Wallis and Futuna | Polynesia |
| Wallis         | Wallis and Futuna | Polynesia |
| English        | Samoa             | Polynesia |
| Samoan         | Samoa             | Polynesia |
| Samoan-English | Samoa             | Polynesia |
+----------------+-------------------+-----------+
23 rows in set (0.00 sec)

--Then, I put SELECT command after prepare
--** This is my answer for Q2 
mysql> prepare languages from 'SELECT countrylanguage.Language, country.Name, country.Region 
from countrylanguage 
inner join country 
on countrylanguage.CountryCode = country.code where Region = ?';
Query OK, 0 rows affected (0.00 sec)
Statement prepared

mysql> set @a = 'Southern Europe';
Query OK, 0 rows affected (0.00 sec)

mysql> execute languages using @a;
+----------------+-------------------------------+-----------------+
| Language       | Name                          | Region          |
+----------------+-------------------------------+-----------------+
| Albaniana      | Albania                       | Southern Europe |
| Greek          | Albania                       | Southern Europe |
| Macedonian     | Albania                       | Southern Europe |
| Catalan        | Andorra                       | Southern Europe |
| French         | Andorra                       | Southern Europe |
| Portuguese     | Andorra                       | Southern Europe |
| Spanish        | Andorra                       | Southern Europe |
| Serbo-Croatian | Bosnia and Herzegovina        | Southern Europe |
| Basque         | Spain                         | Southern Europe |
| Catalan        | Spain                         | Southern Europe |
| Galecian       | Spain                         | Southern Europe |
| Spanish        | Spain                         | Southern Europe |
| Arabic         | Gibraltar                     | Southern Europe |
| English        | Gibraltar                     | Southern Europe |
| Greek          | Greece                        | Southern Europe |
| Turkish        | Greece                        | Southern Europe |
| Serbo-Croatian | Croatia                       | Southern Europe |
| Slovene        | Croatia                       | Southern Europe |
| Albaniana      | Italy                         | Southern Europe |
| French         | Italy                         | Southern Europe |
| Friuli         | Italy                         | Southern Europe |
| German         | Italy                         | Southern Europe |
| Italian        | Italy                         | Southern Europe |
| Romani         | Italy                         | Southern Europe |
| Sardinian      | Italy                         | Southern Europe |
| Slovene        | Italy                         | Southern Europe |
| Albaniana      | Macedonia                     | Southern Europe |
| Macedonian     | Macedonia                     | Southern Europe |
| Romani         | Macedonia                     | Southern Europe |
| Serbo-Croatian | Macedonia                     | Southern Europe |
| Turkish        | Macedonia                     | Southern Europe |
| English        | Malta                         | Southern Europe |
| Maltese        | Malta                         | Southern Europe |
| Portuguese     | Portugal                      | Southern Europe |
| Italian        | San Marino                    | Southern Europe |
| Hungarian      | Slovenia                      | Southern Europe |
| Serbo-Croatian | Slovenia                      | Southern Europe |
| Slovene        | Slovenia                      | Southern Europe |
| Italian        | Holy See (Vatican City State) | Southern Europe |
| Albaniana      | Yugoslavia                    | Southern Europe |
| Hungarian      | Yugoslavia                    | Southern Europe |
| Macedonian     | Yugoslavia                    | Southern Europe |
| Romani         | Yugoslavia                    | Southern Europe |
| Serbo-Croatian | Yugoslavia                    | Southern Europe |
| Slovak         | Yugoslavia                    | Southern Europe |
+----------------+-------------------------------+-----------------+
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


--5.For the country given as input, is there any countries that 
--have the same official language
--is in the same region
--If yes, display those countries.
--If no, display TRUE or FALSE

mysql> prepare samelanguage from 'SELECT country.Code, country.Name, country.Region , countrylanguage.Language  
FROM country inner join countrylanguage  on country.Code >= countrylanguage.CountryCode 
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

mysql> set @b = 'Singapore';
Query OK, 0 rows affected (0.00 sec)

mysql> execute samelanguage using @b;
+------+-----------+----------------+----------+
| Code | Name      | Region         | Language |
+------+-----------+----------------+----------+
| BRN  | Brunei    | Southeast Asia | Malay    |
| IDN  | Indonesia | Southeast Asia | Malay    |
| MYS  | Malaysia  | Southeast Asia | Malay    |
| SGP  | Singapore | Southeast Asia | Chinese  |
| SGP  | Singapore | Southeast Asia | Malay    |
| SGP  | Singapore | Southeast Asia | Tamil    |
+------+-----------+----------------+----------+
6 rows in set (0.00 sec)
