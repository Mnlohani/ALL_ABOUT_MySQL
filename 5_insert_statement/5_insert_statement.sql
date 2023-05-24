# Insert 

# note: The below sql commands will give constraints error, but they are correct. 
# Select ten records from the “titles” table to get a better idea about its content.
# Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
#At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.

SELECT 
    *
FROM
    titles
LIMIT 10;

INSERT INTO titles (emp_no, title, from_date)
VALUES(999903,
'Senior Engineer',
'1997-10-01');

# insert information about the individual with employee number 999903 
#into the “dept_emp” table. He/She is working for department number 5, 
# and has started work on  October 1st, 1997; 
# her/his contract is for an indefinite period of time.
SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;

insert into dept_emp(emp_no,
dept_no,
from_date,to_date
)
values
(
999903,'d005', '1997-10-01', '9999-01-01'
);

# 
create table department_dup
(
dept_no char(4) not null,
dept_name varchar(40) not null
);

Insert into department_dup
(
dept_no,
dept_name
)
select * from departments;

