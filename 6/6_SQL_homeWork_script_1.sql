-- 1. Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
DELIMITER &&

DROP FUNCTION IF EXISTS fibon;
CREATE FUNCTION fibon(num INT)
RETURNS	VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(45) DEFAULT '00:00:00';
    DECLARE x1 INT DEFAULT 0;
    
     IF num<86400 THEN
		SET result = SEC_TO_TIME(num);
		RETURN result;
	 ELSE
		WHILE num>86399 DO
			SET x1 = x1 + 1;
			SET num = num - 86400;
		END WHILE; 
	SET result = concat(x1, ' days', ' ', SEC_TO_TIME(num));
	RETURN result;
    END IF;
    
END &&
DELIMITER ;

SELECT fibon(86900);
