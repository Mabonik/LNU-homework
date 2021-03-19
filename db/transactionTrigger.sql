---stat table---
create table test_scheme.stat(
	ID INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(20),
	totalcount INT NOT NULL,
	PRIMARY KEY(id)
);
select * from test_scheme.stat

insert into test_scheme.stat(name,totalcount) values ('Vetdoctor', 0);

select * from test_scheme.vetdoctor
---function---
CREATE FUNCTION trigger_function()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
AS $$
BEGIN 
	UPDATE test_scheme.vetdoctor
	SET trcount = (SELECT(trcount+1) FROM test_scheme.vetdoctor WHERE id = 1)
	WHERE id = 1;
	RETURN NEW;
END;
$$
---trigger insert---
CREATE TRIGGER row_inserted
	AFTER INSERT
	ON test_scheme.vetdoctor
	EXECUTE PROCEDURE trigger_function();
select * from test_scheme.vetdoctor

INSERT INTO test_scheme.vetdoctor(name,experienceage,clinic)
VALUES('Mykhail', 18,'LKPLev')