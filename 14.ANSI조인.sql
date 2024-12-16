/*
    # ANSI 조인
    - 미국 국가 표준협회에서 정한 표현을 따르는 조인 문법
    - 조인 조건에 사용되는 컬럼명이 같으면 => using문을 사용
    - 조인 조건에 ON을 사용하므로 => WHERE 조건절과 구분하여 사용할 수 있으므로 가독성이 좋음 
*/

select * from employees;
select * from departments;
select * from locations;
select * from jobs;

-- ANSI CROSS JOIN = 아무 의미없는 조인
select * from employees CROSS JOIN departments;

-- EQUI JOIN
select
    *
from
    employees , departments
where
    employees.department_id = departments.department_id;

/* #ANSI INNER JOIN = EQUI 조인과 같음 */
select
    *
from
    employees emp
INNER JOIN  
    departments dept
ON
    emp.department_id = dept.department_id;

/* #ANSI INNER JOIN USING 사용 = 조인할 테이블의 FK, PK 컬럼명이 같을 경우 사용 */
select
    department_id, first_name
from
    employees
INNER JOIN
    departments
USING
    (department_id);

-- 실습1. 모든 직원들의 직원번호/이름/부서이름을 조회하세요. = inner join 사용
select
    employee_id , first_name, department_name
from
    employees
INNER JOIN
    departments
USING
    (department_id);

-- 실습2. job_id가 IT_PROG인 직원들의 이름/부서명/도시이름을 조회하세요.
select
    employees.first_name || ' ' || employees.last_name as emp_name , departments.department_name , locations.city
from employees
    INNER JOIN departments USING (department_id)
    inner join locations using (location_id)
where
    employees.job_id = 'IT_PROG';
    
-- 실습3. Seattle에서 근무하는 직원들의 이름/직책/급여를 조회   
select employees.first_name || ' ' || employees.last_name as emp_name , jobs.job_title , employees.salary*(1+NVL(commission_pct,0)) , city
from employees
    inner join departments using (department_id)
    inner join jobs using (job_id)
    inner join locations using (location_id)
where city = 'Seattle';

-- 실습4. job_title이 Stock Manager인 직원들의 전화번호/직책을 조회 = EQUI 조인 사용
select
    employees.phone_number , jobs.job_title
from
    employees , jobs
where
    employees.job_id = jobs.job_id
    and 
    job_title = 'Stock Manager';

select * from employees;
select * from departments;
select * from locations;
select * from jobs;

-- 실습5. 월급을 최대 월급이상으로 받는 직원들이 속한 부서를 조회. 단, 부서명의 중복도 제거 = ANSI
select distinct
    departments.department_name as 부서명
from
    employees , departments , jobs
where
    employees.department_id = departments.department_id
    and
    employees.job_id = jobs.job_id
    and
    employees.salary*(1+NVL(commission_pct,0)) >= jobs.max_salary;
