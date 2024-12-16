/*
    # 뷰(view)
    - 데이터베이스에서 제공하는 가상의 테이블
    - 뷰 사용시 복잡한 쿼리문을 대신할 수 있으므로 개발의 편의성을 가짐
    - 뷰 = 뷰를 만들때 사용한 쿼리문을 저장하는 것
    - 주로 복잡한 서브쿼리 사용시 다음에 다시 사용할 목적으로 이용함
    
    (예) 여러 테이블을 조인한 복잡한 쿼리문의 결과를
    => 가상의 테이블 뷰에 저장하면, 그 이후부터 복잡한 쿼리를 쉽게 사용할 수 있음
    
    # 뷰 생성하기
    CREATE VIEW 뷰이름
    AS
    서브쿼리
*/

/* 뷰 만들기 */

-- 직원의 사원번호, 이름, 급여, 근무부서, 근무지역을 가지고 있는 뷰 생성 =>EQUI 조인 이용하여 작성 = 코드캡쳐, 넘버링

create view emp_dept_join_view
as
    select a1.employee_id,
        a1.first_name,
        a1.salary,
        a3.department_id,
        a2.location_id
from employees a1, locations a2, departments a3
where a1.department_id = a3.department_id and a3.location_id = a2.location_id;

-- 뷰 조회 = 편리하게 복잡한 쿼리문을 조회하는 것 => 서브쿼리문이 실행되는 것
select * from emp_dept_join_view order by department_id;

/* 시스템 카탈로그 */
select * from user_catalog;


-- 9/9 test 실습 --
create table member1(
    id  varchar2(10) constraint mem_id_pk primary key,
    name varchar2(30) constraint mem_name_nn not null,
    age number(3) constraint mem_age_nn not null,
    address varchar(60)
);

insert into member1 values('dragon','박문수',40,'서울시');
insert into member1 values('sky','김윤신',30,'부산시');
insert into member1 values('blue','이순신',40,'인천시');

select id,name,age,address from member1 where name like '%신%';

select * from user_constraints WHERE table_name = 'MEMBER1';
