CREATE TABLE trains
(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    train_id INT, 
    station VARCHAR(20),
    station_time time,
    next_station_time time
);

INSERT INTO trains (train_id, station, station_time, next_station_time)
VALUES
	(110, 'San Fr', '10:00:00', NULL),
    (110, 'Redwood', '10:54:00', NULL ),
    (110, 'Palo', '11:02:00', NULL ),
    (110, 'Jose', '12:35:00', NULL),
	(120, 'San Fr', '11:00:00', NULL),
    (120, 'Redwood', '12:49:00', NULL ), 
    (120, 'Jose', '13:30:00', NULL);

SELECT *
FROM trains;

/*
Добавьте новый столбец под названием «время до следующей станции». 
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций
*/
SELECT  train_id, station, station_time,
LEAD(station_time) OVER(ORDER BY id) AS next_station_time,
TIMEDIFF((lead(station_time) over (PARTITION by train_id)),station_time) as time_to_next_station
FROM trains;


