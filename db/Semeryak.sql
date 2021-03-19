INSERT INTO test_scheme.puppies(
	 dogBreed, months, city)
	VALUES 
	( 'shepherd', 6, 'Lviv'),
	( 'bichon', 7, 'Rivne'),
	( 'briard', 12, 'Lutsk');
SELECT * FROM test_scheme.puppies

ALTER TABLE test_scheme.puppies
ADD COLUMN ownerId INT,
ADD COLUMN suppliersId INT,
ADD COLUMN feedID INT,
ADD COLUMN vetClinicID INT,
ADD COLUMN vetDoctorId INT;


CREATE TABLE test_scheme.feed(
	Id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL,
	country VARCHAR NOT NULL
);
INSERT INTO test_scheme.feed(name, country)
	VALUES 
	( 'royalCanin', 'Germany'),
	( 'purina', 'France');
SELECT * FROM test_scheme.feed


CREATE TABLE test_scheme.vetClinic(
	Id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL,
	address VARCHAR NOT NULL
);
INSERT INTO test_scheme.vetClinic(name, address)
	VALUES 
	( 'LKPLev', 'Promyslova, 56'),
	( 'Eurovet', 'Pasichna, 11');
SELECT * FROM test_scheme.vetClinic


CREATE TABLE test_scheme.vetDoctor(
	Id SERIAL PRIMARY KEY,
	name VARCHAR NOT NULL,
	experienceAge INT NOT NULL
);
INSERT INTO test_scheme.vetDoctor(name, experienceAge)
	VALUES 
	( 'Johnatan', '15'),
	( 'Elvin', '20');
SELECT * FROM test_scheme.vetDoctor

SELECT * FROM test_scheme.puppies

UPDATE test_scheme.puppies
SET ownerId = 2, 
	 suppliersId = 1,
	 feedId = 1, 
	 vetclinicId = 2,
	 vetDoctorId = 1;

ALTER TABLE test_scheme.puppies
ADD CONSTRAINT puppies_ownerid
	FOREIGN KEY(ownerId)
	REFERENCES test_scheme.owners(id)
	ON DELETE SET NULL;

UPDATE test_scheme.puppies
SET ownerId = 3

UPDATE test_scheme.puppies
SET ownerId = 1
WHERE id = 7

DELETE FROM test_scheme.owners
WHERE id = 1;

ALTER TABLE test_scheme.puppies
ADD CONSTRAINT puppies_suppliersId
	FOREIGN KEY(suppliersId)
	REFERENCES test_scheme.suppliers(id)
	ON DELETE SET DEFAULT;
	
UPDATE test_scheme.puppies
SET suppliersId = 2
WHERE id = 6

DELETE FROM test_scheme.suppliers
WHERE id = 2;

SELECT * FROM test_scheme.puppies

ALTER TABLE test_scheme.puppies
ADD CONSTRAINT puppies_feedId
	FOREIGN KEY(feedId)
	REFERENCES test_scheme.feed(id)
	ON DELETE RESTRICT;


ALTER TABLE test_scheme.puppies
ADD CONSTRAINT puppies_vetClinicId
	FOREIGN KEY(vetClinicId)
	REFERENCES test_scheme.vetClinic(id)
	ON DELETE NO ACTION;
	
ALTER TABLE test_scheme.puppies
ADD CONSTRAINT puppies_vetDoctorId
	FOREIGN KEY(vetDoctorId)
	REFERENCES test_scheme.vetDoctor(id)
	ON DELETE CASCADE;

UPDATE test_scheme.puppies
SET vetDoctorId = 2
WHERE id = 5

DELETE FROM test_scheme.vetDoctor
WHERE id = 2;

ALTER TABLE test_scheme.puppies ALTER COLUMN suppliersId set default 3;
DELETE FROM test_scheme.suppliers
WHERE id = 1;

SELECT dogbreed, months, city, ownerId, suppliersId, feedId, vetClinicId, vetDoctorId FROM test_scheme.puppies ORDER BY Id ASC;
DELETE FROM test_scheme.puppies
WHERE id = 6;