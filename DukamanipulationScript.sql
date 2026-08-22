SET search_path TO duka;

select product_name, price 
from duka.duka_products
where price >150
order by price desc;

select product_name, stock_level
from duka.duka_products
where stock_level <= 30;

select product_name
from duka.duka_products
where price = 65;

select product_name, product_category
from duka.duka_products
where product_category != 'Household'
order by product_category asc;

-- LOGICAL OPERATORS

select product_name, product_category, price
from duka.duka_products 
where product_category = 'Dairy' and price > 70;

select product_name, product_category
from duka.duka_products 
where product_category = 'Beverages' or product_category = 'Household';

select product_name, product_category
from duka.duka_products 
where not product_category = 'Grains & Cereals'


select product_name, product_category, price
from duka.duka_products
where product_category = 'Dairy' and (price < 70 or price > 85);

select product_name, price
from duka.duka_products
where price >= 60 and price <= 200

select product_name, price
from duka.duka_products
where price between 60 and 200;

select product_name, stock_level
from duka.duka_products
where stock_level between 20 and 40
order by product_name asc;

-- ==========MEMBERSHIP (in, not in )===========

select product_name, supplier
from duka.duka_products
where supplier not in ('Kenya Grain Millers', 'Brookside Dairy');

-- Products starting with m

select product_name
from duka.duka_products
where product_name like 'M%';

--Products containing ai

select product_name
from duka.duka_products
where product_name like '%ai%';

-- EXACTLY OBE CHARACTER

select product_name
from duka.duka_products
where product_name like '_kate';

select product_name
from duka.duka_products
where product_name like '%i';


-- Stock less than 30
select count(*) as low_stock_levels
from duka.duka_products
where stock_level < 30;

--How many grains & cereals > 70

select count (*) as cereal_count
from duka.duka_products
where product_category = 'Grains & Cereals' and price > 170;



SELECT * from duka.duka_products;

