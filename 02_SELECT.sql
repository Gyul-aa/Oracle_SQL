/*
    # select 컬럼명 from 테이블명;
        - 원하는 테이블을 조회하는 쿼리문
        - 컬럼명 자리에 * 를 쓰는것은 모든 컬럼을 의미
        - 컬럼명과 테이블명은 대소문자를 구분하지 않음
        - 쿼리문도 대소문자를 구분하지 않음
        - (하지만) 데이터는 대소문자를 구분함
*/
-- 테이블 employee의 모든 데이터 조회
select * from EMPLOYEES;
-- 조회하고 싶은 컬럼의 값만 가져오늘 컬럼문
select first_name, last_name, hire_date, salary, job_id from employees;

select
phone_number, email
from
employees;

/*
    # 연습용 테아블
        - EMPLOYEES : 모든 사원 정보를 저장한 테이블
        - DEPARTMENTS : 모든 부서 정보를 저장한 테이블
        - JOBS : 모든 직급 정보를 저장한 테이블
        - REGIONS : 각 대륙의 정보를 저장한 테이블
*/
-- 위 4개 테이블 모든 정보 출력 => 쿼리문 캡쳐, 넘버링
select * from employees,departments,jobs,regions;

-- 해당 테이블의 컬럼 정보 보기
DESC employees;
DESC department;
DESC jobs;
DESC regions;

/*
    # SQL 기본 데이터 타입
    
    # NUMBER(n) , NUMBER(n,m)
        - 숫자 데이터만 저장할 수 있는 컬럼 타입
        - 숫자가 하나만 적혀 있으면, 정수를 저장하는 컬럼임
        - 숫자가 2개 적혀 있으면, 실수를 저장하는 컬럼임
            (예) NUMBER(8) -> 정수 8자리
                NUMBER(8,2) -> 정수 8자리 , 소수 2자리
    # CHAR(n)
        - 고정 길이 문자 데이터를 저장하는 컬럼 타입
        - 설정된 컬럼 크기보다 적은 양의 데이터가 들어오더라도 설정된 길이를 모두 차지함
        - 데이터가 낭비될 수 있지만 크기 계산이 없기 때문에 속도는 좀 더 빠름
        
    # VARCHAR2(n)
        - 가변 길이 문자 데이터를 저장하는 컬럼 타입
        - 저장하는 데이터의 크기에 따라 알맞은 공간을 차지함
        - 데이터를 저장할 때 저장공간이 절약되지만, 크기 계산이 필요함
        
    # DATE
        - 날짜 및 시간을 저장하는 컬럼 타입
*/
-- 실습1. 모든 사원의 사번/이름/입사일/월급/부서번호 조회
select
    employee_id,
    first_name,
    last_name,
    hire_date,
    salary,
    department_id
from
    employees;

-- AS를 이용해 해당 컬럼을 원하는 이름으로 생성 후 조회할 수 있음
SELECT
    employee_id AS 사번,
    first_name AS 이름,
    salary AS 급여,
    department_id AS 부서번호
FROM
    employees;
    
-- 산술 연산자 이용
-- 모든 사원의 마지막 이름, 월급만 나오도록 조회
select
last_name AS 마지막이름,
salary AS 월급
from employees;
-- 모든 사원의 마지막 이름, 월급 컬럼 별칭 "이사람의 연봉" 계산하여 조회
select
last_name AS 마지막이름,
salary AS 월급,
salary * 12 AS 이사람의연봉
from
employees;
-- 모든 사원의 마지막 이름, 월급 컬럼 별칭 "20퍼센트 삭감" 계산하여 조회
select
last_name AS 마지막이름,
salary AS 월급,
salary * 0.8 AS "20퍼센트삭감"
from
employees;
/*
    # NVL(column, value) = NULL VALUE
    - 계산에 사용되는 컬럼의 값에 NULL이 있는 경우,
    NULL을 대체할 값(=치환)을 지정하는 함수
*/
-- 모든 사원정보 조회
select * from employees;
select
    last_name,
    salary,
    commission_pct,
    job_id,
    salary * (1+NVL(commission_pct,0)) as "커미션 적용 월급"
