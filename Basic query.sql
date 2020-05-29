### general syntax

create table TABLENAME (
    COLUMN1 datatype,
    COLUMN2 datatype,
    COLUMN3 datatype,
        ...
    ) ;
    
    
### let's create a table called COUNTRY with an ID column, 
a two letter country code column, and a variable length country name column

create table COUNTRY (
    ID int NOT NULL,
    CCODE char(2),
    NAME varchar(60),
    PRIMARY KEY (ID)
    );
    
  
  
drop table COUNTRY;
create table COUNTRY (
    ID integer PRIMARY KEY NOT NULL,
    CCODE char(2),
    NAME varchar(60)
    );
    
The general syntax of SELECT statments is:
select COLUMN1, COLUMN2, ... from TABLE1 ;
select * from COUNTRY where ID < 5 ;
select * from COUNTRY where CCODE = 'CA'; 
