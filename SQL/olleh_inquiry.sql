--문의 테이블 삭제
drop table inquiry;
--문의 번호 삭제
drop SEQUENCE inquiry_inquiryNum_seq;
--문의 테이블 생성
create table inquiry(
  inquiryNum NUMBER(10),
  inquiryType char(1),
  inquiryTitle VARCHAR2(150) not null,
  memberId VARCHAR2(20),
  iCDATE TIMESTAMP default systimestamp not null,
  inquiryContent VARCHAR2(600) not null,
  
  constraint inquiry_inquiryNum_pk PRIMARY KEY(inquiryNum),
  constraint inquiry_inquiryType_ck check(inquiryType in('1','2')),
  foreign key(memberId) references member(memberId) ON DELETE CASCADE
);
--문의 번호 생성
create SEQUENCE inquiry_inquiryNum_seq
increment by 1 --증감치
start with 1 --시작값
maxvalue 9999999999; --최대값

--문의 삽입
insert into inquiry(inquiryNum,inquiryType,inquiryTitle,memberId,iCDATE,inquiryContent) values (inquiry_inquiryNum_seq.nextval,'1','문의 제목1','test1',systimestamp,'예약문의의 문의 본문1');
insert into inquiry(inquiryNum,inquiryType,inquiryTitle,memberId,iCDATE,inquiryContent) values (inquiry_inquiryNum_seq.nextval,'2','문의 제목2','test2',systimestamp,'게시글신고의 문의 본문2');
insert into inquiry(inquiryNum,inquiryType,inquiryTitle,memberId,iCDATE,inquiryContent) values (inquiry_inquiryNum_seq.nextval,'1','문의 제목3','test3',systimestamp,'예약문의의 문의 본문3');
commit;

--문의 조회
select inquiryType,inquiryTitle,inquiryContent
from inquiry, member
where inquiry.memberId = member.memberId 
  and inquiry.memberId = 'test1';


select * from inquiry;