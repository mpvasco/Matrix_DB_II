/*
STUDENT: Maria Paula
ID: 5479769



Create product table with following columns:
Productid, name, company, price, manufactured_date, expired_Dat

1. Identify the datatype and create the table. Product id should be unique and it should be auto incremented.
2. Insert at least 5 records.
3. Decrease the 5% price if manufactured date is less than 31st May, 2021.
4. Change manufactured date and expired date if price is greater than $10.
5. Delete the products which are expired.
6. Retrieve the product name, company and price from the product table.
7. Retrieve product names only whose price falls between $5 and $6.
8. Retrieve name of costliest product.
9. Retrieve minimum and maximum price of product.
10. Retrieve total number of products.
11. Retrieve the cost of all products.
12. Retrieve products of companies like apple, dell, google.
13. Retrieve the products which name starts with l, ends with p and should have at least three
characters.
14. Display information of two cheapest product.
15. Display information of product which name contains three characters only.
16. Increase 2% product price if price falls between $10 and $15.
17. Delete products if company is apple or product is expired.
18. Add category column in table.
19. Change size of company column in database.
20. Add not null constraint in price and expired date



*/

-- create database assignments;
-- use assignments;

-- 1. Identify the datatype and create the table. Product id should be unique and it should be auto incremented.
create table product (
prod_id int not null primary key auto_increment,
prod_name varchar (255),
company varchar (255),
price float,
manufactured_date date,
expired_date date

);

-- 2. Insert at least 5 records.
insert into product ( prod_name, company, price, manufactured_date, expired_date ) 
values ("Keyboard", "dell", 75, "2020-06-06", "2010-06-06"), 
("Mouse", "noname", 9, "2021-07-09", "2026-07-09"), 
("headphone", "google", 9, "2016-08-01", "2021-08-01"),  
("monitor", "dell", 135, "2015-05-05", "2025-05-05"), 
("mousepad", "apple", 9, "2016-06-06", "2020-06-06"),  
("laptop", "dell", 699, "2010-10-05", "2020-10-05"),  
("chromebook", "google", 199, "2020-12-05", "2030-12-05") ;
select price from product;

-- 3. Decrease the 5% price if manufactured date is less than 31st May, 2021.
update product
set price = price - (price * 0.05)
where manufactured_date < "2021-05-31";
select price from product;

-- 4. Change manufactured date and expired date if price is greater than $10.
update product
set manufactured_date = "2019-06-09" , expired_date = "2022-07-09"
where price > 10;
select * from product;


-- 5. Delete the products which are expired.
delete from product
where expired_date < CURRENT_DATE();

-- 6. Retrieve the product name, company and price from the product table.
select prod_name, company, price from product;

-- 7. Retrieve product names only whose price falls between $5 and $6.
select prod_name from product
where price >= 5 and price <= 6;

-- 8. Retrieve name of costliest product.
select prod_name from product
where price = ( select max(price) from product);

-- 9. Retrieve minimum and maximum price of product.
select max(price), min(price) from product;

-- 10. Retrieve total number of products.
select count(*) from product;

-- 11. Retrieve the cost of all products.
select sum(price) from product;

-- 12. Retrieve products of companies like apple, dell, google.
select prod_name from product 
where company in ("apple", "dell", "google");

-- 13. Retrieve the products which name starts with l, ends with p and should have at least three characters.
select * from product where prod_name like 'l%_p';

-- 14. Display information of two cheapest product.
select * from product order by price limit 2;

-- 15. Display information of product which name contains three characters only.
select * from product where prod_name like '___';

-- 16. Increase 2% product price if price falls between $10 and $15.
update product
set price = price + (price * 0.02)
where price between 10 and 15;

-- 17. Delete products if company is apple or product is expired.
delete from product
where company = "apple" or expired_date < CURRENT_DATE();

-- 18. Add category column in table.
alter table product
add category varchar(255);

-- 19. Change size of company column in database.
alter table product
modify company varchar(200);

-- 20. Add not null constraint in price and expired date
alter table product
modify column price float not null;  
alter table product
modify column expired_date date not null; 


-- drop table product;


