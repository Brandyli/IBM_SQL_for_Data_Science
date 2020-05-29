--Brandy's queries
--1 Aggregation: SUM(), AVG()
SELECT SUM(SALEPRICE) AS "SUM_OF_SALEPRICE", AVG(SALEPRICE) FROM PETSALE 
WHERE QUANTITY > 1 OR ANIMAL = 'Dog' GROUP BY SALEDATE ORDER BY  SALEDATE DESC;

--2 Aggregation: MAX(), MIN()
SELECT MAX(SALEDATE), MIN(SALEDATE) FROM PETSALE;

--3 Scaler and string function: ROUND(), LENGTH(), LCASE(), UCASE()
SELECT ROUND(SALEPRICE), LENGTH(ANIMAL) FROM PETSALE WHERE LCASE(ANIMAL) = 'cat' OR UCASE(ANIMAL)  = 'dog';

--4 Date, time functions: YEAR(), MONTH(), DAY(), DAYOFMONTH(), DAYOFWEEK()
-- DAYOFYEAR(), WEEK(), HOUR(), MINUTE(), SECOND()
--4A Extract the DAY and YEAR portion from a date
SELECT DAY(SALEDATE), YEAR(SALEDATE) FROM PETSALE;
--4B Get the number of sales during the month of May
SELECT SALEPRICE FROM PETSALE WHERE MONTH(SALEDATE) = '05';
--4C What date is it 3 days after each sale date?
SELECT (SALEDATE +3) FROM PETSALE;
--5 Special registers: CURRENT_DATE, CURRENT_TIME
--5A: How many days have passed since each SALEDATE till now?
SELECT (CURRENT_DATE - SALEDATE), CURRENT_TIME FROM PETSALE;

-- Reference from proejcts
-- select SUM(SALEPRICE) from PETSALE;
-- select SUM(SALEPRICE) AS SUM_OF_SALEPRICE from PETSALE;
-- select MAX(QUANTITY) from PETSALE;
-- select AVG(SALEPRICE) from PETSALE;
-- select AVG( SALEPRICE / QUANTITY ) from PETSALE where ANIMAL = 'Dog';
-- select ROUND(SALEPRICE) from PETSALE;
-- select LENGTH(ANIMAL) from PETSALE;
-- select UCASE(ANIMAL) from PETSALE;
-- select DISTINCT(UCASE(ANIMAL)) from PETSALE;
-- select * from PETSALE where LCASE(ANIMAL) = 'cat';
-- select DAY(SALEDATE) from PETSALE where ANIMAL = 'Cat';
-- select COUNT(*) from PETSALE where MONTH(SALEDATE)='05';
-- select (SALEDATE + 3 DAYS) from PETSALE;
-- select (CURRENT DATE - SALEDATE) from PETSALE;

