-- 구조잡기

/*
    이름          name        varchar2(10)
    주민번호      jumin         char(15)
    전화번호      tel           varchar2(20)
    성별          gender      varchar(10)
    나이          age         number(3)
    출신지        home         varchar2(20)

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
-- 테이블 구조확인
DESC info_tab;

-- 데이타 확인
SELECT * FROM info_tab;

/* 테이블명 : student_score

학번      id          char(4)
학생명     name        varchar2(20)
국어      kor         number(3)
영어      eng         number(3)
총점      total       number
평균      avg         number(3,2)     -- 앞자리는 전체자리수
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

-- 수학 칼럼을 추가
-- ALTER TABLE table_name ADD ([ column_name data_type])

ALTER TABLE student_score
ADD (math number(3));

DESC student_score;

-- 총점 칼럼을 삭제하기
ALTER TABLE student_score[delete total];
-- 평균 컬럼에서 소수점 1자리로 변경
ALTER TABLE student_score MODIFY (  avg number(4,1) );
DESC student_score;

-- 데이터 입력
--  문자 : ' '
INSERT INTO student_score ( id, name, kor, eng)
VALUES ('0001', '홍길동', 50, 80);

SELECT * FROM student_score;

-- 2000번 학번의 홍길자의 국어와 영어점수를 각가 60, 90으로 저장(입력)

INSERT INTO student_score ( id, name, kor, eng)
VALUES ('2000', '홍길자', 60, 90);

SELECT * FROM student_score;

commit;
rollback;

-- 1000번 학생 홍길숙 정보를 저장
INSERT INTO student_score (id, name, kor, eng)
VALUES ('1000', '홍길숙', 80, 75);
-- 이름이 홍길숙인 학생의 레코드를 삭제
DELETE FROM student_score WHERE name = '홍길숙';
SELECT * FROM student_score;

-- 0001번 학생의 국어점수를 100으로 수정하기
UPDATE student_score 
SET kor = 100 
WHERE id = '0001';

SELECT * FROM student_score;

commit;