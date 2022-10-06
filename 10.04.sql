-- »ç¿ø¸í, ±Ş¿©, ¿ù±Ş(±Ş¿©/12)¸¦ Ãâ·ÂÇÏµÇ ¿ù±ŞÀº ½Ê´ÜÀ§¿¡¼­ ¹İ¿Ã¸²ÇÏ¿© Ãâ·Â
SELECT  ENAME, SAL, ROUND(SAL/12, -2) AS WOLGUP
FROM EMP;

-- »ç¿ø¸í, ±Ş¿©, ¼¼±İ(±Ş¿©ÀÇ 3.3%)¸¦ ¿ø´ÜÀ§ Àı»èÇÏ°í Ãâ·Â
SELECT  ENAME, SAL, SAL*0.033, TRUNC(SAL * 0.033,-1) AS TAX
FROM EMP;

-- smithÀÇ Á¤º¸¸¦ »ç¿ø¹øÈ£, ¼º¸í, ´ã´ç¾÷¹«(¼Ò¹®ÀÚ) Ãâ·Â
SELECT EMPNO, ENAME, LOWER(JOB) AS JOB
FROM EMP
WHERE ENAME = 'SMITH';

-- »ç¿ø¹øÈ£, »ç¿ø¸í(Ã¹±ÛÀÚ¸¸ ´ë¹®ÀÚ), ´ã´ç¾÷¹«(Ã¹±ÛÀÚ¸¸ ´ë¹®ÀÚ)·Î Ãâ·Â
SELECT EMPNO, INITCAP(ENAME)AS ENAME, INITCAP(JOB)AS JOB
FROM EMP;

-- ÀÌ¸§ÀÇ Ã¹±ÛÀÚ°¡ ¡®K¡¯º¸´Ù Å©°í ¡®Y¡¯º¸´Ù ÀÛÀº »ç¿øÀÇ Á¤º¸( »ç¿ø¹øÈ£, ÀÌ¸§, ¾÷¹«, ±Ş¿©, ºÎ¼­¹øÈ£)¸¦ Ãâ·ÂÇÏµÇ ÀÌ¸§¼øÀ¸·Î Á¤·Ä
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE SUBSTR(ENAME,1.1)>K AND SUBSTR(ENAME,1.1)<Y
ORDER BY ENAME;



-- ÀÌ¸§ÀÌ 5±ÛÀÚ ÀÌ»óÀÎ »ç¿øµéÀ» Ãâ·Â
SELECT *
FROM EMP
WHERE LENGTH (ename) >=5;



-- ÀÌ¸§À» 15ÀÚ·Î ¸ÂÃß°í ±ÛÀÚ´Â ¿ŞÂÊ¿¡ ¿À¸¥ÂÊ¿¡´Â ¡®*¡¯·Î Ã¤¿î´Ù
SELECT RPAD(ENAME, 15, '*')
FROM EMP;

-- ±Ş¿©´Â 10ÀÚ·Î ¸ÂÃß°í ¼ıÀÚ´Â ¿À¸¥ÂÊ¿¡ ¿ŞÂÊ¿£ ¡®-¡®·Î Ã¤¿î´Ù
SELECT LPAD(ENAME, 10, '*')
FROM EMP;

create table info_tab
(
    name varchar(15),
    jumin number(15)
);
drop table info_tab;

INSERT INTO info_tab ( name, jumin ) VALUES( ¸ÍÀÌ, '800101-1234567' );
INSERT INTO info_tab ( name, jumin) VALUES( Â¯ÀÌ, '900808-2222222' );
select name, jumin, substr(jumin, 8, 1) gender,
                    substr(jumin, 1, 2) birth_year
from info_tab;

select sysdate
from dual;

-- ±Ş¿©¸¦ ¼ıÀÚ¿¡¼­ ¡®¿µÀÏÀÌ»ï»ç¿ÀÀ°Ä¥ÆÈ±¸¡¯ ±ÛÀÚ·Î ´ëÃ¼
select sal, translate(sal, '0123456789', '¿µÀÏÀÌ»ï»ç¿ÀÀ°Ä¥ÆÈ±¸') kor_sal
from emp;


