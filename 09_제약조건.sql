/*
    # 데이터 제약조건
    # 데이터 무결성
    - 데이터가 결함이 없는 성질
    - 정확성, 일관성, 유효성이 유지되는 데이터를 말함
    
    # 개체 무결성
    - 테이블의 데이터 = 반드시 한 행을 구분할 수 있어야 함
    - 데이터의 개체 무결성을 지키기 위한 제약조건 = pk 사용 = UNIQUE, NOT NULL
    
    # 참조 무결성
    - 참조 관계에 있는 데이터는 항상 일관된 값을 가져야 함
    - 참조 무결성을 지키기 위한 제약조건 = FK 사용
    
    # 데이터 무결성 제약 조건
    - NOT NULL : 해당 도메인에 NULL을 허용하지 않음
    - UNIQUE : 해당 도메인에 중복되는 값을 허용하지 않음
    - PRIMARY KEY : 해당 도메인 테이블의 기본키로 사용 = UNIQUE + NOT NULL
    - CHECK : 원하는 조건을 지정, 도메인 무결성을 위해
    
    # 도메인 무결성
    - 하나의 도메인을 구성하는 개체들은 항상 타입이  일정해야 함
    - 테이블 컬럼 타입 설정 및 CHCK 제약조건을 통해 유지 가능함
*/
select * from employees;
select * from departments;
select * from countries;
desc countries; -- description 묘사, 설명
select * from locations;
select * from tab;

/*
    데이터 딕셔너리(Data Dictionary)
    - 시스템 카탈로그라고도 하며, 사용 가능한 데이터베이스 및 테이블의 정보를 가지고 있는 시스템 테이블임
      DBA만 추가, 수정, 삭제가 가능 => 사용자는 조회만 가능
*/
-- 제약조건을 볼 수 있는 데이터 딕셔너리 뷰 (접속 사용자의 권한)
select * from user_constraints;
-- 제약조건을 볼 수 있는 데이터 딕셔너리 뷰 (모든 사용자)
select * from all_constraints;

/*
    # CONSTRAINTS_TYPE (제약조건 타입)
    - P : Primary Key
    - F : Foreign Key
    - C : Check Or Not Null
    - U : Uniqie
*/
/*
    #1. 테이블 생성과 동시에 제약 조건 추가
    - 컬럼명 컬럼타입 제약조건 (이름이 자동으로 정해짐)
    - 컬럼명 컬럼타입 CONSTRAINT 제약조건명 제약조건 
*/

-- fruit3 테이블 | 컬럼명 name, price | 제약조건 둘다 NN
CREATE table fruit3(
    name varchar2(20) NOT NULL,
    price number(5) NOT NULL
);

select * from fruit3;
desc fruit3;
insert into fruit3(name,price) values('apple',200);
-- 제약사항 테이블 조회 | 테이블명 조회시 대문자로 해줘야 함 --
select * from user_constraints where table_name = 'FRUIT3';

-- constraint 제약조건명 설정 --
create table fruit4(
    name    varchar2(20)
            constraint fruit4_name_uk UNIQUE
            constraint fruit4_name_nn NOT NULL,
    price   number(5)
            constraint fruit4_price_nn NOT NULL          
);
select * from fruit4;
-- 제약사항 조회 --
select * from user_constraints where table_name = 'FRUIT4';

insert into fruit4 values('dragonfruits',5000);
insert into fruit4 values('apple',2000);

-- CONSTRAINT 실습
create table fruit5(
    fid     number(4)   
            constraint f5_fid_pk primary key,
    fname   varchar2(20)  
            constraint f5_fname_uk unique
            constraint f5_fname_nn NOT NULL,
    grade   varchar2(2)
            constraint f5_grade_chk check(grade In('A+','A','B+','B')),
    fsize   number(2)
            constraint f5_fsize_chk check(fsize between 0 and 20)
);
insert into fruit5 values(1,'사과','A+',5);
select * from fruit5;
select * from user_constraints where table_name = 'FRUIT5';

