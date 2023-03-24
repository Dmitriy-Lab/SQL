CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);

# 1. Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT shops.shopname, cats.name
FROM shops
JOIN cats ON shops.id = cats.shops_id;


# 2. Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
# 1
SELECT shops.shopname
FROM shops
JOIN cats ON shops.id = cats.shops_id
WHERE cats.name = "Murzik";

# 2
SELECT shops.shopname
FROM shops
RIGHT JOIN cats ON shops.id = cats.shops_id
WHERE cats.name = "Murzik";

# 3. Вывести магазины, в котором НЕ продаются коты “Мурзик” и “Zuza”
SELECT shops.shopname
FROM shops
JOIN cats ON shops.id = cats.shops_id
WHERE NOT (cats.name = "Murzik" OR cats.name = "Zuza");

