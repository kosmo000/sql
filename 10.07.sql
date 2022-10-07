--11. scott �Ǵ� ward�� ������ ���� ����� ������ �̸�, ����, �޿��� ���

?
select ename, job, sal
from emp
where sal in(select sal from emp where ename in ('SCOTT','WARD'));

--12. chicago���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�, ������ ���
select ename, job
from emp 
WHERE job in ( SELECT e.job
FROM emp e inner join dept d
ON e.deptno = d.deptno
WHERE LOWER(d.loc) = 'chicago' );

?

?

--13. �μ����� ������ ��� ���޺��� ���� ����� �μ���ȣ, �̸�, �޿��� ���
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

insert into v_emp values(1000,'ȫ�浿',20); --

insert into v_emp values(2000,'ȫȫ��',90); --

CREATE OR REPLACE VIEW v_emp  AS
           select empno, ename, deptno from emp
           with read only;
           
insert into v_emp values(2000,'ȫȫ��',30);

CREATE or replace VIEW v_emp_30  AS
           select empno emp_no, ename  name, sal as salary  from emp where deptno=30
           with read only;
           
select * from v_emp_30;

Create or replace view v_emp_info as
select e.empno empno, e.ename ename, d.dname dname 
from emp e, dept d
where e.deptno=d.deptno;

select * from v_emp_info;

insert into v_emp_info(empno, ename, dname) values(3333, '�Ͳ���',30);
insert into v_emp_info(empno, ename) values(3333, '�Ͳ���');

delete from v_emp_info where empno=7788;

-- �μ����� �μ���, �ּұ޿�, �ִ� �޿�, �μ��� ��� �޿��� �����ϴ� V_DEPT_SUM �並 �����Ͽ���.
create or replace view v_dept_sum as
select d.dname dname, min(sal) minsal, max(sal) maxsal, round(avg(sal)) avgsal
from emp e, dept d
where e.deptno=d.deptno
group by dname;

select * from v_dept_sum;

insert into emp(empno, ename, sal, deptno)
values(4444,'ȣ��', 9900,20);

CREATE  SEQUENCE   seq_temp;
select seq_temp.currval from dual;

-- 5000���� 10�� �����ϴ� �ڵ������� (������)

create sequence seq_tex
    start with 5000 increment by 10;
    
insert into emp(empno, ename) values(seq_tex.nextval, '�ھ�');

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
select sum(sal) as �޿��Ѿ�, round(avg(sal)) as ��վ�, max(sal) �ְ��, min(sal) �ּҾ�
from emp;

12.
select count(distinct job) as ���������ǰ���
from emp;


--13.
select deptno �μ���ȣ ,round(avg(sal)) ��տ���
from emp
group by deptno;

14.


select count(case when job = 'CLERK' then 1 end) CLERK,
count(case when job = 'SALESMAN' then 1 end) SALESMAN,
count(case when job = 'MANAGER' then 1 end) MANAGER,
count(case when job = 'PRESIDENT' then 1 end) PRESIDENT,
count(case when job = 'ANALYST' then 1 end) ANALYST
from emp;

--15.���޺� ����� ���� �޿��� ����Ͻÿ�, �����ڸ� �˼� ���� ��� �� ���� �޿��� 2000 �̸��� �׷��� ���� ��Ű��
    --����� �޿��� ���� ������������ �����Ͽ� ��� �ϼ���.
select job, min(sal)
from emp
where mgr is not null
group by job
having min(sal)>2000
order by min(sal) desc;



--16. �����ȣ�� 7788�� ����� �������� ���� ����� ��� �Ͻÿ�  <����̸�, ������> ��� �Ͻÿ�
select ename ����̸�, job ������
from emp
where job = (select job from emp where empno = 7788);
--17.�������� 7499 �� ������� �޿��� ���� ����� ��� �Ͻÿ�. <����̸�, ������> ��� �Ͻÿ�.
select ename ����̸�, job ������
from emp
where sal > (select sal from emp where empno = 7499);

--18. �� �μ��� �ּ� �޿��� �޴� ����� �̸� , �޿�, �μ���ȣ�� ����Ͻÿ�.

select  ename, sal, deptno
from emp
where (deptno,sal)=any(select deptno,min(sal) from emp group by deptno);


--19. �޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���ؼ� ������������ �����Ͻÿ�.
select empno, ename
from emp
where sal > (select avg(sal) from emp )
order by sal;

--20. DEPT ���̺� �ִ� �μ��� DNAME �÷�����  ��RESEARCH�� �μ��� �μ���ȣ, ����̸� �� ��� ������ ǥ���Ͻÿ�.
select deptno, ename, job
from emp
where deptno = (select deptno from dept where dname = 'RESEARCH');

