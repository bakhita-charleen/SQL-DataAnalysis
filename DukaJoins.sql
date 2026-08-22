-- setting up Two new tables for JOIN session

set search_path to duka;

CREATE TABLE duka.duka_customers(
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    phone CHAR(10) UNIQUE,
    location VARCHAR(50)
);
 
CREATE TABLE duka.duka_orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES duka_customers(customer_id),
    product_id INT NOT NULL REFERENCES duka_products(product_id),
    quantity INT,
    order_date DATE
);


INSERT INTO duka.duka_customers(name, phone, location)
VALUES
('Peter Mwangi', '0721111111', 'Kileleshwa'),
('Grace Njoroge', '0722222222', 'Kawangware'),
('John Otieno', '0723333333', 'Kileleshwa'),
('Faith Wambui', '0724444444', 'Buruburu'),
('Samuel Kiptoo', '0725555555', 'Umoja'),
('Lucy Achieng', '0726666666', 'Kawangware'),
('David Mutua', '0727777777', 'Buruburu'),
('Ann Wanjiku', '0728888888', 'Kileleshwa');


INSERT INTO duka.duka_orders(customer_id, product_id, quantity, order_date)
VALUES
(1, 3, 2, '2026-05-01'),
(1, 4, 1, '2026-05-01'),
(2, 7, 3, '2026-05-02'),
(3, 1, 1, '2026-05-02'),
(3, 10, 2, '2026-05-03'),
(4, 8, 1, '2026-05-03'),
(5, 3, 5, '2026-05-04'),
(6, 7, 2, '2026-05-05'),
(7, 4, 3, '2026-05-05'),
(1, 10, 1, '2026-05-06'),
(2, 3, 1, '2026-05-06');


select c.name, o.product_id, o.quantity
from duka.duka_customers c
inner join duka.duka_orders o
on c.customer_id = o.customer_id;

select c.name, p.product_name, o.quantity
from duka.duka_customers c
inner join duka.duka_orders o on c.customer_id = o.customer_id
inner join duka.duka_products p on p.product_id = o.product_id;

-- Which customers ordered products priced above 100 shillings
-- name of customer , name of product, price
select c.name, p.product_name, p.price 
from duka.duka_customers c 
inner join duka.duka_orders o on o.customer_id = c.customer_id 
inner join duka.duka_products p on o.product_id = p.product_id 
where p.price > 100;

-- example 4: show Grace Njoroge's history ,
-- name of products, order date and quantity ordered by her
select c.name, p.product_name, o.quantity, o.order_date 
from duka.duka_customers c 
inner join duka.duka_orders o on o.customer_id = c.customer_id 
inner join duka.duka_products p on o.product_id = p.product_id 
where c.name = 'Grace Njoroge';


--SELF JOIN: A TABLE MATCHED TO ITSELF --


select c1.name as customer_a, c2.name as customer_b, c2.location 
from duka.duka_customers c1
inner join duka.duka_customers c2
on c1.location =c2.location and c1.customer_id < c2.customer_id 
;




select * from duka.duka_customers;
SELECT * from duka.duka_products;
select * from duka.duka_orders ;

