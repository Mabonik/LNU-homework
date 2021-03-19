SELECT * FROM test_scheme.vetdoctor
where id = 1
---ROLLBACK update---
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

UPDATE test_scheme.vetdoctor
SET experienceage = 12
WHERE vetdoctor.id = 1;

UPDATE test_scheme.vetdoctor
SET experienceage = 44
WHERE vetdoctor.id = 2;

ROLLBACK;
COMMIT;
---SAVEPOINT update---
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION;

UPDATE test_scheme.vetdoctor
SET experienceage = 10
WHERE vetdoctor.id = 1;

SAVEPOINT before_update2;

UPDATE test_scheme.vetdoctor
SET experienceage = 44
WHERE vetdoctor.id = 2;

ROLLBACK TO before_update2;
COMMIT;

---with DELETE---
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;

UPDATE test_scheme.vetdoctor
SET experienceage = 44
WHERE vetdoctor.id = 9;

SAVEPOINT before_update2;

DELETE FROM test_scheme.vetdoctor
WHERE vetdoctor.id = 8;

ROLLBACK TO before_update2;
COMMIT;
---statistic table---
create table test_scheme.statistic(
	ID INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(20),
	totalcount INT NOT NULL,
	PRIMARY KEY(id)
);
---
select * from test_scheme.statistic
ALTER TABLE test_scheme.statistic add COLUMN insertData integer 
insert into test_scheme.statistic(name,totalcount, insertdata) values ('Feed Expert', 0, 0);
ALTER TABLE test_scheme.statistic add COLUMN updateData integer 
---function for insert---
CREATE FUNCTION trigger_function_data()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
AS $$
BEGIN 
	UPDATE test_scheme.statistic
	SET insertdata = (SELECT(insertdata+1) FROM test_scheme.statistic WHERE id =2)
	WHERE id = 2;
	RETURN NEW;
END;
$$
DROP FUNCTION IF EXISTS trigger_function_insertdata() cascade;
---trigger insert for all rows---
CREATE TRIGGER inserted_all_row
	AFTER INSERT
	ON test_scheme.feed
	EXECUTE PROCEDURE trigger_function_data();
------
select * from test_scheme.feed
insert into test_scheme.feed(name,country,shop) 
values('Teo','Poland','Pryroda'),
	    ('Club 4 paws','Ukraine','Zoomaster')
insert into test_scheme.feed(name,country,shop) 
values('Purina mini ','France','Pryroda'),
	    ('Club 4 paws mini','Poland','Zoomaster')
---function for update---
CREATE FUNCTION trigger_function_updateData()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
AS $$
BEGIN 
	UPDATE test_scheme.statistic
	SET updateData = (SELECT(updateData+1) FROM test_scheme.statistic WHERE id =2)
	WHERE id = 2;
	RETURN NEW;
END;
$$
---trigger update for each rows---
CREATE TRIGGER updated_all_row
	AFTER UPDATE
	ON test_scheme.feed
	FOR EACH ROW
	EXECUTE PROCEDURE trigger_function_updateData();
------
update test_scheme.feed
set shop = 'LKPLev'
where id > 4
