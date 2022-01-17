//1.create a database HR//
mysql> CREATE DATABASE db_HR;
Query OK, 1 row affected (0.01 sec)

//2.create a table employee//
mysql> USE db_HR;
Database changed

mysql> CREATE TABLE employee (EmployeeID INT(8) PRIMARY KEY(EmployeeID) , 
DepartmentID CHAR(4), FirstName VARCHAR(20), LastName VARCHAR(20), Gender ENUM('M','F'), 
Email VARCHAR(30), Salary VARCHAR(8), StartWorkDate DATE);
Query OK, 0 rows affected (0.05 sec)

mysql>  DESCRIBE employee;
+---------------+---------------+------+-----+---------+-------+
| Field         | Type          | Null | Key | Default | Extra |
+---------------+---------------+------+-----+---------+-------+
| EmployeeID    | int(8)        | NO   | PRI | NULL    |       |
| DepartmentID  | char(4)       | YES  |     | NULL    |       |
| FirstName     | varchar(20)   | YES  |     | NULL    |       |
| LastName      | varchar(20)   | YES  |     | NULL    |       |
| Gender        | enum('M','F') | YES  |     | NULL    |       |
| Email         | varchar(30)   | YES  |     | NULL    |       |
| Salary        | varchar(8)    | YES  |     | NULL    |       |
| StartWorkDate | date          | YES  |     | NULL    |       |
+---------------+---------------+------+-----+---------+-------+
8 rows in set (0.01 sec)

//3.create a table locations//
mysql> USE db_HR;
Database changed

mysql> CREATE TABLE locations (LocationID INT(8)PRIMARY KEY(LocationID), 
Adress VARCHAR(20), Street VARCHAR(20), City VARCHAR(20), Country VARCHAR(20), 
PostalCode VARCHAR(7),EmployeeID INT(11) FOREIGN KEY(EmployeeID) REFERENCES employee(EmployeeID));
Query OK, 0 rows affected (0.05 sec)

mysql> DESCRIBE locations;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| LocationID | int(8)      | NO   | PRI | NULL    |       |
| Adress     | varchar(20) | YES  |     | NULL    |       |
| Street     | varchar(20) | YES  |     | NULL    |       |
| City       | varchar(20) | YES  |     | NULL    |       |
| Country    | varchar(20) | YES  |     | NULL    |       |
| PostalCode | varchar(7)  | YES  |     | NULL    |       |
| EmployeeID | int(11)     | YES  | MUL | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

//Show all tables in database HR//

mysql> USE db_HR;
Database changed
mysql> SHOW tables;
+-----------------+
| Tables_in_db_hr |
+-----------------+
| employee        |
| locations       |
+-----------------+

//4. Insert 10-20 rows in each table with relevant fields.//

//4.1 Insert into employee table//
mysql> INSERT INTO employee(EmployeeID, DepartmentID, FirstName, LastName, Gender, Email, Salary, StartWorkDate) 
VALUES
('11111', 'D1001', 'Emy', 'Amit', 'F', 'Emy.Amit@hotmail.com', '24,000', '2004-12-22'),
('232356','F200','Michal','Hills','M','Michal.H@gmail.com','24,000','2005-02-25'),
('224566','D100','Das','Nitin','M','Das.Nit@gmail.com','28,000','2007-07-24'),
('345341','M300','Sharma', 'Sayak', 'F', 'Sharma.S@hotmail.com', '30,000','2005-03-14'),
('394564','B200','Punia','Mani','F','Mani_P@gmail.com','28,000','2006-04-01'),
('455675','R100','Luis','Vuitong','F','Luis_V@hotmail.com','24,000','2007-02-11'),
('542193', 'F100','Wony','Elicson','M','Wony@gmail.com','26,000','2006-11-12');
('564219','F100','Paul','Walker','M','P.Walker@google.com', '23,000','2008-12-07'),
('642193', 'F100', 'Jana','Amand','F','Jana.Amand@gmail.com','25,000','2004-11-02'),
('988678','E100', 'Lex', 'Demond','M','Lex.Demond@hotmail.com', '21,000', '2008-03-01'),


