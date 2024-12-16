-- 직원 테이블 생성 --
create table emp(
    u_id    varchar(8)
        constraint emp_u_id_pk primary key,
    name    varchar(20)
        constraint emp_name_nn NOT NULL,
    password   varchar(20)
        constraint emp_password_nn NOT NULL,
    position    varchar(4)
        constraint emp_position_nn NOT NULL,
    workplace    varchar(20)
        constraint emp_workplace_nn NOT NULL,
    address    varchar(50),
    birth    date,
    regday    date,
    wedday    date
);

-- 급여 테이블 생성 --
create table sal(
    u_id    varchar(8)
        constraint sal_u_id_pk primary key,
    salary    number(10)
        constraint sal_salary_nn NOT NULL,
    from_date    date,
    to_date    date
);

-- 회원 테이블 생성 --
create table member(
    id    varchar(12)
        constraint member_id_pk primary key,
    password   varchar(12)
        constraint member_password_nn NOT NULL,
    name    varchar(20)
        constraint member_name_nn NOT NULL,
    address    varchar(100),
    tel    varchar(20)
        constraint member_tel_nn NOT NULL,
    reg_date    date
);

-- 도서 테이블 생성 --
create table book(
    bookid    number(10)
        constraint book_bookid_pk primary key,
    bookkind   varchar(3)
        constraint book_bookkind_nn NOT NULL,
    booktitle  varchar(50)
        constraint book_booktitle_nn NOT NULL,
    bookprice  number(10)
        constraint book_bookprice_nn NOT NULL,
    bookcount  number(5)
        constraint book_bookcount_nn NOT NULL,
    author     varchar(20),
    pubcom     varchar(20),
    pubdate    date
);

-- 직원 테이블 더미 데이터 추가 --
insert into emp values('a0000','ezenkim','ezenkim00','1000','seoul','guri','00/01/01','24/08/08','');
insert into emp values('a0001','ezenlee','ezenkim01','2000','busan','seomyoen','01/02/02','24/04/04','23/03/11');
insert into emp values('a0002','ezenpark','ezenkim02','3000','zeju','zeju','02/03/03','24/03/02','');
select * from emp; -- 조회

-- 급여 테이블 더미 데이터 추가 --
insert into sal values('a0000',300,'24/08/08','');
insert into sal values('a0001',500,'24/04/04','');
insert into sal values('a0002',400,'24/03/02','');
select * from sal; -- 조회
select * from user_constraints where table_name = 'SAL'; -- 테이블 제약조건 조회
desc sal; -- 테이블 세부 조회

-- 회원 테이블 더미 데이터 추가 --
insert into member values('m0000','m0000','ezenkim','seoul','010-1111-1111','');
insert into member values('m0001','m0001','ezenlee','busan','010-2222-2222','');
insert into member values('m0002','m0002','ezenpark','zeju','010-3333-3333','');
select * from member; -- 조회

-- 도서 테이블 더미 데이터 추가 --
insert into book values(1,'a01','computer science',10000,5,'ezenchoi','top company','23/02/08');
insert into book values(2,'a02','flower of miracle',20000,2,'ezennam','good company','21/04/24');
insert into book values(3,'b01','human being',30000,6,'ezenwang','genius company','24/08/24');
select * from book; -- 조회

commit;