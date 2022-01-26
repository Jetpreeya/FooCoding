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
(listID INT(5) AUTO_INCREMENT , 
listName VARCHAR(20) , 
itemID int(5) NOT NULL references item(itemID), key list_item (listID, itemID));
Query OK, 0 rows affected (0.05 sec)

mysql>  DESCRIBE list;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| listID   | int(5)      | NO   | MUL | NULL    | auto_increment |
| listName | varchar(50) | YES  |     | NULL    |                |
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
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| tagID       | int(5)       | NO   | PRI | NULL    | auto_increment |
| description | varchar(255) | YES  |     | NULL    |                |
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

--Insert data into table
mysql> Insert into user (userID, FirstName, LastName, Email , ListID ) 
VALUES 
('23467', 'Susan', 'Kim', 'Susan@gmail.com','72346'),
('55664', 'John', 'Alex', 'John.a@hotmail.com', '09876');

mysql> SELECT userID, FirstName, LastName, Email , ListID FROM user;
+--------+-----------+----------+--------------------+--------+
| userID | FirstName | LastName | Email              | ListID |
+--------+-----------+----------+--------------------+--------+
|  23467 | Susan     | Kim      | Susan@gmail.com    |  72346 |
|  55664 | John      | Alex     | John.a@hotmail.com |   9876 |
+--------+-----------+----------+--------------------+--------+
2 rows in set (0.00 sec)

--Each list has at least one item.

mysql> Insert into list ( listID , listName , itemID  ) 
VALUES 
('9876', 'Send Email to company', '43567'), 
('9876', 'Send Email to client','07654'),
('72346','Buy food', '56456'),
('72346','Buy food', '12367');

mysql> SELECT listID , listName , itemID FROM list;
+--------+-----------------------+--------+
| listID | listName              | itemID |
+--------+-----------------------+--------+
|  72346 | Buy food              |  56456 |
|  72346 | Buy food              |  12367 |
|   9876 | Send Email to company |  43567 |
|   9876 | Send Email to client  |   7654 |
+--------+-----------------------+--------+
4 rows in set (0.00 sec)

--Each item can be tagged.
--Each item can be marked completed.
mysql> Insert into item (itemID, tagID, marked, date) 
VALUES
('56456', '00001', 'Completed', '2022-01-25 11:15:00'),
('12367', '00002', 'NOT','2022-01-26 11:20:001');

mysql> Insert into item (itemID, tagID, marked) 
VALUES
('43567','00003','NOT'),
('7654','00004','Completed');

mysql> SELECT itemID, tagID, marked, date FROM item;
+--------+-------+-----------+---------------------+
| itemID | tagID | marked    | date                |
+--------+-------+-----------+---------------------+
|   7654 |     4 | Completed | NULL                |
|  12367 |     2 | NOT       | 2022-01-26 11:20:01 |
|  43567 |     3 | NOT       | NULL                |
|  56456 |     1 | Completed | 2022-01-25 11:15:00 |
+--------+-------+-----------+---------------------+
4 rows in set (0.00 sec)

-- Insert into tag table
mysql> Insert into tag (tagID, description) 
VALUES 
('1', 'Buy apple, milk and cheese before sunday'),
('2', 'Buy agg, coffee, vine , pork before friday because my son birthday'), 
('3','Send email to AB company'),
('4', 'Send email information about the process ');


mysql> SELECT tagID, description FROM tag;
+-------+--------------------------------------------------------------------+
| tagID | description                                                        |
+-------+--------------------------------------------------------------------+
|     1 | Buy apple, milk and cheese before sunday                           |
|     2 | Buy agg, coffee, vine , pork before friday because my son birthday |
|     3 | Send email to AB company                                           |
|     4 | Send email information about the process                           |
+-------+--------------------------------------------------------------------+
4 rows in set (0.00 sec)