mysql> SELECT * FROM employee;
+------------+--------------+-----------+----------+--------+------------------------+--------+---------------+
| EmployeeID | DepartmentID | FirstName | LastName | Gender | Email                  | Salary | StartWorkDate |
+------------+--------------+-----------+----------+--------+------------------------+--------+---------------+
|      11111 | D100         | Emy       | Amit     | F      | Emy.Amit@hotmail.com   | 24,000 | 2004-12-22    |
|     224566 | D100         | Das       | Nitin    | M      | Das.Nit@gmail.com      | 28,000 | 2007-07-24    |
|     232356 | F200         | Michal    | Hills    | M      | Michal.H@gmail.com     | 24,000 | 2005-02-25    |
|     345341 | M300         | Sharma    | Sayak    | F      | Sharma.S@hotmail.com   | 30,000 | 2005-03-14    |
|     394564 | B200         | Punia     | Mani     | F      | Mani_P@gmail.com       | 28,000 | 2006-04-01    |
|     455675 | R100         | Luis      | Vuitong  | F      | Luis_V@hotmail.com     | 24,000 | 2007-02-11    |
|     542193 | F100         | Wony      | Elicson  | M      | Wony@gmail.com         | 26,000 | 2006-11-12    |
|     564219 | F100         | Paul      | Walker   | M      | P.Walker@google.com    | 23,000 | 2008-12-07    |
|     642193 | F100         | Jana      | Amand    | F      | Jana.Amand@gmail.com   | 25,000 | 2004-11-02    |
|     988678 | E100         | Lex       | Demond   | M      | Lex.Demond@hotmail.com | 21,000 | 2008-03-01    |
+------------+--------------+-----------+----------+--------+------------------------+--------+---------------+
10 rows in set (0.00 sec)

//4.2 Insert into locations table//
INSERT INTO locations(LocationID,Adress,Street,City,Country,PostalCode,EmployeeID) 
VALUES
('1330', '15 lgh', 'Southern Street', 'London', 'England','21568','11111'),
('75','88 lol','Main Street','Lund','Sweden','78895','224566'),
('456','30 pap','Jarvisville Street', 'Francis', 'USA','56678','232356'),
('188','39 Lghr', 'Abaco Street', 'Bangkok','Thailand','21187','345341'),
('451','3 kok', 'Catherine Street ','NewYork','USA','90098','394564'),
('89','17 gak', 'Duke Street ', 'Lomma','Sweden','21165','455675'),
('544','11 kol','George Street','Shanghai','China','45455', '542193'),
('139','29 jup', 'Morton Street', 'Paris', 'France','08900','564219'),
('9', '69 lof', 'Wellington Street', 'Rome', 'Italy','12356','988678'),
('49','78 loi', 'Popnon Street', 'Paris', 'France','21000','642193');

mysql> SELECT * FROM locations;
+------------+---------+--------------------+----------+----------+------------+------------+
| LocationID | Adress  | Street             | City     | Country  | PostalCode | EmployeeID |
+------------+---------+--------------------+----------+----------+------------+------------+
|          9 | 69 lof  | Wellington Street  | Rome     | Italy    | 12356      |     988678 |
|         49 | 78 loi  | Popnon Street      | Paris    | France   | 21000      |     642193 |
|         75 | 88 lol  | Main Street        | Lund     | Sweden   | 78895      |     224566 |
|         89 | 17 gak  | Duke Street        | Lomma    | Sweden   | 21165      |     455675 |
|        139 | 29 jup  | Morton Street      | Paris    | France   | 08900      |     564219 |
|        188 | 39 Lghr | Abaco Street       | Bangkok  | Thailand | 21187      |     345341 |
|        451 | 3 kok   | Catherine Street   | NewYork  | USA      | 90098      |     394564 |
|        456 | 30 pap  | Jarvisville Street | Francis  | USA      | 56678      |     232356 |
|        544 | 11 kol  | George Street      | Shanghai | China    | 45455      |     542193 |
|       1330 | 15 lgh  | Southern Street    | London   | England  | 21568      |      11111 |
+------------+---------+--------------------+----------+----------+------------+------------+
10 rows in set (0.00 sec)

//1.What are the names of countries with population greater than 8 million?
= SELECT Name FROM country WHERE population > 8000000; //(You can not put SELECT * Name, it will error. So just write SELECT Name)
 or SELECT Name,population FROM country WHERE population > 8000000; //(To see the command is correct)
 +---------------------------------------+------------+
