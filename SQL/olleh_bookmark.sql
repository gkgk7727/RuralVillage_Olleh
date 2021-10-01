--관심리스트 테이블 삭제
drop table bookmark;
--관심리스트번호 삭제
drop SEQUENCE bookmark_bookmarkNum_seq;
--관심리스트 테이블생성
create table bookmark(
  bookmarkNum NUMBER(10),
  memberId VARCHAR2(20),
  id NUMBER(10),
    
  constraint bookmark_bookmarkNum_pk PRIMARY KEY(bookmarkNum),
  foreign key(memberId) references member(memberId) ON DELETE CASCADE,
  foreign key(id) references village(id) ON DELETE CASCADE
);  

--관심리스트번호 생성
create SEQUENCE bookmark_bookmarkNum_seq;

--관심리스트 삽입
insert into bookmark values(bookmark_bookmarkNum_seq.nextval,'test1',2);
insert into bookmark values(bookmark_bookmarkNum_seq.nextval,'test1',3);
commit;

select * from bookmark;

--관심리스트 조회
select exprnVillageNm, rdnmadr, exprnCn
  from bookmark, village
 where bookmark.id = village.id
   and memberId = 'test1';
   
commit;