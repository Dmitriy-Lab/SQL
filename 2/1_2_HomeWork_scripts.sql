# 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.

CREATE TABLE sales
(id INT NOT NULL,
order_date DATE PRIMARY KEY NOT NULL,
amount INT 
);

INSERT INTO sales (id, order_date, amount)
VALUES
(1, '2021-01-01', 150),
(1, '2021-01-02', 250),
(1, '2021-01-03', 100),
(1, '2021-01-04', 150),
(1, '2021-01-05', 300);

SELECT * FROM sales;

# 2. Разделите значения поля “bucket” на 3 сегмента
SELECT *,
CASE 
	WHEN amount <= 100 THEN "Маленький заказ"
	WHEN amount > 100 AND amount < 300 THEN "Средний заказ"
	WHEN amount >= 300 THEN "Большой заказ"
END AS bucket
FROM sales;