-- �����, �޿�, ����(�޿�/12)�� ����ϵ� ������ �ʴ������� �ݿø��Ͽ� ���
SELECT  ENAME, SAL, ROUND(SAL/12, -2) AS WOLGUP
FROM EMP;

-- �����, �޿�, ����(�޿��� 3.3%)�� ������ �����ϰ� ���
SELECT  ENAME, SAL, SAL*0.033, TRUNC(SAL * 0.033,-1) AS TAX
FROM EMP;

-- smith�� ������ �����ȣ, ����, ������(�ҹ���) ���
SELECT EMPNO, ENAME, LOWER(JOB) AS JOB
FROM EMP
WHERE ENAME = 'SMITH';

-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ� �빮��)�� ���
SELECT EMPNO, INITCAP(ENAME)AS ENAME, INITCAP(JOB)AS JOB
FROM EMP;

-- �̸��� ù���ڰ� ��K������ ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SUBSTR(ENAME,1.1)>K AND SUBSTR(ENAME,1.1)<Y
ORDER BY ENAME;



-- �̸��� 5���� �̻��� ������� ���
SELECT *
FROM EMP
WHERE LENGTH (ename) >=5;



-- �̸��� 15�ڷ� ���߰� ���ڴ� ���ʿ� �����ʿ��� ��*���� ä���
SELECT RPAD(ENAME, 15, '*')
FROM EMP;

-- �޿��� 10�ڷ� ���߰� ���ڴ� �����ʿ� ���ʿ� ��-���� ä���
SELECT LPAD(ENAME, 10, '*')
FROM EMP;

create table info_tab
(
    name varchar(15),
    jumin number(15)
);
drop table info_tab;

INSERT INTO info_tab ( name, jumin ) VALUES( ����, '800101-1234567' );
INSERT INTO info_tab ( name, jumin) VALUES( ¯��, '900808-2222222' );
select name, jumin, substr(jumin, 8, 1) gender,
                    substr(jumin, 1, 2) birth_year
from info_tab;

select sysdate
from dual;

-- �޿��� ���ڿ��� �������̻�����ĥ�ȱ��� ���ڷ� ��ü
select sal, translate(sal, '0123456789', '�����̻�����ĥ�ȱ�') kor_sal
from emp;


-- �޿��� ���ڿ��� 0�� ��$���� �ٲپ� ���
select sal, replace(sal, 0, '$') char_sal
from emp;

-- *****(��� ���� ����)
select replace('    ��   ��   ��   ', ' ','') as ename
from dual;

-- ������� �ٹ��� ���� ���� ��� ������ ���
select ename, hiredate,sysdate-nvl(hiredate,sysdate) ,
                        ceil(sysdate-nvl(hiredate,sysdate))
from emp
order by sysdate-hiredate desc;

select ename,hiredate
from emp
order by sysdate-hiredate desc nulls last;

-- ������� �ٹ��� ���� �� �� �� ���ΰ��� ���
select ename, ceil((sysdate-hiredate)/7)as week, 
ceil(sysdate-hiredate) - (ceil((sysdate-hiredate)/7)*7) as day 
from emp;

select ename, sysdate -hiredate,
        trunc((sysdate -hiredate)/7,0) as weeks,
        floor(mod(sysdate -hiredate, 7)) as days
from emp;


-- 10�� �μ��� ����� ��������� �ٹ� ������ ��� 
select ename, months_between(sysdate,hiredate), 
                floor(months_between(sysdate,hiredate)) 
from emp
where deptno = '10';



-- ���� ��¥���� 3���� ���� ��¥ ���ϱ�

select add_months( sysdate, 3 ) as mydate from dual;


-- ���� ��¥���� ���ƿ��� ������������ ��¥ ���ϱ�
select next_day(sysdate,2) as mydate from dual;

-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�

select last_day( sysdate ) as last_day from dual;

-- �Ի����ڿ��� �Ի�⵵�� ���
select ename, hiredate, to_char(hiredate,'yyyy') as hire_year
from emp;

-- �Ի����ڸ� ��1999�� 1�� 1�ϡ� �������� ���
select ename, hiredate, to_char(hiredate,'yyyy"�� "mm"�� "dd"��"') as hire_year
from emp;

-- 1981�⵵�� �Ի��� ��� �˻�
select *
from emp
where to_char(hiredate,'yyyy' )= '1981';

-- 5���� �Ի��� ��� �˻�
select *
from emp
where to_char(hiredate,'mm' )= '05';

-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���
select ename, sal, to_char(sal,'$999,999,999,999')as dollor
from emp;

-- 81�� 2���� �Ի��� ��� �˻�
select *
from emp
where to_char(hiredate,'yyyymm') = '198102';

