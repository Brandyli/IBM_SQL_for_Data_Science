--Query 1: Retrieve all employees whose address is in Elgin,IL
--[Hint: Use the LIKE operator to find similar strings]
SELECT F_NAME, L_NAME FROM EMPLOYEES WHERE ADDRESS = '%Elgin,IL%';

--Query 2: Retrieve all employees who were born during the 1970's.
--[Hint: Use the LIKE operator to find similar strings]
SELECT F_NAME, L_NAME FROM EMPLOYEES WHERE B_DATE  LIKE '197%';

--Query 3: Retrieve all employees in department 5 whose salary is between
--60000 and 70000 .
--[Hint: Use the keyword BETWEEN for this query ]
SELECT F_NAME, L_NAME FROM EMPLOYEES 
WHERE DEP_ID = 5 AND SALARY BETWEEN 60000 and 70000;

--Query 4A: Retrieve a list of employees ordered by department ID.
--[Hint: Use the ORDER BY clause for this query]
SELECT F_NAME, L_NAME FROM EMPLOYEES ORDER BY DEP_ID;

--Query 4B: Retrieve a list of employees ordered in descending order by
--department ID and within each department ordered alphabetically in
--descending order by last name.
SELECT F_NAME, L_NAME, DEP_ID FROM EMPLOYEES ORDER BY DEP_ID DESC, L_NAME DESC;

--Query 5A: For each department ID retrieve the number of employees in the
--department.
--[Hint: Use COUNT(*) to retrieve the total count of a column, and then GROUP BY]
--Course: Databases and SQL for Data Science - LAB: String Patterns, Sorting and Grouping
SELECT COUNT(*), DEP_ID  FROM EMPLOYEES GROUP BY DEP_ID;

--Query 5B: For each department retrieve the number of employees in the
--department, and the average employees salary in the department.
--[Hint: Use COUNT(*) to retrieve the total count of a column, and AVG() function to
--compute average salaries, and then group]
--Query 5C: Label the computed columns in the result set of Query 5B as
--“NUM_EMPLOYEES” and “AVG_SALARY”.
--[Hint: Use AS “LABEL_NAME” after the column name]
--Query 5D: In Query 5C order the result set by Average Salary.
--[Hint: Use ORDER BY after the GROUP BY]
--Query 5E: In Query 5D limit the result to departments with fewer than 4
--employees.
--[Hint: Use HAVING after the GROUP BY, and use the count() function in the
--HAVING clause instead of the column label.
--Note: WHERE clause is used for filtering the entire result set whereas the HAVING
--clause is used for filtering the result of the grouping]
SELECT COUNT(*) AS  "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY" FROM EMPLOYEES 
 GROUP BY DEP_ID  HAVING COUNT(*) < 4 ORDER BY AVG_SALARY;
