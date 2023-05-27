use employees;
SELECT 
    COUNT(from_date)
FROM
    salaries;

SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;

SELECT 
    COUNT(*)
FROM
    salaries; -- null values included
-- count() sum() max() min() avg()

# ROUND()
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;
    
# null and coalase


# some boiler plate
select * from department_dup;

alter Table department_dup
change column dept_name dept_name varchar(40) NULL;

Insert into department_dup(dept_no) 
Values ('d10'), 
('d11');

select * from department_dup;

Alter table employees.department_dup
add column dept_manager varchar(255) null after dept_name;

select * from department_dup;
commit;
## ends


SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department_name is not provided') AS department_name
FROM
    department_dup;

# The COALESCE function returns the first non-NULL value from a series of 
# expressions. The expressions are evaluated in the order in which they 
# are specified, and the result of the function is the first value that 
# is not null. The result of the COALESCE function returns NULL 
# only if all the arguments are null.
select dept_no, dept_name, 
coalesce(dept_manager, dept_name, 'NA') as dept_manager
from department_dup
order by dept_no asc;

# to show a hypothetical column
select dept_no,
coalesce('department manager name') as fake_col
from department_dup;

#another use case
select ifnull(dept_no, 'N/A') as dept_no ,
 ifnull(dept_name,'Department name not provided'),
 COALESCE(dept_no, dept_name) AS dept_info
 from department_dup;