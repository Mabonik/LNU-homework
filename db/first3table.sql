-- Table: test_scheme.aaa

-- DROP TABLE test_scheme.aaa;

CREATE TABLE test_scheme.aaa
(
)

WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE test_scheme.aaa
    OWNER to postgres;
	
	
CREATE TABLE test_scheme.puppies(
	Id SERIAL PRIMARY KEY,
	dogBreed VARCHAR NOT NULL,
	months INTEGER NOT NULL,
	city VARCHAR NOT NULL
);
INSERT INTO test_scheme.puppies(
	 dogBreed, months, city)
	VALUES 
	( 'frenchie', 2, 'Lviv'),
	( 'maltipoo', 3, 'Rivne'),
	( 'labrador', 12, 'Kyiv'),
	( 'affenpinscher', 8, 'Kharkiv'),
	( 'bulldog', 2, 'Lviv');
SELECT * FROM test_scheme.puppies

DELETE FROM test_scheme.puppies
WHERE id > 4;
SELECT * FROM test_scheme.puppies

CREATE TABLE test_scheme.owners(
	Id SERIAL PRIMARY KEY,
	firstName VARCHAR NOT NULL,
	lastName VARCHAR NOT NULL,
	tel VARCHAR(13) NOT NULL
);
INSERT INTO test_scheme.owners(firstName, lastName, tel)
VALUES 
	('John', 'Netreb', '+380985674353'),
	('Olha', 'Rak', '+380665674353'),
	('Ann', 'Laptso', '+380987774353'),
	('Kevin', 'Mukha', '+380982274353');

SELECT * FROM test_scheme.owners


SELECT firstName, lastName, tel FROM test_scheme.owners ORDER BY Id ASC;

CREATE TABLE test_scheme.suppliers(
	Id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL,
	address VARCHAR NOT NULL,
	tel VARCHAR(13) NOT NULL
);

INSERT INTO test_scheme.suppliers(name, address, tel)
VALUES
	('Kennel', 'Zelena,15', '+380987654567'),
	('LKPLev', 'Promyslova,56', '+380955554567'),
	('Eurovet', 'Pasichna,11', '+380966654567');

SELECT * FROM test_scheme.suppliers

UPDATE test_scheme.suppliers
SET address = 'Zelena, 16'
WHERE id = 1;
SELECT * FROM test_scheme.suppliers

SELECT name, address, tel FROM test_scheme.suppliers ORDER BY Id ASC;
SELECT * FROM test_scheme.suppliers