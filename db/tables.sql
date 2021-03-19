-- таблиця груп товарів
CREATE TABLE groups (
id bigint PRIMARY KEY, -- ідентифікатор групи
name varchar(100) NOT NULL, -- назва групи
type char(2) -- тип групи
);

insert into groups(id, name , type)
VALUES 
	(1, 'apple', 'Ph'), --Ph-phone
	(2, 'samsung', 'Ph'),
	(3, 'apple', 'Lp'),--Lp - laptop
	(4, 'asus', 'Lp'),
	(5, 'apple', 'Wt'), -- Wt - watch
	(6, 'apple' , 'Hp'); --Hp - headphone
select * from groups
-- таблиця товарів
CREATE TABLE items (
id bigint PRIMARY KEY, -- ідентоифікатор товару
title varchar(100) NOT NULL, -- назва товару
group_id bigint references groups(id), -- посилання на товарну групу
price numeric(15,2) NOT NULL, -- ціна товару
amount integer NOT NULL -- кількість наявного товару
);
insert into items(id, title, group_id, price, amount) 
VALUES
	(1, 'iphone 12', 1, 1200, 15),
	(2, 'samsung S20 FE', 2, 900, 5),
	(3, 'macbook', 3, 1800, 3),
	(4, 'asus' , 4, 500, 9),
	(5, 'apple watch 5', 5, 500, 16),
	(6, 'airpods', 6 , 300,  18);
	
insert into items values(7, 'airpods 2' , 6 , 250, 10)
select * from items
-- таблиця замовлень
CREATE TABLE orders (
id bigint PRIMARY KEY, -- ідентифікатор замовлення
num varchar(10) NOT NULL, -- номер замовлення
date timestamp NOT NULL, -- дата замовлення
customer varchar(100) NOT NULL, -- назва замовника
status char(2), -- статус замовлення ('NE' - нове, 'PR' - в обробці, 'PA' -оплачене, 'DE' - доставлене)
comment varchar(200) -- коментар до замовлення
);

insert into orders(id, num, date, customer , status, comment)
VALUES
	(1, 11, '2020-10-05', 'Rozetka', 'NE', 'okey'),
	(2, 21, '2018-10-15', 'Allo', 'PR', 'okey2'),
	(3, 1, '2019-02-05', 'Rozetka', 'PA', 'okey3'),
	(4, 5, '2017-11-04', 'Casta', 'DE', 'okey4');
select * from orders
-- таблиця замовлених товарів
CREATE TABLE ordered (
order_id bigint references orders(id), -- посилання на замовлення
item_id bigint references items(id), -- посилання на замовлений товар
amount integer NOT NULL -- кількість замовленого товару
);
insert into ordered (order_id, item_id, amount)
VALUES 
	(1, 1, 2),
	(2, 2, 9),
	(3, 3, 2),
	(4, 4, 6);
select * from ordered
-- 1 task olena
insert into ordered values (3,7,5);
--2 task 
update items set price = price/2 where group_id =2;
--3 task
delete from orders where date > '2019-09-01';
--4 task	
select distinct num, date from orders o 
join ordered od on o.id = od.order_id 
join items i on i.id = od.item_id
join groups g on g.id = i.group_id 
where o.status = 'PA' and g.name = 'Lp';
--5 task
select it.title, sum(it.amount) as full_ordereds from items it 
join ordered o on it.id = o.item_id 
join orders o2 on o2.id = o.order_id 
group by it.title 
having sum(it.amount) <20;

--1 task ana
insert into ordered VALUES(5,11,17);
--2 task
update items set price = price/2 where group_id=2;
--3 task
delete from items where amount < 3;
--4 task
select it.title, it.price from orders o
join ordered od on o.id=od.order_id 
join items it on it.id=od.item_id 
where o.customer='Rozetka' and o.status='PA';
--5 task
select g.name from ordered od
join items it on od.item_id=it.id 
join groups g on it.group_id=g.id 
group by g.id 
having sum(it.price*od.amount)>15000.00

--4 task sydor
select o.customer from orders o
join ordered od on o.id = od.order_id
join items it on od.item_id=it.id 
join groups g on it.group_id=g.id 
where o.status='PA' and g.name='apple'
--5 task sydor
select g.name from ordered od 
join items it on od.item_id=it.id
join groups g on it.group_id=g.id 
group by g.id 
having sum(it.price*od.amount)=3600.00

--1 task smolinska
insert into groups VALUES(102, 'Networks adapters');
--2 task smolinska
update orders set status='DE' where customer = 'Allo';
--4 task smolinska
select o.customer from orders o
join ordered od on o.id = od.order_id
join items it on od.item_id=it.id 
join groups g on it.group_id=g.id 
--where od.amount>1 and g.name='apple' and o.date >= '2020-10-01' and o.date <'2020-11-01';
where od.amount>1 and g.name='apple' and o.date between '2020-10-01' and '2020-11-01';

