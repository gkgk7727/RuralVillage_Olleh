--명소테이블 삭제
drop table attraction;
--명소번호 삭제
drop sequence attraction_attractionNum_seq;
--명소테이블 생성
create table attraction(
  attractionNum NUMBER(10),
  attractionName VARCHAR2(48) not null,
  attractionRdnmadr VARCHAR2(70) not null,
  lnmadr VARCHAR2(70),
  attractionLatitude VARCHAR2(20) not null,
  attractionLongitude VARCHAR2(20) not null,
  constraint attraction_attractionNum_pk primary key(attractionNum)
);

--명소번호(attractionNum) 시퀀스 생성
create SEQUENCE attraction_attractionNum_seq;

--명소삽입
insert into attraction values(ATTRACTION_ATTRACTIONNUM_SEQ.nextval,'광화문', '서울 종로구 효자로 12 국립고궁박물관','세종로 1-57 국립고궁박물관','37.575983583321566','126.97689184432832');
insert into attraction values(ATTRACTION_ATTRACTIONNUM_SEQ.nextval,'소양강스카이워크', '강원도 춘천시 근화동 영서로 2675','강원 춘천시 근화동 8-1 소양강스카이워크','37.89381148478998', '127.72361966585704');
insert into attraction values(ATTRACTION_ATTRACTIONNUM_SEQ.nextval,'공지천 벚꽃길', '강원도 춘천시 근화동 692','','37.875573148567916', '127.70895007046889');

--명소 조회
select *
from attraction
where attractionnum = '1';

--전체조회
select *
from attraction;

commit;