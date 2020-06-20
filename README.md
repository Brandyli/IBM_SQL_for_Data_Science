WHAT YOU WILL LEARN 
* Create and access a database instance on cloud  
* Write basic SQL statements: CREATE, DROP, SELECT, INSERT, UPDATE, DELETE  
* Filter, sort, group results, use built-in functions, access multiple tables  
* Access databases from Jupyter using Python and work with real world datasets
### Access DB2 on Cloud using Python
This notebook illustrates how to access your database instance using Python by following the steps below:

1. Import the ibm_db Python library
1. Identify and enter the database connection credentials
1. Create the database connection
1. Create a table
1. Insert data into the table
1. Query data from the table
1. Retrieve the result set into a pandas dataframe
1. Close the database connection
### Analyze Socioeconomic Dataset of Chicago with SQL and Python.ipynb
In this project, we analyze Chicago Socioeconomic Dataset in an IBM Db2 database on IBM Cloud instance.

### SQL

#### 1. How many rows are in the dataset?
```
# Pandas Query
len(chicago_socioeconomic_data)

# SQL Query
%sql select count(*) from chicago_socioeconomic_data;
```
#### 2. How many community areas in Chicago have a hardship index greater than 50.0?
```
%sql select count(community_area_name) from chicago_socioeconomic_data where hardship_index > 50.0
```
#### 3. What is the maxium hardship index?
```
%sql select max(hardship_index) from chicago_socioeconomic_data;
```
#### 4. Which community area which has the highest hardship index?
```
%sql select community_area_name from chicago_socioeconomic_data where hardship_index in ( select max(hardship_index) from chicago_socioeconomic_data )
```
#### 5. What are the communities whose have more than 60000 per capita income?
```
%sql select community_area_name from chicago_socioeconomic_data where per_capita_income_ > 60000;
```
## Python

#### 6. Create a scatter plot using the variables per_capita_income_ and hardship_index. Explain the correlation between the two variables.

```
# Method 1
plot = sns.swarmplot(x = "per_capita_income_", y = "hardship_index", data = chicago_socioeconomic_data)
plt.title('Income vs Hardship')
plt.show()
```
![image](https://user-images.githubusercontent.com/46945617/85189603-719d9e80-b27e-11ea-8ae9-c62cb83de356.png)
```
# Method 2 Advanced - combined with bar chart and scatter plot
income_vs_hardship = %sql select per_capita_income_, hardship_index from chicago_socioeconomic_data;
plot = sns.jointplot(x = "per_capita_income_", y = "hardship_index", data = income_vs_hardship.DataFrame())
```
![image](https://user-images.githubusercontent.com/46945617/85189605-73fff880-b27e-11ea-8cc7-dd73b710ff33.png)


### Final Project - Analysis of Three Chicago Datasets in Socioeconomic Indicators,Public Schools and Crime.

#### 1. Find the total number of crimes recorded in the CRIME table

```
# Rows in Crime table
%sql select count(*) from crime
```
#### 2. Retrieve first 10 rows from the CRIME table
```
%sql select * from crime limit 10
```
#### 3. How many crimes involve an arrest?
```
%sql select count(*) from crime where arrest = 'TRUE'
```
#### 4. Which unique types of crimes have been recorded at GAS STATION locations?
```
%sql select distinct(primary_type) from crime where location_description = 'GAS STATION'
```
#### 5. In the CENNUS_DATA table list all Community Areas whose names start with the letter ‘B’.
```
%sql select community_area_name from census_data where community_area_name like 'B%'
```
#### 6. Which schools in Community Areas 10 to 15 are healthy school certified?
```
%sql select name_of_school from chicago_public_schools \
where community_area_number between 10 and 15 and \
healthy_school_certified = 'Yes'
```
#### 7. What is the average school Safety Score?
```
%sql select avg(safety_score) from chicago_public_schools
```
#### 8. List the top 5 Community Areas by average College Enrollment [number of students]
```
%sql select avg(safety_score) from chicago_public_schools
```
#### 9. Use a sub-query to determine which Community Area has the least value for school Safety Score?
```
%sql select community_area_name,community_area_number, name_of_school, safety_score from chicago_public_schools\
where safety_score = (select min(safety_score) from chicago_public_schools)
```
#### 10. [Without using an explicit JOIN operator] Find the Per Capita Income of the Community Area which has a school Safety Score of 1
```
%sql select community_area_name,community_area_number, name_of_school, safety_score from chicago_public_schools\
where safety_score = (select min(safety_score) from chicago_public_schools)
```
