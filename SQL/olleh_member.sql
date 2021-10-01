--회원테이블 제거
drop table member;
--회원테이블 생성
create table member(
  memberId VARCHAR2(20) not null,
  memberPw VARCHAR2(16) not null,
  memberName VARCHAR2(15) not null,
  birth DATE not null,
  email varchar2(30) not null,
  tel varchar2(20) not null,
  code number (1) DEFAULT 1,
  withdrawal char(1) DEFAULT 'N',
  withdrawalDate timestamp,
  
  constraint member_memberId_pk primary key(memberId),
  constraint member_memberPw_ck check(length(memberPw) between 8 and 16),
  constraint member_code_ck check(code in(1,2)),
  constraint member_withdrawal check(withdrawal in('Y','N')),
  constraint member_tel_uk unique(tel)
);

ALTER TABLE MEMBER MODIFY(BIRTH VARCHAR2(30));

--회원삽입
insert into member(memberName,birth,memberId,memberPw,email,tel) values('테스터1','19941020','test1','11111111','test1@test.com','01011111111');
insert into member(memberName,birth,memberId,memberPw,email,tel) values('테스터2','19941020','test2','22222222','test2@test.com','01022222222');
insert into member(memberName,birth,memberId,memberPw,email,tel) values('테스터3','19941020','test3','33333333','test3@test.com','01033333333');
insert into member(memberName,birth,memberId,memberPw,email,tel) values('테스터3','19941020','test4','44444444','test4@test.com','01044444444');
commit;
--회원전체조회
select * from member;

--회원조회
select *
from member
where memberId = 'test1';

--ID/PW찾기
select memberId, memberPw, memberName, birth, email, tel
  from member
 where memberName = '테스터4' and tel = '01044444444';
 
--회원수정
update member
   set memberPw = '12345678' , email = 'test4@test.com', tel = '01012345678'
 where memberId = 'test4' and
       memberPw = '44444444';

--회원탈퇴
update member
   set withdrawal = 'Y', withdrawaldate = systimestamp
 where memberId = 'test4' and memberPw = '12345678';

--회원삭제(완전히 삭제)
delete from member
 where memberId = 'test4' and memberPw = '12345678';
 
--회원존재유무
select count(*) from member where memberId = 'test1';

--회원전체조회
select * from member;

--관리자 생성
insert into member(memberName,birth,memberId,memberPw,email,tel,code) 
values('관리자1','19931001','admin','12341234','admin@test.com','01012341234',2);
commit;

delete from member
where memberId = '가나아다ㅏㄹ';
rollback;
