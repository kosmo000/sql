/*
    SELECT �˻��� �׸��
    FROM ���̺��
    Where ����

*/
--��� ����� ������ �޿�, �޿��� ���ʽ��� ���� �հ� ���
SELECT  ename, sal, sal+comm  As total_sal
FROM    emp;
--WHERE

SELECT ename ||' '||job As staff
FROM    emp;

SELECT distinct JOB FROM emp;

-- 1- 20�� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���ȣ ���
SELECT empno, ename, deptno
FROM emp
WHERE deptno=20;

-- 2.
SELECT empno, ename, hiredate 
FROM emp
where ('1981-01-01'<=hiredate and hiredate<='1981-06-09'); 

-- 3.
SELECT ENAME,JOB
FROM EMP
WHERE JOB = 'SALESMAN' OR JOB='CLAEK';

--4.
SELECT *
FROM EMP
WHERE (SAL >= 1500 OR JOB = 'SALESMAN') OR JOB = 'SALEMAN';

--5.
SELECT *
FROM EMP
WHERE (JOB = 'PRESIDENT' OR JOB = 'SALEMAN')AND SAL >1500;
--6.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL ;

--7.
SELECT ENAME,SAL, COMM, SAL+COMM AS TOTAL
FROM EMP;

--8. 
SELECT ENAME
FROM EMP
WHERE ENAME LIKE'A_%'; 

--9.
SElECT ENAME
FROM emp
WHERE ENAME LIKE '_L%';

--10.
SElECT ENAME
FROM emp
WHERE ENAME LIKE '%L%L%';
--11.
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;
--12.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM >= SAL*1.1;

--13.
SELECT *
FROM EMP
WHERE (JOB = 'CLERK' OR  JOB = 'ANALYST')AND SAL NOT IN (1000, 3000, 5000);


--14.
SELECT *
FROM EMP
WHERE (DEPTNO = 30  OR MGR = 7782)