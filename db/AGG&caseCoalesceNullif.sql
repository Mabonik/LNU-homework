SELECT * FROM test_scheme.puppies

SELECT dogbreed, SUM(months),COUNT(id), MAX(months),MIN(id), AVG(months)
FROM test_scheme.puppies
GROUP BY dogbreed

  


,COALESCE(NULLIF('A','B'), 'NO PASSPORT')




create table test_scheme.agecategory(
	dogbreed character varying,
	months integer,
	city character varying,
	ownerid integer,
	coalesce integer,
	nullif integer,
	name character varying,
	experienceage integer,
	clinic character varying,
	dogbreedagecategory bigint
	
);
insert into test_scheme.agecategory(dogbreed,months,city,ownerid,coalesce,nullif,name,experienceage,clinic,dogbreedagecategory)
SELECT
		dogbreed
		,months
		,city
		,ownerid
		,NULLIF(months,6)
		,COALESCE(ownerid, 1)
		,name
		,experienceage
		,clinic
		,SUM
			(CASE
				WHEN months > 0
					AND months < 12 THEN 0
				WHEN months >=12
					AND months < 24 THEN 1
				ELSE 2
		END) AS DogbreedAgeCategory	
		
	
FROM test_scheme.puppies
inner join  test_scheme.vetdoctor
on puppies.vetdoctorid=vetdoctor.id
GROUP BY dogbreed , months, city, ownerid , name, experienceage, clinic
HAVING MAX(experienceage) > 20
ORDER BY DogbreedAgeCategory 


ALTER TABLE test_scheme.agecategory
ADD COLUMN category character varying 
insert into test_scheme.agecategory(category)
SELECT
		CASE
				WHEN months > 0
					AND months < 12 THEN 'PUPPIES'
				WHEN months >=12
					AND months < 24 THEN 'JUNIOR'
				ELSE 'ADULT'
		END CategotyD
FROM test_scheme.puppies
ORDER BY CategotyD


SELECT * FROM test_scheme.agecategoryy



create table test_scheme.agecategoryy(
	dogbreed character varying,
	months integer,
	city character varying,
	ownerid integer,
	coalesce integer,
	nullif integer,
	name character varying,
	experienceage integer,
	clinic character varying,
	dogbreedagecategory bigint
	
);
insert into test_scheme.agecategoryy(dogbreed,months,city,ownerid,coalesce,nullif,name,experienceage,clinic,dogbreedagecategory)
SELECT
		dogbreed
		,months
		,city
		,ownerid
		,NULLIF(months,6)
		,COALESCE(ownerid, 1)
		,name
		,experienceage
		,clinic
		,SUM
			(CASE
				WHEN months > 0
					AND months < 12 THEN 0
				WHEN months >=12
					AND months < 24 THEN 1
				ELSE 2
		END) AS DogbreedAgeCategory	
		, COUNT (*) as totalCount
		,CASE
				WHEN experienceage > 0
					AND experienceage < 20 THEN 'BEGINNER'
				WHEN experienceage >=20
					AND experienceage < 30 THEN 'INTERMEDIATE'
				ELSE 'ADVANCED'
		END CategotyD
		,MAX(experienceage) as max_exp_age
	
FROM test_scheme.puppies
inner join  test_scheme.vetdoctor
on puppies.vetdoctorid=vetdoctor.id
GROUP BY dogbreed , months, city, ownerid , name, experienceage, clinic,CategotyD
HAVING MAX(experienceage) > 20
ORDER BY DogbreedAgeCategory 




