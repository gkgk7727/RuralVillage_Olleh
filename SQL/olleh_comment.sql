--댓글 테이블 삭제
drop table reviewComment;
--댓글 번호 삭제
drop SEQUENCE reviewComment_reviewCommentNum_seq;
--댓글 테이블 생성
create table reviewComment(
  commentNum NUMBER(10),
  reviewNum NUMBER(10),
  memberId VARCHAR2(20),
  CCDATE TIMESTAMP default systimestamp not null,
  CUDATE TIMESTAMP default systimestamp,
  commentContent VARCHAR2(150) not null,
  
  constraint comment_commentNum_pk PRIMARY KEY(commentNum),
  foreign key(memberId) references member(memberId) ON DELETE CASCADE, 
  foreign key(reviewNum) references review(reviewNum) ON DELETE CASCADE
);

--댓글 번호 생성
create SEQUENCE reviewComment_reviewCommentNum_seq
increment by 1 --증감치
start with 1 --시작값
maxvalue 9999999999; --최대값


--댓글 삽입
insert into reviewComment(commentNum,reviewNum,memberId,CCDATE,commentContent) values(reviewComment_reviewCommentNum_seq.nextval,1,'test1',systimestamp,'내용1');  
insert into reviewComment(commentNum,reviewNum,memberId,CCDATE,commentContent) values(reviewComment_reviewCommentNum_seq.nextval,1,'test2',systimestamp,'내용2');
commit;

--댓글 조회
select reviewNum,memberId,commentContent
from reviewComment;

--댓글 수정
update reviewComment
   set commentContent = '수정된 내용1'
 where commentNum = '1' and memberId = 'test1';
commit;

--댓글 삭제
delete from reviewComment
where commentNum = '1' and memberId = 'test1';
rollback; 