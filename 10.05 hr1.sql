--1. 이름의 성이 'King' 사원의 사번과 부서명을 출력 ( employees, departments )
SELECT  employee_id, department_id  
FROM employees 
WHERE last_name='King';
?

?

--2. 이름의 성이 'King' 사원의 사번과 부서명 그리고 업무명을 출력 ( employees, departments, jobs )
SELECT  last_name, employee_id, department_id, job_id  
FROM employees 
WHERE last_name='King';
?

?

--3. 2007년 상반기에 입사한 사원들의 사번과 이름, 입사일 그리고 부서명을 출력

--(*) Grant는 아직 부서가 배정받지 못한 상태이지만 Grant도 출력되려면
select first_name||' '||last_name full_name, hire_date,department_id
from employees
where to_char(hire_date, 'yyyy')='2007' and to_char(hire_date, 'yyyymm') <'200707';

?


--4. 'Executive' 부서에서 사원과 해당 사원의 매니저(상사) 이름을 출력

--(*) 매니저(상사)가 없는 사원인 'King'이 출력되려면
select e.first_name||' '||last_name full_name, e.manager_id, e2.first_name||' '||last_name full_name
from employees e, employees e2
having job_id = Executive
where e.manager_id = e2.first_name||' '||last_name full_name(+);


--아래 스키마를 보고 평점이 3.0 이상인 학생들의 이름을 보여주는 SQL작성하시오
?select c.student, c.class, c.enroll, s.student s.name
from class c inner join student s
on c.student = s.student

-- SQL-문제-2) 다음 중 아래와 같은 테이블에서 Full Outer Join의 결과를 작성하시오
select d.deptno, d.dname, e.deptno,e.dname
from dept d full outer join emp e
on d.deptno = e.deptno