--1. Zlotkey�� ������ �μ��� ���� ��� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻʽÿ�. 
--Zlotkey�� �����Ͻʽÿ�.
select department_id from employees where department_id=80;
select last_name ,hire_date
from employees
where department_id in (select department_id from employees where department_id=80) AND LAST_NAME != 'Zlotkey';
?




--2. �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� 
 --����� �޿��� ���� ������������ �����Ͻʽÿ�.
select employee_id,last_name
from employees
where salary > (select avg(salary) from employees )
order by salary; 
?

?

--3. �̸��� u�� ���Ե� ����� ���� �μ����� ���ϴ� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ�
-- ���Ǹ� �ۼ��Ͻʽÿ�.


select department_id, first_name||' '||last_name as name
from employees
where first_name||' '||last_name in (select first_name||' '||last_name from employees where first_name||' '||last_name like '%u%' );
?where job_id in (select job_id from employees where first_name||' '||last_name like = '%u%');


--4. �μ� ��ġ ID�� 1700�� ��� ����� �̸�, �μ� ��ȣ �� ���� ID�� ǥ���Ͻʽÿ�.

select first_name||' '||last_name as name , department_id, job_id
from employees
where department_loc_id = (select department_loc_id from employees where department_loc_id = 1700);
?
SELECT e.DEPARTMENT_ID, d.LOCATION_ID FROM employees e, DEPARTMENTs d WHERE d.LOCATION_ID=1700;

SELECT e.FIRST_NAME ||' '|| LAST_NAME FULL_NAME, e.DEPARTMENT_ID, e.job_ID
FROM employees e
WHERE e.DEPARTMENT_ID in (SELECT e.DEPARTMENT_ID FROM employees e LEFT OUTER JOIN DEPARTMENTs d
ON e.department_id = d.department_id WHERE d.LOCATION_ID=1700);
--5. King���� �����ϴ� ��� ����� �̸��� �޿��� ǥ���Ͻʽÿ�.



select employee_id from employees where last_name like 'King';
select last_name, salary
from employees
where 

select first_name||' '||last_name as name , salary
?from employees;
?
SELECT employee_id FROM employees WHERE manager_id = 100;

SELECT FIRST_NAME ||' '|| LAST_NAME FULL_NAME, SALARY
FROM employees
WHERE employee_id in (SELECT employee_id FROM employees WHERE manager_id = 100);
select first_name||' '||last_naem as name, salary
from employees;
--6. Executive �μ��� ��� ����� ���� �μ� ��ȣ, �̸� �� ���� ID�� ǥ���Ͻʽÿ�.

select department_id, select first_name||' '||last_naem as name, job_id
from employees;


SELECT * FROM employees WHERE DEPARTMENT_ID=90;

SELECT DEPARTMENT_ID, FIRST_NAME ||' '|| LAST_NAME FULL_NAME, employee_id
FROM employees
WHERE employee_id in (SELECT employee_id FROM employees WHERE DEPARTMENT_ID=90);

--7. ��� �޿����� ���� �޿��� �ް� �̸��� u�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� 

-- ��� ����� ��� ��ȣ, �̸� �� �޿��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻʽÿ�.

SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME FULL_NAME, SALARY
FROM employees
WHERE DEPARTMENT_ID in(SELECT DEPARTMENT_ID FROM employees WHERE FIRST_NAME ||' '|| LAST_NAME like '%u%')
and salary>(SELECT AVG(SALARY)FROM employees);