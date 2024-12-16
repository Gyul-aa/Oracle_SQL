create table member_tbl_test(
    id  varchar2(10) constraint mem2_id_pk primary key,
    email varchar2(20) constraint mem2_email_nn not null,
    tel varchar2(20) constraint mem2_tel_nn not null,
    hobby varchar2(10),
    job varchar2(10),
    age number(3)
);

insert into member_tbl_test values('ezen','ezen@naver.com','010-1234-5678','레고','학생',20);


select * from member_tbl_test;

create SEQUENCE board_test_seq INCREMENT BY 1 START WITH 1;
create SEQUENCE board_test_seq2 INCREMENT BY 1 START WITH 1;

create table board_tbl_test(
    seq  number constraint btt_seq_pk primary key,
    title varchar2(10) constraint btt_title_nn not null,
    name varchar2(10) constraint btt_name_nn not null,
    writedate date,
    viewnum number
);

insert into board_tbl_test values(BOARD_TEST_SEQ.nextval,'제목','김명철','24/02/14',BOARD_TEST_SEQ2.nextval);

select * from board_tbl_test;













