--1. �����ȣ, �̸�, ����, �޿�,  ���� �޿��� 15% ������ �޿���(New Salary),  ������(Increase)�� ���
select empno, ename, job, sal, sal*1.15 as new_salary, sal*1.15 - sal as increase
from emp;


?

--2. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �Ŀ� ���ƿ��� �������� ���
select ename, hiredate, next_day(add_months( hiredate, 6 ),2) as monday
from emp;
?

--3.�̸�, �Ի���, �Ի��Ϸκ��� ���������  ���, �޿�, �Ի��Ϸκ��� ��������� �޿��� �Ѱ踦 ���
select ename, hiredate,(to_char(sysdate,'yyyy')-to_char(hiredate,'yyyy')) as cha, sal 
from emp;

?--sal*hire_year, sum(sal*hire_year)

--4.�̸�, ����, �Ի���, �Ի��� ������ ���
select ename, job, hiredate, to_char(hiredate,'yyyy')as hire_year 
from emp;
?

?

--5. ������, �μ��� �޿� �հ�� �ο����� ����ϵ�, 
--  10�� �μ��� �����ϰ� ������ ��SALESMAN���� ��MANAGER���� ����Ѵ�.
select deptno, job, sum(sal), count(*)
from emp
group by deptno, job;
?
SELECT DEPTNO,JOB, COUNT(*),AVG(SAL), SUM(SAL)
FROM EMP
GROUP BY DEPTNO,JOB;
?

--6. �������� ��ձ޿��� �ִ�޿��� ����ϵ�, ��ձ޿��� 2000�̻��� �͸� ����ϰ� ��ձ޿��� ���� ������ ����
select job,avg(sal), max(sal)
from emp
having avg(sal) >=2000
group by job
order by avg(sal) desc;

?

--7. ���� �Ի�⵵ ���� �ο����� ���
select count(*)
from emp
group by to_char(hiredate,'yyyy');


--8. 5���� �޿��հ�� �ο����� ��� (rownum�̿�)
select ceil(rownum/5), count(*), sum(sal)
from emp
group by ceil(rownum/5);
select ceil(rownum/5), count(*), sum(sal)
from emp
group by ceil(rownum/5);
?

--9. ������ ���� ���

  -- ( ���� ��µ� �ο����� �ٸ� ���� ���� )
select job
from emp;
?group by job;

   CLERK     SALESMAN        MANAGER                       (������)

-----------------------------------------------------------------------

     4                 4                      3                             (�ο���)

?

?

    

?

--10. ������ ���� ������, �μ��� ���

 --( ���� ���� �ݾ��� �ٸ� ���� ���� )



������                10���μ�                20���μ�                30���μ�                �޿��հ�

----------------------------------------------------------------------------------------

CLERK                   1300                    1900                           950                   4150

SALESMAN                 0                         0                         5600                    5600

PRESIDENT             5000                        0                              0                    5000

MANAGER             2450                     2975                         2850                   8275

ANALYST                    0                     6000                             0                   6000
--������̺�(emp)�� ������ �μ����̺�(dept)�� �� ����� �μ����� ���
select ename, dname
from emp, dept;

select emp.ename, dept.dname, dept.deptno
from emp, dept;
--��������
select e.ename ename, d.dname dname, d.deptno deptno
from emp e, dept d
where e.deptno=d.deptno;

select e.ename ename, d.dname dname, d.deptno deptno
from emp e inner join dept d
on e.deptno=d.deptno;

--�ܺ�����
select e.ename ename, d.dname dname, d.deptno deptno
from emp e, dept d
where e.deptno=d.deptno(+);

select e.ename ename, d.dname dname, d.deptno deptno
from emp e right outer join dept d
on e.deptno=d.deptno;

select e.ename ename, d.dname dname, d.deptno deptno
from emp e left outer join dept d
on e.deptno=d.deptno;

select e.ename ename, d.dname dname, d.deptno deptno
from emp e, dept d
where e.deptno(+)=d.deptno(+); -- �ȵ�

select e.ename ename, d.dname dname, d.deptno deptno
from emp e full outer join dept d
on e.deptno=d.deptno;

-- ��� ���̺�(emp)�� �� ����� �Ŵ����� ��ȸ
select e1.empno, e1.ename, e1.mgr, e2.empno,e2.ename
from emp e1, emp e2
where e1.mgr=e2.empno;

select e1.empno, e1.ename, e1.mgr, e2.empno,e2.ename
from emp e1 inner join emp e2
on e1.mgr=e2.empno;

-- �ܺ�����?
select e1.empno, e1.ename, e1.mgr, e2.empno,e2.ename
from emp e1, emp e2
where e1.mgr=e2.empno(+);

select e1.empno, e1.ename, e1.mgr, e2.empno,e2.ename
from emp e1 left outer join emp e2
on e1.mgr=e2.empno;

-- [����]
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
    -- smith / adams / james / miller
    minus
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
    -- clark / king / miller
 
 --1. EMP ���̺��� �����ȣ, �̸�, ����, �μ���ȣ�� DEPT ���̺��� �μ���, �ٹ����� ���
select e.empno,e.ename,e.job, e.deptno, d.dname,d.loc
from emp e left outer join dept d
on e.deptno=d.deptno;
?

?

--2. SALESMAN ����� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ���
SELECT  e.empno, e.ename,e.sal,e.job,d.dname,d.loc  
FROM emp e left outer join dept d
on e.deptno=d.depno
?having job = 'salesman';

?

--3. ���ʽ�(comm)�� �޴� ����� ���� �̸�, �μ���, ��ġ�� ���
SELECT  ename,deptno,MGR  FROM emp WHERE COMM > 0;
?

?

--4. �μ��� �μ���� �޿� �հ踦 ���
select deptno, sum(sal)
from emp
group by deptno;

?

-- 5. ������ ��MANAGER���� ����� ������ �̸�, ����, �μ���, �ٹ����� ��� 
SELECT  ename,job,deptno  FROM emp WHERE job='MANAGER';
?
