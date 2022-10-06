-- 1. ����� ��L���ڰ� �ִ� ����� ���� �̸�, ����, �μ���, ��ġ�� ���
select e.ename ename, e.job job, d.dname dname, d.loc loc
from emp e, dept d
where e.deptno=d.deptno and e.ename like '%L%';

select e.ename ename, e.job job, d.dname dname, d.loc loc
from emp e inner join dept d
on e.deptno=d.deptno 
where e.ename like '%L%';

--2. �����ں��� ���� �Ի��� ����� ���� �̸�, �Ի���, ������ �̸�, ������ �Ի����� ���
select e1.ename, e1.hiredate, e2.ename, e2.hiredate
from emp e1 inner join emp e2
on e1.ename = e2.ename and e1.hiredate > e2.hiredate;
?

?

--3. �Ʒ��� ����� ��� ( �����ڰ� ���� KING�� �����Ͽ� ��� ����� ��� )
select e1.empno, e1.ename , e1.mgr , e2.ename 
from emp e1 , emp e2
where e1.mgr = e2.empno(+);

select e1.empno, e1.ename , e1.mgr , e2.ename 
from emp e1 left outer join emp e2
on e1.mgr = e2.empno;
?
select round(avg(sal)) from emp;

select ename, sal from emp 
where sal < (select round(avg(sal)) from emp );

-- ������ ���� ���� ����� ���� ��ȸ
select round(max(sal)) from emp;

select ename, sal from emp
where sal = (select round(max(sal)) from emp);

-- ��� �޿����� ���� �ִ� �޿����� ���� ������ �޴� ����� ������ ��ȸ

select ename, sal from emp
where sal> (select round(avg(sal)) from emp ) and sal < (select round(max(sal)) from emp);

select e.*
from emp e,
    (select round(avg(sal)) avg, max(sal) max from emp) ext
where e.sal > ext.avg and e.sal < ext.max;
-- ���޼����� ���� 10���� ����� ���
select ename, sal 
from emp
where rownum < 11
order by sal desc;

select e.*
from (select ename, sal from emp order by sal desc) e
where rownum < 11;

--1. SCOTT�� �޿����� ���� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
select empno,ename,job,sal 
from emp
where sal > (select sal from emp where ename = 'SCOTT');

?
select empno,ename,job,sal 
from emp 
where sal > 3000;


--2. 30�� �μ��� �ּ� �޿����� ���μ��� �ּ� �޿��� ���� �μ��� ���
select  deptno,  min(sal)
from emp
group by deptno
having min(sal) > (select min(sal) from emp where deptno=30);
?
?

--3. �������� ��� �޿� �߿��� ���� ���� �޿��� ���� ������ ���
select job, avg(sal)
from emp
group by job
having avg(sal) = (select min(avg(sal)) from emp group by job);
?

?

--4. �����ȣ�� 7521�� ������ ���� ��� 7934�� �������� �޿��� ���� �޴� ����� ������ ���
select *
from emp
where job = (select job from emp where empno = 7521 );
?

?

--5. 'WARD'�� �μ��� ������ ���� ��� ��� ���

-- �������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
select min(sal) from emp group by job;

select empno, ename, job, sal
from emp
where (job,sal) in (select job, min(sal) from emp group by job);

insert inTo emp(empno, ename, job, sal) values(9999, '�׽�Ʈ', 'CLERK',1250);

-- 10�� �μ� ������� ������ ������ ������ �˻�
select job from emp where deptno = 10;
select ename, job
from emp
where job in (select job from emp where deptno = 10);

-- ��� �Ѹ��� ������κ��� ���� ���� �� �ִ� ����� ������ �����ȣ, �̸�, ������ ���
select empno, ename, job
from emp e1
where exists (select * from emp e2 where e1.empno=e2.mgr);

--ford / blake/ king / jones/ scott / clack

-- ����� ���
select empno, ename, job
from emp e1
where not exists (select * from emp e2 where e1.empno=e2.mgr);

create table stat_salary ( 

stat_date date not null, -- ��¥
dept_no number, -- �μ�
emp_count number, -- �����
tot_salary number, -- �޿��Ѿ�
avg_salary number ); -- �޿����

desc stat_salary;

select sysdate, deptno from emp group by deptno;

insert into stat_salary(stat_date, dept_no) 
select sysdate, deptno from emp group by deptno;

select * from stat_salary;


select count(*), sum(sal), round(avg(sal)), from emp group by deptno;
select count(*), sum(sal), round(avg(sal)) from emp group by deptno;

update stat_salary ss
set (emp_count, tot_salary, avg_salary)
    = (select count(*), sum(sal), round(avg(sal)) 
    from emp e
    where ss.dept_no = e.deptno
    group by deptno);
    
create table emp_cp as select * from emp;
select * from emp_cp;

-- �μ����� 'sales'�� ����� ���� ���� ( emp_cp)
delete from emp_cp where deptno = (select deptno from DEPT where dname = 'SALES');