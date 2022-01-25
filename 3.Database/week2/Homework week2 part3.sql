
delimiter //
CREATE TRIGGER my_trigger BEFORE INSERT ON CountryLanguage 
FOR EACH ROW BEGIN
IF (Language >= 10) FROM CountryLanguage THEN INSERT INTO test VALUES ('WoW 10 languages');
END IF;
END;//

delimiter ;


