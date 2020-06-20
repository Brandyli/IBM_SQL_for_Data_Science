WHAT YOU WILL LEARN 
* Create and access a database instance on cloud  
* Write basic SQL statements: CREATE, DROP, SELECT, INSERT, UPDATE, DELETE  
* Filter, sort, group results, use built-in functions, access multiple tables  
* Access databases from Jupyter using Python and work with real world datasets

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