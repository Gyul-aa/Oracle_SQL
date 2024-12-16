/*
    # 서브쿼리
    - 하나의 SELECT문 내부에 포함된 또 하나의 SELECT문
    - 서브 쿼리를 포함하고 있는 쿼리를 메인쿼리라고 함
    - 서브 쿼리가 먼저 실행
    - 실행 결과에 따라 단일행 서브쿼리, 다중행 서브쿼리로 분류됨
    
    # 단일행 서브쿼리
    - 서브쿼리의 실행결과가 단 하나의 행인 서브쿼리
    - 단일 값 끼리의 비교하는 연산자들을 사용할 수 있음
    - 예시) = , > , <
    
    # 다중행 서브쿼리
    - 서브 쿼리의 실행 결과가 2행 이상인 서브쿼리
    - 다중행 연산자와 함께 사용해야 함
    - 예시) IN, ANY, SOME, ALL, EXISTS
*/

/* IN : IN 뒤에 나오는 여러값들 중 해당 값이 포함되어 있으면 참 */
select * from jobs;
select
    *
from
    jobs
where
    job_id
in (select job_id from employees where first_name='Peter');

select * from employees;

/* ANY, SOME : 뒤에 나오는 여러 값들 중 하나이상의 해당 조건을 만족시키면 참 */
select
    *
from
    employees
where
    salary > some(select salary from employees where job_id = 'IT_PROG');
    
/* ALL : 뒤에 나오는 여러 값들의 모든 조건을 만족시키면 참 */
select
    *
from
    employees
where
    salary < ALL(select salary from employees where job_id = 'IT_PROG');