-- 81�⿡ �Ի����� ���� ��� �˻�
select *
from emp
where to_char(hiredate,'yyyy') != '1981';
-- 81�� �Ϲݱ⿡ �Ի��� ��� �˻�
select *
from emp
 where to_char(hiredate,'yyyymm') >= 198107 and to_char(hiredate,'yyyymm') <= 198112;
 
 select *
from emp
 where to_char(hiredate,'yyyy') = 1981 and to_char(hiredate,'mm') >= 07;

SELECT jumin, decode( substr(jumin, 8, 1), '1', '����', '3', '����', '����') AS gender 
FROM info_tab;

SELECT CASE substr( jumin, 8, 1) 

        WHEN '1' THEN '����'
        WHEN '3' THEN '����'
        ELSE '����'
        END as gender

FROM info_tab;

-- �μ���ȣ�� 10�̸� ������, 20�̸� ������, 30�̸� IT�� �� �ܴ� ����η� ���
select deptno,decode(deptno, 10, '������', 20, '������', 30, 'it��', '�����') as part
from emp;

select deptno, case deptno

        when 10 then '������'
        when 20 then '������'
        when 30 then 'it��'
        else '�����'
        end as part
        
from emp;

-- ����(job)�� analyst�̸� �޿� ������ 10%�̰� clerk�̸� 15% , 
-- manager�̸� 20%�� ��� �����ȣ, �����, ����, �޿�, ������ �޿��� ���

select empno, ename, job, sal, 
decode(job, 'amalyst', sal*1.1, 'clerk', sal*1.15, 'manager', sal*1.2)as change
from emp;

select empno, ename, job, sal, case job

    when 'analyst' then sal*1.1
    when 'clerk'   then sal*1.15
    when 'manager' then sal*1.2
    else sal
    end as change
from emp;

select all job from emp;

select distinct job from emp;

select empno, ename, job from emp;

desc emp;
select rownum, empno, ename, job from emp;

select rownum, empno, ename, job from emp where rownum<=5;


-- ������ ��SALESMAN���� ������� ������ ���, ����, �ּҰ�, �ִ밪�� ���ϱ�
select avg(sal), sum(sal), min(sal) min, max(sal) max
from emp
where job = 'SALESMAN';

insert into emp(empno, ename, job)
values(9001, 'ȫ�汹', 'SALESMAN');
-- Ŀ�̼�(COMM)�� �޴� ������� ����

SELECT COUNT(COMM) AS "Ŀ�̼�"
FROM  EMP
WHERE COMM >0;

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�

SELECT DEPTNO, COUNT(*), AVG(SAL), MIN(SAL), MAX(SAL), SUM(SAL)
FROM    EMP
--WHERE
GROUP BY DEPTNO;
--HAVING

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ� ( �μ��� �޿��� ���� ���� ������
SELECT DEPTNO, COUNT(*),AVG(SAL) ,MIN(SAL), MAX(SAL), SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY SUM(SAL) DESC;

-- �μ��� ������ �׷��Ͽ� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���ϱ�
SELECT DEPTNO,JOB, COUNT(*),AVG(SAL), SUM(SAL)
FROM EMP
GROUP BY DEPTNO,JOB;


-- �ִ� �޿��� 2900 �̻��� �μ��� ���� �μ���ȣ, ��� �޿�, �޿��� ���� ���
SELECT DEPTNO,ROUND(AVG(SAL),-2), SUM(SAL)
FROM EMP
HAVING MAX(SAL) >= 2900
GROUP BY DEPTNO;


-- ������ �޿��� ����� 3000�̻��� ������ ���� ������, ��� �޿�, �޿��� ���� ���
select job, round(avg(sal),-2), sum(sal)
from emp
having avg(sal)>=3000
group by job;
-- ��ü �հ� �޿��� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿� �հ踦 ���
--��, SALESMAN�� �����ϰ� �޿� �հ谡 ���� ������ ����
SELECT JOB, SUM(SAL)AS SUM
FROM EMP
WHERE JOB != 'SALESMAN'
HAVING SUM(SAL)>5000
GROUP BY JOB
ORDER BY SUM DESC;

-- ������ �ְ� �޿��� �ּ� �޿��� ���̸� ���϶�
SELECT JOB, MAX(SAL)-MIN(SAL)AS"����"
FROM EMP
GROUP BY JOB;

-- �μ� �ο��� 4�� ���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���
SELECT DEPTNO, COUNT(*), SUM(SAL)
FROM EMP
HAVING COUNT(*) >4
GROUP BY DEPTNO;

--1. 2003�⿡ �Ի��� ������� ���, �̸�, �Ի����� ���
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS ENAME,  HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY')=2003;

?

--2. ������ FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP �� ������� ������ ���
select *
FROM EMPLOYEES
where lower(job_id) ='fi_accout' or lower(job_id) = 'fi_mgr' or 
lower(job_id) = 'sa_man' or lower(job_id)= 'sa_rep';
?

?

--3. Ŀ�̼��� �޴� ������� ����� ���


SELECT *
FROM employees
WHERE commission_pct is not null;
?

--4.������ SA_MAN �Ǵ� SA_REP�̸� "�Ǹźμ�"�� �� �ܴ� "�� �� �μ�"��� ���
SELECT DECODE(JOB_ID,'SA_MAN', '�Ǹźμ�', 'SA_REP', '�Ǹźμ�', '�� �� �μ�' )AS PART
FROM EMPLOYEES;
?

?

--5. �������� �Ի��ڵ��� �ּұ޿�, �ִ� �޿�, �޿��� ���� �׸��� ��� �޿��� ���Ͻÿ�
SELECT to_char(hire_date, 'yyyy')year,MIN(SALARY), MAX(SALARY), SUM(SALARY), AVG(SALARY)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE 'YYYY');
?
SELECT to_char(hire_date, 'YYYY') year, min(salary) min, max(salary) max,
sum(salary) sum, avg(salary) avg
FROM employees
GROUP BY to_char(hire_date, 'YYYY');
?