| Name                                  | population |
+---------------------------------------+------------+
| Afghanistan                           |   22720000 |
| Angola                                |   12878000 |
| Argentina                             |   37032000 |
| Australia                             |   18886000 |
| Austria                               |    8091800 |
| Belgium                               |   10239000 |
| Burkina Faso                          |   11937000 |
| Bangladesh                            |  129155000 |
| Bulgaria                              |    8190900 |
| Belarus                               |   10236000 |
| Bolivia                               |    8329000 |
| Brazil                                |  170115000 |
| Canada                                |   31147000 |
| Chile                                 |   15211000 |
| China                                 | 1277558000 |
| Côte d?Ivoire                         |   14786000 |
| Cameroon                              |   15085000 |
| Congo, The Democratic Republic of the |   51654000 |
| Colombia                              |   42321000 |
| Cuba                                  |   11201000 |
| Czech Republic                        |   10278100 |
| Germany                               |   82164700 |
| Dominican Republic                    |    8495000 |
| Algeria                               |   31471000 |
| Ecuador                               |   12646000 |
| Egypt                                 |   68470000 |
| Spain                                 |   39441700 |
| Ethiopia                              |   62565000 |
| France                                |   59225700 |
| United Kingdom                        |   59623400 |
| Ghana                                 |   20212000 |
| Greece                                |   10545700 |
| Guatemala                             |   11385000 |
| Haiti                                 |    8222000 |
| Hungary                               |   10043200 |
| Indonesia                             |  212107000 |
| India                                 | 1013662000 |
| Iran                                  |   67702000 |
| Iraq                                  |   23115000 |
| Italy                                 |   57680000 |
| Japan                                 |  126714000 |
| Kazakstan                             |   16223000 |
| Kenya                                 |   30080000 |
| Cambodia                              |   11168000 |
| South Korea                           |   46844000 |
| Sri Lanka                             |   18827000 |
| Morocco                               |   28351000 |
| Madagascar                            |   15942000 |
| Mexico                                |   98881000 |
| Mali                                  |   11234000 |
| Myanmar                               |   45611000 |
| Mozambique                            |   19680000 |
| Malawi                                |   10925000 |
| Malaysia                              |   22244000 |
| Niger                                 |   10730000 |
| Nigeria                               |  111506000 |
| Netherlands                           |   15864000 |
| Nepal                                 |   23930000 |
| Pakistan                              |  156483000 |
| Peru                                  |   25662000 |
| Philippines                           |   75967000 |
| Poland                                |   38653600 |
| North Korea                           |   24039000 |
| Portugal                              |    9997600 |
| Romania                               |   22455500 |
| Russian Federation                    |  146934000 |
| Saudi Arabia                          |   21607000 |
| Sudan                                 |   29490000 |
| Senegal                               |    9481000 |
| Somalia                               |   10097000 |
| Sweden                                |    8861400 |
| Syria                                 |   16125000 |
| Thailand                              |   61399000 |
| Tunisia                               |    9586000 |
| Turkey                                |   66591000 |
| Taiwan                                |   22256000 |
| Tanzania                              |   33517000 |
| Uganda                                |   21778000 |
| Ukraine                               |   50456000 |
| United States                         |  278357000 |
| Uzbekistan                            |   24318000 |
| Venezuela                             |   24170000 |
| Vietnam                               |   79832000 |
| Yemen                                 |   18112000 |
| Yugoslavia                            |   10640000 |
| South Africa                          |   40377000 |
| Zambia                                |    9169000 |
| Zimbabwe                              |   11669000 |
+---------------------------------------+------------+

//2.What are the names of countries that have “land” in their names ?
= SELECT Name FROM country WHERE Name LIKE '%land%'; //(If you write %land the result is not the same %land% )
+----------------------------------------------+
| Name                                         |
+----------------------------------------------+
| Netherlands Antilles                         |
| Bouvet Island                                |
| Cocos (Keeling) Islands                      |
| Switzerland                                  |
| Cook Islands                                 |
| Christmas Island                             |
| Cayman Islands                               |
| Finland                                      |
| Fiji Islands                                 |
| Falkland Islands                             |
| Faroe Islands                                |
| Greenland                                    |
| Heard Island and McDonald Islands            |
| Ireland                                      |
| Iceland                                      |
| Marshall Islands                             |
| Northern Mariana Islands                     |
| Norfolk Island                               |
| Netherlands                                  |
| New Zealand                                  |
| Poland                                       |
| South Georgia and the South Sandwich Islands |
| Solomon Islands                              |
| Swaziland                                    |
| Turks and Caicos Islands                     |
| Thailand                                     |
| United States Minor Outlying Islands         |
| Virgin Islands, British                      |
| Virgin Islands, U.S.                         |
+----------------------------------------------+

