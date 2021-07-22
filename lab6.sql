--Task1
CREATE DATABASE lab6;

--Task2
CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_adress VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY ,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    manager_id INTEGER REFERENCES employees,
    department_id INTEGER REFERENCES departments
);

CREATE TABLE job_grades(
    grade CHAR(1),
    lowest_salary INTEGER,
    highest_salary INTEGER
);

--Task3
SELECT employees.first_name, employees.department_id, locations.city, locations.state_province FROM employees INNER JOIN locations ON last_name LIKE '%b%';


--Task4
SELECT departments.department_name, locations.city, locations.state_province FROM departments JOIN locations ON departments.location_id=locations.location_id;


--Task5 not done

--Task6
SELECT AVG(employees.salary), job_grades.grade FROM employees JOIN job_grades ON employees.salary > job_grades.lowest_salary and employees.salary< job_grades.highest_salary;

--Task7
SELECT employees.first_name, employees.last_name FROM employees INNER JOIN departments ON employees.department_id = departments.department_id AND departments.department_id = (SELECT department_id FROM departments INNER JOIN locations ON departments.location_id = locations.location_id AND locations.city = 'London');