--예약테이블 삭제
drop table reservation;
--예약번호 삭제
drop SEQUENCE reservation_reservationNum_seq;
--예약테이블 생성
create table reservation(
  reservationNum NUMBER(10),
  memberId VARCHAR2(20),
  id NUMBER(10),
  reservationDate VARCHAR2(30) not null,
  checkin VARCHAR2(5) not null,
  total NUMBER(2) not null,
  exprnCn VARCHAR2(240), --체험프로그램명
  reservationName VARCHAR2(20) not null,
  reservationTel VARCHAR2(11) not null,
  
  constraint reservation_reservationNum_pk PRIMARY KEY(reservationNum),
  foreign key(memberId) references member(memberId) ON DELETE CASCADE,
  foreign key(id) references village(id) ON DELETE CASCADE
);
--예약번호 생성
create SEQUENCE reservation_reservationNum_seq
increment by 1 --증감치
start with 1 --시작값
maxvalue 9999999999; --최대값

--예약삽입
insert into reservation values(reservation_reservationNum_seq.nextval, 'test1', '2','2021/08/22','13:00',2,'윷놀이','예약자1','01015975385');
insert into reservation values(reservation_reservationNum_seq.nextval, 'test2', '3','2021/08/22','14:00',3,'목공예체험','예약자2','01059475545');
insert into reservation values(reservation_reservationNum_seq.nextval, 'test3', '2','2021/08/23','13:00',3,'윷놀이','예약자3','01088756369');
commit;


--예약조회
select exprnVillageNm,reservationDate,checkin,total,reservation.exprnCn
  from village,reservation,member
 where village.id=reservation.id
   and member.memberId = reservation.memberId
   and reservation.memberId = 'test1';



select * from reservation;

