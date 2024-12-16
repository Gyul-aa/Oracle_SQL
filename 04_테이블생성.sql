/*
    # DML (Data Manipulation Language) = 데이터 조작어 = 웹 개발자 주로 사용
        - select : 데이터 조회
        - insert : 데이터 추가
        - update : 데이터 수정
        - delete : 데이터 삭제
    
    # DDL (Data Definition Language) = 데이터 정의어
        - 테이블, 시퀀스 , 뷰 .. 등 DB에서 사용하는 DB 오브젝트 구조를 생성할 때 사용하는 명령어
        - create : 오브젝스 생성
        - drop : 오브젝트 삭제
        - alter : 오브젝트 수정
        - truncate : 오브젝트 완전 삭제
        
    # DCL (Data Control Language) = 데이터 제어 명령어
        - GRANT : 권한 부여
        - REVOKE : 권환 회수
*/
/*
    # 테이블 생성
        - CREATE TABLE 테이블명 (컬럼명1 컬럼타입1 제약사항1, 컬럼명2 컬럼타입2 제약사항2 ...);
    # 테이블 삭제
        - DROP TABLE 테이블명
*/
-- rownum : 열번호
select * from employees;

drop table fruits; -- 테이블 삭제

create table fruits(
    name    varchar2(20),
    qty     NUMBER(5),
    price   NUMBER(5)
);

alter table fruits rename column prive to price;

select * from fruits;
-- 데이터 삽입
INSERT INTO fruits
VALUES('귤',40,1000);
INSERT INTO fruits
VALUES('감',30,2000);
INSERT INTO fruits
VALUES('배',50,3000);

-- 첫번째 데이터 수정
update fruits set name='망고' where name='귤';
-- 과일명이 배->사과인 것의 수량을 33으로 변경
update fruits set qty=33 where name='배';
update fruits set name='사과' where name='배';
-- 데이터 삭제
DELETE from fruits where name='감';
