/*
    # 트랜잭션(Transaction)
     - 데이터 처리의 한 단위
     - 하나의 트랜잭션은 여러 명령어들로 이루어져 있음
     - 트랜잭션의 모든 과정이 정상적으로 완료되는 경우에만 변경사항이 확정됨 (All or Nothing)
     - 트랜잭션을 관리하기 위한 명령어 = COMMIT, ROLLBACK, SAVEPOINT 등등이 있음
     - 하나의 트랜잭션은 마지막 실행된 COMMIT, ROLLBACK부터 새로운 커밋을 실행하기 전까지 수행하는 SQL문을 의미함
     
    (예)
    오라클 DB = 개발자가 전달한 (INSERT, UPDATE, DELETE)문을 메모리상에서만 수행
               실제 영속성을 위한 작업을 하지 않음(=하드디스크에 아직 전달 안함)
               => 실수로 인해 데이터의 유실을 막기 위한 장치임
               => CREATE, DROP TABLE 등은 상관없음
    DB 조작하는 작업이 모두 정상적으로 완료되었다면, DB의 저장장치에 반영이 되어야 함
    => 작업이 시작되고, DB의 저장장치에 반영될 때까지의 작업 단위를 -> 트랜잭션이라고 함
    
    [명령어]
     - COMMIT = 트랜잭션 완료, 저장장치에 반영 = 복구불가
     - ROLLBACK = 트랜잭션 취소
     - SAVEPOINT = ROLLBACK의 단위별 저장
*/

select * from employees;

-- 연습용 테이블
create table cafe_coffee_menu (
    mid         number(4)   constraint cc_menu_mid_pk primary key
);
select * from cafe_coffee_menu;

-- 테이블 수정
alter table cafe_coffee_menu ADD(
    name        varchar2(30)
            constraint cc_menu_name_uk  unique
            constraint cc_menu_name_nn  not null,
    price       number(5)
            constraint cc_menu_price_chk    check(price >= 0)
            constraint cc_price_nn      not null,
    min_size    varchar2(1)
            constraint cc_menu_min_size_chk      check(min_size IN('S','M','L'))
            constraint cc_menu_min_size_nn   not null,
    max_size    varchar2(1)
            constraint cc_menu_max_size_chk     check(max_size IN('S','M','L'))
            constraint cc_menu_max_size_nn  not null
);
select * from cafe_coffee_menu;

-- 제약조건 출력
select * from user_constraints where table_name = 'CAFE_COFFEE_MENU';

-- 더미 데이터 5개 삽입
insert into cafe_coffee_menu values(1,'아아',5000,'S','L');
insert into cafe_coffee_menu values(2,'아메리카노',5000,'S','L');
insert into cafe_coffee_menu values(3,'카페라떼',5500,'S','L');
insert into cafe_coffee_menu values(4,'프라푸치노',6500,'S','L');
insert into cafe_coffee_menu values(5,'밀크쉐이브',5500,'S','L');

-- 하나의 트랙잭션이 commit이 실행되기 전까지 실행중...
COMMIT;

-- 새로운 트랜잭션 시작
insert into cafe_coffee_menu values(6,'자몽에이드',6700,'S','L');
select * from cafe_coffee_menu;

-- 롤백하여 5번 더미데이터만 보임 --
ROLLBACK;

 -- 다시 6번 추가 --
insert into cafe_coffee_menu values(6,'자몽에이드',6700,'S','L');

-- 세이브 포인트 저장 --
SAVEPOINT save01;
select * from cafe_cofee_menu;

-- 7번 더미데이터 추가 --
insert into cafe_coffee_menu values(7,'녹차',4500,'S','L');
select * from cafe_coffee_menu;

-- 세이브포인트로 롤백하여 6번 더미데이터까지만 보임 --
ROLLBACK TO save01;
select * from cafe_coffee_menu;

-- 커밋 --
COMMIT;

select * from cafe_coffee_menu;







