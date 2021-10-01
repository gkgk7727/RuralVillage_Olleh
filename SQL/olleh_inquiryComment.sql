--문의 답변 테이블 삭제
drop table inquiryComment;
--문의 답변 번호 삭제
drop SEQUENCE inquiryComment_inquiryCommentNum_seq;
--문의 답변 테이블 생성
create table inquiryComment(
  inquiryCommentNum NUMBER(10),
  inquiryNum NUMBER(10),
  memberId VARCHAR2(20),
  inquiryCommentTitle  VARCHAR2(150) not null,
  iCCDATE TIMESTAMP default systimestamp not null,
  inquiryCommentContent VARCHAR2(600),
  
  constraint inquiryComment_inquiryCommentNum_pk PRIMARY KEY(inquiryCommentNum),
  foreign key(inquiryNum) references inquiry(inquiryNum) ON DELETE CASCADE,
  foreign key(memberId) references member(memberId) ON DELETE CASCADE
);

--문의 답변 번호 생성
create SEQUENCE inquiryComment_inquiryCommentNum_seq
increment by 1 --증감치
start with 1 --시작값
maxvalue 9999999999; --최대값
--문의 답변 삽입
insert into inquiryComment values(inquiryComment_inquiryCommentNum_seq.nextval, 1, 'test1','문의 답변 제목1', systimestamp, '문의 답변 내용1');
insert into inquiryComment values(inquiryComment_inquiryCommentNum_seq.nextval, 1, 'test2','문의 답변 제목2', systimestamp, '문의 답변 내용2');
insert into inquiryComment values(inquiryComment_inquiryCommentNum_seq.nextval, 1, 'test3','문의 답변 제목3', systimestamp, '문의 답변 내용3');

--전체 문의 답변 조회
select * from inquirycomment;

--문의 답변 조회
select inquiryCommentTitle, inquiryCommentContent
from inquirycomment, member
where member.memberId = inquiryComment.memberId
  and inquiryComment.memberId = 'test1';
commit;