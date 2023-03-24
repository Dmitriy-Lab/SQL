/* 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный”
статус заказа, используя оператор CASE
*/

CREATE TABLE orders
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
employeeid VARCHAR(6) NOT NULL,
amount DECIMAL NOT NULL,
orderstatus VARCHAR(10) NOT NULL
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED'),
('e04', 99.99, 'OPEN');

SELECT * FROM orders;

SELECT orderstatus,
CASE orderstatus
	WHEN 'OPEN' THEN "Order is open state"
	WHEN 'CLOSED'  THEN "Order is closed"
	WHEN 'CANCELLED' THEN "Order cancelled"
END AS order_summarysales
FROM orders;