-- ±Ş¿©ÀÇ ¼ıÀÚ¿¡¼­ 0À» ¡®$¡¯·Î ¹Ù²Ù¾î Ãâ·Â
select sal, replace(sal, 0, '$') char_sal
from emp;

-- *****(¸ğµç °ø¹é Á¦°Å)
select replace('    ÀÌ   ¼ø   ½Å   ', ' ','') as ename
from dual;

-- ÇöÀç±îÁö ±Ù¹«ÀÏ ¼ö°¡ ¸¹Àº »ç¶÷ ¼øÀ¸·Î Ãâ·Â
select ename, hiredate,sysdate-nvl(hiredate,sysdate) ,
                        ceil(sysdate-nvl(hiredate,sysdate))
from emp
order by sysdate-hiredate desc;

select ename,hiredate
from emp
order by sysdate-hiredate desc nulls last;

-- ÇöÀç±îÁö ±Ù¹«ÀÏ ¼ö°¡ ¸î ÁÖ ¸î ÀÏÀÎ°¡¸¦ Ãâ·Â
select ename, ceil((sysdate-hiredate)/7)as week, 
ceil(sysdate-hiredate) - (ceil((sysdate-hiredate)/7)*7) as day 
from emp;

select ename, sysdate -hiredate,
        trunc((sysdate -hiredate)/7,0) as weeks,
        floor(mod(sysdate -hiredate, 7)) as days
from emp;


-- 10¹ø ºÎ¼­ÀÇ »ç¿øÀÇ ÇöÀç±îÁöÀÇ ±Ù¹« ¿ù¼ö¸¦ °è»ê 
select ename, months_between(sysdate,hiredate), 
                floor(months_between(sysdate,hiredate)) 
from emp
where deptno = '10';



-- ÇöÀç ³¯Â¥¿¡¼­ 3°³¿ù ÈÄÀÇ ³¯Â¥ ±¸ÇÏ±â

select add_months( sysdate, 3 ) as mydate from dual;


-- ÇöÀç ³¯Â¥¿¡¼­ µ¹¾Æ¿À´Â ¡®¿ù¡¯¿äÀÏÀÇ ³¯Â¥ ±¸ÇÏ±â
select next_day(sysdate,2) as mydate from dual;

-- ÇöÀç ³¯Â¥¿¡¼­ ÇØ´ç ¿ùÀÇ ¸¶Áö¸· ³¯Â¥ ±¸ÇÏ±â

select last_day( sysdate ) as last_day from dual;

-- ÀÔ»çÀÏÀÚ¿¡¼­ ÀÔ»ç³âµµ¸¦ Ãâ·Â
select ename, hiredate, to_char(hiredate,'yyyy') as hire_year
from emp;

-- ÀÔ»çÀÏÀÚ¸¦ ¡®1999³â 1¿ù 1ÀÏ¡¯ Çü½ÄÀ¸·Î Ãâ·Â
select ename, hiredate, to_char(hiredate,'yyyy"³â "mm"¿ù "dd"ÀÏ"') as hire_year
from emp;

-- 1981³âµµ¿¡ ÀÔ»çÇÑ »ç¿ø °Ë»ö
select *
from emp
where to_char(hiredate,'yyyy' )= '1981';

-- 5¿ù¿¡ ÀÔ»çÇÑ »ç¿ø °Ë»ö
select *
from emp
where to_char(hiredate,'mm' )= '05';

-- ±Ş¿© ¾Õ¿¡ $¸¦ »ğÀÔÇÏ°í 3ÀÚ¸® ¸¶´Ù ,¸¦ Ãâ·Â
select ename, sal, to_char(sal,'$999,999,999,999')as dollor
from emp;

-- 81³â 2¿ù¿¡ ÀÔ»çÇÑ »ç¿ø °Ë»ö
select *
from emp
where to_char(hiredate,'yyyymm') = '198102';

