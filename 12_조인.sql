/*
    # 기본키 = Primary key = PK
    - 한 테이블에서 하나의 행을 유일하게 구분할 수 있는 컬럼
    - 하나의 테이블에는 하나의 기본키가 존재 = UNIQUE
    - 기본키  설정 컬럼에는 NULL이 허용되지 않음 = NOT NULL
    
    # 외래키 = Foreign Key = FK
    - 다른 테이블에서는 기본키지만, 해당 테이블에서는 값이 중복인 컬럼
    - 어떤 테이블의 기본키가 다른 테이블의 외래키로 설정되면, 두 테이블간에는 관계가 형성
    - 참조) 외래키로 설정된 컬럼에는 참조하는 테이블의 해당 컬럼에 존재하는 값만 추가 가능
*/
/*
    # 테이블 JOIN
    - 기본키와 외래키로 관계가 형성되어 있는 테이블들의 정보를 종합하여 조회하는 것
    - 2개 이상의 테이블의 데이터를 한번에 가져올 수 있음
*/
select * from employees;
select * from departments;
/*
    CROSS JOIN
    - 아무 의미가 없는 조인 = 조인에 사용하는 테이블들의 데이터를 조합하여 나올 수 있는 모든 경우의 수를 출력하는 조인
*/
select * from employees, departments; -- 107 * 27
select count(ROWNUM) as employees의row개수 from employees; -- 107 row
select count(ROWNUM) as departments의row개수 from departments; -- 27 row

/*
    # EQUI JOIN (1-1)
    - 두 테이블에서 서로 동일한 값을 지닌 컬럼(기본키, 외래키)을 이용, CROSS JOIN에서 의미있는 데이터만 걸러내는 JOIN
    - 두 테이블을 함께 사용할 때 같은 이름의 컬럼이 있다면, 앞에 테이블 이름을 (반드시) 명시해야 함
*/
select * from employees;
select * from departments;
select * from locations;
-- (기본) 직원테이블과 부서테이블 조인
-- 의미있는 같은 부서명을 가진 두 테이블을 가져옴
-- 조건에 따라 같은 컬럼명을 기준으로 두 테이블이 옆으로 합쳐진 거라 생각하면 됨
select
    *
from
    employees a1, departments a2
where
    a1.department_id = a2.department_id;

-- 직원테이블과 부서테이블을 조인하여 사원의 이름과 부서번호 조회
select
    a1.first_name , a2.department_name
from
    employees a1, departments a2
where
    a1.department_id = a2.department_id;
    
select * from user_constraints where table_name = 'EMPLOYEES';
select * from user_constraints where table_name = 'DEPARTMENTS';

-- 실습1. 직원테이블과 부서테이블 조인하여 직원번호 , 이름 , 부서명 조회 => 별칭사용 = 캡쳐, 넘버링
select
    a1.employee_id as 사원번호 , a1.first_name as 이름 , a2.department_name as 부서명
from
    employees a1, departments a2
where
    a1.department_id = a2.department_id;

-- 실습2. 직원테이블과 부서테이블 조인하여 직원번호 , 이름 , 근무지역번호 조회 => 별칭사용 = 캡쳐, 넘버링
select
    a1.employee_id as 사원번호 , a1.first_name as 이름 , a2.location_id as 근무지역번호
from
    employees a1, departments a2
where
    a1.department_id = a2.department_id;

-- 실습3. 근무지역번호가 1700인 곳에서 근무하는 직원들의 직원번호, 이름, 직무를 조회
select
    a1.employee_id as 직원번호 , a1.first_name as 이름 , a1.job_id as 직무 , a2.location_id as 근무지역번호
from
    employees a1, departments a2
where
    a1.department_id = a2.department_id and a2.location_id = 1700;

-- 실습4. Sales부서에 근무하는 직원들의 이름, 근무지역번호, 부서명 조회
select
    a1.employee_id as 사번 , a1.first_name as 이름 , a2.location_id as 근무지역번호 , a2.department_name as 부서명
from
    employees a1, departments a2
where
    a1.department_id = a2.department_id and a2.department_name ='Sales';

-- 실습5. 2002년에 입사한 직원들의 직원번호, 이름, 입사일, 근무부서 조회 | (정렬) 입사일순으로 정렬
select
    a1.employee_id as 사번 , a1.first_name as 이름 , a1.hire_date as 입사일 , a2.department_name as 근무부서
from
    employees a1 , departments a2
where 
    a1.department_id = a2.department_id
    and
    hire_date between '02/01/01' and '02/12/31'
order by
    hire_date;
    
select * from tab;
select * from departments; -- location_id(fk)
select * from jobs; -- job_id , job_title , 연봉범위
select * from locations; -- location_id(pk) , city(도시이름), country_id(fk)

/* 3개 테이블 조인 */
-- 직무가 IT_FROG인 직원들의 이름/부서명/도시이름/직무 조회
select
    employees.first_name , departments.department_name , locations.city , employees.job_id
from
    employees, departments, locations
where
    employees.department_id = departments.department_id
    and
    departments.location_id = locations.location_id
    and
    job_id = 'IT_PROG';
    
-- 실습. 사는 도시가 'Seattle'인 직원의 이름/직급/급여/사는도시 조회 | 테이블 4개 조인
select
    a1.first_name as 이름 , a4.job_title as 직급 , a1.salary*(1+NVL(commission_pct,0)) as 급여 , a3.city as 사는도시
from
    employees a1 , departments a2, locations a3, jobs a4
where
    a1.department_id = a2.department_id
    and
    a2.location_id = a3.location_id
    and
    a1.job_id = a4.job_id
    and
    city = 'Seattle';
    
commit;
    




