--Sub-queries, Multiple Tables

--1 Sub-queries
--1A Retrieve the list of employees who earn more than the average salary
--1B Sub-queires in FROM clause
SELECT * FROM (
SELECT EMP_ID, F_NAME, L_NAME, DEP_ID FROM employees) AS EMP4ALL;
--1C Sub-queries in list of columns
SELECT EMP_ID, SALARY FROM employees 
WHERE SALARY IN (SELECT AVG(SALARY) FROM employees );

-- 2A Accessing Multiple Tables with Sub-queries
SELECT * FROM employees WHERE DEP_ID IN 
(SELECT DEP_ID FROM departments WHERE LOC_ID = 'L0002');

-- 2B To retrieve the department ID and name for employees who earn more than $70,000
SELECT DEP_ID FROM employees WHERE SALARY IN 
(SELECT SALARY FROM EMPLOYEES WHERE SALARY > 70000);

-- 2C Accesing multiple tables with implicit join
SELECT E.EMP_ID, D.DEP_NAME 
FROM employees E, departments D 
WHERE E.DEP_ID=D.DEPT_ID_DEP;