-- 81³â¿¡ ÀÔ»çÇÏÁö ¾ÊÀº »ç¿ø °Ë»ö
select *
from emp
where to_char(hiredate,'yyyy') != '1981';
-- 81³â ÇÏ¹İ±â¿¡ ÀÔ»çÇÑ »ç¿ø °Ë»ö
select *
from emp
 where to_char(hiredate,'yyyymm') >= 198107 and to_char(hiredate,'yyyymm') <= 198112;
 
 select *
from emp
 where to_char(hiredate,'yyyy') = 1981 and to_char(hiredate,'mm') >= 07;

SELECT jumin, decode( substr(jumin, 8, 1), '1', '³²ÀÚ', '3', '³²ÀÚ', '¿©ÀÚ') AS gender 
FROM info_tab;

SELECT CASE substr( jumin, 8, 1) 

        WHEN '1' THEN '³²ÀÚ'
        WHEN '3' THEN '³²ÀÚ'
        ELSE '¿©ÀÚ'
        END as gender

FROM info_tab;

-- ºÎ¼­¹øÈ£°¡ 10ÀÌ¸é ¿µ¾÷ºÎ, 20ÀÌ¸é °ü¸®ºÎ, 30ÀÌ¸é ITºÎ ±× ¿Ü´Â ±â¼úºÎ·Î Ãâ·Â
select deptno,decode(deptno, 10, '¿µ¾÷ºÎ', 20, '°ü¸®ºÎ', 30, 'itºÎ', '±â¼úºÎ') as part
from emp;

select deptno, case deptno

        when 10 then '¿µ¾÷ºÎ'
        when 20 then '°ü¸®ºÎ'
        when 30 then 'itºÎ'
        else '±â¼úºÎ'
        end as part
        
from emp;

-- ¾÷¹«(job)ÀÌ analystÀÌ¸é ±Ş¿© Áõ°¡°¡ 10%ÀÌ°í clerkÀÌ¸é 15% , 
-- managerÀÌ¸é 20%ÀÎ °æ¿ì »ç¿ø¹øÈ£, »ç¿ø¸í, ¾÷¹«, ±Ş¿©, Áõ°¡ÇÑ ±Ş¿©¸¦ Ãâ·Â

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


-- ¾÷¹«°¡ ¡®SALESMAN¡¯ÀÎ »ç¶÷µéÀÇ ¿ù±ŞÀÇ Æò±Õ, ÃÑÇÕ, ÃÖ¼Ò°ª, ÃÖ´ë°ªÀ» ±¸ÇÏ±â
select avg(sal), sum(sal), min(sal) min, max(sal) max
from emp
where job = 'SALESMAN';

insert into emp(empno, ename, job)
values(9001, 'È«±æ±¹', 'SALESMAN');
-- Ä¿¹Ì¼Ç(COMM)À» ¹Ş´Â »ç¶÷µéÀÇ ¼ö´Â

SELECT COUNT(COMM) AS "Ä¿¹Ì¼Ç"
FROM  EMP
WHERE COMM >0;

-- ºÎ¼­º°·Î ÀÎ¿ø¼ö, Æò±Õ±Ş¿©, ÃÖÀú±Ş¿©, ÃÖ°í±Ş¿©, ±Ş¿©ÀÇ ÇÕÀ» ±¸ÇÏ±â

SELECT DEPTNO, COUNT(*), AVG(SAL), MIN(SAL), MAX(SAL), SUM(SAL)
FROM    EMP
--WHERE
GROUP BY DEPTNO;
--HAVING

