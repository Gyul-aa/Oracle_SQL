/*
    # SELECT 컬럼명 FROM 테이블명 WHERE 조건절;
    - SELECT문에 WHERE절을 추가하여 해당 조건을 만족하는 행만 조회 가능
    - 오라클의 비교 연산자들을 활용
    
    # 비교연산자
    = : 같으면 TRUE
    < , > , <= , >= : 비교
    != , <> , ^= : 다르면 TRUE
*/
-- 모든 EMPLOYEE 테이블 조회
select * from employees;

-- 실습. 급여가 10000 이상인 직원의 풀네임, 직무, 급여 조회
select first_name, last_name, job_id, salary from employees where salary >= 10000;
-- 급여가 10000이상인 직원의 모든 정보
select * from employees where salary >= 10000;
-- 실습. 모든 직원중에 첫번째 이름이 John인 사람의 모든 정보 출력
select * from employees where first_name = 'John';
--모든 직원중에 첫번째 이름이 Vance인 사람의 부서정보, 급여, 마지막이름 출력
select job_id,salary,last_name from employees where first_name = 'Vance';

/* # 문자 타입 비교 */
select * from employees where first_name > 'P' order by first_name;

/* 날짜 타입 비교 */
select * from employees where hire_date < '06/01/01' order by hire_date;
