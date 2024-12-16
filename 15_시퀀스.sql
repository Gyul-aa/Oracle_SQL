/*
    # 시퀀스
    - 기본키로 사용하기 편하도록 설계된 자동 번호 생성기
    - 호출할 때 마다 번호를 자동으로 증가시키는 것
    
    CREATE SEQUENCE 시퀀스명 [옵션명];
    
    [옵션명]
    [START WITN n]              - 시퀀스의 시작 번호 설정
    [INCREMENT BY n]            - 시퀀스의 증가값 설정
    [MAXVALUE n | NOMAXVALUES ] - 최댓값 설정
    [MINVALUE n | NOMINVALUES ] - 최솟값 설정
*/ 
-- 시퀀스 만들기
create sequence z_board_seq INCREMENT BY 1 START WITH 1;
-- 시퀀스 확인
select * from user_sequences;
select * from all_sequences;
-- 시퀀스 연습 테이블
create table seqexetest(
    seq     number          primary key,
    kind    varchar2(30)    not null,
    grade   char(2)         check(grade IN('A','B','C','D')),
    qty     number          not null,
    price   number          not null
);
select * from seqexetest;
-- 시퀀스 만들기 = 시작시퀀스 3001부터 1씩 증가 | 시퀀스명 seqexetest_seq
-- (중요) 시퀀스명.nextval = 더미데이터 2개 세트 삽입
create sequence seqexetest_seq increment by 1 start with 3001;

insert into seqexetest VALUES (seqexetest_seq.nextval,'ACADEMY','B',10,300);
commit;

-- 오라클 DB에서 제공하는 한 행짜리 테스트 테이블 (=함수 등 결과 테스트용)
select * from dual;
select seqexetest_seq.currval from dual;

-- 시퀀스 삭제
drop sequence z_board_seq;