-- ºÎ¼­º°·Î ÀÎ¿ø¼ö, Æò±Õ±Ş¿©, ÃÖÀú±Ş¿©, ÃÖ°í±Ş¿©, ±Ş¿©ÀÇ ÇÕÀ» ±¸ÇÏ±â ( ºÎ¼­º° ±Ş¿©ÀÇ ÇÕÀÌ ³ôÀº ¼øÀ¸·Î
SELECT DEPTNO, COUNT(*),AVG(SAL) ,MIN(SAL), MAX(SAL), SUM(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY SUM(SAL) DESC;

-- ºÎ¼­º° ¾÷¹«º° ±×·ìÇÏ¿© ºÎ¼­¹øÈ£, ¾÷¹«, ÀÎ¿ø¼ö, ±Ş¿©ÀÇ Æò±Õ, ±Ş¿©ÀÇ ÇÕÀ» ±¸ÇÏ±â
SELECT DEPTNO,JOB, COUNT(*),AVG(SAL), SUM(SAL)
FROM EMP
GROUP BY DEPTNO,JOB;


-- ÃÖ´ë ±Ş¿©°¡ 2900 ÀÌ»óÀÎ ºÎ¼­¿¡ ´ëÇØ ºÎ¼­¹øÈ£, Æò±Õ ±Ş¿©, ±Ş¿©ÀÇ ÇÕÀ» Ãâ·Â
SELECT DEPTNO,ROUND(AVG(SAL),-2), SUM(SAL)
FROM EMP
HAVING MAX(SAL) >= 2900
GROUP BY DEPTNO;


-- ¾÷¹«º° ±Ş¿©ÀÇ Æò±ÕÀÌ 3000ÀÌ»óÀÎ ¾÷¹«¿¡ ´ëÇØ ¾÷¹«¸í, Æò±Õ ±Ş¿©, ±Ş¿©ÀÇ ÇÕÀ» Ãâ·Â
select job, round(avg(sal),-2), sum(sal)
from emp
having avg(sal)>=3000
group by job;
-- ÀüÃ¼ ÇÕ°è ±Ş¿©°¡ 5000¸¦ ÃÊ°úÇÏ´Â °¢ ¾÷¹«¿¡ ´ëÇØ¼­ ¾÷¹«¿Í ±Ş¿© ÇÕ°è¸¦ Ãâ·Â
--´Ü, SALESMANÀº Á¦¿ÜÇÏ°í ±Ş¿© ÇÕ°è°¡ ³ôÀº ¼øÀ¸·Î Á¤·Ä
SELECT JOB, SUM(SAL)AS SUM
FROM EMP
WHERE JOB != 'SALESMAN'
HAVING SUM(SAL)>5000
GROUP BY JOB
ORDER BY SUM DESC;

-- ¾÷¹«º° ÃÖ°í ±Ş¿©¿Í ÃÖ¼Ò ±Ş¿©ÀÇ Â÷ÀÌ¸¦ ±¸ÇÏ¶ó
SELECT JOB, MAX(SAL)-MIN(SAL)AS"Â÷ÀÌ"
FROM EMP
GROUP BY JOB;

-- ºÎ¼­ ÀÎ¿øÀÌ 4¸í º¸´Ù ¸¹Àº ºÎ¼­ÀÇ ºÎ¼­¹øÈ£, ÀÎ¿ø¼ö, ±Ş¿©ÀÇ ÇÕÀ» Ãâ·Â
SELECT DEPTNO, COUNT(*), SUM(SAL)
FROM EMP
HAVING COUNT(*) >4
GROUP BY DEPTNO;

--1. 2003³â¿¡ ÀÔ»çÇÑ »ç¿øµéÀÇ »ç¹ø, ÀÌ¸§, ÀÔ»çÀÏÀ» Ãâ·Â
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS ENAME,  HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY')=2003;

?

--2. ¾÷¹«°¡ FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP ÀÎ »ç¿øµéÀÇ Á¤º¸¸¦ Ãâ·Â
select *
FROM EMPLOYEES
where lower(job_id) ='fi_accout' or lower(job_id) = 'fi_mgr' or 
lower(job_id) = 'sa_man' or lower(job_id)= 'sa_rep';
?

?

--3. Ä¿¹Ì¼ÇÀ» ¹Ş´Â »ç¿øµéÀÇ ¸í´ÜÀ» Ãâ·Â


SELECT *
FROM employees
WHERE commission_pct is not null;
?

--4.¾÷¹«°¡ SA_MAN ¶Ç´Â SA_REPÀÌ¸é "ÆÇ¸ÅºÎ¼­"¸¦ ±× ¿Ü´Â "±× ¿Ü ºÎ¼­"¶ó°í Ãâ·Â
SELECT DECODE(JOB_ID,'SA_MAN', 'ÆÇ¸ÅºÎ¼­', 'SA_REP', 'ÆÇ¸ÅºÎ¼­', '±× ¿Ü ºÎ¼­' )AS PART
FROM EMPLOYEES;
?

?

--5. ¿¬µµº°·Î ÀÔ»çÀÚµéÀÇ ÃÖ¼Ò±Ş¿©, ÃÖ´ë ±Ş¿©, ±Ş¿©ÀÇ ÃÑÇÕ ±×¸®°í Æò±Õ ±Ş¿©¸¦ ±¸ÇÏ½Ã¿À
SELECT to_char(hire_date, 'yyyy')year,MIN(SALARY), MAX(SALARY), SUM(SALARY), AVG(SALARY)
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE 'YYYY');
?
SELECT to_char(hire_date, 'YYYY') year, min(salary) min, max(salary) max,
sum(salary) sum, avg(salary) avg
FROM employees
GROUP BY to_char(hire_date, 'YYYY');
?

--6. ºÎ¼­º° Æò±Õ ±Ş¿©°¡ $10,000 ÀÌ»óÀÎ ºÎ¼­¸¸ ±¸ÇÏ½Ã¿À. ( Æò±Õ±Ş¿©°¡ ³ôÀº ¼øÀ¸·Î )
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY),0) AS AVG
FROM EMPLOYEES
HAVING AVG(SALARY) >=10000
GROUP BY DEPARTMENT_ID
ORDER BY AVG(SALARY) DESC;
?