--6. �μ��� ��� �޿��� $10,000 �̻��� �μ��� ���Ͻÿ�. ( ��ձ޿��� ���� ������ )
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY),0) AS AVG
FROM EMPLOYEES
HAVING AVG(SALARY) >=10000
GROUP BY DEPARTMENT_ID
ORDER BY AVG(SALARY) DESC;
?

?

--7. �μ��� �ִ� �޿��� ���Ͻÿ�
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- ���̺� ����

CREATE TABLE reg_tab( text varchar2(20) );

?

-- ���ڵ� �Է�

INSERT INTO reg_tab VALUES('TIGER');

INSERT INTO reg_tab VALUES('TIGGER');

INSERT INTO reg_tab VALUES('elephant');

INSERT INTO reg_tab VALUES('tiger');

INSERT INTO reg_tab VALUES('tiger2');

INSERT INTO reg_tab VALUES('tiger3');

INSERT INTO reg_tab VALUES('doggy');

INSERT INTO reg_tab VALUES('5doggy');

INSERT INTO reg_tab VALUES('DOG');

INSERT INTO reg_tab VALUES('DOG2');

INSERT INTO reg_tab VALUES('��');

INSERT INTO reg_tab VALUES('cat');

INSERT INTO reg_tab VALUES('catty');

INSERT INTO reg_tab VALUES('9catty');

INSERT INTO reg_tab VALUES('catwoman');

INSERT INTO reg_tab VALUES('�����');

INSERT INTO reg_tab VALUES('BAT');

INSERT INTO reg_tab VALUES('BATMAN');

INSERT INTO reg_tab VALUES('BATGIRL'); 

INSERT INTO reg_tab VALUES('0BATGIRL'); 

INSERT INTO reg_tab VALUES('����');

?

-- Ŀ��

COMMIT;

desc reg_tab;
select * from reg_tab;
drop table reg_tab;
-- 1.  text �÷��� ���ڿ����� 't'�� �����ϴ� ������ �˻�
select text 
from reg_tab
where text like 't%';

?

?

-- 2.  text �÷��� ���ڿ����� 't'�� ������ ������ �˻�
select *
from reg_tab
WHERE TEXT LIKE '%t';

?

-- 3. ù��° 't'�� �����Ͽ� 5��° 'r'�� �ִ� ������ �˻�
select *
from reg_tab
where text like 't%%%%r';
?

-- 4. ���ڷ� ������ ������ �˻�
select *
from reg_tab
where REGEXP_LIKE (text , '[0~9]$');


-- 5. ���ڷ� �����ϴ� ����Ÿ �˻�
select *
from reg_tab
where REGEXP_LIKE (text , '^[0~9]');
?

-- 6. ���ڰ� �ƴ� ���ڷ� �����ϴ� ������ �˻�
select *
from reg_tab
where not REGEXP_LIKE (text , '^[0~9]');
?

-- 7. �빮�ڷ� �����ϴ� ������ �˻�
select *
from reg_tab
where  regexp_like (text, '^[A-Z]');
?

-- 8. �ҹ��� ���� ���ڷ� �����ϴ� ������ �˻�
select *
from reg_tab
where not regexp_like (text, '^[a-z]');
?

-- 9. �ѱ۷� �����ϴ� ������ �˻�
select *
from reg_tab
where regexp_like(text,'^[��-�R]');

-- 10. ������ �� 'gg'�� 'GG'�� ����ִ� ������ �˻�
select *
from reg_tab
where TEXT like '%gg%' or text like '%GG%';

