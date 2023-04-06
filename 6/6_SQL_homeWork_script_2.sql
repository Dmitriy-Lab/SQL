-- 2. Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)

DELIMITER &&
DROP FUNCTION IF EXISTS even;
CREATE FUNCTION even()
RETURNS	VARCHAR(45)
DETERMINISTIC
BEGIN
    DECLARE x1 INT DEFAULT 2;
	DECLARE result VARCHAR(45) DEFAULT '2';
		WHILE x1<10 DO
			SET x1 = x1 + 2;
			SET result= concat(result, ', ', x1);
		END WHILE; 

	RETURN result;
    
END &&
DELIMITER ;

SELECT even();
