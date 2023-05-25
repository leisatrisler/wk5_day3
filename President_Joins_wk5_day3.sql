-- Create a customer table

create table if not exists customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	address VARCHAR(50),
	city VARCHAR(50),
	state VARCHAR(50)
);

select *
from customer;

-- Create customer Order Table
create table if not exists receipt(
	receipt_id SERIAL primary key,
	receipt_date TIMESTAMP default CURRENT_TIMESTAMP,
	amount NUMERIC(5,2), -- Max 5 total digits, 2 to the right if the decimal(xxx.xx)
	customer_id INTEGER,
	foreign key(customer_id) references customer(customer_id)
	
);

select *
from receipt;

-- DML STATEMENTS TO ADD DATA TO THE TABLES

-- Inserting into the customer table
INSERT INTO customer(first_name, last_name, email, address, city, state)
VALUES('George', 'Washington', 'firstpres@usa.gov', '3200 Mt. Vernon Way', 'Mt. Vernon', 'VA'),
('John', 'Adams', 'jadams@whitehouse.org', '1234 W Presidential Place', 'Quincy', 'MA'),
('Thomas', 'Jefferson', 'iwrotethedeclaration@freeamerica.org', '555 Independence Drive', 'Charleston', 'VA'),
('James', 'Madison', 'fatherofconstitution@prez.io', '8345 E Eastern Ave', 'Richmond', 'VA'),
('James', 'Monroe', 'jmonroe@usa.gov', '3682 N Monroe Parkway', 'Chicago', 'IL');


-- Confirm new customers have been added 

select *
from customer;

-- Add data to the receipt table
INSERT INTO receipt(amount, customer_id)
VALUES (23.32, 1);

INSERT INTO receipt(amount, customer_id)
VALUES (78.84, 3);

INSERT INTO receipt(amount, customer_id)
VALUES (173.85, 1);

INSERT INTO receipt(amount, customer_id)
VALUES (294.51, 2);

INSERT INTO receipt(amount, customer_id)
VALUES (73.97, null);

INSERT INTO receipt(amount, customer_id)
VALUES (876.54, null);

SELECT *
FROM receipt;

select *
from customer;

select *
from customer
where last_name = 'Washington';

select *
from receipt
where customer_id = 1;

-- USING JOINS we can combine these tables togethr on a common field 
-- SYNTAX: 
-- SELECT col_1, col_2, etc. (can be from either table)
-- FROM table_name_1 (will be considered the LEFT table)
-- JOIN table_name_2 (will be considered the RIGHT table)
-- ON table_name_1.col_name = table_name_2.col_name (where col_name is a Foreign Key to other col_name)

-- Inner Join- Most Common Join - default JOIN i.e. do not have to specify INNER
select first_name, last_name, email, customer.customer_id as cust_cust_id, receipt.customer_id as rec_cust_id,amount, receipt_date, receipt_id
from customer 
inner join receipt 
on customer.customer_id = receipt.customer_id;

-- Each Join

-- INNER JOIN
select *
from customer 
join receipt 
on customer.customer_id = receipt.customer_id;

-- FULL JOIN
select *
from customer 
full join receipt 
on customer.customer_id = receipt.customer_id;

-- LEFT JOIN
select *
from customer -- left table
left join receipt -- right table
on customer.customer_id = receipt.customer_id;

-- RIGHT JOIN
select *
from customer -- left table
right join receipt -- right table
on customer.customer_id = receipt.customer_id;

-- JOIN ON comes after the SELECT FROM and before the where 

--select 
--from 
--join
--on 
--where 
--group by 
--having 
--order by 
--limit 
--offset 

select  customer.customer_id, first_name, last_name, COUNT(*), SUM(amount)
from customer 
join receipt 
on customer.customer_id = receipt. customer_id
where last_name = 'Washington';
group by customer.ccustomer_id, first_name, last_name;

-- ALIASING Table Names 

create table if not exists teacher(
	teacher_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

insert into teacher(first_name, last_name) values ('Bob', 'Bobberson'), ('Frank', 'Franklinson');

CREATE TABLE IF NOT EXISTS student(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	teacher_id INTEGER NOT NULL,
	FOREIGN KEY(teacher_id) REFERENCES teacher(teacher_id)
);

insert into student(first_name, last_name, teacher_id)
values('Jimmy', 'Butler', 1), ('Jayson', 'Tatum', 2), ('Jaylen', 'Brown', 1), ('Dereck', 'Rose', 2);

select *
from teacher;

select *
from student;

select teacher.first_name, teacher.last_name, student.first_name, student.last_name
from teacher
join student
on teacher.teacher_id = student.teacher_id;

select t.first_name, t.last_name, s.first_name, s.last_name
from teacher t
join student s 
on t.teacher_id = s.teacher_id;















