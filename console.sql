CREATE TABLE products
(
    id           SERIAL PRIMARY KEY,
    productName  VARCHAR(30) NOT NULL,
    manufacturer      VARCHAR(20) NOT NULL,
    productCount INT DEFAULT 0,
    price        NUMERIC     NOT NULL,
    isDiscounted BOOL
);
INSERT INTO products (productName, manufacturer, productCount, price, isDiscounted)
VALUES ('iPhone X', 'Apple', 3, 76000, false),
       ('iPhone 8', 'Apple', 2, 71000, true),
       ('iPhone 7', 'Apple', 5, 42000, true),
       ('Galaxy S9', 'Samsung', 2, 46000, false),
       ('Galaxy S8 Plus', 'Samsung', 1, 56000, true),
       ('Desire 12', 'HTC', 5, 28000, true),
       ('Nokia 9', 'HMD Global', 6, 38000, true);
---------------------------------------------------------------
--------------------------- 1 ---------------------------------
select * from products where manufacturer not in ('HTC');
--------------------------- 2 ---------------------------------
select * from products where manufacturer = 'Apple' and price < 70000;
--------------------------- 3 ----------------------------------
select * from products where price >= 46000;
--------------------------- 4 ----------------------------------
select * from products order by price  desc limit 2;
--------------------------- 5 ----------------------------------
select productName from products where price = (select min(price) from products);
--------------------------- 6 ----------------------------------
select * from products where isDiscounted = true;
--------------------------- 7 ----------------------------------
select * from products where isDiscounted = false;
--------------------------- 8 ---------------------------------
select * from products order by price desc ;
--------------------------- 9 ----------------------------------
select sum(price) from products;
--------------------- ----- 10 ---------------------------------
select * from products  where productCount <=2;
