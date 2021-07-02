--Task1
CREATE DATABASE lab2;


--Task2
CREATE TABLE countries
(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INTEGER,
    population INTEGER
);


--Task3
INSERT INTO countries VALUES (DEFAULT, 'Indonesia', 15, 2700000);


--Task4
INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, 'Kazakhstan');


--Task5
INSERT INTO countries VALUES (DEFAULT, 'Vatikan', NULL, 7000);


--Task6 
INSERT INTO countries (country_id, country_name, region_id, population) VALUES (DEFAULT, 'Russia', 1, 144000000),
                                                                               (DEFAULT, 'Canada', 2, 37590000),
                                                                               (DEFAULT, 'USA', 3, 328200000);


--Task7
ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';


--Task8
INSERT INTO countries VALUES (DEFAULT, DEFAULT, 9, 18060000);


--Task9
INSERT INTO countries VALUES (DEFAULT);


--Task10
CREATE TABLE countries_new
(
    LIKE countries
);


--Task11
INSERT INTO countries_new SELECT * FROM countries RETURNING *;


--Task12
UPDATE countries SET region_id = 1 WHERE region_id IS NULL;


--Task13
UPDATE countries SET population = population * 1.1 RETURNING country_name, population AS "New Population";


--Task14
DELETE FROM countries WHERE population < 100000;


--Task15
DELETE FROM countries_new AS CN USING countries AS C WHERE CN.country_id = C.country_id RETURNING *;


--Task16
DELETE FROM countries RETURNING *;


SELECT * FROM countries;
