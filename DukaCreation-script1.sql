CREATE SCHEMA IF NOT EXISTS duka;
SET search_path TO duka;

DROP TABLE IF EXISTS duka_products;

CREATE TABLE duka_products (
    product_id       SERIAL PRIMARY KEY,
    product_name     VARCHAR(80) NOT NULL,
    product_category VARCHAR(30),
    price            NUMERIC(10,2),
    stock_level      INT,
    supplier         VARCHAR(50)
);




INSERT INTO duka_products (product_name, product_category, price, stock_level, supplier) VALUES
('Unga wa ngano',      'Grains & Cereals', 180.00, 50, 'Kenya Grain Millers'),
('Mchele Pishori',     'Grains & Cereals', 235.00, 60, 'Kenya Grain Millers'),
('Sukari',             'Grains & Cereals', 165.00, 90, 'Kenya Grain Millers'),
('Maziwa Fresh',       'Dairy',             60.00, 30, 'Brookside Dairy'),
('Mtindi',             'Dairy',             90.00, 20, 'Brookside Dairy'),
('Chai ya Majani',     'Beverages',        250.00, 25, 'Kenya Beverages Ltd'),
('Soda',               'Beverages',         70.00, 45, 'Kenya Beverages Ltd'),
('Sabuni ya kufulia',  'Household',         55.00, 35, 'Metro Wholesalers'),
('Mkate',              'Snacks & Bakery',   65.00, 20, 'Britania Ltd'),
('Maharagwe',          'Grains & Cereals', 200.00, 35, 'Kenya Grain Millers'),
('Unga wa Dola',       'Grains & Cereals', 195.00, 45, 'Kenya Grain Millers');


SELECT * FROM duka_products;