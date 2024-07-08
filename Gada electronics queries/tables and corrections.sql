Create database Gada_Electronics;
Use Gada_Electronics;
CREATE TABLE categories (
    category_id bigint PRIMARY KEY,
    category_code VARCHAR(255)
);

CREATE TABLE products (
    product_id bigint PRIMARY KEY,
    category_id bigint,
    price double,
    brand VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

load data infile
'products.csv'
into table products fields terminated by','
ignore 1 lines;


Select * from products;
Select brand from products where product_id=139905;
ALTER TABLE products
ADD CONSTRAINT fk_categoriess
FOREIGN KEY (category_id) REFERENCES categories(category_id);


Select @@secure_file_priv;


CREATE TABLE events (
    event_id bigint AUTO_INCREMENT PRIMARY KEY,
    event_time DATETIME,
    event_type VARCHAR(50),
    product_id bigint,
    user_id BIGINT,
    user_session VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

Select * from categories;
select count( category_id) from categories;

Select * from products;
select count( product_id) from products;

Select * from users;
Select count( id) from users;
select id from users where user_session='Yxfwuvw47A' limit 3000;
Select * from events;

CREATE TABLE temp_products (
    product_id INT,
    category_id bigint,
    price DECIMAL(10, 2),
    brand VARCHAR(255)
);



SELECT DISTINCT category_id 
FROM temp_products 
WHERE category_id NOT IN (SELECT category_id FROM categories);

UPDATE temp_products
SET category_id = 0  
WHERE category_id NOT IN (SELECT category_id FROM categories);

INSERT INTO products (product_id, category_id, price, brand)
SELECT product_id, category_id, price, brand
FROM temp_products;

DROP TABLE temp_products;
select * from products;

SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA INFILE 'products.csv' 
INTO TABLE products 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES 
(product_id, category_id, price, brand);

Select * from products;
SET FOREIGN_KEY_CHECKS = 1;
SELECT DISTINCT category_id 
FROM products 
WHERE category_id NOT IN (SELECT category_id FROM categories);
DELETE FROM products
WHERE category_id NOT IN (SELECT category_id FROM categories);
SET FOREIGN_KEY_CHECKS = 1;

LOAD DATA INFILE 'products.csv' 
INTO TABLE products 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES 
(product_id, category_id, price, brand);











CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category_id bigint,
    price double,
    brand VARCHAR(255)
);
SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA INFILE 'products.csv' 
INTO TABLE products 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES 
(product_id, category_id, price, brand);
SET FOREIGN_KEY_CHECKS = 1;
SELECT DISTINCT category_id 
FROM products 
WHERE category_id NOT IN (SELECT category_id FROM categories);



INSERT INTO categories (category_id, category_code) values(2144420000000000000,'dummy');
INSERT INTO categories (category_id, category_code) values(2151550000000000000,'dummy2');
INSERT INTO categories (category_id, category_code) values(2150220000000000000,'dummy3');
INSERT INTO categories (category_id, category_code) values(2166250000000000000,'dummy4');
INSERT INTO categories (category_id, category_code) values(2176610000000000000,'dummy5');
INSERT INTO categories (category_id, category_code) values(2223380000000000000,'dummy6');
INSERT INTO categories (category_id, category_code) values(2227850000000000000,'dummy7');


ALTER TABLE products
ADD CONSTRAINT fk_categories3
FOREIGN KEY (category_id) REFERENCES categories(category_id);

Select * from products where category_id=2227850000000000000;
CREATE TABLE users (
    
    user_id BIGINT,
    user_session VARCHAR(255)
);
LOAD DATA INFILE 'users.csv' 
INTO TABLE users 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES 
(user_id,user_session);

ALTER TABLE users
ADD COLUMN id BIGINT AUTO_INCREMENT PRIMARY KEY FIRST;
Select * from users;


CREATE TABLE events (
    
    event_time DATETIME,
    event_type VARCHAR(50),
    product_id bigint,
    user_id BIGINT,
    user_session VARCHAR(255)
    
);
Alter table events modify column event_time varchar(50);

LOAD DATA INFILE 'events.csv' 
INTO TABLE events 
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES 
(event_time,event_type,product_id,user_id,user_session);

LOAD DATA INFILE 'events7.csv' 
INTO TABLE events 
FIELDS TERMINATED BY ',' 
IGNORE 0 LINES 
(event_time,event_type,product_id,user_id,user_session);

LOAD DATA INFILE 'events7.csv'
INTO TABLE events
FIELDS TERMINATED BY ','
IGNORE 0 LINES
(event_time, event_type, @product_id, user_id, user_session)
SET product_id = NULLIF(@product_id, '');

LOAD DATA INFILE 'events7.csv'
INTO TABLE events
FIELDS TERMINATED BY ','
IGNORE 0 LINES
(event_time, event_type, @product_id, @user_id, user_session)
SET product_id = NULLIF(@product_id, ''),
    user_id = NULLIF(@user_id, '');

ALTER TABLE events
ADD COLUMN event_id BIGINT AUTO_INCREMENT PRIMARY KEY FIRST;
ALTER TABLE events
ADD CONSTRAINT fk_events3
FOREIGN KEY (product_id) REFERENCES products(product_id);
SELECT DISTINCT product_id 
FROM events 
WHERE product_id NOT IN (SELECT product_id FROM products);
DELETE FROM events
WHERE product_id NOT IN (SELECT product_id FROM products);
select event_id from events;
ALTER TABLE events
drop COLUMN event_id ;
ALTER TABLE events
ADD COLUMN event_id BIGINT AUTO_INCREMENT PRIMARY KEY FIRST;
select * from events;

Alter table events modify column product_id int;
ALTER TABLE events
ADD CONSTRAINT fk_events2
FOREIGN KEY (product_id) REFERENCES products(product_id);