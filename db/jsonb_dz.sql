create table testing.cards(
	id integer NOT NULL,
	data jsonb
);
select * from testing.cards
Insert into testing.cards values(1, '{"name":"Wash dishes","finished":false,"tags":["Clean","Kitchen"]}');
Insert into testing.cards values(2, '{"name":"Paint the house","finished":true,"tags":["Home decoration","Improvements"]}');
Insert into testing.cards values(3, '{"name":"Hang the picture","finished":false,"tags":["Home decoration","Living room"]}');
Insert into testing.cards values(4, '{"name":"Cook the lunch","finished":true,"tags":["Kitchen","Food","Avocado toast"],"ingredients":["Avocado","Breads"]}');

select data ->> 'tags' as Tags from testing.cards;

select data -> 'tags' ->> 0 as Tags from testing.cards;

select * from testing.cards where data ->> 'finished' = 'true'

select count(*) from testing.cards where data ? 'ingredients'

select * from testing.cards
where 
	data -> 'tags' ? 'Home decoration'
	and data -> 'tags' ? 'Improvements'
	and data ->> 'finished' = 'true'

select 
	jsonb_array_elements_text(data->'tags')
from testing.cards;

