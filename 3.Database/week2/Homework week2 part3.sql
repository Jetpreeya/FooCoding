mysql> delimiter $$
mysql> CREATE TRIGGER my_new BEFORE INSERT ON CountryLanguage 
FOR EACH ROW BEGIN
IF Language >= 10  THEN INSERT INTO test VALUES ('WoW 10 languages');
ELSEIF Language < 10 THEN INSERT INTO test VALUES ('You can insert one more');
END IF;
END;
$$
mysql> delimiter ;
Query OK, 0 rows affected (0.02 sec)