COMMIT;

/*
    # 이미 생성된 테이블에 제역조건 추가
    - ALTER TABLE 테이블명 ADD CONSTRAIN 제약조건명 제약조건(컬럼) = 추가
    - ALTER TABLE 테이블명 MODIFY = 이미 존재하는 컬럼을 수정
*/
select * from fruit6;
-- 제약조건 추가 = PK
ALTER TABLE fruit6 ADD CONSTRAINT ff6_fid_pk PRIMARY KEY(fid);

-- 제약조건 추가 = UNIQUE => fname
ALTER TABLE fruit6 ADD CONSTRAINT ff6_fname_uk UNIQUE(fname);

-- 테이블 수정,제약조건 수정 = CHECK, NOT NULL = MODIFY 사용
ALTER TABLE fruit6 MODIFY (fname varchar2(20) CONSTRAINT ff6_fname_nn NOT NULL);
ALTER TABLE fruit6 MODIFY (grade varchar2(2) CONSTRAINT ff6_grade_chk CHECK(grade IN('A+','A','B+','B')));

-- fsize = 제약조건에서 0에서 20사이의 값만 올수있도록 제약조건 수정
alter table fruit6 modify (fsize number(2) constraint ff6_fsize_chk check(fsize between 0 and 20));

commit;

-- 제약조건 조회 = 캡,넘
select * from user_constraints where table_name = 'FRUIT6';

-- # alter table 테이블명 modify = 이미 존재하는 컬럼을 수정
alter table fruit6 modify (fsize number(4));

/* 제약 조건 외래키 = 제약 조건을 설정할 때 어떤 테이블의 어떤 컬럼을 참조할 것인지 지정해야 함 */
create table original(
    code        number(4),
    kor_name    varchar2(100),
    eng_name    varchar2(100),
    weather     number(2)
);
select * from original;
-- 제약사항 추가 = code에 pk 설정
alter table original add constraint org_code_pk primary key(code);
-- 제약조건 테이블 검색
select * from user_constraints where table_name = 'ORIGINAL';
-- 더미 데이터 2개 추가
insert into original values(2,'박이젠','parkezen',2);
commit;
-- 제약사항 제거
alter table original drop constraint org_code_pk;

-- 실습 | 테이블명 address1 | 컬럼 = aid , aname, agrade, asize, code | 데이터형 = 숫자, 가변문자, 가변문자, 숫자, 숫자
create table address1(
    aid         number(4),
    aname       varchar2(20),
    agrade      varchar2(20),
    asize       number(4),
    code    number(4)
);
-- 제약조건 추가 | aid = PK , aname = U , agrade = Chk => C K D F , asize = chk => 1~100사이값
alter table address1 add constraint ad_aid_pk primary key(aid);
alter table address1 add constraint ad_aname_u unique(aname);
alter table address1 add constraint ad_agrade_chk check(agrade in('C','K','D','F'));
alter table address1 add constraint ad_asize_chk check(asize between 1 and 100);
-- 더미 데이터 3개 삽입
insert into address1 values(1,'서울','K',1,1);
insert into address1 values(2,'제주','D',1,1);
insert into address1 values(3,'부산','F',1,1);
-- 테이블 조회, 제약사항 조회 => 캡, 넘
select * from address1;
select * from user_constraints where table_name = 'ADDRESS1';

commit;
select * from address1;

/* FK = 기본키 PK 와 외래키 FK 연동 */
/* # 테이블 생성하면서 외래키 추가 */
create table goodss(
    gid     number(4)
            constraint goodss_gid_pk primary key,
    gname   varchar(10)
            constraint goodss_gname_nn not null,
    gcode   number(5)
            constraint goodss_code_fk REFERENCES fruit6(fid)
);

-- 참조 관계에 있는 테이블은 지울 수 없음 --
drop table fruit6;




