--Task1
CREATE DATABASE lab4;

--Task2
CREATE TABLE salesman(
    salesman_id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255),
    commission FLOAT NOT NULL
);

CREATE TABLE customers(
    customer_id INTEGER PRIMARY KEY,
    cust_name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    grade DECIMAL,
    salesman_id INTEGER NOT NULL,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

CREATE TABLE orders(
    ord_no INTEGER PRIMARY KEY,
    purch_amt FLOAT NOT NULL,
    ord_date DATE NOT NULL,
    customer_id INTEGER NOT NULL,
    salesman_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);


INSERT INTO salesman(salesman_id, name, city, commission) VALUES(5001,'James Hoog','New York',0.15);
INSERT INTO salesman(salesman_id, name, city, commission) VALUES(5002,'Nail Knite','Paris',0.13);
INSERT INTO salesman(salesman_id, name, city, commission) VALUES(5005,'Pit Alex','London',0.11);
INSERT INTO salesman(salesman_id, name, city, commission) VALUES(5006,'Mc Lyon','Paris',0.14);
INSERT INTO salesman(salesman_id, name, city, commission) VALUES(5003,'Lauson Hen',NULL,0.12);
INSERT INTO salesman(salesman_id, name, city, commission) VALUES(5007,'Paul Adam','Rome',0.13);


INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES(3002,'Nick Rimando','New York',100,5001);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES(3005,'Graham Zusi','California',200,5002);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES(3001,'Brad Guzan','London',NULL,5005);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES(3004,'Fabian Johns','Paris',300,5006);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES(3007,'Brad Davis','New York',200,5001);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES(3009,'Geoff Camero','Berlin',100,5003);
INSERT INTO customers(customer_id, cust_name, city, grade, salesman_id) VALUES(3008,'Julian Green','London',300,5002);


INSERT INTO orders(ORD_NO, PURCH_AMT, ORD_DATE, CUSTOMER_ID, SALESMAN_ID) VALUES(70001,150.5,'2012-10-05',3005,5002);
INSERT INTO orders(ORD_NO, PURCH_AMT, ORD_DATE, CUSTOMER_ID, SALESMAN_ID) VALUES(70009,270.65,'2012-09-10',3001,5005);
INSERT INTO orders(ORD_NO, PURCH_AMT, ORD_DATE, CUSTOMER_ID, SALESMAN_ID) VALUES(70002,65.26,'2012-10-05',3002,5001);
INSERT INTO orders(ORD_NO, PURCH_AMT, ORD_DATE, CUSTOMER_ID, SALESMAN_ID) VALUES(70004,110.5,'2012-08-17',3009,5003);
INSERT INTO orders(ORD_NO, PURCH_AMT, ORD_DATE, CUSTOMER_ID, SALESMAN_ID) VALUES(70007,948.5,'2012-09-10',3005,5002);
INSERT INTO orders(ORD_NO, PURCH_AMT, ORD_DATE, CUSTOMER_ID, SALESMAN_ID) VALUES(70005,2400.6,'2012-07-27',3007,5001);
INSERT INTO orders(ORD_NO, PURCH_AMT, ORD_DATE, CUSTOMER_ID, SALESMAN_ID) VALUES(70008,5760,'2012-09-10',3002,5001);

--Task 3
SELECT SUM(purch_amt) FROM orders;

--Task4
SELECT AVG(purch_amt) FROM orders;

--Task5
SELECT COUNT(cust_name) FROM customers WHERE cust_name IS NOT NULL;

--Task6
SELECT MIN(purch_amt) FROM orders;

--Task7
SELECT * FROM customers WHERE cust_name LIKE '_____b';

--Task8
SELECT * FROM orders WHERE customer_id IN (SELECT customers.customer_id FROM customers WHERE city = 'New York');

--Task9
SELECT * FROM customers WHERE customer_id IN(SELECT orders.customer_id FROM orders WHERE purch_amt>10);

--Task10
SELECT SUM(grade) FROM customers;

--Task11
SELECT * FROM customers WHERE cust_name IS NOT NULL;

--Task12
SELECT MAX(grade) FROM customers;