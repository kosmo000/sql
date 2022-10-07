--11. scott 또는 ward와 월급이 같은 사원의 정보를 이름, 업무, 급여를 출력

?
select ename, job, sal
from emp
where sal in(select sal from emp where ename in ('SCOTT','WARD'));

--12. chicago에서 근무하는 사원과 같은 업무를 하는 사원의 이름, 업무를 출력
select ename, job
from emp 
WHERE job in ( SELECT e.job
FROM emp e inner join dept d
ON e.deptno = d.deptno
WHERE LOWER(d.loc) = 'chicago' );

?

?

--13. 부서별로 월급이 평균 월급보다 높은 사원을 부서번호, 이름, 급여를 출력
select deptno, ename, sal
from emp
where  sal > (select avg(sal) from emp )
order by deptno;

SELECT deptno, ename, sal
FROM emp e1
WHERE sal > (SELECT AVG(sal)
FROM emp e2
WHERE e1.deptno = e2.deptno)
ORDER BY deptno;

CREATE OR REPLACE VIEW v_emp  AS

           select empno, ename, deptno from emp;
           
select * from v_emp;
select * from emp;
desc v_emp;

insert into v_emp values(1000,'홍길동',20); --

insert into v_emp values(2000,'홍홍이',90); --

CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp
           with read only;
           
insert into v_emp values(2000,'홍홍이',30);

CREATE or replace VIEW v_emp_30  AS
           select empno emp_no, ename  name, sal as salary  from emp where deptno=30
           with read only;
           
select * from v_emp_30;

Create or replace view v_emp_info as
select e.empno empno, e.ename ename, d.dname dname 
from emp e, dept d
where e.deptno=d.deptno;

select * from v_emp_info;

insert into v_emp_info(empno, ename, dname) values(3333, '맹꽁이',30);
insert into v_emp_info(empno, ename) values(3333, '맹꽁이');

delete from v_emp_info where empno=7788;

-- 부서별로 부서명, 최소급여, 최대 급여, 부서의 평균 급여를 포함하는 V_DEPT_SUM 뷰를 생성하여라.
create or replace view v_dept_sum as
select d.dname dname, min(sal) minsal, max(sal) maxsal, round(avg(sal)) avgsal
from emp e, dept d
where e.deptno=d.deptno
group by dname;

select * from v_dept_sum;

insert into emp(empno, ename, sal, deptno)
values(4444,'호이', 9900,20);

CREATE  SEQUENCE   seq_temp;
select seq_temp.currval from dual;

-- 5000부터 10씩 증가하는 자동증가수 (시퀀스)

create sequence seq_tex
    start with 5000 increment by 10;
    
insert into emp(empno, ename) values(seq_tex.nextval, '박씨');

desc emp;
select empno, ename, job, rowid from emp;
commit;
1.
select ename,empno,hiredate,sal
from emp
where sal >= 2000 and sal <=3000
order by ename asc;
2.
select ename, hiredate, deptno
from emp
where comm is null
order by deptno, ename asc;


3.
select empno, ename, sal, comm
from emp
where comm in (select comm from emp where comm in (300, 500, 1400))
order by comm desc;
4.
select ename
from emp
where ename like 'S%';
5.
select ename, hiredate
from emp
where hiredate not like  '81%';
6.
select deptno 
from emp
group by deptno
order by deptno asc;
7.
select ename
from emp
where ename like '%A%' and ename like '%E%';
8.
select empno,ename, hiredate
from emp
where substr(hiredate,4,2) = '12'; 


9.
select ename, nvl(sal,0), nvl(comm,0), nvl(sal*12,0) as yearsal
from emp
order by yearsal desc;

10.
select ename, nvl2(sal,sal,0) sal, nvl2(comm,comm,0) comm, nvl2(sal*12,sal*12,0) as yearsal
from emp
order by yearsal desc;

11.
select sum(sal) as 급여총액, round(avg(sal)) as 평균액, max(sal) 최고액, min(sal) 최소액
from emp;

12.
select count(distinct job) as 직업종류의갯수
from emp;


--13.
select deptno 부서번호 ,round(avg(sal)) 평균월급
from emp
group by deptno;

14.


select count(case when job = 'CLERK' then 1 end) CLERK,
count(case when job = 'SALESMAN' then 1 end) SALESMAN,
count(case when job = 'MANAGER' then 1 end) MANAGER,
count(case when job = 'PRESIDENT' then 1 end) PRESIDENT,
count(case when job = 'ANALYST' then 1 end) ANALYST
from emp;

--15.직급별 사원의 최저 급여를 출력하시오, 관리자를 알수 없는 사원 및 최저 급여가 2000 미만인 그룹은 제외 시키고
    --결과를 급여에 대한 내림차순으로 정렬하여 출력 하세요.
select job, min(sal)
from emp
where mgr is not null
group by job
having min(sal)>2000
order by min(sal) desc;



--16. 사원번호가 7788인 사원과 담당업무가 같은 사원을 출력 하시오  <담당이름, 담당업무> 출력 하시오
select ename 사원이름, job 담당업무
from emp
where job = (select job from emp where empno = 7788);
--17.담당업무가 7499 인 사원보다 급여가 많은 사원을 출력 하시오. <사원이름, 담당업무> 출력 하시오.
select ename 사원이름, job 담당업무
from emp
where sal > (select sal from emp where empno = 7499);

--18. 각 부서의 최소 급여를 받는 사원의 이름 , 급여, 부서번호를 출력하시오.

select  ename, sal, deptno
from emp
where (deptno,sal)=any(select deptno,min(sal) from emp group by deptno);


--19. 급여가 평균 급여보다 많은 사원들의 사원보호와 이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬하시오.
select empno, ename
from emp
where sal > (select avg(sal) from emp )
order by sal;

--20. DEPT 테이블에 있는 부서명 DNAME 컬럼에서  ‘RESEARCH’ 부서의 부서번호, 사원이름 및 담당 업무를 표시하시오.
select deptno, ename, job
from emp
where deptno = (select deptno from dept where dname = 'RESEARCH');

