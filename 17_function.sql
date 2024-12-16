
/*
    # 함수
    - 오라클의 함수를 이용하면 테이블의 데이터를 가공하여 조회가 가능함
*/

select * from dual;

-- ABS(n) : 절댓값
select abs(-123) from dual;

-- FLOOR(n) : 내림
select floor(123.1234) from dual;

-- CEIL(n) : 올림
select ceil(123.1234) from dual;

-- ROUND(n) : 반올림
select round(123.1234) from dual;

-- MOD(n,m) : 나머지 연산
select mod(17,10) from dual;

-- TRUNC(value,n) : 해당값의 n자리 밑으로 잘라냄
select trunc(123.123456,4) from dual;
select trunc(123.123456,-2) from dual;

-- TO_CHAR() : 데이터를 문자 타입으로 변경하는 함수
select to_char(123) from dual;
select to_char(sysdate,'[YYYY/MM/DD HH:MI:SS]') from dual;

-- TO_DATE() : 데이터를 날짜 타입으로 변환
select to_date('[2024-01-01]','[YYYY-MM-DD]') from dual;

-- TRIM() : 양쪽의 공백 제거
select trim('     Oracle     ') from dual;
