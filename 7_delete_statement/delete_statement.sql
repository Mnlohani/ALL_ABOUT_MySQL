USE employees;

INSERT INTO titles(emp_no, title, from_date, to_date)
VALUES(999901, 'Senior Engineer', '1986-06-26', '9999-01-01') ;
commit;

select * from employees where emp_no = 999901;
select * from titles where emp_no= 999901;

delete from employees where emp_no = 999901;

select * from employees where emp_no = 999901;
select * from titles where emp_no= 999901;
-- its deleted from titles because on delete cascade

rollback;

# 
# delete from department_dup ; == Truncate department_dup

-- Truncate auto_increment will be reset.
-- Truncate faster > delete from table_name
-- auto_increment will not reset with delete from table_name