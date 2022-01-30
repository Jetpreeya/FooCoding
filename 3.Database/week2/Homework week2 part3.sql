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

--Rewrite by Johan--

drop trigger if exists lang_count;
delimiter $$
create trigger lang_count
before insert on countrylanguage
for each row
begin
declare langcount int(2);
set langcount = ( select count(1) from countrylanguage where countrycode = new.countrycode );
if langcount  > 9
then
signal sqlstate '45000'
  set message_text = 'You are trying to insert language 10 or above' ;
end if;
end;
$$
delimiter ;

mysql> Insert into countrylanguage value ('SWE','chinese','F','3.5');
Query OK, 1 row affected (0.03 sec)

mysql> SELECT COUNT(1) from countrylanguage where countrycode = 'SWE';
+----------+
| COUNT(1) |
+----------+
|        7 |
+----------+
1 row in set (0.00 sec)

mysql> Insert into countrylanguage value ('SWE','French','F','10.9');
ERROR 1644 (45000): You are trying to insert language 10 or above

mysql> SELECT COUNT(1) from countrylanguage where countrycode = 'SWE';
+----------+
| COUNT(1) |
+----------+
|       10 |
+----------+
1 row in set (0.00 sec)