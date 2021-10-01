--리뷰테이블 삭제
drop table review;
--리뷰번호 삭제
drop SEQUENCE review_reviewNum_seq;
--리뷰 테이블 생성
create table review (
  reviewNum NUMBER(10),
  reviewTitle VARCHAR2(150) not null,
  memberId VARCHAR2(20),
  RCDATE TIMESTAMP default systimestamp,
  RUDATE TIMESTAMP default systimestamp,
  RHIT NUMBER(5) default 1 not null,
  reviewContent VARCHAR2(600) not null,
  score NUMBER(1) not null,
  id NUMBER(10),
  
  constraint review_reviewNum_pk PRIMARY KEY(reviewNum),
  constraint review_score_ck check(score between 1 and 5),
  foreign key(memberId) references member(memberId) ON DELETE CASCADE,
  foreign key(id) references village(id) ON DELETE CASCADE
);

--리뷰번호 생성
create SEQUENCE review_reviewNum_seq
increment by 1 --증감치
start with 1 --시작값
maxvalue 9999999999; --최대값


select review_reviewNum_seq.nextval from dual;

select review_reviewNum_seq.nextval from dual;
--리뷰 삽입
insert into review(reviewNum,reviewTitle,memberId,RCDATE,reviewContent,score,id) values(
  review_reviewNum_seq.nextval,'제목1','test1',systimestamp,'내용1',5,21);
insert into review(reviewNum,reviewTitle,memberId,RCDATE,reviewContent,score,id) values(
  review_reviewNum_seq.nextval,'제목2','test2',systimestamp,'내용2',4,3);
commit;

--리뷰 조회
select exprnVillageNm, reviewNum, reviewTitle, reviewContent, score, rhit, rcdate,rudate
from review, village
where review.id = village.id;

--내가 쓴 리뷰 목록
select exprnVillageNm,rdnmadr,exprnCn,score
  from review, village
 where review.id = village.id 
   and memberId = 'test1';

--리뷰 조회수 증가
update review
set rhit = rhit+1
where reviewNum = 1;
commit;


commit;

select * from review;