from
    employees;
    
-- 실습1. 모든 사원들의 "사번,이름,직책ID, 별칭사용 "보너스가 적용된 연봉"을 출력
-- 캡쳐, 넘버링
select
employee_id,
first_name,
job_id,
salary*(12+NVL(commission_pct,0)) AS "보너스가 적용된 연봉"
from
employees;

--SELECT DISTINCT 중복되는 내용 한번씩만 출력
--사원들의 모든 직책을 조회, 캡처, 넘버링
select job_id from employees;
select distinct job_id from employees;

-- 사원들의 모든 부서ID 조회
-- 부서ID 한번씩 조회(중복값 제거)
select department_id from employees;
select distinct department_id from employees;

--해당 DB의 모든 테이블 출력
select * from tab;
/*
    # and or not
*/
-- and 연산자 = 조건이 모두 참일 경우 실행
select * from employees where hire_date >= '2006/05/01' and hire_date < '2008/09/02';
-- or 연산자 = 하나라도 참일 경우 실행
select * from employees where job_id = 'IT_PROG' or job_id = 'SH_CLERK';
-- not 연산자 = 부정
-- 직무가 IT_PROG가 아닌 사원들 모두 조회
select * from employees where not job_id = 'IT_PROG';
-- 실습2. 2000에서 3000사이의 월급을 받는 직원들의 모든 정보 조회
select * from employees where salary >= 2000 and salary < 3000;
-- 실습3. 30번, 60번, 90번 부서에 소속된 직원들의 이름/직책/전화번호/부서번호 정보 조회
select first_name, job_id, phone_number, department_id from employees where department_id = 30 or department_id = 60 or department_id = 90;

/* 컬럼명 BETWEEN A AND B = 해당 컬럼의 값이 A이상 B이하인 경우 TRUE*/
select * from employees where salary Between 2000 And 3000;
/* # 컬럼명 IN(A,B,C,D, ... = () 안에 내용의 값이 있으면 TRUE => OR 연산자와 비슷 */
select * from employees where department_id  IN(30,60,90);
/* # MOD(value1, value2) = value1을 value2로 나눈 나머지를 구하는 함수 */
select * from employees where MOD(employee_id, 2)=0; -- (주의) = 비교연산자
/* # NULL = 크기 비교가 불가능하여 비교연산자 사용 불가 */
--커미션이 0.2미만인 모든 사원 조회
select * from employees where commission_pct < 0.2;
select * from employees where commission_pct = null; -- NULL 은 무한대 개념이라 비교 불가
select * from employees where commission_pct IS NULL;
select * from employees where commission_pct IS NOT NULL;

-- 사원번호가 100인 사원의 모든 정보 출력
select * from employees where employee_id = 100;

/* NOT 연산자 = 위치는 비교적 자유로움 */
select * from employees where commission_pct IS NOT NULL;
select * from employees where not commission_pct is null;
-- 급여가 2000-3000 사이가 아닌 사원들의 모든 정보를 출력
select * from employees where salary not Between 2000 and 3000;

/*
    # LIKE
    - 데이터의 일부분으로 원하는 내용을 검색할 수 있음
    - 문자 타입과 날짜 타입에 사용할 수 있음
    - % => 길이 제한 없이 아무 문자가 와도 상관없는 와일드카드 = 포함된 모든 문자 조회
    - _(언더바) => 하나의 문자가 반드시 와야하는 와일드카드 = 하나의 문자만 대응
*/
select * from employees where first_name like 'D%';
select * from employees where first_name like '_e%';
select * from employees where first_name like '%t%';

-- 실습4. -- 실습. 모든 이름에서 처음 나오는 a의 직원의 이름중 뒤에 3글자가 더 나오도록 직원들의 모든 정보 조회
select * from employees where first_name like '%a___';

--고용일이 5월인 직원들의 모든 정보 조회
select * from employees where hire_date Like '%/05/%';

--고용일의 마지막 날짜가 5일인 직원들의 모든 정보 조회 = 5일 15일 25일
select * from employees where hire_date Like '%_5';