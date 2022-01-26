--Part 2 : Database design
mysql> CREATE DATABASE IF NOT EXISTS db_TODO ;
Query OK, 1 row affected (0.00 sec)

--First user table
mysql> CREATE TABLE IF NOT EXISTS user ( 
    userID INT(5) AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL, 
    Email VARCHAR(50) , 
    ListID int(5) references list(listID), key list_user (listID, userID));
Query OK, 0 rows affected (0.06 sec)

mysql> DESCRIBE user;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| userID    | int(5)      | NO   | PRI | NULL    | auto_increment |
| FirstName | varchar(20) | NO   |     | NULL    |                |
| LastName  | varchar(20) | NO   |     | NULL    |                |
| Email     | varchar(50) | YES  |     | NULL    |                |
| ListID    | int(5)      | YES  | MUL | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

--Second list table 
mysql> CREATE TABLE IF NOT EXISTS list 
(listID INT(5) AUTO_INCREMENT PRIMARY KEY, 
listName VARCHAR(20) , 
itemID int(5) NOT NULL references item(itemID), key list_item (listID, itemID));
Query OK, 0 rows affected (0.05 sec)

mysql> DESCRIBE list;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| listID   | int(5)      | NO   | PRI | NULL    | auto_increment |
| listName | varchar(20) | YES  |     | NULL    |                |
| itemID   | int(5)      | NO   |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

--Third item table
 mysql> CREATE TABLE IF NOT EXISTS item (
     itemID INT(5) AUTO_INCREMENT PRIMARY KEY, 
     tagID INT(5) NOT NULL, 
     marked SET('Completed','NOT'), 
     date DATETIME);
Query OK, 0 rows affected (0.05 sec)

mysql> DESCRIBE item;
+--------+------------------------+------+-----+---------+----------------+
| Field  | Type                   | Null | Key | Default | Extra          |
+--------+------------------------+------+-----+---------+----------------+
| itemID | int(5)                 | NO   | PRI | NULL    | auto_increment |
| tagID  | int(5)                 | NO   |     | NULL    |                |
| marked | set('Completed','NOT') | YES  |     | NULL    |                |
| date   | datetime               | YES  |     | NULL    |                |
+--------+------------------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)


--Fourth tag table
mysql> CREATE TABLE IF NOT EXISTS tag (
    tagID INT(5) AUTO_INCREMENT PRIMARY KEY, 
    description varchar(45) );
Query OK, 0 rows affected (0.06 sec)

mysql> DESCRIBE tag;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| tagID       | int(5)      | NO   | PRI | NULL    | auto_increment |
| description | varchar(45) | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

--I have 4 tables in my db_todo database 
mysql> SHOW tables;
+-------------------+
| Tables_in_db_todo |
+-------------------+
| item              |
| list              |
| tag               |
| user              |
+-------------------+
4 rows in set (0.00 sec)

