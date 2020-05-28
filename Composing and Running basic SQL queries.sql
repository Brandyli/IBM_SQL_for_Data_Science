-- 0. Drop table INSTRUCTOR in case it already exists
drop table INSTRUCTOR;
--1. Create table INSTRUCTOR
CREATE TABLE INSTRUCTOR
  (ins_id INTEGER PRIMARY KEY NOT NULL, 
   lastname VARCHAR(15) NOT NULL, 
   firstname VARCHAR(15) NOT NULL, 
   city VARCHAR(15), 
   country CHAR(2)
  )
;
--2A: Insert one row into the INSTRUCTOR table for the the instructor Rav Ahuja
--2B: Insert two rows at once in the INSTRUCTOR table for instructors Raul Chong and Hima Vasudevan
-- (Hint: values for the character fields require a singe quotation mark (') before and after each value)
INSERT INTO INSTRUCTOR
    (ins_id, lastname, firstname, city, country)
VALUES
    ('1','Ahuja',' Rav', 'Toronto', 'CA'),
    ('2','Chong',' Raul', 'Toronto', 'CA'),
    ('3','Vasudevan',' Hima', 'Chicago', 'US');
 -- 3: Select all rows from the INSTRUCTOR table.
 --3B: Select the firstname, lastname and country where the city is Toronto
 SELECT * FROM INSTRUCTOR;
 SELECT  firstname, lastname, country FROM INSTRUCTOR WHERE city = 'Toronto';

--4: Update the row for Rav Ahuja and change his city to Markham.
UPDATE INSTRUCTOR SET city = 'Markham' WHERE ins_id=1;

--5: Delete the row for Raul Chong from the table
--5B: Retrieve all rows in the INSTRUCTOR table
DELETE FROM  INSTRUCTOR WHERE ins_id=2;
SELECT * FROM  INSTRUCTOR;


