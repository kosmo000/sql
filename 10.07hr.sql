
select index_name, index_type
from user_indexes
where table_name='EMPLOYEES';

create index idx_emp_salary on employees (salary);

SELECT employee_id, first_name, last_name, phone_number FROM employees 
WHERE salary=3000;

SELECT employee_id, first_name, last_name, phone_number FROM employees 
WHERE employee_id=8000;