insert into employees
Values(
999901,
'1986-04-21',
'John',
'Smith',
'M',
'2011-01-01');

select * from employees where emp_no ='999901';

UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1991-10-31',
    gender = 'F'
WHERE
    emp_no = '999901';
    
# if we use a non-existing emp_no, the below will run without any error but no effect

UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1991-10-31',
    gender = 'F'
WHERE
    emp_no = '999911';
    
## ****If no where clause is provided , all rows wil be updated.


# Change the “Business Analysis” department name to “Data Analysis”.
UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_name = 'Business Analysis';
