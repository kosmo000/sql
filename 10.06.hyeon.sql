-- ȸ�� ���̺�

create table ex_member(

id varchar2(10), -- ���̵�
pass varchar2(10), -- �н�����
name varchar2(20), -- �̸�
tel varchar2(20), -- ��ȭ��ȣ
addr varchar2(100) -- �ּ�

);
alter table ex_member
add CONSTRAINT pk_ex_meber_id primary key(id);

ALTER  TABLE   ex_number
ADD  CONSTRAINT  fk_name  FOREIGN  KEY ( column_name )
REFERENCES  ref_table_name ( ref_column_name );
?

-- ��ǰ ���̺�

create table ex_good(
gno varchar2(10), -- ��ǰ��ȣ
gname varchar(30), -- ��ǰ��
gdetail varchar2(300), -- �󼼼���
price number); -- ����

alter table ex_good
add CONSTRAINT pk_ex_good_gno primary key(gno);
?
ALTER  TABLE   ex_good
ADD  CONSTRAINT  fk_i_gno  FOREIGN  KEY ( gno )
REFERENCES  ex_order( gno );
-- �ֹ� ���̺�

create table ex_order (

ono number, -- ��ȣ
orderno varchar2(20), -- �ֹ���ȣ
gno varchar2(10), -- ��ǰ��ȣ
id varchar2(10), -- ȸ�� ���̵�
count number, -- ����
status varchar2(10) -- ��ۻ���

);
alter table ex_order
add CONSTRAINT pk_ex_order_ono primary key(ono);

ALTER  TABLE   ex_good
ADD  CONSTRAINT  fk_ex_good_gno  FOREIGN  KEY ( gno )
REFERENCES  ref_ex_order_gno ( gno );

-- �ֹ����̺�� ȸ�����̺�, ��ǰ���̺��� ���踦 �δ´ٸ�?



-- ȸ�� ���̺� ����Ÿ �Է�

insert into ex_member(id, pass, name, tel, addr )

values('kim', '1111', '��浿', '02-222-2222','���� ������ �̻۵�');

?

insert into ex_member(id, pass, name, tel, addr )

values('park', '1111', '�ڱ浿', '03-333-3333','��õ ������ �̻۵�');

?

insert into ex_member(id, pass, name, tel, addr )

values('meng', '1111', '�ͱ浿', '04-444-4444','��� ������ �̻۵�');

?

commit;

?

-- ���� ���̺� ����Ÿ �Է�

insert into ex_good( gno, gname, gdetail, price )

values('1001', '�Ӹ���', '���� ��� �Ӹ���', 200 );

?

?

insert into ex_good( gno, gname, gdetail, price )

values('2002', '������-A', '������� ������ �޸��� ������', 10000 );

?

insert into ex_good( gno, gname, gdetail, price )

values('2010', '������-B', '���� ������� ������ �����ϰ� �޸��ٴ� ������', 20000 );

?

insert into ex_good( gno, gname, gdetail, price )

values('3333', '�ڵ������̽�', '�ΰ� �����ϴ� �ڵ��� ���̽�', 1500 );

?

commit;

?

?

?

-- �ֹ� ���̺� ����Ÿ �˻�

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 1, '20161212', '1001', 'park', 1, '��ۿϷ�');

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 2, '20161212', '2010', 'park', 1, '�����');

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 3, '20161111', '1001', 'kim', 2, '�ֹ�');

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 4, '20161111', '3333', 'kim', 3, '�ֹ�');

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 5, '20163333', '1001', 'park', 3, '�ֹ�');

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 6, '20163333', '2010', 'park', 1, '�����');

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 7, '20163333', '2002', 'park', 2, '�ֹ�');

?

insert into ex_order( ono, orderno, gno, id, count, status )

values( 8, '20165050', '1001', 'meng', 1, '�����');

?

commit;

--1. ������� ��ǰ�� ���� ������ ���
select *
from ex_order
where status = '�����';

SELECT o.orderno, g.gno, g.gname, g.gdetail, g.price
FROM ex_good g, ( SELECT gno, status FROM ex_order WHERE status = '�����' ) 
WHERE g.gno = o.gno;



--2. �ֹ� ���� ��ǰ ������ �� ���� ���
select  orderno, gno, id
from ex_order
where status = '�ֹ�';

SELECT o.ono ��ȣ, o.gno ��ǰ��ȣ , m.id ȸ�����̵�, m.name �̸�, g.gname
FROM ex_member m, ex_order o, ex_good g
WHERE (o.id =m.id and status='�ֹ�') and (o.gno=g.gno);

--3. �ֹ����� �� ����(���̵�)�� �ֹ��� ��ǰ�� �ѱݾ��� ���
select e1.gno, e1count(*), e2.sum(price)
from ex_order e1 full outer join ex_good e2
on e1.gmo = e2.gmo
group by gno;

SELECT o.id, sum(g.price * o.count) total
FROM ex_member m, ex_good g, ex_order o
WHERE o.id = m.id AND g.gno = o.gno
GROUP BY o.id, o.orderno;