//3.What are the names of the cities with population in between 500,000 and 1 million ?
= SELECT Name FROM city WHERE population >=500000 and population < 1000000; 
+--------------------------------+
| Name                           |
+--------------------------------+
| Amsterdam                      |
| Rotterdam                      |
| Oran                           |
| Dubai                          |
| Rosario                        |
| Lomas de Zamora                |
| Quilmes                        |
| Almirante Brown                |
| La Plata                       |
| Mar del Plata                  |
| Adelaide                       |
| Khulna                         |
| Cotonou                        |
| Santa Cruz de la Sierra        |
| La Paz                         |
| El Alto                        |
| Campinas                       |
| São Gonçalo                    |
| Nova Iguaçu                    |
| São Luís                       |
| Maceió                         |
| Duque de Caxias                |
| São Bernardo do Campo          |
| Teresina                       |
| Natal                          |
| Osasco                         |
| Campo Grande                   |
| Santo André                    |
| João Pessoa                    |
| Jaboatão dos Guararapes        |
| Contagem                       |
| São José dos Campos            |
| Glasgow                        |
| Ouagadougou                    |
| Shubra al-Khayma               |
| Valencia                       |
| Sevilla                        |
| Zaragoza                       |
| Málaga                         |
| Soweto                         |
| Johannesburg                   |
| Port Elizabeth                 |
| Pretoria                       |
| Inanda                         |
| Durban                         |
| Cebu                           |
| Zamboanga                      |
| Pasig                          |
| Ciudad de Guatemala            |
| Port-au-Prince                 |
| Tegucigalpa                    |
| Malang                         |
| Bandar Lampung                 |
| Bekasi                         |
| Padang                         |
| Surakarta                      |
| Madurai                        |
| Haora (Howrah)                 |
| Varanasi (Benares)             |
| Patna                          |
| Srinagar                       |
| Agra                           |
| Coimbatore                     |
| Thane (Thana)                  |
| Allahabad                      |
| Meerut                         |
| Vishakhapatnam                 |
| Jabalpur                       |
| Amritsar                       |
| Faridabad                      |
| Vijayawada                     |
| Gwalior                        |
| Jodhpur                        |
| Nashik (Nasik)                 |
| Hubli-Dharwad                  |
| Solapur (Sholapur)             |
| Ranchi                         |
| Bareilly                       |
| Guwahati (Gauhati)             |
| Shambajinagar (Aurangabad)     |
| Cochin (Kochi)                 |
| Rajkot                         |
| Kota                           |
| Thiruvananthapuram (Trivandrum |
| Pimpri-Chinchwad               |
| Jalandhar (Jullundur)          |
| Gorakhpur                      |
| Chandigarh                     |
| Mosul                          |
| Karaj                          |
| Ahvaz                          |
| Qom                            |
| Kermanshah                     |
| Jerusalem                      |
| Torino                         |
| Palermo                        |
| Genova                         |
| Sendai                         |
| Chiba                          |
| Sakai                          |
| Kumamoto                       |
| Okayama                        |
| Sagamihara                     |
| Hamamatsu                      |
| Kagoshima                      |
| Funabashi                      |
| Higashiosaka                   |
| Hachioji                       |
| Sanaa                          |
| Phnom Penh                     |
| Calgary                        |
| Toronto                        |
| North York                     |
| Winnipeg                       |
| Edmonton                       |
| Mississauga                    |
| Scarborough                    |
| Vancouver                      |
| Bangui                         |
| Baotou                         |
| Shenzhen                       |
| Hohhot                         |
| Handan                         |
| Wuxi                           |
| Xuzhou                         |
| Datong                         |
| Yichun                         |
| Benxi                          |
| Luoyang                        |
| Suzhou                         |
| Xining                         |
| Huainan                        |
| Jixi                           |
| Daqing                         |
| Fuxin                          |
| Amoy [Xiamen]                  |
| Liuzhou                        |
| Shantou                        |
| Jinzhou                        |
| Mudanjiang                     |
| Yinchuan                       |
| Changzhou                      |
| Zhangjiakou                    |
| Dandong                        |
| Hegang                         |
| Kaifeng                        |
| Bishkek                        |
| Cartagena                      |
| Cúcuta                         |
| Bucaramanga                    |
| Brazzaville                    |
| Pointe-Noire                   |
| Lubumbashi                     |
| Mbuji-Mayi                     |
| Hamhung                        |
| Chongjin                       |
| Nampo                          |
| Songnam                        |
| Puchon                         |
| Suwon                          |
| Anyang                         |
| Chonju                         |
| Chongju                        |
| Koyang                         |
| Ansan                          |
| Pohang                         |
| Athenai                        |
| Zagreb                         |
| Vientiane                      |
| Riga                           |
| Monrovia                       |
| Bengasi                        |
| Vilnius                        |
| Antananarivo                   |
| Bamako                         |
| Rabat                          |
| Marrakech                      |
| Fès                            |
| Tanger                         |
| Salé                           |
| Nouakchott                     |
| Naucalpan de Juárez            |
| Mexicali                       |
| Culiacán                       |
| Acapulco de Juárez             |
| Tlalnepantla de Baz            |
| Mérida                         |
| Chihuahua                      |
| San Luis Potosí                |
| Guadalupe                      |
| Toluca                         |
| Aguascalientes                 |
| Querétaro                      |
| Morelia                        |
| Hermosillo                     |
| Saltillo                       |
| Torreón                        |
| Centro (Villahermosa)          |
| Chisinau                       |
| Ulan Bator                     |
| Mandalay                       |
| Kathmandu                      |
| Managua                        |
| Ogbomosho                      |
| Kano                           |
| Oslo                           |
| Peshawar                       |
| Quetta                         |
| Islamabad                      |
| Asunción                       |
| Arequipa                       |
| Trujillo                       |
| Chiclayo                       |
| Lisboa                         |
| Lódz                           |
| Kraków                         |
| Wroclaw                        |
| Poznan                         |
| Marseille                      |
| Stockholm                      |
| Köln                           |
| Frankfurt am Main              |
| Essen                          |
| Dortmund                       |
| Stuttgart                      |
| Düsseldorf                     |
| Bremen                         |
| Duisburg                       |
| Hannover                       |
| Mekka                          |
| Medina                         |
| Pikine                         |
| Dakar                          |
| Freetown                       |
| Mogadishu                      |
| Colombo                        |
| Khartum                        |
| Sharq al-Nil                   |
| Helsinki [Helsingfors]         |
| Hims                           |
| Dushanbe                       |
| Taichung                       |
| Tainan                         |
| Panchiao                       |
| N´Djaména                      |
| Tunis                          |
| Gaziantep                      |
| Konya                          |
| Mersin (Içel)                  |
| Antalya                        |
| Ashgabat                       |
| Kampala                        |
| Zaporizzja                     |
| Lviv                           |
| Kryvyi Rig                     |
| Mykolajiv                      |
| Barquisimeto                   |
| Valencia                       |
| Ciudad Guayana                 |
| Volgograd                      |
| Voronez                        |
| Krasnojarsk                    |
| Saratov                        |
| Toljatti                       |
| Uljanovsk                      |
| Izevsk                         |
| Krasnodar                      |
| Jaroslavl                      |
| Habarovsk                      |
| Vladivostok                    |
| Irkutsk                        |
| Barnaul                        |
| Novokuznetsk                   |
| Penza                          |
| Rjazan                         |
| Orenburg                       |
| Lipetsk                        |
| Nabereznyje T?elny             |
| Tula                           |
| Tjumen                         |
| Haiphong                       |
| Detroit                        |
| San Jose                       |
| Indianapolis                   |
| San Francisco                  |
| Jacksonville                   |
| Columbus                       |
| Austin                         |
| Baltimore                      |
| Memphis                        |
| Milwaukee                      |
| Boston                         |
| Washington                     |
| Nashville-Davidson             |
| El Paso                        |
| Seattle                        |
| Denver                         |
| Charlotte                      |
| Fort Worth                     |
| Portland                       |
| Oklahoma City                  |
| Bulawayo                       |
+--------------------------------+

//4.What's the name of all the countries on the continent ‘Europe’ ?
= SELECT Name FROM country WHERE Continent = 'Europe'; //(Continent = is matter so ,do not forget =)
+-------------------------------+
| Name                          |
+-------------------------------+
| Albania                       |
| Andorra                       |
| Austria                       |
| Belgium                       |
| Bulgaria                      |
| Bosnia and Herzegovina        |
| Belarus                       |
| Switzerland                   |
| Czech Republic                |
| Germany                       |
| Denmark                       |
| Spain                         |
| Estonia                       |
| Finland                       |
| France                        |
| Faroe Islands                 |
| United Kingdom                |
| Gibraltar                     |
| Greece                        |
| Croatia                       |
| Hungary                       |
| Ireland                       |
| Iceland                       |
| Italy                         |
| Liechtenstein                 |
| Lithuania                     |
| Luxembourg                    |
| Latvia                        |
| Monaco                        |
| Moldova                       |
| Macedonia                     |
| Malta                         |
| Netherlands                   |
| Norway                        |
| Poland                        |
| Portugal                      |
| Romania                       |
| Russian Federation            |
| Svalbard and Jan Mayen        |
| San Marino                    |
| Slovakia                      |
| Slovenia                      |
| Sweden                        |
| Ukraine                       |
| Holy See (Vatican City State) |
| Yugoslavia                    |
+-------------------------------+

//5.List all the countries in the descending order of their surface areas.
= SELECT Name FROM country ORDER BY SurfaceArea DESC;
or SELECT Name,SurfaceArea FROM country ORDER BY SurfaceArea DESC; 
   //(to see that surface areas is descending order)
+----------------------------------------------+-------------+
| Name                                         | SurfaceArea |
+----------------------------------------------+-------------+
| Russian Federation                           | 17075400.00 |
| Antarctica                                   | 13120000.00 |
| Canada                                       |  9970610.00 |
| China                                        |  9572900.00 |
| United States                                |  9363520.00 |
| Brazil                                       |  8547403.00 |
| Australia                                    |  7741220.00 |
| India                                        |  3287263.00 |
| Argentina                                    |  2780400.00 |
| Kazakstan                                    |  2724900.00 |
| Sudan                                        |  2505813.00 |
| Algeria                                      |  2381741.00 |
| Congo, The Democratic Republic of the        |  2344858.00 |
| Greenland                                    |  2166090.00 |
| Saudi Arabia                                 |  2149690.00 |
| Mexico                                       |  1958201.00 |
| Indonesia                                    |  1904569.00 |
| Libyan Arab Jamahiriya                       |  1759540.00 |
| Iran                                         |  1648195.00 |
| Mongolia                                     |  1566500.00 |
| Peru                                         |  1285216.00 |
| Chad                                         |  1284000.00 |
| Niger                                        |  1267000.00 |
| Angola                                       |  1246700.00 |
| Mali                                         |  1240192.00 |
| South Africa                                 |  1221037.00 |
| Colombia                                     |  1138914.00 |
| Ethiopia                                     |  1104300.00 |
| Bolivia                                      |  1098581.00 |
| Mauritania                                   |  1025520.00 |
| Egypt                                        |  1001449.00 |
| Nigeria                                      |   923768.00 |
| Venezuela                                    |   912050.00 |
| Tanzania                                     |   883749.00 |
| Namibia                                      |   824292.00 |
| Mozambique                                   |   801590.00 |
| Pakistan                                     |   796095.00 |
| Turkey                                       |   774815.00 |
| Chile                                        |   756626.00 |
| Zambia                                       |   752618.00 |
| Myanmar                                      |   676578.00 |
| Afghanistan                                  |   652090.00 |
| Somalia                                      |   637657.00 |
| Central African Republic                     |   622984.00 |
| Ukraine                                      |   603700.00 |
| Madagascar                                   |   587041.00 |
| Botswana                                     |   581730.00 |
| Kenya                                        |   580367.00 |
| France                                       |   551500.00 |
| Yemen                                        |   527968.00 |
| Thailand                                     |   513115.00 |
| Spain                                        |   505992.00 |
| Turkmenistan                                 |   488100.00 |
| Cameroon                                     |   475442.00 |
| Papua New Guinea                             |   462840.00 |
| Sweden                                       |   449964.00 |
| Uzbekistan                                   |   447400.00 |
| Morocco                                      |   446550.00 |
| Iraq                                         |   438317.00 |
| Paraguay                                     |   406752.00 |
| Zimbabwe                                     |   390757.00 |
| Japan                                        |   377829.00 |
| Germany                                      |   357022.00 |
| Congo                                        |   342000.00 |
| Finland                                      |   338145.00 |
| Vietnam                                      |   331689.00 |
| Malaysia                                     |   329758.00 |
| Norway                                       |   323877.00 |
| Poland                                       |   323250.00 |
| Côte d?Ivoire                                |   322463.00 |
| Oman                                         |   309500.00 |
| Italy                                        |   301316.00 |
| Philippines                                  |   300000.00 |
| Ecuador                                      |   283561.00 |
| Burkina Faso                                 |   274000.00 |
| New Zealand                                  |   270534.00 |
| Gabon                                        |   267668.00 |
| Western Sahara                               |   266000.00 |
| Guinea                                       |   245857.00 |
| United Kingdom                               |   242900.00 |
| Uganda                                       |   241038.00 |
| Ghana                                        |   238533.00 |
| Romania                                      |   238391.00 |
| Laos                                         |   236800.00 |
| Guyana                                       |   214969.00 |
| Belarus                                      |   207600.00 |
| Kyrgyzstan                                   |   199900.00 |
| Senegal                                      |   196722.00 |
| Syria                                        |   185180.00 |
| Cambodia                                     |   181035.00 |
| Uruguay                                      |   175016.00 |
| Tunisia                                      |   163610.00 |
| Suriname                                     |   163265.00 |
| Nepal                                        |   147181.00 |
| Bangladesh                                   |   143998.00 |
| Tajikistan                                   |   143100.00 |
| Greece                                       |   131626.00 |
| Nicaragua                                    |   130000.00 |
| North Korea                                  |   120538.00 |
| Malawi                                       |   118484.00 |
| Eritrea                                      |   117600.00 |
| Benin                                        |   112622.00 |
| Honduras                                     |   112088.00 |
| Liberia                                      |   111369.00 |
| Bulgaria                                     |   110994.00 |
| Cuba                                         |   110861.00 |
| Guatemala                                    |   108889.00 |
| Iceland                                      |   103000.00 |
| Yugoslavia                                   |   102173.00 |
| South Korea                                  |    99434.00 |
| Hungary                                      |    93030.00 |
| Portugal                                     |    91982.00 |
| French Guiana                                |    90000.00 |
| Jordan                                       |    88946.00 |
| Azerbaijan                                   |    86600.00 |
| Austria                                      |    83859.00 |
| United Arab Emirates                         |    83600.00 |
| Czech Republic                               |    78866.00 |
| Panama                                       |    75517.00 |
| Sierra Leone                                 |    71740.00 |
| Ireland                                      |    70273.00 |
| Georgia                                      |    69700.00 |
| Sri Lanka                                    |    65610.00 |
| Lithuania                                    |    65301.00 |
| Latvia                                       |    64589.00 |
| Svalbard and Jan Mayen                       |    62422.00 |
| Togo                                         |    56785.00 |
| Croatia                                      |    56538.00 |
| Bosnia and Herzegovina                       |    51197.00 |
| Costa Rica                                   |    51100.00 |
| Slovakia                                     |    49012.00 |
| Dominican Republic                           |    48511.00 |
| Bhutan                                       |    47000.00 |
| Estonia                                      |    45227.00 |
| Denmark                                      |    43094.00 |
| Netherlands                                  |    41526.00 |
| Switzerland                                  |    41284.00 |
| Taiwan                                       |    36188.00 |
| Guinea-Bissau                                |    36125.00 |
| Moldova                                      |    33851.00 |
| Belgium                                      |    30518.00 |
| Lesotho                                      |    30355.00 |
| Armenia                                      |    29800.00 |
| Solomon Islands                              |    28896.00 |
| Albania                                      |    28748.00 |
| Equatorial Guinea                            |    28051.00 |
| Burundi                                      |    27834.00 |
| Haiti                                        |    27750.00 |
| Rwanda                                       |    26338.00 |
| Macedonia                                    |    25713.00 |
| Djibouti                                     |    23200.00 |
| Belize                                       |    22696.00 |
| Israel                                       |    21056.00 |
| El Salvador                                  |    21041.00 |
| Slovenia                                     |    20256.00 |
| New Caledonia                                |    18575.00 |
| Fiji Islands                                 |    18274.00 |
| Kuwait                                       |    17818.00 |
| Swaziland                                    |    17364.00 |
| East Timor                                   |    14874.00 |
| Bahamas                                      |    13878.00 |
| Vanuatu                                      |    12189.00 |
| Falkland Islands                             |    12173.00 |
| Gambia                                       |    11295.00 |
| Qatar                                        |    11000.00 |
| Jamaica                                      |    10990.00 |
| Lebanon                                      |    10400.00 |
| Cyprus                                       |     9251.00 |
| Puerto Rico                                  |     8875.00 |
| French Southern territories                  |     7780.00 |
| Palestine                                    |     6257.00 |
| Brunei                                       |     5765.00 |
| Trinidad and Tobago                          |     5130.00 |
| Cape Verde                                   |     4033.00 |
| French Polynesia                             |     4000.00 |
| South Georgia and the South Sandwich Islands |     3903.00 |
| Samoa                                        |     2831.00 |
| Luxembourg                                   |     2586.00 |
| Réunion                                      |     2510.00 |
| Mauritius                                    |     2040.00 |
| Comoros                                      |     1862.00 |
| Guadeloupe                                   |     1705.00 |
| Faroe Islands                                |     1399.00 |
| Martinique                                   |     1102.00 |
| Hong Kong                                    |     1075.00 |
| Sao Tome and Principe                        |      964.00 |
| Netherlands Antilles                         |      800.00 |
| Dominica                                     |      751.00 |
| Kiribati                                     |      726.00 |
| Micronesia, Federated States of              |      702.00 |
| Bahrain                                      |      694.00 |
| Tonga                                        |      650.00 |
| Saint Lucia                                  |      622.00 |
| Singapore                                    |      618.00 |
| Guam                                         |      549.00 |
| Andorra                                      |      468.00 |
| Northern Mariana Islands                     |      464.00 |
| Palau                                        |      459.00 |
| Seychelles                                   |      455.00 |
| Antigua and Barbuda                          |      442.00 |
| Barbados                                     |      430.00 |
| Turks and Caicos Islands                     |      430.00 |
| Saint Vincent and the Grenadines             |      388.00 |
| Mayotte                                      |      373.00 |
| Heard Island and McDonald Islands            |      359.00 |
| Virgin Islands, U.S.                         |      347.00 |
| Grenada                                      |      344.00 |
| Malta                                        |      316.00 |
| Saint Helena                                 |      314.00 |
| Maldives                                     |      298.00 |
| Cayman Islands                               |      264.00 |
| Saint Kitts and Nevis                        |      261.00 |
| Niue                                         |      260.00 |
| Saint Pierre and Miquelon                    |      242.00 |
| Cook Islands                                 |      236.00 |
| Wallis and Futuna                            |      200.00 |
| American Samoa                               |      199.00 |
| Aruba                                        |      193.00 |
| Marshall Islands                             |      181.00 |
| Liechtenstein                                |      160.00 |
| Virgin Islands, British                      |      151.00 |
| Christmas Island                             |      135.00 |
| Montserrat                                   |      102.00 |
| Anguilla                                     |       96.00 |
| British Indian Ocean Territory               |       78.00 |
| San Marino                                   |       61.00 |
| Bouvet Island                                |       59.00 |
| Bermuda                                      |       53.00 |
| Pitcairn                                     |       49.00 |
| Norfolk Island                               |       36.00 |
| Tuvalu                                       |       26.00 |
| Nauru                                        |       21.00 |
| Macao                                        |       18.00 |
| United States Minor Outlying Islands         |       16.00 |
| Cocos (Keeling) Islands                      |       14.00 |
| Tokelau                                      |       12.00 |
| Gibraltar                                    |        6.00 |
| Monaco                                       |        1.50 |
| Holy See (Vatican City State)                |        0.40 |
+----------------------------------------------+-------------+

//6.What are the names of all the cities in the Netherlands?
= SELECT Name FROM city WHERE CountryCode = 'NLD';
+------------------+
| Name             |
+------------------+
| Amsterdam        |
| Rotterdam        |
| Haag             |
| Utrecht          |
| Eindhoven        |
| Tilburg          |
| Groningen        |
| Breda            |
| Apeldoorn        |
| Nijmegen         |
| Enschede         |
| Haarlem          |
| Almere           |
| Arnhem           |
| Zaanstad         |
| ´s-Hertogenbosch |
| Amersfoort       |
| Maastricht       |
| Dordrecht        |
| Leiden           |
| Haarlemmermeer   |
| Zoetermeer       |
| Emmen            |
| Zwolle           |
| Ede              |
| Delft            |
| Heerlen          |
| Alkmaar          |
+------------------+

//7.What is the population of Rotterdam ?
= SELECT Name, Population FROM city WHERE Name = 'Rotterdam';
+-----------+------------+
| Name      | Population |
+-----------+------------+
| Rotterdam |     593321 |
+-----------+------------+

//8.What's the top 10 countries by Surface Area ?
= SELECT Name,SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 10; 
  //(top 10 largest Surface Area countries, I write DESC mean descending)
+--------------------+-------------+
| Name               | SurfaceArea |
+--------------------+-------------+
| Russian Federation | 17075400.00 |
| Antarctica         | 13120000.00 |
| Canada             |  9970610.00 |
| China              |  9572900.00 |
| United States      |  9363520.00 |
| Brazil             |  8547403.00 |
| Australia          |  7741220.00 |
| India              |  3287263.00 |
| Argentina          |  2780400.00 |
| Kazakstan          |  2724900.00 |
+--------------------+-------------+

= SELECT Name,SurfaceArea FROM country ORDER BY SurfaceArea LIMIT 10; //(top 10 smallest surface area)
+--------------------------------------+-------------+
| Name                                 | SurfaceArea |
+--------------------------------------+-------------+
| Holy See (Vatican City State)        |        0.40 |
| Monaco                               |        1.50 |
| Gibraltar                            |        6.00 |
| Tokelau                              |       12.00 |
| Cocos (Keeling) Islands              |       14.00 |
| United States Minor Outlying Islands |       16.00 |
| Macao                                |       18.00 |
| Nauru                                |       21.00 |
| Tuvalu                               |       26.00 |
| Norfolk Island                       |       36.00 |
+--------------------------------------+-------------+

//9. What's the top 10 most populated cities?
= SELECT Name, Population FROM city ORDER BY Population DESC LIMIT 10;
+------------------+------------+
| Name             | Population |
+------------------+------------+
| Mumbai (Bombay)  |   10500000 |
| Seoul            |    9981619 |
| São Paulo        |    9968485 |
| Shanghai         |    9696300 |
| Jakarta          |    9604900 |
| Karachi          |    9269265 |
| Istanbul         |    8787958 |
| Ciudad de México |    8591309 |
| Moscow           |    8389200 |
| New York         |    8008278 |
+------------------+------------+

//10.What is the population of the world ?
= SELECT SUM(Population) FROM country;
+-----------------+
| SUM(Population) |
+-----------------+
|      6078749450 |
+-----------------+
