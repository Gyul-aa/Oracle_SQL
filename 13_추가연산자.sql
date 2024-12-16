/*
    # concat 연산자
    - 문자열을 합치는 연산자
    - (형식) 문자열 || 컬럼 || 문자열 || 컬럼
*/
select
    first_name || ' 사원의 담당업무는 ' || job_id || ' 입니다'
from
    employees;
/*
    # distinct 연산자
    - SELECT문에서 가져온 모든 ROW들 중에 중복된 ROW를 제거하는 키워드 // ROW 값의 범위 = DOMAIN
*/
select
    distinct department_id
from
    employees
order by
    department_id;