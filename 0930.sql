-- 8000�� ��� <�����̸�>�� �޿� 10000 �� �����ϼ���
INSERT INTO emp(empno, ename, sal )
VALUES (8000, '�����', 10000);

SELECT * FROM emp;

-- 7788�� ������� <�����̸�>�� �޿� 10000 �� �����ϼ���
UPDATE emp(empno, ename, sal )
VALUES (7788, '�����', 10000);

INSERT INTO emp(empno, ename, sal , deptno )
VALUES (8001, '�����', 10000 , 20);

-- (#) �ٸ� Ű�� �������� �ʴ� ���� �Է��߱⿡
INSERT INTO emp(empno, ename, sal , deptno )
VALUES (8002, '�����', 10000 , 50);
--------------------------------------
INSERT INTO info_tab(tel, name, jumin,gender, age, home)
VALUES('032','ȫ��','801212','����',33,'����');

ALTER INTO info_tab
VALUES('032','ȫ��','801212','����',33,'����');

SELECT * FROM info_tab;

INSERT INTO info_tab(tel, name) VALUES('1001', 'ȫ�浿'); 
INSERT INTO info_tab(tel, name) VALUES('1002', '��浿');
INSERT INTO info_tab(tel, name) VALUES('1002', '�Ѹ�');
INSERT INTO info_tab(name, jumin) VALUES('��浿', '901010-1234567');
INSERT INTO info_tab(Gender, AGE) VALUES('����', 22);
INSERT INTO info_tab(tel,Gender, AGE) VALUES(9999,'����', 22);

ALTER TABLE info_tab
ADD CONSTRAINT pk_info_tel PRIMARY KEY (tel);

DELETE FROM info_tab;
commit;

DROP TABLE info_tab;

CREATE TABLE info_tab
(    
    name  varchar2(10),
    jumin   char(15),
    tel     varchar2(20),
    gender  varchar2(10),
    age     number(3),
    home    varchar2(20),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel)
);
ALTER TABLE info_tab
    MODIFY (name varchar2(10) not null);
    
ALTER TABLE info_tab
    ADD CONSTRAINT uq_info_jumin UNIQUE (jumin);
    
 SELECT * FROM info_tab;   
INSERT INTO info_tab(tel, name, jumin) VALUES('2001','ȫ����','990101');
INSERT INTO info_tab(tel, name, jumin) VALUES('2002','ȫ����','990101');
INSERT INTO info_tab(tel, name) VALUES('2003','ȫȫ��'); --?

ALTER TABLE info_tab
    ADD CONSTRAINT ck_into_gender CHECK (gender in ('����','����'));

INSERT INTO info_tab(tel, name, gender) VALUES('10001','ȫ����','����');
INSERT INTO info_tab(tel, name, gender) VALUES('20001','ȫ����','����');
INSERT INTO info_tab(tel, name, gender) VALUES('30001','ȫ����','����');

ALTER TABLE info_tab
    MODIFY ( gender varchar2(6) default '����');
    
INSERT INTO info_tab(tel, name) VALUES('7777','ȫ��');

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('������', '02-777-4444', '990909-1234567');

?

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('������','03-555-5555', '880808-1234567', '����', 27,'���');

?

INSERT INTO info_tab( name, tel, jumin, gender, age, home )

VALUES('ȫ�浿','03-031-0310', '900909-1234567', '����', 27,'���');

?

INSERT INTO info_tab( name, jumin) VALUES('ȫ����', '550505-1234567');

?

INSERT INTO info_tab( tel, jumin ) VALUES('031-777-7777', '700707-1234567');

INSERT INTO info_tab( name, tel, jumin ) VALUES('������', '031-000-0000', '700707-1234567');




CREATE TABLE info_tab
(    
    name  varchar2(10),
    jumin   char(15),
    tel     varchar2(20),
    gender  varchar2(10) default '����',
    age     number(3),
    home    varchar2(20),
    deptno  number(2),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel),
    CONSTRAINT uq_info_jumin UNIQUE (jumin),
    CONSTRAINT ck_info_gender CHECK (gender in ('����','����')),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno)
);
 DROP TABLE info_tab;
 SELECT * FROM info_tab;  

INSERT INTO info_tab(tel, name, deptno) VALUES('7777','����',20);
INSERT INTO info_tab(tel, name, deptno) VALUES('8888','����',22);
INSERT INTO info_tab(tel, name) VALUES('9999','¯��');

//1.
CREATE TABLE sawon_tab
(
    sabun   number(6),
    sawon_name    varchar2(15),
    ubmu    varchar2(30),
    weolgub number(8,2),
    buseo   number(3)
);
 SELECT * FROM sawon_tab;  
 DROP TABLE sawon_tab;
//2.
CREATE TABLE sawon_tab
(
    sabun   number(6),
    sawon_name    char(15),
    ubmu    char(30),
    weolgub number(8,2),
    buseo   number(3),
    CONSTRAINT pk_info_sabun PRIMARY KEY (sabun)
);
//3. 
CREATE TABLE sawon_tab
(
    sabun   number(6),
    sawon_name    char(15),
    ubmu    varchar2(30),
    weolgub number(8,2),
    buseo   number(3),
    jiyeok  char(20) not null,
    CONSTRAINT pk_info_sabun PRIMARY KEY (sabun)
);
//4.
CREATE TABLE sawon_tab
(
    sabun   number(6),
    sawon_name    char(15),
    ubmu    varchar2(30),
    weolgub number(8,2),
    buseo   number(3),
    jiyeok  char(20) not null,
    CONSTRAINT pk_info_sabun PRIMARY KEY (sabun)
    
);
ALTER TABLE sawon_tab MODIFY ( weolgub number(7) );
DESC sawon_tab;

//5. 
