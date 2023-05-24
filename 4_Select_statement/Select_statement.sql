use employees;

# Retrieve a list with all female employees whose first name is either Kellie or Aruna.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
# In works faster than OR
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
	AND first_name IN ('Kellie' , 'Aruna');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
## Pattern matching
# Retrieve a list with all employees who have been hired in the year 2000.

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '2000%';
    
# Retrieve a list with all employees whose employee number is written with not starts with “1000”. 
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT LIKE '1000_';
    
# BETWEEN-AND (inclusive) NOT BETWEEN

# Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
# Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;

   

SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';

# IS NULL and IS NOT NULL
# Select the names of all departments whose department number value is not null.
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;

## Other comparison operators - exercise

# Retrieve a list with data about all female employees who were hired in the year 2000 or after
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01'
        AND gender = 'F';

# DISTINCT 
SELECT DISTINCT
    hire_date
FROM
    employees;
    
## Aggregate functions
# count()
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
# Aggregate functions ignore NULL values unless told not to
# How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;
    
## ORDER BY ASC/DESC
SELECT 
    *
FROM
    employees
ORDER BY first_name ASC , last_name DESC;
# Select all data from the “employees” table, ordering it by “hire date” in descending order.
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

#GROUP BY
# below 2 are similar
SELECT 
    first_name
FROM
    employees
GROUP BY first_name;
SELECT DISTINCT
    first_name
FROM
    employees; -- faster
    
# always use the the field yoou have group by statement
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

# HAVING
# Where vs Having:  Having can be used in subsets of aggregate function but where not.
SELECT 
    *
FROM
    employees
HAVING first_name LIKE 'Zito';

# Select all employees whose average salary is higher than $120,000 per annum.
# below are different
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no;

# aggregated and non-aggregated condition cant come together in Having clause
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name;
# but the below is incorrect
/*
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees   
GROUP BY first_name
HAVING COUNT(first_name) < 200 and  hire_date > '1999-01-01'
ORDER BY first_name;
*/

# LIMIT
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name
LIMIT 10;