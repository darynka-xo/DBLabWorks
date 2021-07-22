--Task1
CREATE INDEX countries_index ON country(name ASC) WHERE name = 'string';

--Task2
CREATE INDEX employees_namesurname ON  employees(name,lastname ASC) WHERE name = 'string' AND lastname = 'string';

--Task3
CREATE UNIQUE INDEX employees_Sindex ON employees(salary ASC) WHERE salary BETWEEN value1 AND value2;

--Task4
CREATE INDEX employees_name ON employees(name ASC) WHERE substring(name FROM 1 FOR 4) = 'abcd';

--Task5