/*
A PostgreSQL practice script covering fundamental database creation, data manipulation, 
table modification, constraints and basic querying.

Concepts covered:
> Creating schema and tables
> Primary and foreign keys
> NOT NULL, UNIQUE and CHECK constraints
> INSERT, UPDATE and DELETE
> ALTER TABLE
> TRUNCATE and DROP
> WHERE filtering
> CASE statements
*/

/* 
CONSTRAINTS
NOT NULL
NULL ''
DEFAULT (20)
UNIQUE 
PRIMARY KEY
FOREIGN KEYS
CHECK
*/

create schema bookstore;

set search_path to bookstore;

show search_path;

create table customers (
customer_id SERIAL primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(100) unique,
phone_number char (10) unique 
);

-- Inserting data into customers

insert into customers(first_name, last_name, email, phone_number)
values 
('Melanie', 'Moreno', 'melaniemoreno@gmail.com', '0727945294'),
('Kayda', 'Bosse', 'kaydabosse@gmail.com', '0748945825'),
('Trinity', 'Celeste', 'trinityceleste@gmail.com', '0749219574'),
('Aniya', 'Harvey', 'aniyaharvey@gmail.com', '0776480662');

create table books (
book_id SERIAL primary key,
title varchar(150) not null,
author varchar (100),
price numeric,
published_date date 
);

insert into books (title, author, price,published_date)
values 
('Understanding SQL', 'David Kimani', 1500, '2023-01-15'),
('Advanced PostGreSQL', 'Grace Achieng', 2500.00, '2023-02-20'),
('Learning Python', 'James Mwangi', 3000.00, '2022-11-10'),
('Data Analytics Basics', 'Susan Njeri', 2200.00, '2023-03-05');

truncate table books restart identity;

create table orders (
order_id serial primary key,
customer_id int not null references customers(customer_id),
book_id int not null references books(book_id),
order_date date 
);

insert into orders (customer_id, book_id, order_date)
values 
(1, 3, '2023-04-01'),
(2, 1, '2023-04-02'),
(3, 2, '2023-04-03'),
(4, 4, '2023-04-04'),
(1, 2, '2023-04-05');

 /* Changing table names
  * ALTER TABLE: Change an existing table
  * adding and removing columns
  * rename columns and tables
  * change data types
  * setting and removing default values
  * changing default values
  alter table table_name
  action;
  */

-- Renaming customer tables

alter table customers
rename to clients;

select * from clients; 

alter table clients 
rename to customers;

-- Adding columns to a table
alter table customers
add column city varchar(50);

--Add a column called quantity to the orders table

alter table orders
add column quantity int;

alter table orders
drop column quantity;

-- Renaming columns
 alter table customers
 rename phone_number to contact;

-- Changing data types
alter table customers
alter column contact type varchar(20);

-- Setting a NOT NULL constraint
alter table customers
alter column email set not null;

-- Dropping a not null constraint
alter table customers
alter column email drop not null;

--Adding a unique constraint
alter table books 
add constraint unique_title unique (title);

--Dropping unique constraint
alter table books
drop constraint unique_title;

--Adding a foreign key constraint
alter table orders
add constraint fk_customer
foreign key (customer_id)
references customers (customer_id);

--Dropping fk constraint
alter table orders 
drop constraint fk_customer;

/*UPDATE changes data already stored in a table
 * update table_name
 * set column_name = value
 * where condition
 * 
 */

update customers 
set city = 'Nairobi'
where customer_id = 1;

update customers
set city = 'Nakuru'
where customer_id = 4;

update customers
set city = 'Mombasa'
where customer_id = 2;

update customers
set city = 'Kisumu'
where customer_id = 3;

-- Using case statement
update customers
set city = case customer_id
when 1 then 'Nairobi'
when 2 then 'Mombasa'
when 3 then 'Kisumu'
when 4 then 'Nakuru'
else city
end;

update orders
set quantity = case order_id
when 1 then 3
when 2 then 4
when 3 then 1
when 4 then 2
when 5 then 3
else quantity
end;

--Deleting rows: You can specify 
delete from customers 
where customer_id = 1;

alter table orders 
add constraint fk_customer
foreign key (customer_id)
references customers (customer_id)
on delete cascade;

delete from orders
where customer_id =1;

--TRUNCATE - Removes all rows from a table: Can't specify what remains
truncate table customers;

-- Dropping - Removes the entire table including its structure and data
drop table customers;

insert into customers (first_name, last_name, email, contact, city)
values 
('Grace', 'Wanjiku', 'grace.wanjiku@gmail.com', '+254712345001', 'Nairobi'),
('Brian', 'Otieno', 'brian.otieno@gmail.com', '+254712345002', 'Kisumu'),
('Amina', 'Hassan', 'amina.hassan@gmail.com', '+254712345003', 'Mombasa'),
('Kevin', 'Mwangi', 'kevin.mwangi@gmail.com', '+254712345004', 'Nairobi');

select * from customers;

insert into books (title, author, price,published_date)
values
('Power BI Basics', 'John Kimani', 1200.00, '2022-03-15'),
('Data Science Basics', 'Sarah Mwangi', 2200.00, '2021-07-20'),
('Python for Data Analytics', 'John Kimani', 1800.00, '2023-01-10'),
('Database Design Principles', 'Mary Achieng', 2200.00, '2020-11-05'),
('Business Analytics 101', 'David Mutua', 1500.00, '2024-02-18');

select * from  books;

insert into orders(customer_id, book_id, order_date, quantity)
values 
(1, 1, '2026-07-01', 2),
(1, 3, '2026-07-02', 1),
(2, 2, '2026-07-03', 3),
(3, 4, '2026-07-04', 1),
(2, 1, '2026-07-05', 2);

select * from orders;

