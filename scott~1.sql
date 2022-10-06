//1.
CREATE TABLE sawon_tab
(
    sabun   number(6),
    sawon_name    char(15),
    ubmu    char(30),
    weolgub number(8,2),
    buseo   number(3)
);
 SELECT * FROM sawon_tab;  
 DROP TABLE sawon_tab;
//2.
alter table sawon
add constraint pk_info_sabun primary key(sabun);

//3. 
CREATE TABLE sawon_tab
(
    sabun   number(6),
    sawon_name    char(15),
    ubmu    char(30),
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
    ubmu    char(30),
    weolgub number(8,2),
    buseo   number(3),
    jiyeok  char(20) not null,
    CONSTRAINT pk_info_sabun PRIMARY KEY (sabun)
   
);
ALTER TABLE sawon_tab MODIFY ( weolgub number(7) );
DESC sawon_tab;

//5. 
CREATE TABLE sawon_tab
(
    sabun   number(6),
    sawon_name    char(15),
    ubmu    char(30),
    weolgub number(8,2),
    buseo   number(3),
    jiyeok  char(20) not null,
    CONSTRAINT pk_info_sabun PRIMARY KEY (sabun),
    CONSTRAINT ck_info_ubmu CHECK (ubmu in ('개발','유지','보수'))
   
);
ALTER TABLE sawon_tab MODIFY ( weolgub number(7) );
 SELECT * FROM sawon_tab;  
 DROP TABLE sawon_tab;
 
 //6.
 CREATE TABLE sawon_tab
(
    sabun   number(6),
    sawon_name    varchar2(15),
    ubmu    char(30) default '개발',
    weolgub number(8,2),
    buseo   number(3),
    jiyeok  varchar2(20) not null,
    CONSTRAINT pk_info_sabun PRIMARY KEY (sabun),
    CONSTRAINT ck_info_ubmu CHECK (ubmu in ('개발','유지','보수'))
   
);
ALTER TABLE sawon_tab MODIFY ( weolgub number(7) );

//7. 
CREATE TABLE buseo_tab
(
    buseo_no number(3),
    buseo_name char(30)
);

//8.
CREATE TABLE sawon_tab
(
    sabun   number(6),
    sawon_name    varchar2(15),
    ubmu    char(30) default '개발',
    weolgub number(8,2),
    buseo   number(3),
    jiyeok  varchar2(20) not null,
    CONSTRAINT pk_info_sabun PRIMARY KEY (sabun),
    CONSTRAINT ck_info_ubmu CHECK (ubmu in ('개발','유지','보수')),
    CONSTRAINT fk_info_buoseo FOREIGN KEY (buseo_no) REFERENCES buseo(buoso_no)
    
);
ALTER TABLE sawon_tab MODIFY ( weolgub number(7) );

CREATE TABLE buseo_tab
(
    buseo_no number(3),
    buseo_name varchar2(30)
);
DROP TABLE buseo_tab;

DESC buseo_tab;
//9.
insert into buseo(buseo-no, buseo_name) values(101, '소프트웨어유지보수부');

INSERT INTO buseo_tab(buseo-no, buseo_name)
values(202, '관리부');
INSERT INTO buseo_tab(buseo-no, buseo_name)
values(303, '인적관리부');

insert into sawon_tab(sabun, sawon_name, ubmu, weolgub. buseo, jiyeok)
values(홍길동이군,null,10000,101,부산);
