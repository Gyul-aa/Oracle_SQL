select * from tab; -- ctrl + enter : 커서위치의 한 쿼리문장 실행
select * from employees;
select * from all_users;

/*
    # 데이터베이스 (Database) - 종류는 多 , 현재 배우는 것은 Oracle
        - 데이터 창고
        - 데이터를 효율적으로 저장하기 위한 데이터 저장 전문 프로그램
        - 파일 시스템의 많은 문제점과 한계를 극복하기 위한 프로그램
    
    # 파일 시스템의 문제점
        - 데이터 불일치가 발생할 수 있음
        - 다수 사용자를 위한 동시 제공이 불가능함
        - 중복 데이터를 필요 이상으로 많이 저장하게 됨
        - 파일 복구 기능이 없음
        
    # DBMS (database manangement service)
        - 데이터베이스를 관리하기 위한 프로그램
        - 데이터베이스는 데이터를 보관하는 장소이고, 데이터를 다루는 작업은 DBMS가 한다고 생각하면 됨
    
    # RDMBS (relational database manangement service)
        - 데이터들 간의 관계를 이용하여 데이터의 중복을 최소화하는 방식의 DBMS
        - 질의문(Query, SQL)으로 데이터를 관리함
        - 쿼리는 국제 표준을 따름
        - 데이터를 표(table)형태로 저장
    
    # 테이블
        - 관계형 데이터베이스는 데이터를 표 형태로 저장
        - 필드 : 한 열에 저장되는 데이터들의 이름 = attribute = 속성 = column
        - 레코드 : 한 행에 저장되는 하나의 개체에 관한 데이터들의 묶음 = tuple = 튜플 = row
        
    # SQL (Structed Query Language)
        - RDBMS에 명령을 내리기 위한 언어
*/
/*  
    # 오라클 DB 이름 명명 규칙
        a. 문자로 시작해야 함
        b. 1자부터 30자까지 가능
        c. A-Z , a-z , 0-9 , _ , $ 포함 가능
        d. 동일한 사용자가 소유한 다른 DB의 이름과 중복되지 않아야 함
        e. Oracle의 예약어가 아니어야 함
*/
/* 기본 명령어 */
-- 현재 접속한 계정을 확인하는 명령어
show user;
-- 현재 접속한 계정이 가지고 있는 모든 테이블을 확인하는 명령어
select * from tab;
-- 테이블의 모든 내용을 확인하는 명령어
select * from employees;
select * from countries;
select * from departments;