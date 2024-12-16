/*
    # 그룹함수
        - 테이블의 행들을 특정 컬럼 기준으로 그룹화하여 계산하는 함수들
        - 특정 그룹의 총합, 갯수, 평균등을 구하는 함수들
        - 그룹의 기준이 되는 컬럼은 GROUP BY절을 통해 선택 (인지할것)
*/
/*
    SUM(column) : 총합
    AVG(column) : 평균
    MAX(column) : 최댓값
    MIN(column) : 최솟값
    count(column) : 갯수
*/
select * from employees;
-- 직원테이블에서 급여의 총합을 조회 --
select SUM(salary) from employees;
-- GROUP BY ~ 컬럼 기준으로 조회 = 직무별 --
select job_id, sum(salary) from employees group by job_id;
-- 각 직무별 평균 임금을 직무 기준으로 조회
select job_id, avg(salary) as 평균임금 from employees group by job_id;
-- 커미션 갯수 조회 | 조회기준 - 부서번호
select department_id, count(commission_pct) as 총갯수 from employees group by department_id;
-- 부서번호 80이 어떤 직무를 하는지 조회
select job_id from employees where department_id = 80;
-- 실습. 각 부서별로 가장 최근에 입사한 사원의 날짜와 가장 오래전 입사한 사원의 날짜를 조회 = 부서번호로 그룹 조회
select department_id , max(hire_date) as 최근입사 , min(hire_date) as 초기입사 from employees group by department_id;
-- 각 직책별 평균 연봉 구하기 | 직무별로 조회
select job_id , avg(salary*(1+NVL(commission_pct,0))*12) as 평균연봉 from employees group by job_id;

/* Having절 = 그룹함수 결과에 대한 조건을 주고 싶을 때 사용 */
select job_id, avg(salary) as 평균급여 from employees group by job_id having avg(salary) >= 10000;
-- 5명 이하로 구성된 부서번호를 조회 | 그 부서의 최고 급여액
select department_id , max(salary) as 최고급여 from employees group by department_id having count(department_id)<=5;

/* where절과 group by 함께 사용 = where절의 조건을 모든 행에 적용한 결과를 통하여 그룹화 */
select department_id, min(salary) as 최저급여 from employees where salary >= 5000 group by department_id;

