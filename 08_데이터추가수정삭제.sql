/*
    # 테이블 데이터 생성
    - INSERT INTO 테이블(컬럼명...) VALUES(값...);
    - 테이블명 옆에 컬럼명을 생략하면 모든 컬럼을 순서대로 넣어줘야 함
*/
select * from employees;
select * from departments;
select * from fruits;
-- fruits 테이블에 데이터 입력 = 오렌지 --
insert into fruits(name,qty,price) values('오렌지',30,1000);
-- 컬럼 순서 상관없음 --
insert into fruits(qty,price,name) values(10,3500,'밤');
-- 일부 컬럼만 삽입 가능 --
insert into fruits(name,price) values('바나나',4000);
insert into fruits(price) values(8000);
-- 컬럼명 생략시 테이블 컬럼 순서대로 넣어야 함 --
insert into fruits values('Apple',20,2500);

/* 서브쿼리를 이용해 INSERT 가능함 */
insert into fruits (select * from fruits);

/*
    # 테이블 데이터 수정
        - UPDATE 테이블명 SET 컬럼 = 값 WHERE 조건;
        - 조건을 만족하는 모든 행을 수정함
        - 조건을 안쓰면 모든 행을 수정
        - 하나의 행을 구분할 수 있는 컬럼이 조건으로 사용되는 경우가 많음 (예: 기본키)
*/
-- 모든 과일명을 사과로 변경 --
UPDATE fruits set name = '사과';
select * from fruits;
rollback;
commit;

--  수량이 10개이하인 과일의 가격을 10으로 변경
update fruits set price = 10 where qty >= 10;

/*
    # 테이블 데이터 삭제
    - DELETE FROM 테이블명 WHERE 조건
    - 조건을 만족하는 모든 행을 삭제
    - 조건을 안쓰면 모든 행을 삭제
*/
DELETE FROM fruits where name = '바나나';


