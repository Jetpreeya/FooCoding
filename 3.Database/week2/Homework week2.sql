--Part 1 --

--1.What is the capital of country X ? (Accept X from user)

mysql> prepare cities from 'select ci.name from city ci inner join country co on ci.countrycode = co.code where lower(co.name) = ?';
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

