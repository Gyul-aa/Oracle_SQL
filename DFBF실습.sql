select * from tab;
create table student(
    sid     number(4),
    sname   varchar2(10), 
    sgrade  number(1),
    sscore  varchar2(10)
);

alter table student add constraint sid_pk primary key(sid);
alter table student add constraint sgrade_chk check(sgrade between 1 and 3);
alter table student add constraint sscore_chk check(sscore in('a','b','c','f'));

insert into student values(1,'김종혁',3,'f');
insert into student values(2,'박재훈',3,'c');
insert into student values(3,'김규래',3,'b');
insert into student values(4,'이필석',3,'a');

select * from student;
select * from user_constraints where table_name = 'STUDENT';

commit;

-------------------------------------------------------------------------------

-- 문제 1. --

create table member2(
    member_id varchar2(10) constraint mem2_member_id_pk primary key,
    name varchar2(20) constraint mem2_name_nn not null,
    age number(3) constraint mem2_age_nn not null,
    address varchar2(60)
);

-- 문제 2. --
create table order2(
    order_id varchar2(10) constraint ord2_order_id_pk primary key,
    member_id varchar2(10) constraint ord2_member_id_fk references member2 (member_id),
    order_date date constraint ord2_order_date_nn not null,
    amount number(8,2) constraint ord2_amount_nn not null
);

-- 문제 3. --
create sequence member2_seq increment by 1 start with 1 maxvalue 9999;
create sequence order2_seq increment by 1 start with 1 maxvalue 9999;

-- 문제 4. --
insert into member2 values(MEMBER2_SEQ.nextval,'John Doe',30,'1234 Elm Street');
insert into member2 values(MEMBER2_SEQ.nextval,'Jane Smith',25,'5678 Oak Street');
insert into member2 values(MEMBER2_SEQ.nextval,'Alice Brown',40,'9101 Maple Avenue');

-- 문제 5. --
insert into order2 values(ORDER2_SEQ.nextval,'1','2023-08-01',150.00);
insert into order2 values(ORDER2_SEQ.nextval,'2','2023-08-05',200.50);
insert into order2 values(ORDER2_SEQ.nextval,'1','2023-08-10',75.25);
select * from order2;
-- 문제 6. --
select member2.name , member2.address from member2 where member2.age >= 30;

-- 문제 7. --
select order2.order_date as 주문날짜 , order2.order_id as 주문번호 , amount as 주문금액
from order2 where order2.amount >= 100;

-- 문제 8. --
select
    member2.name , order2.order_id , amount
from
    member2, order2
where
    member2.member_id = order2.member_id
order by
    member2.name;

-- 문제 9. --
select order_id, order_date , amount  from order2 where order2.order_date >= '2023-08-01';

-- 문제 10. --
select member2.name as 이름 , sum(amount)as 총주문금액 from member2 , order2 where member2.member_id = order2.member_id 
group by member2.name
order by sum(amount) desc;

