/*
 * SQL Querying, Filtering & Aggregation 
 * Covers SELECT, WHERE, filtering operators, ORDER BY, GROUP BY, HAVING, 
 * aggregate functions and LIMIT using a bookstore dataset.
 */

--SELECT
select * from books;
select * from customers;
select * from orders;

select title from books;
select title, author from books;

select first_name, last_name, city from customers;

--SELECT WHERE

select * from customers
where city = 'Nairobi';

select * from customers
where customer_id = '1';

select title, price from books
where author = 'David Kimani';

select * from books
where price < 2000;

select * from orders
where order_date < '2023-12-31';

select * from customers
where city = 'Nairobi' or city = 'Nakuru';

select * from customers 
where city in ('Nairobi', 'Nakuru');

-- FILTERING OPERATORS

-- Books published after January 1st 2023 and costing less than 2000

select * from books
where price < 2000 and published_date > '2023-01-01';

-- Books costing between 1800 and 2500
select * from books 
where price between 1800 and 2500;

select * from books
where price >= 1800 and price <= 2500;

--Orders made in 2023
select * from orders
where order_date between '2023-01-01' and '2023-12-31';

select * from books
where author in ('John Kimani', 'Susan Njeri', 'James Mwangi')
and published_date between '2023-01-01' and '2024-12-31' 
and price < 2500;

/* Operations used with where
 * = -         Equals to
 * <> / !=     Not equal to
 * >           Greater than
 * <           Less than
 * between     Inclusive ranges
 * in          Matches any value in a list
 * and         All conditions must be true
 * or          Only one condition must be true
 * not         Negates a condition
 * is null     Checks for blanks
 * is not null Checks for non blanks
 * like        Pattern matching
 */

-- ORDER BY:Sorts data -ASC/DESC

select * from customers
order by first_name desc;

select * from books
order by price desc;

select * from books
order by published_date desc;

-- GROUP BY: Used to group rows with the same values in specified columns
-- Customer count in each city

select city, count(*) as customers
from customers 
group by city;

select author, count(*) as books
from books
group by author
order by author desc;

select author, sum(price) as total
from books
group by author;

select customer_id, count(*) as customers
from orders
group by customer_id;

select book_id, count() as books
from orders
group by book_id;

select customer_id, sum(quantity) as total
from orders
group by customer_id;

select book_id, sum(quantity) as total
from orders
group by book_id;

--HAVING: Filter groups after aggregation
--Find authors that wrote more than one book

select author, count(*) as books
from books
group by author
having count (*) > 1;


select book_id, sum(quantity) as total
from orders
group by book_id
having sum(quantity) > 5;

--Cities with less than two customers
select city, count(*) as count
from customers 
group by city 
having count(*) <2;

--List customers who bought more than 5 books
select customer_id, sum(quantity) as total
from orders
group by customer_id
having sum(quantity) >5;

select customer_id, count(order_id) as number
from orders
group by customer_id 
having count(order_id) >2;

--LIMIT: Restricts results
select * from books 
order by price desc 
limit 3;

select * from books
limit 5;

/*
 * QUERY WRITING ORDER
 * Select column from table
 * where condition
 * group by column
 * having condition
 * order by column
 * limit number
 */

/*
QUERY EXECUTION ORDER
FROM, WHERE, GROUP BY, HAVING
SELECT, ORDER BY, LIMIT

