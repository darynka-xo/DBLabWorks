--Task1
CREATE DATABASE lab1;

--Task2
CREATE TABLE users(
  id     SERIAL,
  firstname VARCHAR(50),
  lastname VARCHAR(50)
);

--Task3
ALTER TABLE users ADD COLUMN isadmin INTEGER;

--Task4
ALTER TABLE users 
ALTER COLUMN isadmin TYPE BOOL
USING isadmin::BOOLEAN;

--Task5
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;


--Task6
ALTER TABLE users ADD CONSTRAINT pk PRIMARY KEY (id);


--Task7
CREATE TABLE tasks(
  id     INTEGER,
  name VARCHAR(50),
  user_id INTEGER
);

--Task8
DROP TABLE tasks;

--Task9
DROP DATABASE lab1;