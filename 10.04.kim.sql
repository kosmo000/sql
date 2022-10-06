CREATE TABLE dept AS SELECT * FROM scott.dept;

desc dept;

select * from dept;


ALTER  TABLE   dept
ADD  CONSTRAINT  pk_dept_deptno  PRIMARY  KEY ( deptno );

create table student
(
    no  char(4),
    name  varchar(30) not null,
    gender varchar(10),
    addr varchar(30),
    jumin char(30) not null,
    deptno number(2),
    CONSTRAINT fk_dept_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno)

);

select * from student;

--2.
alter table student
add constraint pk_student_no primary key (no);

--3.

ALTER  TABLE   student
modify jumin null;

--4.

alter table student
modify jumin default'����';

--5.

alter table student
modify( check (gender in ('����','����')));

alter table student
add CONSTRAINT ck_student_gender CHECK ( gender IN (��������,��������) );

INSERT INTO student(no, name, gender, addr, jumin ) 

VALUES('1111', '������', '����', '����� ������', '801212-1234567' );


INSERT INTO student(no, name, jumin ) 

VALUES('2222', '������', '881212-1234567');


INSERT INTO student(no, name, jumin ) 

VALUES('1111', '������', '881212-1234567');


INSERT INTO student(no, name, gender, jumin ) 

VALUES('3333', '������', '����', '830303-1234567');


INSERT INTO student(no, name, addr, jumin ) 

VALUES('4444', '�����', '����� ���ʱ�', '990909-1234567');


INSERT INTO student(no, name, addr, deptno ) 

VALUES('8888', ���̺���', '����� �Ѱ�', 50);

select * from student;
--6.

create table library
(
rent_id number(2),
book_id varchar(10) not null,
hakbun char(4),
CONSTRAINT pk_library_rent_id PRIMARY Key (rent_id),
CONSTRAINT fk_library_no FOREIGN KEY (hakbun) REFERENCES student (no)
);

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 1, 'bk001', '1111' );


INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 2, 'bk002', '2222' );


INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 3, 'bk003', '3333' );


INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 4, 'bk004', '4444' );


INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 5, 'bk005', '5555' );

select * from library;

drop table dept;
drop table student;
drop table library;

CREATE TABLE DEPT(

DEPTID NUMBER(5),

DEPTNAME VARCHAR(50),

CONSTRAINT PK_DEPT_DEPTID PRIMARY KEY(DEPTID)

);

?

CREATE TABLE EMP(

EMPID NUMBER(5) 

, NAME VARCHAR2(20) 

, RESID CHAR(14) 

, GENDER VARCHAR2(10) 

, AGE NUMBER(5) 

, DEPTID NUMBER(5) NOT NULL

, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)

, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)

, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('����', '����'))

, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) REFERENCES DEPT(DEPTID)

);

-- INSERT (TABLE: DEPT)

INSERT INTO DEPT(DEPTID, DEPTNAME)

VALUES (10001, 'IT��');

INSERT INTO DEPT(DEPTID, DEPTNAME)

VALUES (10002, '������');

INSERT INTO DEPT(DEPTID, DEPTNAME)

VALUES (10003, '��������');

select * from dept;

-- INSERT (TABLE: EMP)

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30001, '�ְ���', '881012-1187527', '����', 32, 10001);

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30002, '��ȿ��', '850712-1000007', '����', 35, 10002);

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30003, '������', '881112-1187527', '����', 32, 10003);

DELETE FROM DEPT WHERE DEPTID  = 10003;

DROP TABLE EMP;

DROP TABLE DEPT;

CREATE TABLE DEPT(

DEPTID NUMBER(5)

, DEPTNAME VARCHAR(50)

, CONSTRAINT PK_DEPT_DEPTID PRIMARY KEY(DEPTID)

);

CREATE TABLE EMP(

EMPID NUMBER(5) 

, NAME VARCHAR2(20) 

, RESID CHAR(14) 

, GENDER VARCHAR2(10) 

, AGE NUMBER(5) 

, DEPTID NUMBER(5) NOT NULL

, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)

, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)

, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('����', '����'))

, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 

REFERENCES DEPT(DEPTID) ON DELETE CASCADE

);

-- INSERT (TABLE: DEPT)

INSERT INTO DEPT(DEPTID, DEPTNAME)

VALUES (10001, 'IT��');

INSERT INTO DEPT(DEPTID, DEPTNAME)

VALUES (10002, '������');

INSERT INTO DEPT(DEPTID, DEPTNAME)

VALUES (10003, '��������');

?

-- INSERT (TABLE: EMP)

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)

VALUES (30001, '�ְ���', '881012-1187527', '����', 32, 10001);

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)

VALUES (30002, '��ȿ��', '850712-1000007', '����', 35, 10002);

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)

VALUES (30003, '������', '881112-1187527', '����', 32, 10003);

select * from dept;

select * from emp;

DELETE FROM DEPT WHERE DEPTID IN = 10003;

DROP TABLE EMP;

DROP TABLE DEPT;

CREATE TABLE DEPT(

DEPTID NUMBER(5)

, DEPTNAME VARCHAR(50)

, CONSTRAINT PK_DEPT_DEPTID PRIMARY KEY(DEPTID)

);
?
CREATE TABLE EMP(

EMPID NUMBER(5) 

, NAME VARCHAR2(20) 

, RESID CHAR(14) 

, GENDER VARCHAR2(10) 

, AGE NUMBER(5) 

, DEPTID NUMBER(5) 

, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)

, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)

, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('����', '����'))

, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 

REFERENCES DEPT(DEPTID) ON DELETE SET NULL

);

-- INSERT (TABLE: DEPT)

INSERT INTO DEPT(DEPTID, DEPTNAME)

VALUES (10001, 'IT��');

INSERT INTO DEPT(DEPTID, DEPTNAME)

VALUES (10002, '������');

INSERT INTO DEPT(DEPTID, DEPTNAME)

VALUES (10003, '��������');

?

-- INSERT (TABLE: EMP)

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)

VALUES (30001, '�ְ���', '881012-1187527', '����', 32, 10001);

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)

VALUES (30002, '��ȿ��', '850712-1000007', '����', 35, 10002);

INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)

VALUES (30003, '������', '881112-1187527', '����', 32, 10003);

SELECT * FROM DEPT;

SELECT * FROM EMP;

DELETE FROM DEPT WHERE DEPTID = 10003;

?