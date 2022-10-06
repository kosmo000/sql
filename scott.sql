-- �������

/*
    �̸�          name        varchar2(10)
    �ֹι�ȣ      jumin         char(15)
    ��ȭ��ȣ      tel           varchar2(20)
    ����          gender      varchar(10)
    ����          age         number(3)
    �����        home         varchar2(20)

*/
--CREATE TABLE table_name ([colummn_name data_type]);

CREATE TABLE info_tab
(    name  varchar(10),
    jumin   char(15),
    tel     varchar2(20),
    gender  varchar2(10),
    age     number(3),
    home    varchar2(20)
);

DROP TABLE student_score;

DESC student_score;
-- ���̺� ����Ȯ��
DESC info_tab;

-- ����Ÿ Ȯ��
SELECT * FROM info_tab;

/* ���̺�� : student_score

�й�      id          char(4)
�л���     name        varchar2(20)
����      kor         number(3)
����      eng         number(3)
����      total       number
���      avg         number(3,2)     -- ���ڸ��� ��ü�ڸ���
*/

CREATE TABLE student_score
(
    id  char(4),
    name varchar2(20),
    kor number(3),
    eng number(3),
    total number,
    avg  number(3,2)
);
DESC student_score;

SELECT * FROM student_score;

CREATE TABLE info_tab
(    name varchar(10),
    jumin   char(15),
    tel     varchar2(20),
    gender  varchar2(10),
    age     number(3),
    home    varchar2(20)
);

-- ���� Į���� �߰�
-- ALTER TABLE table_name ADD ([ column_name data_type])

ALTER TABLE student_score
ADD (math number(3));

DESC student_score;

-- ���� Į���� �����ϱ�
ALTER TABLE student_score[delete total];
-- ��� �÷����� �Ҽ��� 1�ڸ��� ����
ALTER TABLE student_score MODIFY (  avg number(4,1) );
DESC student_score;

-- ������ �Է�
--  ���� : ' '
INSERT INTO student_score ( id, name, kor, eng)
VALUES ('0001', 'ȫ�浿', 50, 80);

SELECT * FROM student_score;

-- 2000�� �й��� ȫ������ ����� ���������� ���� 60, 90���� ����(�Է�)

INSERT INTO student_score ( id, name, kor, eng)
VALUES ('2000', 'ȫ����', 60, 90);

SELECT * FROM student_score;

commit;
rollback;

-- 1000�� �л� ȫ��� ������ ����
INSERT INTO student_score (id, name, kor, eng)
VALUES ('1000', 'ȫ���', 80, 75);
-- �̸��� ȫ����� �л��� ���ڵ带 ����
DELETE FROM student_score WHERE name = 'ȫ���';
SELECT * FROM student_score;

-- 0001�� �л��� ���������� 100���� �����ϱ�
UPDATE student_score 
SET kor = 100 
WHERE id = '0001';

SELECT * FROM student_score;

commit;