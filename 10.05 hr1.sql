--1. �̸��� ���� 'King' ����� ����� �μ����� ��� ( employees, departments )
SELECT  employee_id, department_id  
FROM employees 
WHERE last_name='King';
?

?

--2. �̸��� ���� 'King' ����� ����� �μ��� �׸��� �������� ��� ( employees, departments, jobs )
SELECT  last_name, employee_id, department_id, job_id  
FROM employees 
WHERE last_name='King';
?

?

--3. 2007�� ��ݱ⿡ �Ի��� ������� ����� �̸�, �Ի��� �׸��� �μ����� ���

--(*) Grant�� ���� �μ��� �������� ���� ���������� Grant�� ��µǷ���
select first_name||' '||last_name full_name, hire_date,department_id
from employees
where to_char(hire_date, 'yyyy')='2007' and to_char(hire_date, 'yyyymm') <'200707';

?


--4. 'Executive' �μ����� ����� �ش� ����� �Ŵ���(���) �̸��� ���

--(*) �Ŵ���(���)�� ���� ����� 'King'�� ��µǷ���
select e.first_name||' '||last_name full_name, e.manager_id, e2.first_name||' '||last_name full_name
from employees e, employees e2
having job_id = Executive
where e.manager_id = e2.first_name||' '||last_name full_name(+);


--�Ʒ� ��Ű���� ���� ������ 3.0 �̻��� �л����� �̸��� �����ִ� SQL�ۼ��Ͻÿ�
?select c.student, c.class, c.enroll, s.student s.name
from class c inner join student s
on c.student = s.student

-- SQL-����-2) ���� �� �Ʒ��� ���� ���̺��� Full Outer Join�� ����� �ۼ��Ͻÿ�
select d.deptno, d.dname, e.deptno,e.dname
from dept d full outer join emp e
on d.deptno = e.deptno