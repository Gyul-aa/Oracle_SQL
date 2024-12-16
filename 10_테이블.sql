/*
    # 테이블 복사하기
    - CREATE TABLE 테이블명 AS (서브쿼리)
    - 테이블 복사시 제약조건 NOT NULL은 복사됨
*/
select * from employees;

create table employees2 as (select * from employees);
select * from employees2;

desc employees;
desc employees2;

-- 제약조건 확인 --
select * from user_constraints where table_name = 'EMPLOYEES2';

-- 사용자 계정의 table 조회 | fruit 테이블 중 서브쿼리를 이용하여 새로운 테이블 tablenew 를 만드세요
select * from tab;
create table tablenew as (select * from fruit3);
select * from tablenew;
commit;

/*
    # 테이블 새컬럼 추가하기
    - ALTER TABLE 테이블명 ADD (컬럼명 컬럼타입,...);
*/
-- BOX 테이블 생성 = 컬럼명 color , 문자열 20자리 , 제약사항 = nn (제약사항명 명시적 코딩)
create table box1(
    color1   varchar2(20)
            constraint bx_color_nn NOT NULL
);
select * from user_constraints where table_name = 'BOX1';
alter table box1 add(
    brand   varchar2(30)
            constraint bx_brand_nn NOT NULL
            constraint bx_brand_uk UNIQUE,
    country_code    varchar2(8)
            constraint bx_cc_nn NOT NULL
);
select * from box1;

/*
    # 테이블 컬럼명 변경
    - ALTER TABLE 테이블명 RENAME COLUMN 현재컬럼명 TO 바꿀컬럼명;
*/
-- COUNTRY_CODE를 CODE 로 변경
alter table box1 rename column country_code to code;

/*
    # 테이블 컬럼 타입 변경
    - ALTER TABLE 테이블명 MODIFY (컬럼명 컬럼타입,...);
*/
alter table box1 modify(
    code varchar(4)
);
desc box1;

-- box1 테이블명 box 로 변경 --
alter table box1 rename to box;
commit;

/*
    # 테이블 컬럼 삭제
    - ALTER TABLE 테이블명 DROP COLUMN 컬럼명;
    - 해당 컬럼의 제약 조건들도 함께 삭제
*/
alter table box drop column code;
alter table box drop column brand;
select * from box;

/*
    # 테이블 제약조건 삭제
    - ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명;
*/
CREATE table ezen_computer(
    id      varchar2(20)
            constraint ec_id_nn NOT NULL
);
select * from ezen_computer;
select * from user_constraints where table_name = 'EZEN_COMPUTER';
commit;

alter table ezen_computer drop constraint ec_id_nn;
commit;