?

--7. ºÎ¼­º° ÃÖ´ë ±Ş¿©¸¦ ±¸ÇÏ½Ã¿À
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- Å×ÀÌºí »ı¼º

CREATE TABLE reg_tab( text varchar2(20) );

?

-- ·¹ÄÚµå ÀÔ·Â

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

INSERT INTO reg_tab VALUES('°³');

INSERT INTO reg_tab VALUES('cat');

INSERT INTO reg_tab VALUES('catty');

INSERT INTO reg_tab VALUES('9catty');

INSERT INTO reg_tab VALUES('catwoman');

INSERT INTO reg_tab VALUES('°í¾çÀÌ');

INSERT INTO reg_tab VALUES('BAT');

INSERT INTO reg_tab VALUES('BATMAN');

INSERT INTO reg_tab VALUES('BATGIRL'); 

INSERT INTO reg_tab VALUES('0BATGIRL'); 

INSERT INTO reg_tab VALUES('¹ÚÁã');

?

-- Ä¿¹Ô

COMMIT;

desc reg_tab;
select * from reg_tab;
drop table reg_tab;
-- 1.  text ÄÃ·³ÀÇ ¹®ÀÚ¿­¿¡¼­ 't'·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
select text 
from reg_tab
where text like 't%';

?

?

-- 2.  text ÄÃ·³ÀÇ ¹®ÀÚ¿­¿¡¼­ 't'·Î ³¡³ª´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
WHERE TEXT LIKE '%t';

?

-- 3. Ã¹¹øÂ° 't'·Î ½ÃÀÛÇÏ¿© 5¹øÂ° 'r'ÀÌ ÀÖ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where text like 't%%%%r';
?

-- 4. ¼ıÀÚ·Î ³¡³ª´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where REGEXP_LIKE (text , '[0~9]$');


-- 5. ¼ıÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅ¸ °Ë»ö
select *
from reg_tab
where REGEXP_LIKE (text , '^[0~9]');
?

-- 6. ¼ıÀÚ°¡ ¾Æ´Ñ ¹®ÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where not REGEXP_LIKE (text , '^[0~9]');
?

-- 7. ´ë¹®ÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where  regexp_like (text, '^[A-Z]');
?

-- 8. ¼Ò¹®ÀÚ ¿ÜÀÇ ¹®ÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where not regexp_like (text, '^[a-z]');
?

-- 9. ÇÑ±Û·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where regexp_like(text,'^[°¡-ÆR]');

-- 10. µ¥ÀÌÅÍ Áß 'gg'³ª 'GG'°¡ µé¾îÀÖ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where TEXT like '%gg%' or text like '%GG%';

