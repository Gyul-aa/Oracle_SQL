/*
    # ORDER BY
        - 원하는 컬럼 기준으로 정렬하여 조회할 수 있다.
        - ORDER BY 컬럼명 [ASC | DESC]
        - ASC : 오름차순 , asending (기본값)
        - DESC : 내림차순 , desending
        - NULL은 오름차순으로 정렬하면 가장 나중에 출력되고, 내림차순으로 정렬하면 가장 먼저 출력됨
*/
select * from employees;
-- 부서번호로 오름차순 정렬 | 모든 직원 조회
select * from employees order by department_id;
-- 부서번호로 내림차순 정렬 | 모든 직원 조회
select * from employees order by department_id desc;

-- NULL 정렬
select * from employees order by commission_pct;
select * from employees order by commission_pct desc;

-- 각각에 정렬 주기
select * from employees order by job_id asc, hire_date desc;

