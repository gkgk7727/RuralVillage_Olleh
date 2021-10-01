--코드 테이블 제거
drop table code;
--업로드 파일 테이블 제거
drop table upLoadFile;
--1대1 문의 답변  테이블 제거
drop table inquiryComment;
--1대1 문의 테이블 제거
drop table inquiry;
--리뷰 댓글 테이블 제거
drop table reviewComment;
--리뷰 테이블 제거
drop table review;
--예약 테이블 제거
drop table reservation;
--관심리스트 테이블 제거
drop table bookmark;
--명소 테이블 제거
drop table attraction;
--마을 테이블 제거
drop table village;
--회원 테이블 제거
drop table member;

--파일 번호 삭제
drop SEQUENCE uploadFile_fileNum_seq;
--문의 답변 번호 삭제
drop SEQUENCE inquiryComment_inquiryCommentNum_seq;
--문의 번호 삭제
drop SEQUENCE inquiry_inquiryNum_seq;
--댓글 번호 삭제
drop SEQUENCE reviewComment_reviewCommentNum_seq;
--리뷰번호 삭제
drop SEQUENCE review_reviewNum_seq;
--예약번호 삭제
drop SEQUENCE reservation_reservationNum_seq;
--관심리스트번호 삭제
drop SEQUENCE bookmark_bookmarkNum_seq;
--명소번호 삭제
drop sequence attraction_attractionNum_seq;
--시퀀스삭제(id - 체험마을번호)
drop sequence village_id_seq;







--회원테이블 생성
create table member(
  memberId VARCHAR2(20) not null,
  memberPw VARCHAR2(16) not null,
  memberName VARCHAR2(15) not null,
  birth VARCHAR2(30) not null,
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

--관리자 생성
insert into member(memberName,birth,memberId,memberPw,email,tel,code) values('관리자1','19931001','admin','12341234','admin@test.com','01012341234',2);
--회원 샘플 데이터 삽입
insert into member(memberName,birth,memberId,memberPw,email,tel) values('테스터1','20000916','test1','11111111','test1@test.com','01011111111');
insert into member(memberName,birth,memberId,memberPw,email,tel) values('테스터2','20000916','test2','22222222','test2@test.com','01022222222');
insert into member(memberName,birth,memberId,memberPw,email,tel) values('테스터3','20000916','test3','33333333','test3@test.com','01033333333');
insert into member(memberName,birth,memberId,memberPw,email,tel) values('테스터3','20000916','test4','44444444','test4@test.com','01044444444');
insert into member(memberName,birth,memberId,memberPw,email,tel) values('테스터3','20000916','test5','55555555','test5@test.com','01055555555');
commit;






--마을 테이블 생성
create table village(
  id NUMBER(10), --마을번호
  exprnVillageNm VARCHAR2(150) not null, --마을이름
  homepageUrl VARCHAR2(60) not null, --홈페이지주소
  rprsntvName VARCHAR2(15) not null, --대표자 성명
  phoneNumber varchar2(20) not null, --대표자 연락처
  ctprvnNm VARCHAR2(60) NOT NULL, --시도명
  signguNm VARCHAR2(60) NOT NULL, --시군구명
  exprnSe VARCHAR2(30), --체험프로그램구분
  exprnCn VARCHAR2(240), --체험프로그램명
  rdnmadr VARCHAR2(300) not null,  --도로명주소
  villageLatitude VARCHAR2(20) not null,  --위도
  villageLongitude VARCHAR2(20) not null, --경도
  villageCount number(2) default 10,
  
  constraint village_id_pk primary key(id)
);

--체험 마을 번호(id) 시퀀스 생성
create SEQUENCE village_id_seq
increment by 1 --증감치
start with 1 --시작값
maxvalue 9999999999; --최대값

--체험 마을 샘플 데이터 삽입
insert into village values(village_id_seq.nextval,'모래내행복마을', 'http://www.naver.com', '박성호', '033-653-5268', '강원', '강릉시', '전통문화체험', '마술체험', '강원도 강릉시 사천면 미노길 103', '37.826547', '128.848563',10);
insert into village values(village_id_seq.nextval,'왕산권역마을', 'http://www.wangsan.kr', '정길수', '033-648-7179', '강원', '강릉시', '전통문화체험', '윷놀이', '강원도 강릉시 왕산면 도마길 21', '37.672441', '128.840513',10);
insert into village values(village_id_seq.nextval,'대굴령마을', 'http://www.naver.com', '조춘형', '033-648-0406', '강원', '강릉시', '만들기체험', '목공예체험', '강원도 강릉시 성산면 성연로 17', '37.722952', '128.814977',10);
insert into village values(village_id_seq.nextval,'대기리마을', 'http://www.naver.com', '김홍래', '000-000-0000', '강원', '강릉시', '만들기체험', '감자 쿠키 만들기', '강원도 강릉시 왕산면 왕산로 1327', '37.588164', '128.777003',10);
insert into village values(village_id_seq.nextval,'삽당령고송마을', 'http://www.gscamp.kr', '김연기', '033-644-6161', '강원', '강릉시', '만들기체험', '솟대, 미니화분, 감자피자', '강원도 강릉시 왕산면 왕산로 23-23', '37.519895', '128.847803',10);
insert into village values(village_id_seq.nextval,'소금강마을', 'http://www.naver.com', '황진구', '033-661-0401', '강원', '강릉시', '만들기체험', 'LED청사초롱 만들기', '강원도 강릉시 연곡면 진고개로 1826-11', '37.848233', '128.741332',10);
insert into village values(village_id_seq.nextval,'소금강솔내마을', 'http://www.solnaemall.com', '김창기', '000-000-0000', '강원', '강릉시', '만들기체험', '묵은지손만두체험', '강원도 강릉시 연곡면 진고개로 1123-3', '37.843807', '128.664433',10);
insert into village values(village_id_seq.nextval,'소금강장천마을', 'http://www.naver.com', '강태식', '033-661-4667', '강원', '강릉시', '만들기체험', '꽃부채만들기', '강원도 강릉시 연곡면 진고개로 1502', '37.846496', '128.704649',10);
insert into village values(village_id_seq.nextval,'정감이마을', 'http://www.naver.com', '이규용', '033-645-5114', '강원', '강릉시', '만들기체험', '곶감설기만들기', '강원도 강릉시 강동면 둔지길 81', '37.716841', '128.955951',10);
insert into village values(village_id_seq.nextval,'복사꽃마을', 'http://dohwa.invil.org', '조웅구', '033-661-5207', '강원', '강릉시', '농작물경작체험', '감자캐기', '강원도 강릉시 주문진읍 신리천로 527-3', '37.880021', '128.7770304',10);
insert into village values(village_id_seq.nextval,'한울타리마을', 'http://bdr.invil.org', '이갑수', '000-000-0000', '강원', '강릉시', '농작물경작체험', '감자캐기', '강원도 강릉시 옥계면 풍동로 406', '37.617601', '128.991742',10);
insert into village values(village_id_seq.nextval,'해살이마을', 'http://haesari.invil.org', '권영선', '033-648-8123', '강원', '강릉시', '농작물경작체험', '농사체험(감자캐기)', '강원도 강릉시 사천면 중앙서로 557-1', '37.792917', '128.811019',10);
insert into village values(village_id_seq.nextval,'블루베리마을', 'http://www.naver.com', '이중영', '000-000-0000', '강원', '고성군', '농작물경작체험', '딸기따는 체험행사', '강원도 고성군 간성읍 중두골길 7', '38.38799045', '128.416207',10);
insert into village values(village_id_seq.nextval,'소똥령마을', 'http://www.naver.com', '이남성', '033-681-8126', '강원', '고성군', '농작물경작체험', '감자수확체험', '강원도 고성군 간성읍 소똥령마을길 82', '38.331665', '128.380341',10);
insert into village values(village_id_seq.nextval,'봉정연꽃마을', 'http://5218559.modoo.at', '이홍우', '033-521-8559', '강원', '동해시', '자연생태체험', '꿀벌체험', '강원도 동해시 봉정1길 19-7', '37.473092', '129.124445',10);
insert into village values(village_id_seq.nextval,'청정신흥마을', 'http://www.naver.com', '김영삼', '000-000-0000', '강원', '동해시', '만들기체험', '손두부만들기', '강원도 동해시 서동로 825-4', '37.519659', '129.021081',10);
insert into village values(village_id_seq.nextval,'늘햇살만우농촌마을', 'https://cafe.daum.net/sunhwa587', '류재식', '000-000-0000', '강원', '동해시', '농작물경작체험', '감따기', '강원도 동해시 마상천길 239', '37.563098', '129.075458',10);
insert into village values(village_id_seq.nextval,'고천마을', 'https://blog.naver.com/34choice', '김재수', '000-000-0000', '강원', '삼척시', '전통문화체험', '고추장,된장,막장,메주만들기체험', '강원도 삼척시 미로면 고내로 138-19', '37.419018', '129.063881',10);
insert into village values(village_id_seq.nextval,'너와마을', 'http://neowa.invil.org', '강춘희', '033-552-1659', '강원', '삼척시', '만들기체험', '감자피자만들기', '강원도 삼척시 도계읍 문의재로 1113', '37.183739', '129.129957',10);
insert into village values(village_id_seq.nextval,'미로정원마을', 'http://mirogarden.com/index.htm', '박재진', '033-575-4846', '강원', '삼척시', '만들기체험', '두부체험', '강원도 삼척시 미로면 동안로 540', '37.444076', '129.070681',10);
insert into village values(village_id_seq.nextval,'복동아리마을', 'http://www.naver.com', '이금옥', '033-572-7178', '강원', '삼척시', '만들기체험', '산초비누만들기체험', '강원도 삼척시 가곡면 가곡천로 681-13', '37.140451', '129.149499',10);
insert into village values(village_id_seq.nextval,'신선마을', 'http://www.naver.com', '이광식', '033-576-1222', '강원', '삼척시', '만들기체험', '가시오가피빵 만들기', '강원도 삼척시 노곡면 문의재로 2722', '37.285368', '129.182938',10);
insert into village values(village_id_seq.nextval,'고무릉환선마을', 'http://hwanseon.invil.org', '박경식', '033-541-4800', '강원', '삼척시', '농작물경작체험', '감자캐기', '강원도 삼척시 신기면 고무릉길 49', '37.344616', '129.053589',10);
insert into village values(village_id_seq.nextval,'덕풍계곡마을', 'http://valley.invil.org', '장용택', '033-576-0394', '강원', '삼척시', '농작물경작체험', '감따기체험', '강원도 삼척시 가곡면 풍곡안길 17-18', '37.12468951', '129.155955',10);
insert into village values(village_id_seq.nextval,'도리내마을', 'http://www.naver.com', '박달용', '070-8809-3345', '강원', '삼척시', '농작물경작체험', '고구마 수확체험', '강원도 삼척시 노곡면 박걸남로 373', '37.381112', '129.141922',10);
insert into village values(village_id_seq.nextval,'맹방유채꽃마을', 'http://www.naver.com', '홍광표', '070-4118-0105', '강원', '삼척시', '농작물경작체험', '감자수확체험', '강원도 삼척시 근덕면 삼척로 3906-11', '37.399715', '129.2116798',10);
insert into village values(village_id_seq.nextval,'번천리마을', 'http://www.naver.com', '천길영', '000-000-0000', '강원', '삼척시', '농작물경작체험', '농촌체험', '강원도 삼척시 하장면 두타로 457', '37.368601', '128.999691',10);
insert into village values(village_id_seq.nextval,'산양마을', 'http://sanyang.invil.org', '민만기', '033-572-8658', '강원', '삼척시', '농작물경작체험', '감자 캐기', '강원도 삼척시 원덕읍 산양서원1길 89', '37.141035', '129.280329',10);
insert into village values(village_id_seq.nextval,'판문마을', 'http://www.naver.com', '김경희', '000-000-0000', '강원', '삼척시', '농작물경작체험', '농특산물판매', '강원도 삼척시 하장면 판문길 246', '37.265106', '128.893284',10);
insert into village values(village_id_seq.nextval,'가온밸리(가곡온천휴양마을)', 'http://www.naver.com', '민경범', '033-572-9520', '강원', '삼척시', '건강', '유황온천수족욕체험', '강원도 삼척시 가곡면 가곡천로 1476', '37.150069', '129.205955',10);
insert into village values(village_id_seq.nextval,'척산온천마을', 'http://www.naver.com', '김문득', '000-000-0000', '강원', '속초시', '만들기체험', '계란꾸러미만들기체험', '강원도 속초시 관광로 277', '38.186041', '128.542283',10);
insert into village values(village_id_seq.nextval,'상도문1테마마을', 'http://www.naver.com', '오진석', '000-000-0000', '강원', '속초시', '농작물경작체험', '감자캐기', '강원도 속초시 상도문길 54-2', '38.165187', '128.551708',10);
insert into village values(village_id_seq.nextval,'하도문쌈채마을', 'http://hadomun.invil.org', '정연일', '033-638-3122', '강원', '속초시', '농작물경작체험', '딸기따기체험', '강원도 속초시 설악산로 110', '38.161852', '128.595787',10);
insert into village values(village_id_seq.nextval,'오미마을', 'http://omi.invil.org', '최치남', '033-481-6403', '강원', '양구군', '전통음식체험', '가마솥밥짓기체험', '강원도 양구군 방산면 평화로 4818', '38.188551', '127.923006',10);
insert into village values(village_id_seq.nextval,'국토정중앙배꼽마을', 'http://www.naver.com', '정병삼', '033-481-2011', '강원', '양구군', '만들기체험', '곰취찐빵만들기', '강원도 양구군 남면 국토정중앙로 155-15', '38.068604', '128.033878',10);
insert into village values(village_id_seq.nextval,'약수산채마을', 'http://www.naver.com', '김선묵', '033-481-7011', '강원', '양구군', '만들기체험', '곰취찐빵체험', '강원도 양구군 동면 바랑길 170', '38.209805', '128.067993',10);
insert into village values(village_id_seq.nextval,'지게마을', 'http://www.palrang.co.kr', '이흥준', '000-000-0000', '강원', '양구군', '만들기체험', '가양주체험', '강원도 양구군 동면 바랑길158번길 3', '38.209769', '128.065769',10);
insert into village values(village_id_seq.nextval,'광치마을', 'http://www.naver.com', '박석주', '033-481-7002', '강원', '양구군', '농작물경작체험', '고구마,감자 수확체험', '강원도 양구군 남면 광치령로 1793-5', '38.12866974', '128.049386',10);
insert into village values(village_id_seq.nextval,'두무산촌마을', 'http://www.naver.com', '안용범', '033-481-4355', '강원', '양구군', '농작물경작체험', '꽃 수확체험', '강원도 양구군 남면 관대두무로1058번길 5', '38.041503', '128.082183',10);
insert into village values(village_id_seq.nextval,'박수근마을', 'http://junglimli.co.kr', '함 만흥', '033-482-6767', '강원', '양구군', '농작물경작체험', '농촌체험', '강원도 양구군 양구읍 박수근로 278', '38.097055', '127.984187',10);
insert into village values(village_id_seq.nextval,'엄마품마을', 'http://www.eommapoom.com', '박성순', '000-000-0000', '강원', '양구군', '농작물경작체험', '고구마,땅콩수확', '강원도 양구군 양구읍 고대길 48', '38.144098', '127.981198',10);
insert into village values(village_id_seq.nextval,'송천떡마을', 'http://songcheon.invil.org', '김성완', '033-673-8977', '강원', '양양군', '전통문화체험', '널뛰기,그네타기,디딜방아밟기', '강원도 양양군 서면 떡마을길 107', '38.051669', '128.554432',10);
insert into village values(village_id_seq.nextval,'탁장사마을', 'http://www.naver.com', '함철용', '033-673-2526', '강원', '양양군', '전통문화체험', '탁장사 마당놀이', '강원도 양양군 현북면 어성전길 256', '37.940182', '128.66581',10);
insert into village values(village_id_seq.nextval,'38평화마을', 'http://www.naver.com', '홍기성', '033-671-0305', '강원', '양양군', '자연생태체험', '3.8선숨길체험행사', '강원도 양양군 현북면 쟁기동길 71-20', '37.998932', '128.725217',10);
insert into village values(village_id_seq.nextval,'치래마을', 'http://www.naver.com', '엄주현', '033-671-5880', '강원', '양양군', '자연생태체험', '단풍옛길, 단풍약수 체험', '강원도 양양군 서면 구룡령로 1103-6', '37.910777', '128.502426',10);
insert into village values(village_id_seq.nextval,'금풀애마을', 'http://woniljeon.co.kr', '윤종철', '033-671-3166', '강원', '양양군', '만들기체험', '김치만들기 체험', '강원도 양양군 현북면 남대천로 1532', '37.977494', '128.653468',10);
insert into village values(village_id_seq.nextval,'명지리앵두마을', 'http://www.naver.com', '이근억', '000-000-0000', '강원', '양양군', '만들기체험', '감자 내얼굴 조각하기', '강원도 양양군 현북면 송이로 579', '37.992468', '128.678219',10);
insert into village values(village_id_seq.nextval,'설악산오색마을', 'http://www.naver.com', '임승엽', '000-000-0000', '강원', '양양군', '만들기체험', '도자기만들기체험', '강원도 양양군 서면 백암길 12', '38.075727', '128.5084602',10);
insert into village values(village_id_seq.nextval,'해담마을', 'http://hd.invil.org', '손태영', '033-673-2233', '강원', '양양군', '만들기체험', '너비아니햄버거만들기', '강원도 양양군 서면 구룡령로 2110-17', '37.987883', '128.532466',10);
insert into village values(village_id_seq.nextval,'샘재골송이마을', 'http://www.naver.com', '박재성', '000-000-0000', '강원', '양양군', '농작물경작체험', '농산물 수확 체험', '강원도 양양군 현북면 송이로 245-44', '38.01341952', '128.695065',10);
insert into village values(village_id_seq.nextval,'수동고을마을(지경리)', 'http://www.sudonggol.kr', '이종민', '033-671-4568', '강원', '양양군', '농작물경작체험', '샌드아트', '강원도 양양군 현남면 동해대로 122', '37.924154', '128.797894',10);
insert into village values(village_id_seq.nextval,'자두마을', 'http://www.naver.com', '박용관', '033-673-5900', '강원', '양양군', '농작물경작체험', '농사체험', '강원도 양양군 서면 용소길 89', '38.033282', '128.560168',10);
insert into village values(village_id_seq.nextval,'한별마을', 'http://hanbyul.net/', '김영춘', '033-673-3806', '강원', '양양군', '농작물경작체험', '감자캐기', '강원도 양양군 서면 구룡령로 2402-1', '38.010343', '128.542631',10);
insert into village values(village_id_seq.nextval,'황룡마을', 'http://www.naver.com', '강종구', '033-672-0025', '강원', '양양군', '농작물경작체험', '감자캐기', '강원도 양양군 서면 구룡령로 1782', '37.961519', '128.515022',10);
insert into village values(village_id_seq.nextval,'달래촌마을', 'https://cafe.daum.net/woori2202/', '김주성', '000-000-0000', '강원', '양양군', '건강', '건강체험', '강원도 양양군 현남면 화상천로 634', '37.924422', '128.728435',10);
insert into village values(village_id_seq.nextval,'공기1리마을', 'http://www.naver.com', '박윤희', '000-000-0000', '강원', '영월군', '자연생태체험', '한달살기 프로그램', '강원도 영월군 북면 삼방산길 396', '37.311292', '128.434646',10);
insert into village values(village_id_seq.nextval,'바둑골농촌체험휴양마을', 'http://www.naver.com', '원영호', '033-372-2349', '강원', '영월군', '자연생태체험', '숲속탐방, 공예체험', '강원도 영월군 주천면 바둑골길 11-77', '37.254151', '128.286674',10);
insert into village values(village_id_seq.nextval,'뼝창마을', 'http://dongkangnet.com', '이병대', '000-000-0000', '강원', '영월군', '자연생태체험', '자연생태체험', '강원도 영월군 영월읍 동강로 1488', '37.271065', '128.527558',10);
insert into village values(village_id_seq.nextval,'산솔마을', 'http://www.naver.com', '김진선', '033-378-6989', '강원', '영월군', '자연생태체험', '단풍산등산', '강원도 영월군 중동면 송운길 69', '37.132126', '128.724509',10);
insert into village values(village_id_seq.nextval,'유전리삼굿마을', 'http://3good.invil.org', '주금연', '033-978-8585', '강원', '영월군', '자연생태체험', '가재잡기', '강원도 영월군 중동면 유전길 115', '37.155267', '128.68495',10);
insert into village values(village_id_seq.nextval,'한반도뗏목마을', 'http://www.naver.com', '엄정섭', '000-000-0000', '강원', '영월군', '자연생태체험', '에코뗏목체험', '강원도 영월군 한반도면 선암길 70', '37.222386', '128.346751',10);
insert into village values(village_id_seq.nextval,'밧도내마을', 'http://www.naver.com', '한규호', '000-000-0000', '강원', '영월군', '만들기체험', '전통음식만들기', '강원도 영월군 주천면 밧도내길 11-36', '37.291535', '128.236444',10);
insert into village values(village_id_seq.nextval,'요선마을', 'http://www.sujulove.co.kr', '성홍기', '033-372-2882', '강원', '영월군', '만들기체험', '김치체험', '강원도 영월군 무릉도원면 명마동길 44-37', '37.285416', '128.280767',10);
insert into village values(village_id_seq.nextval,'태화산체험마을', 'http://taehwasan.co.kr/', '박종국', '033-375-9957', '강원', '영월군', '만들기체험', '4D 종이공예, 내가 만드는 DIY동화, 돔라이트', '강원도 영월군 영월읍 흥월로 149-49', '37.143725', '128.462276',10);
insert into village values(village_id_seq.nextval,'운학삼돌이마을', 'https://cafe.naver.com/haksancheon', '안충선', '033-374-1201', '강원', '영월군', '레포츠', '가족카누타기', '강원도 영월군 무릉도원면 덕은골길 6', '37.326971', '128.1898204',10);
insert into village values(village_id_seq.nextval,'예밀촌마을', 'http://www.yemilchon.co.kr', '정정근', '033-375-3720', '강원', '영월군', '농작물경작체험', '나만의 와인 만들기', '강원도 영월군 김삿갓면 예밀촌길 229-4', '37.141769', '128.590485',10);
insert into village values(village_id_seq.nextval,'예밀포도마을', 'http://www.naver.com', '신동익', '033-372-7422', '강원', '영월군', '농작물경작체험', '감자캐기체험', '강원도 영월군 김삿갓면 포도마을길 1-30', '37.134025', '128.573714',10);
insert into village values(village_id_seq.nextval,'하늘샘마을', 'http://www.naver.com', '신길하', '000-000-0000', '강원', '영월군', '농작물경작체험', '토마토, 자두수확', '강원도 영월군 북면 하늘샘길 17', '37.243446', '128.425482',10);
insert into village values(village_id_seq.nextval,'황금마차마을', 'http://www.naver.com', '김현필', '000-000-0000', '강원', '영월군', '농작물경작체험', '농산물수확체험', '강원도 영월군 북면 밤재로 231-9', '37.257415', '128.455015',10);
insert into village values(village_id_seq.nextval,'늘보마을', 'http://www.naver.com', '주인섭', '000-000-0000', '강원', '영월군', '기타', '옥동적별체험, 식도락체험, 백패킹', '강원도 영월군 김삿갓면 옥동장터길 11', '37.124046', '128.568724',10);
insert into village values(village_id_seq.nextval,'청정학곡마을', 'http://www.hakgok.kr', '안주언', '033-731-8883', '강원', '원주시', '전통음식체험', '곤드레밥', '강원도 원주시 소초면 구룡사로 7', '37.437046', '128.057473',10);
insert into village values(village_id_seq.nextval,'손위실마을', 'http://www.naver.com', '송치호', '000-000-0000', '강원', '원주시', '전통문화체험', '마을역사탐방순례', '강원도 원주시 부론면 잣나무골길 16-14', '37.225473', '127.783922',10);
insert into village values(village_id_seq.nextval,'삼송마을', 'http://www.naver.com', '이영모', '033-765-3381', '강원', '원주시', '만들기체험', '찐빵만들기', '강원도 원주시 신림면 송계로 17', '37.26337013', '128.1925997',10);
insert into village values(village_id_seq.nextval,'성황림마을', 'http://www.naver.com', '고계환', '033-763-7657', '강원', '원주시', '만들기체험', '곤드레비빔밥체험', '강원도 원주시 신림면 성남로 345', '37.274074', '128.080151',10);
insert into village values(village_id_seq.nextval,'승안동마을', 'https://cafe.naver.com/deaanri', '신영규', '033-763-6112', '강원', '원주시', '만들기체험', '김장체험', '강원도 원주시 흥업면 승안동길 146-6', '37.31054045', '127.881344',10);
insert into village values(village_id_seq.nextval,'꽃양귀비마을', 'http://www.naver.com', '김정윤', '033-764-4443', '강원', '원주시', '농작물경작체험', '꽃양귀비,사과따기,숲체험,농산물수확', '강원도 원주시 판부면 내동막길 35-12', '37.293401', '127.946027',10);
insert into village values(village_id_seq.nextval,'섬강매향골마을', 'http://www.sgmh.kr', '이하섭', '033-731-4555', '강원', '원주시', '농작물경작체험', '감자캐기', '강원도 원주시 호저면 칠봉로 358-85', '37.425554', '127.898565',10);
insert into village values(village_id_seq.nextval,'연봉정마을', 'http://www.yeonbongjung.co.kr', '조석희', '033-762-8005', '강원', '원주시', '농작물경작체험', '고구마캐기', '강원도 원주시 신림면 연봉정길 48-18', '37.203101', '128.102692',10);
insert into village values(village_id_seq.nextval,'용소막마을', 'https://cafe.daum.net/ysm.co.kr', '이찬규', '033-763-5330', '강원', '원주시', '농작물경작체험', '고구마농사체험', '강원도 원주시 신림면 구학산로 1831', '37.210877', '128.0864304',10);
insert into village values(village_id_seq.nextval,'황둔마을', 'http://www.naver.com', '김광수', '033-765-5136', '강원', '원주시', '농작물경작체험', '감자캐고. 옥수수꺽기', '강원도 원주시 신림면 오미로 810-1', '37.252134', '128.194296',10);
insert into village values(village_id_seq.nextval,'솔미마을', 'https://cafe.daum.net/thfalakdmf', '신기영', '000-000-0000', '강원', '원주시', '건강', '남한강변트래킹', '강원도 원주시 부론면 부론로 544', '37.168149', '127.769408',10);
insert into village values(village_id_seq.nextval,'남교선녀마을', 'http://www.naver.com', '전흥수', '000-000-0000', '강원', '인제군', '전통문화체험', '대보름놀이', '강원도 인제군 북면 미시령옛길 140', '38.216733', '128.4205296',10);
insert into village values(village_id_seq.nextval,'고로쇠마을', 'http://misan.invil.org', '김만수', '033-463-9036', '강원', '인제군', '자연생태체험', '개인약수생태탐방로등반', '강원도 인제군 상남면 내린천로 1477', '37.863967', '128.329277',10);
insert into village values(village_id_seq.nextval,'달빛소리마을', 'http://www.mv01.co.kr', '심규식', '033-463-0222', '강원', '인제군', '자연생태체험', '송어잡기체험', '강원도 인제군 북면 금강로 537', '38.158945', '128.211531',10);
insert into village values(village_id_seq.nextval,'신월리달뜨는마을', 'http://www.sinwol.net', '손영식', '000-000-0000', '강원', '인제군', '자연생태체험', '통발 민물새우잡기 체험', '강원도 인제군 남면 신월로 414', '38.027473', '128.074099',10);
insert into village values(village_id_seq.nextval,'용늪마을', 'http://ynm.modoo.at', '유정호', '033-463-7500', '강원', '인제군', '자연생태체험', '대암산용늪생태탐방', '강원도 인제군 서화면 금강로 1106-27', '38.19721031', '128.2099696',10);
insert into village values(village_id_seq.nextval,'용늪대바위마을', 'http://www.naver.com', '박희춘', '000-000-0000', '강원', '인제군', '산촌생활체험', '고로쇠수액체험', '강원도 인제군 서화면 금강로 1051', '38.193395', '128.206505',10);
insert into village values(village_id_seq.nextval,'방방마을', 'http://www.naver.com', '전명식', '000-000-0000', '강원', '인제군', '만들기체험', 'EM천연비누만들기', '강원도 인제군 기린면 방태산길 7', '37.94841041', '128.383881',10);
insert into village values(village_id_seq.nextval,'백담마을', 'http://baekdam.invil.org/', '정연배', '033-462-4609', '강원', '인제군', '만들기체험', '나만의 물병만들기', '강원도 인제군 북면 만해로 410-17', '38.194856', '128.345295',10);
insert into village values(village_id_seq.nextval,'보랏빛산채마을', 'http://www.naver.com', '임성재', '000-000-0000', '강원', '인제군', '만들기체험', '곰취짱아찌만들기', '강원도 인제군 상남면 자포대길 13', '37.8452399', '128.2416598',10);
insert into village values(village_id_seq.nextval,'산양마을', 'http://www.naver.com', '이희복', '000-000-0000', '강원', '인제군', '만들기체험', '떡메치기', '강원도 인제군 인제읍 한석산로 1631-14', '38.061557', '128.325663',10);
insert into village values(village_id_seq.nextval,'진동계곡마을', 'http://www.jindongri.kr', '이성익', '000-000-0000', '강원', '인제군', '만들기체험', 'EM 천연 벌레퇴치제', '강원도 인제군 기린면 조침령로 1071-1', '37.963392', '128.406364',10);
insert into village values(village_id_seq.nextval,'햇살마을', 'http://www.naver.com', '전흥식', '033-462-2323', '강원', '인제군', '만들기체험', '발효효소 담그기체험', '강원도 인제군 남면 자작나무숲길 743-36', '38.012872', '128.194145',10);
insert into village values(village_id_seq.nextval,'드론마을정자리', 'http://www.naver.com', '우주헌', '000-000-0000', '강원', '인제군', '레포츠', '드론교육체험', '강원도 인제군 남면 부평정자로 1555', '37.950127', '128.194119',10);
insert into village values(village_id_seq.nextval,'황태마을', 'http://www.yongdaeri.com', '이영용', '033-462-4805', '강원', '인제군', '레포츠', '빙벽등반', '강원도 인제군 북면 황태길 372-13', '38.221114', '128.371463',10);
insert into village values(village_id_seq.nextval,'냇강마을', 'http://wolhakri.go2vil.org/', '박수홍', '033-463-9928', '강원', '인제군', '농작물경작체험', '감자수확', '강원도 인제군 북면 냇강마을로 171', '38.138779', '128.196579',10);
insert into village values(village_id_seq.nextval,'마의태자권역마을', 'http://www.naver.com', '이철구', '033-461-0228', '강원', '인제군', '농작물경작체험', '농작물수확체험(감자,옥수수등)', '강원도 인제군 상남면 김부대왕로 2390', '37.88110958', '128.257235',10);
insert into village values(village_id_seq.nextval,'송학마을', 'http://www.naver.com', '김원춘', '000-000-0000', '강원', '인제군', '농작물경작체험', '농사체험', '강원도 인제군 북면 금강로 769', '38.172809', '128.205571',10);
insert into village values(village_id_seq.nextval,'평화마을', 'http://www.naver.com', '박광주', '000-000-0000', '강원', '인제군', '농작물경작체험', '농사체험', '강원도 인제군 서화면 서화길 36', '38.253904', '128.207563',10);
insert into village values(village_id_seq.nextval,'하늘여울소치마을', 'http://www.naver.com', '김명환', '033-462-6563', '강원', '인제군', '농작물경작체험', '감자캐기', '강원도 인제군 남면 부평정자로 780-5', '37.958903', '128.133629',10);
insert into village values(village_id_seq.nextval,'하추리산촌마을', 'http://hachu.invil.org', '윤종욱', '070-4404-4481', '강원', '인제군', '농작물경작체험', '농사체험', '강원도 인제군 인제읍 하추로 187', '38.019628', '128.2817797',10);
insert into village values(village_id_seq.nextval,'곰배령설피마을', 'http://www.naver.com', '양승남', '000-000-0000', '강원', '인제군', '건강', '곰배령탐방', '강원도 인제군 기린면 설피밭길 434', '38.018688', '128.474653',10);
insert into village values(village_id_seq.nextval,'두메마을덕적리영농조합법인(덕적리)', 'http://www.naver.com', '주인근', '033-461-7121', '강원', '인제군', '건강', '숙박(숲)체험', '강원도 인제군 인제읍 한석산로 704', '38.078378', '128.2435696',10);
insert into village values(village_id_seq.nextval,'자작나무마을', 'http://www.naver.com', '정병용', '000-000-0000', '강원', '인제군', '건강', '자작나무숲트레킹', '강원도 인제군 인제읍 회동길 8', '38.001952', '128.233913',10);
insert into village values(village_id_seq.nextval,'백두대간약초마을', 'http://www.naver.com', '안만기', '000-000-0000', '강원', '정선군', '전통문화체험', '떡메치기체험', '강원도 정선군 임계면 눈꽃마을길 178-30', '37.502522', '128.907923',10);
insert into village values(village_id_seq.nextval,'개미들마을', 'http://ant.invil.org', '최법순', '070-8876-9991', '강원', '정선군', '자연생태체험', '계곡체험', '강원도 정선군 남면 광락로 354', '37.318964', '128.692748',10);
insert into village values(village_id_seq.nextval,'설레는마을', 'http://www.naver.com', '김동관', '000-000-0000', '강원', '정선군', '자연생태체험', '물고기잡기', '강원도 정선군 임계면 장찬동길 439-67', '37.469084', '128.882766',10);
insert into village values(village_id_seq.nextval,'초향산골짜기마을', 'http://www.naver.com', '김인규', '000-000-0000', '강원', '정선군', '자연생태체험', '송어잡기, 풍경차 투어', '강원도 정선군 남면 영곡길 414', '37.298927', '128.678965',10);
insert into village values(village_id_seq.nextval,'달뜨락마을', 'http://www.naver.com', '김인배', '033-563-2007', '강원', '정선군', '산촌생활체험', '산채채취체험', '강원도 정선군 정선읍 가내길 16', '37.404798', '128.593144',10);
insert into village values(village_id_seq.nextval,'365행복마을', 'http://www.naver.com', '변석종', '033-562-1365', '강원', '정선군', '만들기체험', '곤드레밥 체험', '강원도 정선군 북평면 장열길 83-2', '37.456497', '128.683133',10);
insert into village values(village_id_seq.nextval,'덕우리마을', 'http://www.naver.com', '김광진', '033-562-9001', '강원', '정선군', '만들기체험', '감자전만들기', '강원도 정선군 정선읍 대촌길 56', '37.364044', '128.715579',10);
insert into village values(village_id_seq.nextval,'동강할미꽃마을', 'http://www.naver.com', '박재열', '000-000-0000', '강원', '정선군', '농작물경작체험', '농촌체험', '강원도 정선군 정선읍 동강로 2500', '37.341185', '128.615145',10);
insert into village values(village_id_seq.nextval,'로하스마을', 'http://www.naver.com', '김영희', '033-563-1256', '강원', '정선군', '농작물경작체험', '농산물 수확 체험', '강원도 정선군 정선읍 돌다리길 11', '37.397096', '128.667774',10);
insert into village values(village_id_seq.nextval,'석곡2리산골마을', 'http://www.naver.com', '박종렬', '000-000-0000', '강원', '정선군', '농작물경작체험', '메주만들기, 사과따기, 물고기(뚜구리) 잡기', '강원도 정선군 화암면 소금강로 204', '37.350475', '128.733859',10);
insert into village values(village_id_seq.nextval,'솔돌마을', 'http://soldol.invil.org', '윤종국', '033-562-3727', '강원', '정선군', '농작물경작체험', '벼베기체험', '강원도 정선군 북평면 와가길 25', '37.431733', '128.660265',10);
insert into village values(village_id_seq.nextval,'억새마을', 'http://www.naver.com', '문병수', '033-591-1768', '강원', '정선군', '농작물경작체험', '농사체험', '강원도 정선군 남면 민둥산로 142', '37.257635', '128.788749',10);
insert into village values(village_id_seq.nextval,'정선곤드레마을', 'http://www.naver.com', '전승일', '000-000-0000', '강원', '정선군', '농작물경작체험', '농촌체험', '강원도 정선군 화암면 소금강로 1511', '37.323686', '128.808117',10);
insert into village values(village_id_seq.nextval,'금강산철길마을', 'http://www.naver.com', '장기환', '000-000-0000', '강원', '철원군', '자연생태체험', '안보체험, 두부만들기 및 식사', '강원도 철원군 갈말읍 금강산로 1737', '38.289703', '127.340003',10);
insert into village values(village_id_seq.nextval,'누에마을', 'http://nue.invil.org', '신재일', '033-458-2584', '강원', '철원군', '만들기체험', '김장체험', '강원도 철원군 근남면 도덕동길 13', '38.165468', '127.459863',10);
insert into village values(village_id_seq.nextval,'두루미자는버들골마을', 'http://2gili.kr/', '김종연', '000-000-0000', '강원', '철원군', '만들기체험', '고추장담그기체험', '강원도 철원군 동송읍 금강산로 1556', '38.283176', '127.320933',10);
insert into village values(village_id_seq.nextval,'두루미평화마을', 'http://dmz.invil.org', '최춘석', '033-455-2300', '강원', '철원군', '만들기체험', '두부만들기체험', '강원도 철원군 철원읍 묘장로 301', '38.264823', '127.169186',10);
insert into village values(village_id_seq.nextval,'자누리마을', 'http://www.naver.com', '김명남', '033-458-7004', '강원', '철원군', '만들기체험', '오디따기 체험', '강원도 철원군 서면 태봉로 465-83', '38.162129', '127.411043',10);
insert into village values(village_id_seq.nextval,'철새마을영농조합법인', 'https://blog.naver.com/kimys58000', '정희섭', '033-452-9194', '강원', '철원군', '만들기체험', '두부, 미니솟대, 밀랍초, 나만의 컵', '강원도 철원군 동송읍 양지3길 13-30', '38.268514', '127.283792',10);
insert into village values(village_id_seq.nextval,'학마을', 'http://www.naver.com', '박명선', '033-455-2010', '강원', '철원군', '만들기체험', '고추장만들기체험', '강원도 철원군 동송읍 오덕로 196', '38.224536', '127.236399',10);
insert into village values(village_id_seq.nextval,'무네미고향마을', 'http://www.naver.com', '김경자', '033-458-1147', '강원', '철원군', '농작물경작체험', '농사체험', '강원도 철원군 서면 대성로 218', '38.252512', '127.455089',10);
insert into village values(village_id_seq.nextval,'천지자연마을', 'http://www.naver.com', '최우범', '033-455-5015', '강원', '철원군', '농작물경작체험', '농산물 수확 체험', '강원도 철원군 동송읍 강회동길 154-5', '38.226275', '127.254724',10);
insert into village values(village_id_seq.nextval,'토성민속마을', 'http://www.naver.com', '진수천', '070-8801-1204', '강원', '철원군', '농작물경작체험', '농촌체험', '강원도 철원군 갈말읍 토성길 98', '38.244925', '127.343095',10);
insert into village values(village_id_seq.nextval,'행복산촌텃골마을', 'http://www.naver.com', '김도용', '033-452-5783', '강원', '철원군', '농작물경작체험', '고구마캐기(감자)', '강원도 철원군 갈말읍 텃골1길 51', '38.18996003', '127.371213',10);
insert into village values(village_id_seq.nextval,'다람이마을', 'http://www.naver.com', '박제철', '033-242-6179', '강원', '춘천시', '전통문화체험', '관혼상제 인성교육', '강원도 춘천시 북산면 장재골길 12-32', '37.996652', '127.877877',10);
insert into village values(village_id_seq.nextval,'가래골마을', 'http://www.naver.com', '안영우', '000-000-0000', '강원', '춘천시', '만들기체험', '가마솥 두부만들기', '강원도 춘천시 북산면 춘양로 1506', '38.029512', '127.880074',10);
insert into village values(village_id_seq.nextval,'금옥골마을', 'http://www.naver.com', '안길현', '000-000-0000', '강원', '춘천시', '만들기체험', '보리빵체험', '강원도 춘천시 동면 금옥길 297', '37.925192', '127.807239',10);
insert into village values(village_id_seq.nextval,'누리삼마을', 'http://nurisam.co.kr', '황정식', '033-243-7350', '강원', '춘천시', '만들기체험', '건강밥상', '강원도 춘천시 북산면 원동조교로 601-45', '37.939931', '127.943609',10);
insert into village values(village_id_seq.nextval,'대룡산해맞이마을', 'http://www.naver.com', '지무현', '000-000-0000', '강원', '춘천시', '만들기체험', '김장체험', '강원도 춘천시 동내면 금촌로 84-42', '37.851887', '127.785619',10);
insert into village values(village_id_seq.nextval,'대추나무골마을', 'http://www.naver.com', '함중철', '033-243-7812', '강원', '춘천시', '만들기체험', '감자 삼굿구이 체험', '강원도 춘천시 사북면 대추나무길 43', '38.048263', '127.603452',10);
insert into village values(village_id_seq.nextval,'물안골마을', 'http://www.naver.com', '김화자', '000-000-0000', '강원', '춘천시', '만들기체험', '김장체험', '강원도 춘천시 북산면 삼막길 59', '37.971611', '127.854495',10);
insert into village values(village_id_seq.nextval,'박사마을', 'http://ccbs.invil.org', '양우석', '033-250-4110', '강원', '춘천시', '만들기체험', '감자떡및 만두만들기체험', '강원도 춘천시 서면 당산1길 7', '37.897035', '127.669238',10);
insert into village values(village_id_seq.nextval,'복사꽃수레마을', 'http://www.naver.com', '고민성', '000-000-0000', '강원', '춘천시', '만들기체험', '두부, 막국수, 장만들기', '강원도 춘천시 동내면 대룡산길 32', '37.839685', '127.766752',10);
insert into village values(village_id_seq.nextval,'섬배마을', 'http://seombae.invil.org/', '김일상', '033-261-4460', '강원', '춘천시', '만들기체험', '목화인형 만들기, 오이따기체험', '강원도 춘천시 남산면 섬배안길 65', '37.745941', '127.675337',10);
insert into village values(village_id_seq.nextval,'온새미마을', 'https://cafe.naver.com/leesaooo', '박영준', '000-000-0000', '강원', '춘천시', '만들기체험', '가양주 만들기', '강원도 춘천시 사북면 아랫말길 9', '38.048668', '127.615924',10);
insert into village values(village_id_seq.nextval,'원평팜스테이마을', 'http://www.naver.com', '양찬식', '033-243-3431', '강원', '춘천시', '만들기체험', '감자채피자만들기', '강원도 춘천시 사북면 말고개길 82-35', '38.003676', '127.628434',10);
insert into village values(village_id_seq.nextval,'은행나무마을', 'http://www.naver.com', '홍재춘', '033-241-1564', '강원', '춘천시', '만들기체험', '김장체험, 삼굿체험', '강원도 춘천시 동면 가산로 45', '37.908125', '127.781244',10);
insert into village values(village_id_seq.nextval,'강언덕부엉이마을', 'http://www.handeok.kr', '전종선', '033-263-7775', '강원', '춘천시', '농작물경작체험', '농사체험', '강원도 춘천시 남면 한덕발산길 44', '37.678348', '127.6137303',10);
insert into village values(village_id_seq.nextval,'고탄산들미마을', 'http://www.naver.com', '이행재', '000-000-0000', '강원', '춘천시', '농작물경작체험', '감자캐기 체험', '강원도 춘천시 사북면 춘화로 485', '37.988478', '127.7042601',10);
insert into village values(village_id_seq.nextval,'명월마을', 'http://www.naver.com', '이만재', '000-000-0000', '강원', '춘천시', '농작물경작체험', '떡메치기, 김장체험, 감자캐기체험', '강원도 춘천시 서면 명월길 410', '37.880222', '127.6370097',10);
insert into village values(village_id_seq.nextval,'솔바우마을', 'http://solbau.invil.org', '홍성수', '033-250-3460', '강원', '춘천시', '농작물경작체험', '감자심기', '강원도 춘천시 사북면 솔바우길 195', '37.995824', '127.686463',10);
insert into village values(village_id_seq.nextval,'수리봉마을', 'http://www.naver.com', '김석포', '000-000-0000', '강원', '춘천시', '농작물경작체험', '감자캐기', '강원도 춘천시 사북면 영서로 4595-5', '38.019821', '127.636602',10);
insert into village values(village_id_seq.nextval,'용화산양통마을', 'http://www.naver.com', '한경수', '000-000-0000', '강원', '춘천시', '농작물경작체험', '감자, 고구마, 옥수수 수확체험', '강원도 춘천시 사북면 매산골길 8-17', '37.986733', '127.733408',10);
insert into village values(village_id_seq.nextval,'강촌바일마을', 'http://www.naver.com', '이해성', '000-000-0000', '강원', '춘천시', '건강', '숯가마체험', '강원도 춘천시 남산면 풀무골길 13', '37.795252', '127.642422',10);
insert into village values(village_id_seq.nextval,'한강의아침마을', 'http://www.naver.com', '신민옥', '000-000-0000', '강원', '태백시', '레포츠', '검룡소 트레킹 보물찾기', '강원도 태백시 백두대간로 783-11', '37.241485', '128.982204',10);
insert into village values(village_id_seq.nextval,'구문소마을', 'http://www.naver.com', '정춘교', '033-581-8600', '강원', '태백시', '농작물경작체험', '고추장만들기', '강원도 태백시 사군드리길 7', '37.093246', '129.037977',10);
insert into village values(village_id_seq.nextval,'광천마을', 'http://daehwa6.modoo.at', '임종길', '000-000-0000', '강원', '평창군', '자연생태체험', '광천 동굴 체험', '강원도 평창군 대화면 고대동길 193', '37.520606', '128.449101',10);
insert into village values(village_id_seq.nextval,'어름치마을', 'http://www.mahari.kr', '김정하', '033-332-1260', '강원', '평창군', '자연생태체험', '동강래프팅', '강원도 평창군 미탄면 마하길 41-5', '37.291636', '128.541088',10);
insert into village values(village_id_seq.nextval,'고랭지만두마을', 'http://www.naver.com', '이은종', '000-000-0000', '강원', '평창군', '만들기체험', '김장 체험', '강원도 평창군 대관령면 갈골길 33-5', '37.690251', '128.691949',10);
insert into village values(village_id_seq.nextval,'눈꽃마을', 'http://www.snowtown.co.kr', '강환문', '033-333-3301', '강원', '평창군', '만들기체험', '고냉지김치체험', '강원도 평창군 대관령면 차항길 11', '37.688005', '128.693942',10);
insert into village values(village_id_seq.nextval,'백옥마을', 'http://www.naver.com', '전동택', '000-000-0000', '강원', '평창군', '만들기체험', '꽃차체험', '강원도 평창군 용평면 백옥포길 24', '37.586263', '128.409232',10);
insert into village values(village_id_seq.nextval,'산채으뜸마을', 'http://www.sanchae.co.kr', '전일용', '033-333-5009', '강원', '평창군', '만들기체험', '김치체험', '강원도 평창군 평창읍 대골길 5', '37.312945', '128.344483',10);
insert into village values(village_id_seq.nextval,'소도둑놈마을', 'http://sododuk.modoo.at', '김일동', '033-336-7780', '강원', '평창군', '만들기체험', '감자떡만들기', '강원도 평창군 진부면 경강로 3346-9', '37.643871', '128.537883',10);
insert into village values(village_id_seq.nextval,'수동마을', 'http://www.naver.com', '조수행', '000-000-0000', '강원', '평창군', '만들기체험', '삼굿구이', '강원도 평창군 방림면 고원로 1233-33', '37.454558', '128.345684',10);
insert into village values(village_id_seq.nextval,'약초마을', 'http://www.naver.com', '이경수', '033-335-0700', '강원', '평창군', '만들기체험', '감자옹심이', '강원도 평창군 진부면 방아다리로 348', '37.687917', '128.560363',10);
insert into village values(village_id_seq.nextval,'의야지바람마을', 'http://windvil.invil.org', '한기연', '033-336-9812', '강원', '평창군', '만들기체험', '피자, 아이스크림만들기', '강원도 평창군 대관령면 사부랑길 8', '37.689007', '128.713932',10);
insert into village values(village_id_seq.nextval,'황토구들마을', 'http://htgdv.modoo.at', '김태겸', '033-334-7442', '강원', '평창군', '만들기체험', '구들아궁이백숙체험', '강원도 평창군 용평면 의풍포길 23-10', '37.574807', '128.402391',10);
insert into village values(village_id_seq.nextval,'흰구름산촌마을', 'http://wcloud.modoo.at', '유인배', '033-333-0034', '강원', '평창군', '만들기체험', '공예체험', '강원도 평창군 미탄면 창터길 29-10', '37.331535', '128.5374798',10);
insert into village values(village_id_seq.nextval,'배두둑마을', 'http://www.700farmstay.com/', '오순녀', '033-333-8614', '강원', '평창군', '레포츠', '감성체험', '강원도 평창군 대화면 선애길 90', '37.473813', '128.402503',10);
insert into village values(village_id_seq.nextval,'해락촌마을', 'http://ohstarvillage.com', '정석교', '033-333-0069', '강원', '평창군', '레포츠', 'atv산악체험', '강원도 평창군 평창읍 고길천로 123', '37.369915', '128.439248',10);
insert into village values(village_id_seq.nextval,'기화코끼리농촌체험휴양마을협의회', 'http://www.naver.com', '이용국', '000-000-0000', '강원', '평창군', '농작물경작체험', '농산물 수확', '강원도 평창군 미탄면 평창동강로 471-22', '37.305403', '128.538594',10);
insert into village values(village_id_seq.nextval,'도사산촌마을', 'http://www.naver.com', '이부한', '000-000-0000', '강원', '평창군', '농작물경작체험', '농촌체험', '강원도 평창군 용평면 도사길 273', '37.630349', '128.444128',10);
insert into village values(village_id_seq.nextval,'별천지마을', 'http://www.motgol.kr', '곽정수', '000-000-0000', '강원', '평창군', '농작물경작체험', '감자캐기', '강원도 평창군 평창읍 고길천로 789', '37.413669', '128.477377',10);
insert into village values(village_id_seq.nextval,'봉황마을', 'http://www.naver.com', '김정수', '000-000-0000', '강원', '평창군', '농작물경작체험', '고랭지배추김장만들기', '강원도 평창군 대화면 금당계곡로 824', '37.486401', '128.390961',10);
insert into village values(village_id_seq.nextval,'서시래연화마을', 'http://www.naver.com', '조숙자', '000-000-0000', '강원', '평창군', '농작물경작체험', '농산물 수확체험', '강원도 평창군 미탄면 창절터길 4', '37.333492', '128.5123695',10);
insert into village values(village_id_seq.nextval,'청옥산깨비마을', 'http://www.naver.com', '권대섭', '000-000-0000', '강원', '평창군', '농작물경작체험', '농산물 수확체험', '강원도 평창군 미탄면 수리재길 21', '37.367829', '128.485359',10);
insert into village values(village_id_seq.nextval,'정겨운마을', 'https://blog.naver.com/pbj0373/', '안찬규', '000-000-0000', '강원', '홍천군', '자연생태체험', '가령폭포경유 산림욕,등산', '강원도 홍천군 내촌면 장수원로 1050', '37.811427', '128.130359',10);
insert into village values(village_id_seq.nextval,'홍천동키마을', 'http://www.naver.com', '김도형', '033-432-6766', '강원', '홍천군', '자연생태체험', '강변체험', '강원도 홍천군 화촌면 구룡령로 149', '37.750384', '127.957826',10);
insert into village values(village_id_seq.nextval,'무궁화마을', 'http://www.mgh.co.kr', '이강목', '033-434-4677', '강원', '홍천군', '만들기체험', '3색송편만들기', '강원도 홍천군 서면 밤벌길19번길 47', '37.696843', '127.597703',10);
insert into village values(village_id_seq.nextval,'바회마을', 'http://www.naver.com', '홍성애', '033-435-1960', '강원', '홍천군', '만들기체험', '감자옹심이만들기', '강원도 홍천군 두촌면 광석로 922-8', '37.885682', '128.099594',10);
insert into village values(village_id_seq.nextval,'복주머니마을', 'http://www.naver.com', '박종한', '000-000-0000', '강원', '홍천군', '만들기체험', '꽃차만들기', '강원도 홍천군 서면 개야마을길 73', '37.694599', '127.629856',10);
insert into village values(village_id_seq.nextval,'살둔마을', 'http://saldun.invil.org', '조순택', '033-434-3798', '강원', '홍천군', '레포츠', '래프팅', '강원도 홍천군 내면 내린천로 638', '37.833375', '128.376415',10);
insert into village values(village_id_seq.nextval,'약수봉마을', 'http://www.naver.com', '김동근', '000-000-0000', '강원', '홍천군', '농작물경작체험', '농산물 수확 체험', '강원도 홍천군 동면 신봉논골길 55-5', '37.685699', '127.975255',10);
insert into village values(village_id_seq.nextval,'열목어마을', 'http://www.mgrbest.com', '김광수', '033-435-7557', '강원', '홍천군', '농작물경작체험', '감자 캐기', '강원도 홍천군 내면 명개로 98', '37.850015', '128.505858',10);
insert into village values(village_id_seq.nextval,'용오름마을', 'http://www.naver.com', '이용운', '033-436-0732', '강원', '홍천군', '농작물경작체험', '고로쇠 채취 체험', '강원도 홍천군 서석면 검산길 263', '37.720881', '128.2361904',10);
insert into village values(village_id_seq.nextval,'청솔내마을', 'http://www.naver.com', '박영록', '000-000-0000', '강원', '홍천군', '농작물경작체험', '농산물 수확 체험', '강원도 홍천군 서석면 청량로 210-4', '37.678319', '128.2077001',10);
insert into village values(village_id_seq.nextval,'팔봉청삼골돌배마을', 'http://www.naver.com', '최진현', '000-000-0000', '강원', '홍천군', '농작물경작체험', '고구마 이야기', '강원도 홍천군 서면 팔봉강변길 217', '37.697137', '127.710362',10);
insert into village values(village_id_seq.nextval,'배바위카누마을', 'http://www.naver.com', '최승구', '033-434-3010', '강원', '홍천군', '기타', '교육여행', '강원도 홍천군 서면 마곡길 149', '37.725163', '127.585777',10);
insert into village values(village_id_seq.nextval,'파로호느릅마을', 'http://www.naver.com', '오세건', '033-442-5517', '강원', '화천군', '만들기체험', '두부만들기', '강원도 화천군 간동면 파로호로 923-15', '38.055872', '127.790325',10);
insert into village values(village_id_seq.nextval,'산천어마을', 'http://www.naver.com', '김형국', '000-000-0000', '강원', '화천군', '레포츠', '4륜바이크체험', '강원도 화천군 상서면 만산동로 1479', '38.132357', '127.6642495',10);
insert into village values(village_id_seq.nextval,'산속호수마을', 'http://www.naver.com', '박세영', '033-442-3820', '강원', '화천군', '농작물경작체험', '농산물 수확 체험', '강원도 화천군 화천읍 호음로 806', '38.125602', '127.790256',10);
insert into village values(village_id_seq.nextval,'연꽃마을건넌들', 'http://www.naver.com', '서윤석', '000-000-0000', '강원', '화천군', '농작물경작체험', '농산물 수확 체험', '강원도 화천군 하남면 건넌들길 79', '38.041194', '127.653844',10);
insert into village values(village_id_seq.nextval,'토고미마을', 'http://togomi.invil.org', '한상열', '033-441-7254', '강원', '화천군', '농작물경작체험', '3가지체험 당일', '강원도 화천군 상서면 토고미길 22-8', '38.133939', '127.676737',10);
insert into village values(village_id_seq.nextval,'파로호생태마을', 'http://paroho.invil.org', '이호석', '033-442-0524', '강원', '화천군', '농작물경작체험', '농산물수확체험', '강원도 화천군 간동면 용호길 33-13', '38.059071', '127.778521',10);
insert into village values(village_id_seq.nextval,'풍산마을', 'http://www.naver.com', '박종성', '033-441-1213', '강원', '화천군', '농작물경작체험', '농산물 수확 체험', '강원도 화천군 화천읍 평화로 1148', '38.135405', '127.7430504',10);
insert into village values(village_id_seq.nextval,'산채마을', 'http://sanche.co.kr', '김학석', '033-345-9196', '강원', '횡성군', '전통음식체험', '가마솥 곤드레나물밥짖기', '강원도 횡성군 둔내면 용현로 492', '37.539678', '128.256697',10);
insert into village values(village_id_seq.nextval,'벽봉마을', 'http://bbong.egagae.com', '이영구', '033-345-7744', '강원', '횡성군', '전통문화체험', '볏짚새끼꼬기 및 줄다리기', '강원도 횡성군 공근면 금계로 505', '37.572429', '127.985218',10);
insert into village values(village_id_seq.nextval,'도새울마을', 'http://www.naver.com', '최성환', '000-000-0000', '강원', '횡성군', '자연생태체험', '강원도 숲 체험', '강원도 횡성군 공근면 도곡로 185', '37.549238', '127.9431003',10);
insert into village values(village_id_seq.nextval,'태기산마을', 'https://cafe.daum.net/agoodtown', '권순화', '033-342-7675', '강원', '횡성군', '자연생태체험', '숲 체험치유', '강원도 횡성군 청일면 청일로779번길 117', '37.592775', '128.218583',10);
insert into village values(village_id_seq.nextval,'개나리마을', 'http://www.naver.com', '김학종', '000-000-0000', '강원', '횡성군', '만들기체험', '가마솥밥짓기', '강원도 횡성군 갑천면 외갑천로107번길 71', '37.557421', '128.022398',10);
insert into village values(village_id_seq.nextval,'금계뜰마을', 'http://ggtt837.modoo.at', '이기동', '033-345-8370', '강원', '횡성군', '만들기체험', '천연비누, 치약만들기', '강원도 횡성군 공근면 금계로 837', '37.595266', '128.001921',10);
insert into village values(village_id_seq.nextval,'사재산마을', 'http://www.naver.com', '김희철', '070-7783-5786', '강원', '횡성군', '만들기체험', '가마솥밥짓기', '강원도 횡성군 안흥면 서동로상안8길 9-14', '37.416736', '128.221267',10);
insert into village values(village_id_seq.nextval,'살구마을', 'http://www.wooyongri.com', '정관교', '000-000-0000', '강원', '횡성군', '만들기체험', '김장체험', '강원도 횡성군 둔내면 우용로91번길 5', '37.491022', '128.229896',10);
insert into village values(village_id_seq.nextval,'상대마을(향기마을)', 'http://www.naver.com', '남철우', '033-343-3435', '강원', '횡성군', '만들기체험', '감자 부침개', '강원도 횡성군 갑천면 갑천로 839', '37.525387', '128.176861',10);
insert into village values(village_id_seq.nextval,'춘당노다지마을', 'https://cafe.naver.com/ypcwcamping', '차희수', '000-000-0000', '강원', '횡성군', '만들기체험', '바베큐패키지체험', '강원도 횡성군 청일면 춘당로 232', '37.617741', '128.158961',10);
insert into village values(village_id_seq.nextval,'고라데이마을', 'http://www.naver.com', '이재명', '033-344-1004', '강원', '횡성군', '농작물경작체험', '고구마캐기', '강원도 횡성군 청일면 봉명로 375-1', '37.648959', '128.139204',10);
insert into village values(village_id_seq.nextval,'공근봉화마을', 'http://www.naver.com', '정구환', '033-342-0760', '강원', '횡성군', '농작물경작체험', '옥수수수확 및 껍질까기', '강원도 횡성군 공근면 금계서로 15', '37.568441', '127.969654',10);
insert into village values(village_id_seq.nextval,'대산마을', 'http://www.naver.com', '이완용', '033-342-8979', '강원', '횡성군', '농작물경작체험', '감자캐기', '강원도 횡성군 서원면 신평석화로 172', '37.41883037', '127.863706',10);
insert into village values(village_id_seq.nextval,'덕고마을', 'http://dg.invil.org/', '조원경', '033-342-8583', '강원', '횡성군', '농작물경작체험', '농사체험', '강원도 횡성군 횡성읍 덕고로 410', '37.473491', '128.020853',10);
insert into village values(village_id_seq.nextval,'밤두둑마을', 'http://bamduduk.invil.org', '김경환', '033-344-7675', '강원', '횡성군', '농작물경작체험', '모닥불놀이', '강원도 횡성군 횡성읍 반곡3길 6', '37.46661996', '127.961472',10);
insert into village values(village_id_seq.nextval,'백로마을', 'http://www.naver.com', '윤명현', '000-000-0000', '강원', '횡성군', '농작물경작체험', '가을프로그램', '강원도 횡성군 서원면 백로마을길 29', '37.492019', '127.889207',10);
insert into village values(village_id_seq.nextval,'초롱이둥지마을', 'http://www.naver.com', '강병옥', '031-584-9959', '경기', '가평군', '전통음식체험', '가마솥밥짓기외', '경기도 가평군 설악면 묵안로 906', '37.60311956', '127.524854',10);
insert into village values(village_id_seq.nextval,'연인산마을', 'http://www.naver.com', '김희숙', '000-000-0000', '경기', '가평군', '전통문화체험', '물놀이', '경기도 가평군 북면 백둔로 417-11', '37.901375', '127.462647',10);
insert into village values(village_id_seq.nextval,'잣향기푸른마을', 'http://www.naver.com', '정용수', '000-000-0000', '경기', '가평군', '전통문화체험', '게이트 볼 게임', '경기도 가평군 상면 축령로45번길 24', '37.773511', '127.363337',10);
insert into village values(village_id_seq.nextval,'물미연꽃마을', 'http://mulmi.kr', '이규도', '000-000-0000', '경기', '가평군', '자연생태체험', '숲체험', '경기도 가평군 설악면 미사리로645번길 205', '37.720772', '127.525953',10);
insert into village values(village_id_seq.nextval,'달콤한샘마을', 'http://www.naver.com', '채성수', '031-585-8597', '경기', '가평군', '만들기체험', '들깨잣강정만들기', '경기도 가평군 청평면 버들숲로8번길 34-77', '37.753002', '127.4384504',10);
insert into village values(village_id_seq.nextval,'반딧불마을', 'http://bandibul.invil.org/', '이복형', '031-585-8556', '경기', '가평군', '만들기체험', '두부만들기', '경기도 가평군 설악면 묵안로 182', '37.648131', '127.497163',10);
insert into village values(village_id_seq.nextval,'산바라기마을', 'http://www.naver.com', '장관순', '000-000-0000', '경기', '가평군', '만들기체험', '계절별김치담그기', '경기도 가평군 조종면 명지산로 46-27', '37.878807', '127.361256',10);
insert into village values(village_id_seq.nextval,'아침고요푸른마을', 'http://www.naver.com', '류재혁', '031-585-3633', '경기', '가평군', '만들기체험', '나무공예', '경기도 가평군 상면 수목원로 262-22', '37.755272', '127.359546',10);
insert into village values(village_id_seq.nextval,'아홉마지기마을', 'http://www.naver.com', '이두영', '031-582-3115', '경기', '가평군', '만들기체험', '나무에 꿈을 태우다(우드버닝)', '경기도 가평군 가평읍 용추로 238', '37.84804988', '127.487674',10);
insert into village values(village_id_seq.nextval,'옻샘마을', 'http://www.naver.com', '김영기', '031-584-9339', '경기', '가평군', '만들기체험', '소통비빔밥체험', '경기도 가평군 설악면 묵안로654번길 33-13', '37.619897', '127.513501',10);
insert into village values(village_id_seq.nextval,'포도향이흐르는마을', 'http://www.naver.com', '송재운', '070-7761-6112', '경기', '가평군', '만들기체험', '고구마체험', '경기도 가평군 상면 음지말로 6', '37.831506', '127.291281',10);
insert into village values(village_id_seq.nextval,'버섯구지마을', 'http://www.naver.com', '윤태훈', '031-584-9614', '경기', '가평군', '농작물경작체험', '감자,고구마캐기 체험', '경기도 가평군 조종면 대보간선로 173', '37.809482', '127.364268',10);
insert into village values(village_id_seq.nextval,'별바라기마을', 'http://byeolbaragi.com', '홍주표', '031-585-3823', '경기', '가평군', '농작물경작체험', '감자캐기', '경기도 가평군 조종면 명지산로 325', '37.901338', '127.372596',10);
insert into village values(village_id_seq.nextval,'유명산 농부들', 'http://www.naver.com', '서영갑', '000-000-0000', '경기', '가평군', '농작물경작체험', '버섯, 산나물 채취', '경기도 가평군 설악면 양방가루재길 6', '37.62310953', '127.496641',10);
insert into village values(village_id_seq.nextval,'선유랑마을', 'http://www.naver.com', '박창호', '000-000-0000', '경기', '고양시', '농작물경작체험', '감자수확체험', '경기도 고양시 덕양구 서리골길 130', '37.694573', '126.911807',10);
insert into village values(village_id_seq.nextval,'산두른마을', 'http://www.naver.com', '이학순', '031-762-0166', '경기', '광주시', '만들기체험', '김장체험', '경기도 광주시 도척면 추곡길 91', '37.280898', '127.285862',10);
insert into village values(village_id_seq.nextval,'달뫼마을', 'http://www.naver.com', '윤상진', '000-000-0000', '경기', '김포시', '농작물경작체험', '농산물 수확 체험', '경기도 김포시 통진읍 동을산로178번길 51', '37.700227', '126.626113',10);
insert into village values(village_id_seq.nextval,'매화미르마을', 'http://www.naver.com', '김중환', '000-000-0000', '경기', '김포시', '농작물경작체험', '농산물 수확 체험', '경기도 김포시 월곶면 용강로437번길 98', '37.758682', '126.552733',10);
insert into village values(village_id_seq.nextval,'한강노을빛체험마을', 'http://hanriversunset.modoo.at/', '최허기', '031-985-2344', '경기', '김포시', '농작물경작체험', '공동체험 고구마캐기', '경기도 김포시 하성면 봉성로159번길 80', '37.694715', '126.652725',10);
insert into village values(village_id_seq.nextval,'한음마을', 'http://www.naver.com', '이완교', '031-577-8741', '경기', '남양주시', '기타', '꽃 체험 및 가든스쿨', '경기도 남양주시 조안면 한음길 4', '37.569142', '127.317039',10);
insert into village values(village_id_seq.nextval,'선비마을', 'http://www.sunbidm.com', '오세익', '031-672-6875', '경기', '안성시', '전통문화체험', '국궁체험', '경기도 안성시 양성면 덕봉길 45', '37.04474033', '127.187653',10);
insert into village values(village_id_seq.nextval,'과채류마을', 'http://anseongsg.invil.org', '손창규', '000-000-0000', '경기', '안성시', '자연생태체험', '곤충생태체험', '경기도 안성시 미양면 신계4길 20', '36.964593', '127.176537',10);
insert into village values(village_id_seq.nextval,'신기마을', 'http://www.bluesingi.net', '김점수', '031-672-1575', '경기', '안성시', '만들기체험', '건강한 먹거리 만들기', '경기도 안성시 금광면 신양복길 18-41', '37.007822', '127.322289',10);
insert into village values(village_id_seq.nextval,'용설호문화마을', 'http://www.yongseol.com', '구본철', '031-676-5518', '경기', '안성시', '만들기체험', 'EM비누만들기', '경기도 안성시 죽산면 용설호수길 187', '37.053332', '127.446024',10);
insert into village values(village_id_seq.nextval,'인처골마을', 'http://www.naver.com', '이돈일', '031-677-0286', '경기', '안성시', '만들기체험', '감자 버터구이', '경기도 안성시 서운면 인처동길 38-12', '36.944317', '127.2723198',10);
insert into village values(village_id_seq.nextval,'구메농사마을', 'http://gume.invil.org', '박성수', '070-7098-3096', '경기', '안성시', '농작물경작체험', '감자 수확 체험', '경기도 안성시 죽산면 임꺽정길 51-7', '37.02435969', '127.408236',10);
insert into village values(village_id_seq.nextval,'꽃뫼마을', 'http://www.naver.com', '안윤환', '031-673-4308', '경기', '안성시', '농작물경작체험', '감자캐기', '경기도 안성시 고삼면 이전봉산길 269', '37.074195', '127.286125',10);
insert into village values(village_id_seq.nextval,'미리내마을', 'http://mirinaesolmoe.com', '정대식', '000-000-0000', '경기', '안성시', '농작물경작체험', '감자캐기', '경기도 안성시 양성면 미산1길 2', '37.138585', '127.258621',10);
insert into village values(village_id_seq.nextval,'유별난마을', 'http://www.naver.com', '송근목', '031-672-8600', '경기', '안성시', '농작물경작체험', '가마솥밥짖기', '경기도 안성시 대덕면 장수정길 12-22', '37.040608', '127.233512',10);
insert into village values(village_id_seq.nextval,'풍산개마을', 'http://www.naver.com', '이기운', '031-672-6919', '경기', '안성시', '농작물경작체험', '감자캐기', '경기도 안성시 삼죽면 계곡길 89', '37.087074', '127.381381',10);
insert into village values(village_id_seq.nextval,'초록지기마을', 'http://chorok.invil.org', '박상덕', '031-863-4666', '경기', '양주시', '전통음식체험', '떡 메치기', '경기도 양주시 남면 양연로173번길 26', '37.922786', '126.997455',10);
insert into village values(village_id_seq.nextval,'맹골마을', 'http://mengol.invil.org', '백호열', '031-863-6978', '경기', '양주시', '전통문화체험', '농가민박체험', '경기도 양주시 남면 휴암로443번길 29-6', '37.893332', '126.958211',10);
insert into village values(village_id_seq.nextval,'비암장수팜스테이마을', 'http://www.naver.com', '김상철', '031-836-3608', '경기', '양주시', '농작물경작체험', '감자캐기체험', '경기도 양주시 광적면 부흥로 236', '37.811913', '126.931062',10);
insert into village values(village_id_seq.nextval,'전원일기마을', 'http://www.naver.com', '이대영', '000-000-0000', '경기', '양주시', '농작물경작체험', '감자수확하기', '경기도 양주시 장흥면 일영로376번길 40', '37.677992', '126.925278',10);
insert into village values(village_id_seq.nextval,'천생연분마을', 'http://lotus.invil.org', '임신우', '031-855-6223', '경기', '양주시', '농작물경작체험', '감자캐기', '경기도 양주시 장흥면 일영로502번길 105', '37.691241', '126.930292',10);
insert into village values(village_id_seq.nextval,'주읍리산수유꽃마을', 'http://www.naver.com', '곽명신', '031-771-5010', '경기', '양평군', '전통음식체험', '산수유고추장담기키트, 바로먹는 고추장담금', '경기도 양평군 개군면 산수유꽃길 88', '37.435048', '127.577951',10);
insert into village values(village_id_seq.nextval,'서후리 산촌생태마을', 'http://www.naver.com', '장동배', '000-000-0000', '경기', '양평군', '전통문화체험', '농촌체험', '경기도 양평군 서종면 거북바위1길 58-19', '37.571712', '127.421707',10);
insert into village values(village_id_seq.nextval,'모꼬지마을', 'https://blog.naver.com/johyunblog', '최용업', '000-000-0000', '경기', '양평군', '자연생태체험', '팜파티', '경기도 양평군 용문면 청용길 13-6', '37.522501', '127.612808',10);
insert into village values(village_id_seq.nextval,'소리산마을', 'http://sorisan.invil.org', '허상구', '031-772-6076', '경기', '양평군', '자연생태체험', '감자, 고구마 캐기', '경기도 양평군 단월면 물레골길 6', '37.641466', '127.6039499',10);
insert into village values(village_id_seq.nextval,'숲속의명품마을', 'https://malgasil.modoo.at/', '전영배', '031-775-1231', '경기', '양평군', '자연생태체험', '가을수확', '경기도 양평군 청운면 수풀길 37', '37.542779', '127.702536',10);
insert into village values(village_id_seq.nextval,'뚱딴지마을', 'http://www.naver.com', '이형훈', '031-775-6655', '경기', '양평군', '만들기체험', '김장체험', '경기도 양평군 강상면 학곡양지말길 35-10', '37.469715', '127.465057',10);
insert into village values(village_id_seq.nextval,'미사랑마을', 'http://loveme.invil.org', '김효성', '031-773-9443', '경기', '양평군', '만들기체험', '한우시식체험', '경기도 양평군 지평면 지평로 878', '37.43553963', '127.619423',10);
insert into village values(village_id_seq.nextval,'봉미산산촌마을', 'http://www.naver.com', '이교섭', '000-000-0000', '경기', '양평군', '만들기체험', '밀랍떡만들기', '경기도 양평군 단월면 석산로 971', '37.610686', '127.599236',10);
insert into village values(village_id_seq.nextval,'산음휴양림 달빛마을', 'http://saneum.modoo.at', '김연호', '031-775-5418', '경기', '양평군', '만들기체험', '김장축제', '경기도 양평군 단월면 산음안골길 6', '37.603471', '127.599539',10);
insert into village values(village_id_seq.nextval,'편전마을(용천체험나라)', 'http://www.naver.com', '함세원', '000-000-0000', '경기', '양평군', '만들기체험', '계란꾸러미만들기', '경기도 양평군 옥천면 용천로 145', '37.535819', '127.489187',10);
insert into village values(village_id_seq.nextval,'호박손마을', 'http://www.naver.com', '박연원', '000-000-0000', '경기', '양평군', '만들기체험', '김장체험', '경기도 양평군 용문면 상망길 72', '37.539661', '127.635708',10);
insert into village values(village_id_seq.nextval,'가루매마을', 'http://www.garumae.com', '권윤주', '031-774-3908', '경기', '양평군', '농작물경작체험', '딸기따기체험', '경기도 양평군 지평면 부일길 101', '37.451563', '127.61402',10);
insert into village values(village_id_seq.nextval,'단석리산촌생태마을', 'http://www.naver.com', '박상우', '000-000-0000', '경기', '양평군', '농작물경작체험', '농산물 수확', '경기도 양평군 양동면 여양3로 459-3', '37.401464', '127.728187',10);
insert into village values(village_id_seq.nextval,'별내체험마을', 'http://www.naver.com', '김종세', '000-000-0000', '경기', '양평군', '농작물경작체험', '가을 수확체험', '경기도 양평군 용문면 월성1길 61', '37.469989', '127.563067',10);
insert into village values(village_id_seq.nextval,'별빛체험마을', 'http://startwn.com', '민병곤', '000-000-0000', '경기', '양평군', '농작물경작체험', '가을프로그램', '경기도 양평군 단월면 통골길 18-11', '37.606768', '127.6811898',10);
insert into village values(village_id_seq.nextval,'보릿고개마을', 'http://borigoge.invil.org/', '원용우', '031-774-7786', '경기', '양평군', '농작물경작체험', '감자수확체험', '경기도 양평군 용문면 연안길 32-1', '37.526682', '127.557132',10);
insert into village values(village_id_seq.nextval,'수미마을', 'http://soomyland.com', '최성준', '031-775-5205', '경기', '양평군', '농작물경작체험', '딸기따기체험', '경기도 양평군 단월면 수미길52번길 2-1', '37.515342', '127.648241',10);
insert into village values(village_id_seq.nextval,'양평시골여행', 'http://www.naver.com', '남동균', '000-000-0000', '경기', '양평군', '농작물경작체험', '감자캐기', '경기도 양평군 청운면 오목골길 26', '37.564954', '127.726903',10);
insert into village values(village_id_seq.nextval,'양평원조외갓집체험마을', 'http://www.sinronlee.com', '양봉호', '000-000-0000', '경기', '양평군', '농작물경작체험', '농산물수확체험', '경기도 양평군 청운면 신론로 279', '37.565814', '127.770624',10);
insert into village values(village_id_seq.nextval,'여물리체험마을', 'http://www.naver.com', '공익성', '031-772-3122', '경기', '양평군', '농작물경작체험', '감자수확체험', '경기도 양평군 청운면 청운체육공원길 26', '37.553539', '127.706295',10);
insert into village values(village_id_seq.nextval,'옹달샘꽃누름마을', 'http://www.naver.com', '홍석기', '000-000-0000', '경기', '양평군', '농작물경작체험', '감자체험 패키지1', '경기도 양평군 용문면 궁촌길29번길 16', '37.461798', '127.607828',10);
insert into village values(village_id_seq.nextval,'외갓집체험마을', 'http://www.stayfarm.co.kr', '김주헌', '000-000-0000', '경기', '양평군', '농작물경작체험', '농촌체험', '경기도 양평군 청운면 신론로 344', '37.561877', '127.775061',10);
insert into village values(village_id_seq.nextval,'용문산마을', 'http://www.naver.com', '오희자', '031-774-1884', '경기', '양평군', '농작물경작체험', '가을 밤 줍기', '경기도 양평군 용문면 장수길 16', '37.508372', '127.564448',10);
insert into village values(village_id_seq.nextval,'유기농마을', 'http://uginong.invil.org', '안병훈', '070-8839-6250', '경기', '양평군', '농작물경작체험', '농산물수확체험', '경기도 양평군 옥천면 장알재길 32', '37.525343', '127.489366',10);
insert into village values(village_id_seq.nextval,'질울고래실마을', 'http://goraesil.modoo.at', '최용석', '070-4131-7539', '경기', '양평군', '농작물경작체험', '가을패키지', '경기도 양평군 양서면 양서도곡길 76', '37.518168', '127.385548',10);
insert into village values(village_id_seq.nextval,'청운농촌체험마을', 'http://www.chungwoonfarm.co.kr', '이강조', '000-000-0000', '경기', '양평군', '농작물경작체험', '농촌체험', '경기도 양평군 청운면 신론로 346', '37.561602', '127.774737',10);
insert into village values(village_id_seq.nextval,'큰삼촌농촌체험마을', 'http://www.cehum.com', '양명석', '000-000-0000', '경기', '양평군', '농작물경작체험', '농촌체험', '경기도 양평군 청운면 신론로 358', '37.560845', '127.775136',10);
insert into village values(village_id_seq.nextval,'말마댕이체험휴양마을', 'http://www.naver.com', '심덕보', '031-881-4588', '경기', '여주시', '전통음식체험', '장담그기 체험', '경기도 여주시 능서면 양화로 867-5', '37.293019', '127.570522',10);
insert into village values(village_id_seq.nextval,'늘향골마을', 'http://www.dori.or.kr', '민남식', '000-000-0000', '경기', '여주시', '전통문화체험', '과거시험', '경기도 여주시 점동면 도리길 152', '37.223389', '127.705724',10);
insert into village values(village_id_seq.nextval,'강천섬농촌체험휴양마을', 'https://cafe.daum.net/gangchunsum', '유재섭', '031-882-7588', '경기', '여주시', '만들기체험', '원데이 클래스 판화', '경기도 여주시 강천면 강천리길 76-14', '37.236471', '127.708703',10);
insert into village values(village_id_seq.nextval,'서화마을', 'http://seohwa.invil.org', '박수만', '000-000-0000', '경기', '여주시', '만들기체험', '메주만들기', '경기도 여주시 북내면 서원2길 4', '37.397851', '127.700774',10);
insert into village values(village_id_seq.nextval,'넓은들마을', 'http://www.naver.com', '이동근', '031-885-9090', '경기', '여주시', '농작물경작체험', '감자밭 분양', '경기도 여주시 능서면 광대3길 1', '37.26364031', '127.581046',10);
insert into village values(village_id_seq.nextval,'밀머리마을', 'http://www.naver.com', '이용업', '000-000-0000', '경기', '여주시', '농작물경작체험', '고구마 수확', '경기도 여주시 점동면 밀머리길 20', '37.182437', '127.683217',10);
insert into village values(village_id_seq.nextval,'백화원', 'http://www.naver.com', '손동인', '000-000-0000', '경기', '여주시', '농작물경작체험', '농산물 수확 체험', '경기도 여주시 점동면 구부실길 35', '37.195825', '127.668863',10);
insert into village values(village_id_seq.nextval,'상호리마을', 'http://farmstay.invil.org', '민수식', '031-886-5552', '경기', '여주시', '농작물경작체험', '감자', '경기도 여주시 금사면 윗범실길 8-3', '37.408751', '127.474596',10);
insert into village values(village_id_seq.nextval,'품실채마을', 'http://www.naver.com', '김은섭', '031-884-1555', '경기', '여주시', '농작물경작체험', '순두부만들기', '경기도 여주시 산북면 광여로 1389', '37.413893', '127.453508',10);
insert into village values(village_id_seq.nextval,'하하호호마을', 'http://www.naver.com', '전신자', '000-000-0000', '경기', '여주시', '농작물경작체험', '농산물 수확 체험', '경기도 여주시 금사면 금품1로 716', '37.407603', '127.504133',10);
insert into village values(village_id_seq.nextval,'해바라기마을', 'http://sune.invil.org', '이규정', '031-886-8668', '경기', '여주시', '농작물경작체험', '감자캐기', '경기도 여주시 강천면 부평로 368', '37.284439', '127.740522',10);
insert into village values(village_id_seq.nextval,'새둥지마을', 'http://www.gumiri.com', '김탁순', '031-835-7345', '경기', '연천군', '전통음식체험', '가마솥 밥짓기', '경기도 연천군 백학면 노아로491번길 86', '38.006349', '126.959873',10);
insert into village values(village_id_seq.nextval,'한여울체험마을', 'http://www.naver.com', '김준문', '031-834-8999', '경기', '연천군', '전통음식체험', '들기름', '경기도 연천군 연천읍 현문로 537', '38.065754', '127.121906',10);
insert into village values(village_id_seq.nextval,'나룻배마을', 'http://www.naver.com', '전해원', '031-833-5449', '경기', '연천군', '만들기체험', '가마솥밥짓기', '경기도 연천군 왕징면 북삼로 45', '38.092098', '127.0070402',10);
insert into village values(village_id_seq.nextval,'초성김치마을', 'http://www.choseongkimchi.com/', '박광천', '031-835-0381', '경기', '연천군', '만들기체험', '가마솥밥짓기', '경기도 연천군 청산면 평화로 209', '37.992963', '127.069128',10);
insert into village values(village_id_seq.nextval,'두루미그린빌리지마을', 'http://www.naver.com', '이광길', '000-000-0000', '경기', '연천군', '농작물경작체험', '농산물 수확', '경기도 연천군 중면 군중로 324', '38.134885', '127.028433',10);
insert into village values(village_id_seq.nextval,'푸르내마을', 'http://www.purnevil.com', '김선기', '031-833-5299', '경기', '연천군', '농작물경작체험', '감자캐기', '경기도 연천군 청산면 아우라지길 9', '38.032359', '127.108817',10);
insert into village values(village_id_seq.nextval,'서랑동문화마을', 'http://seorangvill.com', '이석근', '000-000-0000', '경기', '오산시', '전통문화체험', '눈썰매 체험장', '경기도 오산시 서랑로105번길 33', '37.174344', '127.006386',10);
insert into village values(village_id_seq.nextval,'상덕마을', 'http://www.naver.com', '장용표', '000-000-0000', '경기', '용인시', '전통음식체험', '할머니와 함께하는 만두 만들기 체험', '경기도 용인시 처인구 이동읍 백자로133번길 3', '37.211669', '127.169628',10);
insert into village values(village_id_seq.nextval,'연미향마을', 'http://www.yeonmihyang.net', '정동만', '031-338-3317', '경기', '용인시', '만들기체험', '가래떡구워먹기', '경기도 용인시 처인구 원삼면 백원로 128-7', '37.156191', '127.330525',10);
insert into village values(village_id_seq.nextval,'내동마을', 'https://blog.naver.com/gonggan70', '이상범', '000-000-0000', '경기', '용인시', '농작물경작체험', '감자캐기', '경기도 용인시 처인구 원삼면 내동로23번길 6', '37.176013', '127.296804',10);
insert into village values(village_id_seq.nextval,'용인호박등불마을', 'http://hobak.go2vil.org/', '오순화', '031-335-0567', '경기', '용인시', '농작물경작체험', '감자,고구마, 딸기, 땅콩 캐기 채험', '경기도 용인시 처인구 모현읍 능곡로56번길 21', '37.335435', '127.178983',10);
insert into village values(village_id_seq.nextval,'학일마을', 'http://hakil.invil.org', '김시연', '031-334-7991', '경기', '용인시', '농작물경작체험', '감자 캐기', '경기도 용인시 처인구 원삼면 학일로 117', '37.147377', '127.285819',10);
insert into village values(village_id_seq.nextval,'황토현마을', 'http://www.naver.com', '유지선', '000-000-0000', '경기', '용인시', '건강', '마방체험', '경기도 용인시 처인구 원삼면 보개원삼로2075번길 6', '37.173521', '127.3291298',10);
insert into village values(village_id_seq.nextval,'이천산수유마을', 'http://www.naver.com', '이춘희', '031-632-4304', '경기', '이천시', '만들기체험', '민화.매듭공예체험', '경기도 이천시 백사면 원적로 757', '37.339767', '127.461555',10);
insert into village values(village_id_seq.nextval,'노승산우무실마을', 'http://www.naver.com', '신민준', '031-641-5600', '경기', '이천시', '농작물경작체험', '감자심기체험', '경기도 이천시 설성면 진상미로867번길 34-8', '37.140752', '127.497931',10);
insert into village values(village_id_seq.nextval,'도니울마을', 'http://doniwool.invil.org', '장순선', '070-4239-5284', '경기', '이천시', '농작물경작체험', '감자캐기', '경기도 이천시 대월면 대월로667번길 359', '37.207044', '127.481017',10);
insert into village values(village_id_seq.nextval,'부래미마을', 'http://www.buraemi.com', '김영국', '031-643-0817', '경기', '이천시', '농작물경작체험', '고구마', '경기도 이천시 율면 금율로640번길 177', '37.058907', '127.547773',10);
insert into village values(village_id_seq.nextval,'서경들마을', 'http://www.seogyeong.kr', '송성재', '031-634-1089', '경기', '이천시', '농작물경작체험', '감자 캐기', '경기도 이천시 모가면 진상미로1178번길 25', '37.161886', '127.481609',10);
insert into village values(village_id_seq.nextval,'자채방아마을', 'http://www.naver.com', '김찬용', '031-634-4283', '경기', '이천시', '농작물경작체험', '감자캐기', '경기도 이천시 대월면 대월로358번길 168-24', '37.191142', '127.507033',10);
insert into village values(village_id_seq.nextval,'자운두부', 'https://blog.naver.com/soung6969', '윤유현', '000-000-0000', '경기', '파주시', '만들기체험', '두부, 청국장 만들기', '경기도 파주시 법원읍 자운서원로 292-11', '37.867176', '126.858777',10);
insert into village values(village_id_seq.nextval,'장단콩마을', 'http://tongilchon.co.kr', '이경만', '031-953-7600', '경기', '파주시', '만들기체험', '두부만들기,청국장만들기', '경기도 파주시 군내면 통일촌길 64', '37.910639', '126.733603',10);
insert into village values(village_id_seq.nextval,'늘노리마을', 'http://www.naver.com', '장석호', '000-000-0000', '경기', '파주시', '농작물경작체험', '농산물 수확 체험', '경기도 파주시 파평면 청송로446번길 30', '37.930895', '126.863186',10);
insert into village values(village_id_seq.nextval,'산머루마을', 'http://wildgrape.invil.org', '김정대', '031-958-3600', '경기', '파주시', '농작물경작체험', '버섯수확체험', '경기도 파주시 적성면 윗배우니길 194', '37.969348', '126.951916',10);
insert into village values(village_id_seq.nextval,'주월리한배미마을', 'http://www.jwr.co.kr', '김영오', '000-000-0000', '경기', '파주시', '농작물경작체험', '고구마심기체험', '경기도 파주시 적성면 달빛길 345', '37.984151', '126.904237',10);
insert into village values(village_id_seq.nextval,'대추리평화마을', 'http://www.daechuri.com', '신종원', '031-655-3179', '경기', '평택시', '만들기체험', '가죽공예', '경기도 평택시 팽성읍 대추안길 5', '36.946796', '127.089266',10);
insert into village values(village_id_seq.nextval,'바람새마을', 'http://baramsae.modoo.at', '김경남', '031-663-5453', '경기', '평택시', '만들기체험', '갈대플룻만들기', '경기도 평택시 고덕면 새악길 43-62', '37.013325', '127.020162',10);
insert into village values(village_id_seq.nextval,'밝은세상마을', 'http://www.naver.com', '이계송', '031-683-0981', '경기', '평택시', '만들기체험', '건강한 전통 주전부리', '경기도 평택시 포승읍 충열길 37', '36.971043', '126.8735599',10);
insert into village values(village_id_seq.nextval,'로컬푸드길음마을', 'http://gireum.co.kr', '유광호', '031-681-1514', '경기', '평택시', '농작물경작체험', '감자체험', '경기도 평택시 오성면 길음3길 49-16', '36.981839', '126.969138',10);
insert into village values(village_id_seq.nextval,'초록미소마을', 'http://www.misovillage.co.kr', '조병욱', '031-683-1888', '경기', '평택시', '농작물경작체험', '감자수확체험', '경기도 평택시 오성면 신1리길 44-14', '37.008788', '127.002246',10);
insert into village values(village_id_seq.nextval,'서예마을', 'http://www.naver.com', '박광복', '031-534-0819', '경기', '포천시', '전통문화체험', '詩 공부', '경기도 포천시 관인면 창동로1754번길 70-25', '38.148484', '127.242789',10);
insert into village values(village_id_seq.nextval,'교동장독대마을회영농조합법인', 'http://www.naver.com', '이수인', '031-534-5211', '경기', '포천시', '만들기체험', '가마솥 밥해먹기', '경기도 포천시 관인면 신교동로 148-11', '38.103364', '127.2192001',10);
insert into village values(village_id_seq.nextval,'도리돌마을', 'http://www.doridol.com', '장보영', '031-535-9958', '경기', '포천시', '만들기체험', '가양주체험', '경기도 포천시 이동면 화동로 2381', '38.054795', '127.3838096',10);
insert into village values(village_id_seq.nextval,'숯골마을', 'http://soot.invil.org', '안근영', '031-532-7796', '경기', '포천시', '만들기체험', '감자고로케', '경기도 포천시 관인면 숯골길 108', '38.147795', '127.252282',10);
insert into village values(village_id_seq.nextval,'지동산촌마을', 'http://jidong.invil.org', '이관영', '031-535-5399', '경기', '포천시', '만들기체험', '나무공예', '경기도 포천시 신북면 지동길 114-11', '37.938277', '127.1211095',10);
insert into village values(village_id_seq.nextval,'비둘기낭마을', 'http://www.naver.com', '김명숙', '031-536-9668', '경기', '포천시', '농작물경작체험', '농산물 수확', '경기도 포천시 영북면 비둘기낭길 52', '38.073889', '127.226362',10);
insert into village values(village_id_seq.nextval,'울미연꽃마을', 'http://www.naver.com', '이한강', '000-000-0000', '경기', '포천시', '농작물경작체험', '어린이그림공모', '경기도 포천시 군내면 꽃배산2길 9', '37.865451', '127.225926',10);
insert into village values(village_id_seq.nextval,'민들레연극마을', 'http://www.mdl.or.kr', '송인현', '031-358-7587', '경기', '화성시', '전통문화체험', '공연관람', '경기도 화성시 우정읍 이화뱅곳길 22', '37.039648', '126.797902',10);
insert into village values(village_id_seq.nextval,'청미르마을', 'http://www.naver.com', '노재광', '000-000-0000', '경기', '화성시', '전통문화체험', '농경문화체험', '경기도 화성시 송산면 공룡로 484', '37.248092', '126.746393',10);
insert into village values(village_id_seq.nextval,'금당엄나무마을', 'https://cafe.daum.net/kptree', '이갑선', '000-000-0000', '경기', '화성시', '농작물경작체험', '감자캐기', '경기도 화성시 마도면 금당북길 70', '37.191751', '126.742229',10);
insert into village values(village_id_seq.nextval,'상두리마을', 'https://cafe.naver.com/ass2537', '김만중', '000-000-0000', '경기', '화성시', '농작물경작체험', '감자캐기', '경기도 화성시 향남읍 솔태상두길 141', '37.107685', '126.946454',10);
insert into village values(village_id_seq.nextval,'송라마을', 'http://songra.net/', '고희문', '000-000-0000', '경기', '화성시', '농작물경작체험', '감따기', '경기도 화성시 매송면 매송북길264번길 37', '37.282505', '126.909309',10);
insert into village values(village_id_seq.nextval,'장전노루마을', 'http://www.naver.com', '홍성재', '031-357-7630', '경기', '화성시', '농작물경작체험', '가을채소꾸러미수확체험', '경기도 화성시 남양읍 장전길 58', '37.264753', '126.823001',10);
insert into village values(village_id_seq.nextval,'정남농촌체험휴양마을', 'http://www.naver.com', '최원배', '031-353-5528', '경기', '화성시', '기타', '팜스월드체험', '경기도 화성시 정남면 만년로 379-60', '37.155441', '126.980006',10);
insert into village values(village_id_seq.nextval,'거제둔덕시골', 'http://www.gddsigol.co.kr/', '제석훈', '055-632-5496', '경남', '거제시', '농작물경작체험', '거봉포도따기', '경상남도 거제시 둔덕면 청마로 159', '34.85232978', '128.510722',10);
insert into village values(village_id_seq.nextval,'부춘마을', 'http://prm6061.modoo.at', '김상범', '055-633-9982', '경남', '거제시', '농작물경작체험', '고구마캐기,군고구마만들기', '경상남도 거제시 동부면 부춘2길 5', '34.806026', '128.607787',10);
insert into village values(village_id_seq.nextval,'연담마을', 'http://m.cafe.naver.com/lar612', '원장일', '055-632-4583', '경남', '거제시', '농작물경작체험', '감자캐기', '경상남도 거제시 동부면 동부로 278', '34.811187', '128.6286801',10);
insert into village values(village_id_seq.nextval,'와항마을', 'http://www.naver.com', '옥무근', '000-000-0000', '경남', '거제시', '농작물경작체험', '감자캐기체험', '경상남도 거제시 하청면 와항2길 21-3', '34.968314', '128.648544',10);
insert into village values(village_id_seq.nextval,'삼거마을', 'https://blog.naver.com/sgvil', '옥대석', '055-637-7475', '경남', '거제시', '기타', '전통모내기, 하천생태체험, 버섯체험', '경상남도 거제시 거제중앙로 1274', '34.842937', '128.648302',10);
insert into village values(village_id_seq.nextval,'숲옛마을(갈계)', 'http://oldvil.go2vil.org', '신은범', '055-942-2247', '경남', '거창군', '자연생태체험', '갈계숲생태체험', '경상남도 거창군 북상면 송계로 738', '35.779904', '127.818574',10);
insert into village values(village_id_seq.nextval,'가남정보화마을', 'http://ganam.invil.org', '이성국', '055-940-3950', '경남', '거창군', '만들기체험', '가면꾸미기', '경상남도 거창군 가조면 지산로 1242', '35.688288', '128.0221595',10);
insert into village values(village_id_seq.nextval,'베짱이사랑방농어촌체험휴양마을', 'http://www.naver.com', '최용환', '055-945-1534', '경남', '거창군', '만들기체험', '압화체험, 제과제빵', '경상남도 거창군 고제면 고제로 740-8', '35.872584', '127.879877',10);
insert into village values(village_id_seq.nextval,'솔향담은장마을', 'http://www.naver.com', '허운', '055-943-3788', '경남', '거창군', '만들기체험', '된장만들기', '경상남도 거창군 남상면 청림1길 17', '35.646219', '127.926289',10);
insert into village values(village_id_seq.nextval,'수승대마을', 'http://www.naver.com', '김무호', '055-941-2023', '경남', '거창군', '만들기체험', '강정만들기체험', '경상남도 거창군 위천면 원학길 410', '35.752674', '127.831042',10);
insert into village values(village_id_seq.nextval,'월천 농어촌체험휴양마을', 'http://www.naver.com', '백경란', '055-941-2214', '경남', '거창군', '만들기체험', '드립커피, 마들렌 만들기', '경상남도 거창군 거창읍 주곡로 220-14', '35.714843', '127.918342',10);
insert into village values(village_id_seq.nextval,'황금원숭이마을', 'https://cafe.daum.net/mongtown', '원경자', '055-943-5025', '경남', '거창군', '만들기체험', '가마솥밥짓기', '경상남도 거창군 위천면 상천길 50-159', '35.749729', '127.818251',10);
insert into village values(village_id_seq.nextval,'곰내미마을', 'http://www.naver.com', '이지영', '055-942-2038', '경남', '거창군', '농작물경작체험', '고사리수확', '경상남도 거창군 웅양면 화평길 6', '35.801728', '127.915363',10);
insert into village values(village_id_seq.nextval,'깊은골 신기마을', 'http://www.naver.com', '구교윤', '000-000-0000', '경남', '거창군', '농작물경작체험', '딸기따기', '경상남도 거창군 신원면 신기1길 189', '35.568938', '127.955036',10);
insert into village values(village_id_seq.nextval,'빙기실마을', 'http://www.naver.com', '김재연', '055-943-4096', '경남', '거창군', '농작물경작체험', '감자캐기', '경상남도 거창군 북상면 병곡길 448', '35.810059', '127.775812',10);
insert into village values(village_id_seq.nextval,'신원양지마을', 'http://www.naver.com', '신용덕', '055-944-3000', '경남', '거창군', '농작물경작체험', '농산물 수확', '경상남도 거창군 신원면 양지1길 8-1', '35.584955', '127.958444',10);
insert into village values(village_id_seq.nextval,'참깨비마을', 'http://www.kkabi.co.kr', '유영준', '000-000-0000', '경남', '거창군', '농작물경작체험', '농촌체험', '경상남도 거창군 남하면 지산로 727-13', '35.665861', '127.997294',10);
insert into village values(village_id_seq.nextval,'탑선마을', 'http://www.naver.com', '김창수', '000-000-0000', '경남', '거창군', '농작물경작체험', '농산물 수확 체험', '경상남도 거창군 고제면 고제로 1134', '35.902408', '127.865344',10);
insert into village values(village_id_seq.nextval,'하늘비단마을(도리)', 'http://www.skysilk.co.kr', '박희철', '055-942-9980', '경남', '거창군', '농작물경작체험', '감국꽃잎따기', '경상남도 거창군 가조면 도리1길 8', '35.70441986', '128.046802',10);
insert into village values(village_id_seq.nextval,'무지돌이마을', 'http://www.naver.com', '박격원', '000-000-0000', '경남', '고성군', '전통문화체험', '고무줄총만들기', '경상남도 고성군 개천면 나선길 73-10', '35.121988', '128.31579',10);
insert into village values(village_id_seq.nextval,'자란만농촌체험휴양마을', 'http://www.naver.com', '강남이', '070-4121-6932', '경남', '고성군', '자연생태체험', '가리비양식체험, 갯벌체험, 예절전래놀이', '경상남도 고성군 하일면 자란만로 1622-8', '34.932741', '128.197162',10);
insert into village values(village_id_seq.nextval,'종생마을', 'http://www.naver.com', '백승완', '055-672-3436', '경남', '고성군', '농작물경작체험', '농작물, 생산 체험', '경상남도 고성군 대가면 갈천로 174', '35.016089', '128.247032',10);
insert into village values(village_id_seq.nextval,'청광새들녘마을', 'http://cknf.co.kr', '박현규', '055-672-7985', '경남', '고성군', '기타', '전통먹거리,천연제품,새들녘체험', '경상남도 고성군 개천면 영회로 1296', '35.114809', '128.309264',10);
insert into village values(village_id_seq.nextval,'장척힐링휴양마을', 'http://www.naver.com', '이종표', '000-000-0000', '경남', '김해시', '자연생태체험', '목공예, 짚라인체험', '경상남도 김해시 상동면 장척로462번길 140', '35.277149', '128.924524',10);
insert into village values(village_id_seq.nextval,'화포천마을', 'http://www.naver.com', '김진호', '055-342-7729', '경남', '김해시', '만들기체험', '단감강정만들기체험', '경상남도 김해시 진영읍 봉하로 10', '35.314469', '128.758228',10);
insert into village values(village_id_seq.nextval,'대감삼통마을', 'http://www.naver.com', '이봉수', '000-000-0000', '경남', '김해시', '농작물경작체험', '농촌체험', '경상남도 김해시 상동면 상동로 562', '35.307892', '128.931213',10);
insert into village values(village_id_seq.nextval,'두모마을', 'http://www.naver.com', '신만호', '055-862-5865', '경남', '남해군', '전통문화체험', '개매기체험', '경상남도 남해군 상주면 양아로533번길 18', '34.73394', '127.955353',10);
insert into village values(village_id_seq.nextval,'갱번마루', 'http://gaengbeon.co.kr', '박명식', '055-862-5590', '경남', '남해군', '자연생태체험', '개막이체험', '경상남도 남해군 설천면 설천로 291-6', '34.894013', '127.910168',10);
insert into village values(village_id_seq.nextval,'해바리마을', 'http://www.naver.com', '양명용', '055-867-1616', '경남', '남해군', '자연생태체험', '갯벌생태체험', '경상남도 남해군 창선면 서부로 257', '34.843802', '127.975705',10);
insert into village values(village_id_seq.nextval,'해울림마을', 'http://www.naver.com', '박진갑', '055-867-5998', '경남', '남해군', '자연생태체험', '갯벌체험', '경상남도 남해군 창선면 흥선로 1330', '34.851798', '128.053602',10);
insert into village values(village_id_seq.nextval,'적량해비치마을', 'http://www.naver.com', '강동우', '000-000-0000', '경남', '남해군', '어촌생활체험', '요트', '경상남도 남해군 창선면 흥선로 1196-1', '34.860328', '128.059497',10);
insert into village values(village_id_seq.nextval,'지족갯마을', 'http://jijok.invil.org/', '손종심', '055-867-1277', '경남', '남해군', '어촌생활체험', '갯벌생태체험', '경상남도 남해군 삼동면 삼이로24번길 39', '34.82886977', '127.993413',10);
insert into village values(village_id_seq.nextval,'남구마을', 'http://seagarden.kr', '박광윤', '000-000-0000', '경남', '남해군', '만들기체험', '계절 장아찌 만들기', '경상남도 남해군 남면 남서대로 1144', '34.782801', '127.861249',10);
insert into village values(village_id_seq.nextval,'다랭이마을', 'http://www.naver.com', '김봉수', '000-000-0000', '경남', '남해군', '농작물경작체험', '농사체험', '경상남도 남해군 남면 남면로679번길 21', '34.72752012', '127.894035',10);
insert into village values(village_id_seq.nextval,'덕월마을', 'http://www.naver.com', '김석윤', '000-000-0000', '경남', '남해군', '농작물경작체험', '농사체험', '경상남도 남해군 남면 남서대로 1176-19', '34.782478', '127.858828',10);
insert into village values(village_id_seq.nextval,'회룡농촌체험휴양마을', 'http://www.naver.com', '이정만', '055-863-8888', '경남', '남해군', '농작물경작체험', '농산물 수확 체험', '경상남도 남해군 서면 남서대로 2645', '34.87428032', '127.828448',10);
insert into village values(village_id_seq.nextval,'평리농촌체험휴양마을', 'http://sandaechu.invil.org', '구자원', '055-353-5244', '경남', '밀양시', '자연생태체험', '논메기잡기', '경상남도 밀양시 단장면 고례4길 7-3', '35.499428', '128.926867',10);
--insert into village values(village_id_seq.nextval,'고례마을', 'http://gorye.co.kr', '서규의', '000-000-0000', '경남', '밀양시', '만들기체험', '도깨비 방망이 만들기, 도깨비 석고방향제만들기', '경상남도 밀양시 단장면 고례2길 8', '35.490334', '',10);
insert into village values(village_id_seq.nextval,'밀양 숲속마을', 'http://www.naver.com', '김춘택', '055-356-9600', '경남', '밀양시', '만들기체험', '제과제빵, 천연염색', '경상남도 밀양시 청도면 청도로 105-11', '35.550106', '128.625228',10);
insert into village values(village_id_seq.nextval,'꽃새미마을(방동마을)', 'http://kkotsaemi.go2vil.org', '박성부', '055-391-1518', '경남', '밀양시', '농작물경작체험', '고구마캐기', '경상남도 밀양시 초동면 방동안길 22', '35.453185', '128.705903',10);
insert into village values(village_id_seq.nextval,'백산마을', 'http://www.naver.com', '신종완', '055-391-5084', '경남', '밀양시', '농작물경작체험', '농산물 수확 체험', '경상남도 밀양시 하남읍 백산로 292-10', '35.370512', '128.746099',10);
insert into village values(village_id_seq.nextval,'퇴로고가마을', 'http://www.naver.com', '석영호', '070-7313-7022', '경남', '밀양시', '농작물경작체험', '고구마캐기 체험', '경상남도 밀양시 부북면 퇴로로 233', '35.548906', '128.700627',10);
insert into village values(village_id_seq.nextval,'다슬기초량마을', 'https://cafe.naver.com/crvill', '정영규', '055-854-2336', '경남', '사천시', '전통음식체험', '고추장만들기, 다슬기체험, 블루베리떡만들기, 찹쌀떡만들기', '경상남도 사천시 곤명면 초량길 27-3', '35.106048', '127.9235795',10);
insert into village values(village_id_seq.nextval,'거북선마을', 'http://www.naver.com', '강승규', '055-835-0881', '경남', '사천시', '자연생태체험', '마을체험', '경상남도 사천시 용현면 사천대교로 75-61', '34.99851042', '128.0406001',10);
insert into village values(village_id_seq.nextval,'고읍마을', 'http://goeup.invil.org', '강종기', '055-852-7634', '경남', '사천시', '자연생태체험', '생태체험', '경상남도 사천시 정동면 고읍길 223', '35.067576', '128.097802',10);
insert into village values(village_id_seq.nextval,'상정비봉내마을', 'http://www.beebong.co.kr', '조현래', '055-854-5111', '경남', '사천시', '어촌생활체험', '갯벌체험', '경상남도 사천시 곤양면 상정마을길 139', '35.071118', '127.9584403',10);
insert into village values(village_id_seq.nextval,'우천바리안마을', 'https://blog.naver.com/barian2723', '곽석도', '055-854-2723', '경남', '사천시', '만들기체험', '가마솥뚜껑 볶음밥', '경상남도 사천시 사남면 사남로 587', '35.034447', '128.117595',10);
insert into village values(village_id_seq.nextval,'소곡금자정마을', 'https://blog.daum.net/gusxo1643', '권혁용', '000-000-0000', '경남', '사천시', '농작물경작체험', '고구마판매', '경상남도 사천시 정동면 소곡길 61', '35.031884', '128.1611398',10);
insert into village values(village_id_seq.nextval,'가마실마을', 'http://www.naver.com', '홍대수', '055-974-8255', '경남', '산청군', '자연생태체험', '긴꼬리투구새우관찰체험', '경상남도 산청군 오부면 오동로705번길 31', '35.504238', '127.891444',10);
insert into village values(village_id_seq.nextval,'늘비물고기휴양마을', 'http://www.naver.com', '박정수', '055-973-6400', '경남', '산청군', '자연생태체험', '낚시체험', '경상남도 산청군 생초면 새실로 32-15', '35.496308', '127.840521',10);
insert into village values(village_id_seq.nextval,'남사예담촌마을', 'http://www.namsayedam.com', '박태진', '070-8199-7107', '경남', '산청군', '만들기체험', '떡메치기', '경상남도 산청군 단성면 지리산대로2897번길 10', '35.274386', '127.936305',10);
insert into village values(village_id_seq.nextval,'마근담마을', 'http://www.mgdedu.com', '조태제', '055-973-8116', '경남', '산청군', '만들기체험', 'EM 효소세제만들기', '경상남도 산청군 시천면 마근담길 600', '35.319856', '127.857736',10);
insert into village values(village_id_seq.nextval,'방곡마을', 'https://cafe.naver.com/bangsill', '오석기', '000-000-0000', '경남', '산청군', '만들기체험', '간장,된장 만들기 체험', '경상남도 산청군 금서면 화계오봉로 535', '35.426711', '127.781826',10);
insert into village values(village_id_seq.nextval,'철쭉피는황매골마을', 'http://www.naver.com', '박상무', '000-000-0000', '경남', '산청군', '만들기체험', '김장체험', '경상남도 산청군 차황면 황매산로 1126-17', '35.472027', '127.961752',10);
insert into village values(village_id_seq.nextval,'둔철산얼레지피는마을', 'https://cafe.daum.net/2502farm', '성경모', '055-972-2460', '경남', '산청군', '레포츠', '경호강레프팅', '경상남도 산청군 신안면 둔철산로472번길 37-6', '35.373927', '127.962268',10);
insert into village values(village_id_seq.nextval,'대포한개마을', 'http://www.naver.com', '김미화', '055-974-1038', '경남', '산청군', '농작물경작체험', '감자,고구마캐기', '경상남도 산청군 생초면 명지대포로 298-44', '35.46221013', '127.857789',10);
insert into village values(village_id_seq.nextval,'신안갈전마을', 'https://cafe.daum.net/galjeonri', '강흥구', '000-000-0000', '경남', '산청군', '농작물경작체험', '농사체험', '경상남도 산청군 신안면 중촌갈전로 913-1', '35.374275', '127.985599',10);
insert into village values(village_id_seq.nextval,'운리마을', 'http://www.naver.com', '권박현', '000-000-0000', '경남', '산청군', '농작물경작체험', '농산물 수확 체험', '경상남도 산청군 단성면 호암로619번길 98', '35.316011', '127.9000004',10);
insert into village values(village_id_seq.nextval,'장자골마을', 'http://www.naver.com', '이종남', '000-000-0000', '경남', '산청군', '농작물경작체험', '블루베리체험', '경상남도 산청군 산청읍 동의보감로312번길 176-20', '35.443374', '127.8595898',10);
insert into village values(village_id_seq.nextval,'지리산대포마을', 'http://daepo.invil.org', '이서우', '055-972-1022', '경남', '산청군', '농작물경작체험', '농산물 수확 체험', '경상남도 산청군 삼장면 덕산대포로245번길 48', '35.296124', '127.829213',10);
insert into village values(village_id_seq.nextval,'지리산덕천강마을', 'http://www.naver.com', '정의갑', '055-974-6700', '경남', '산청군', '농작물경작체험', '단감따기체험', '경상남도 산청군 단성면 덕천로 794', '35.240856', '127.895185',10);
insert into village values(village_id_seq.nextval,'지성마을', 'http://www.jsfarmstay.kr', '김윤태', '055-973-2733', '경남', '산청군', '농작물경작체험', '감자캐기 체험', '경상남도 산청군 산청읍 웅석봉로 213', '35.400948', '127.880631',10);
insert into village values(village_id_seq.nextval,'차황상법마을', 'http://www.naver.com', '조용석', '000-000-0000', '경남', '산청군', '농작물경작체험', '고구마캐기', '경상남도 산청군 차황면 황매산로980번길 42', '35.464835', '127.963468',10);
insert into village values(village_id_seq.nextval,'철수마을', 'http://www.naver.com', '정영학', '000-000-0000', '경남', '산청군', '농작물경작체험', '고구마 재배', '경상남도 산청군 차황면 신차로1480번길 47', '35.444234', '127.9556702',10);
insert into village values(village_id_seq.nextval,'배내골마을공동체지원센터', 'http://benebene.modoo.at', '하선근', '000-000-0000', '경남', '양산시', '농작물경작체험', '농산물 수확 체험', '경상남도 양산시 원동면 배내로 236', '35.472052', '128.976928',10);
insert into village values(village_id_seq.nextval,'선리마을', 'http://baenapple.invil.org', '심재진', '055-365-6262', '경남', '양산시', '농작물경작체험', '감자심기', '경상남도 양산시 원동면 배내로 452', '35.487608', '128.986918',10);
insert into village values(village_id_seq.nextval,'장선마을', 'http://www.naver.com', '서양희', '055-363-9549', '경남', '양산시', '농작물경작체험', '감자,고구마,캐기', '경상남도 양산시 원동면 장선2길 30', '35.501578', '128.996446',10);
insert into village values(village_id_seq.nextval,'창기마을농촌체험휴양마을', 'http://www.naver.com', '송영철', '000-000-0000', '경남', '양산시', '농작물경작체험', '농산물 수확', '경상남도 양산시 동면 창기1길 15-5', '35.334873', '129.120253',10);
insert into village values(village_id_seq.nextval,'덕실감빛마을', 'http://www.naver.com', '주해돈', '055-573-3888', '경남', '의령군', '전통음식체험', '감말랭이만들기, 감물염색하기(손수건), 대봉감따기, 대봉곶감만들기, 블루베리수확체험, 블루베리피자만들기, 블루베리쨈만들기', '경상남도 의령군 의령읍 중리로 18', '35.294091', '128.253669',10);
insert into village values(village_id_seq.nextval,'갑을골권역', 'http://www.naver.com', '정능수', '055-572-9977', '경남', '의령군', '자연생태체험', '자연생태 체험', '경상남도 의령군 가례면 가례로 729', '35.381824', '128.230451',10);
insert into village values(village_id_seq.nextval,'나루마을', 'http://www.naver.com', '신경환', '055-572-8786', '경남', '의령군', '만들기체험', '공예체험', '경상남도 의령군 화정면 화정로 687', '35.260653', '128.242635',10);
insert into village values(village_id_seq.nextval,'신전권역', 'http://1000ha.kr.', '황귀현', '055-574-1109', '경남', '의령군', '만들기체험', '망개떡만들기', '경상남도 의령군 대의면 모의로 662-24', '35.381677', '128.175884',10);
insert into village values(village_id_seq.nextval,'너른떡농촌체험휴양마을', 'http://www.naver.com', '김광지', '055-573-3052', '경남', '의령군', '농작물경작체험', '농산물 수확 체험', '경상남도 의령군 봉수면 대한로 873', '35.482983', '128.236286',10);
insert into village values(village_id_seq.nextval,'늘품마을(막곡)', 'http://www.naver.com', '이헌두', '000-000-0000', '경남', '의령군', '농작물경작체험', '농사체험', '경상남도 의령군 부림면 막곡2길 72-1', '35.451623', '128.329178',10);
insert into village values(village_id_seq.nextval,'청미래마을(수암)', 'http://www.naver.com', '주인석', '055-573-7400', '경남', '의령군', '농작물경작체험', '감자수확', '경상남도 의령군 의령읍 수암로2길 1-4', '35.308539', '128.2396604',10);
insert into village values(village_id_seq.nextval,'자굴산권역', 'http://www.jagulsan.org', '이규용', '055-574-1199', '경남', '의령군', '건강', '건강테마(찜질체험)', '경상남도 의령군 칠곡면 칠곡로5길 3-1', '35.339218', '128.196718',10);
insert into village values(village_id_seq.nextval,'정수문화마을', 'http://jungsootown.kr', '이병옥', '055-753-3666', '경남', '진주시', '전통문화체험', '국궁, 북관대첩비, 풍물체험', '경상남도 진주시 이반성면 오봉산로 871', '35.181895', '128.330577',10);
insert into village values(village_id_seq.nextval,'가뫼골마을', 'http://www.naver.com', '유재하', '000-000-0000', '경남', '진주시', '만들기체험', '가래떡초코크런치', '경상남도 진주시 명석면 관덕길 174', '35.25863962', '128.032364',10);
insert into village values(village_id_seq.nextval,'대암초록마을', 'http://daeam.invil.org/', '이호식', '055-746-1864', '경남', '진주시', '만들기체험', 'POP예쁜손글씨체험, 도자기체험, 물놀이체험, 사계절테마체험, 우드버닝체험, 캘리그라피체험, 핸드페인팅체험', '경상남도 진주시 집현면 진산로 1141', '35.266713', '128.079354',10);
insert into village values(village_id_seq.nextval,'내촌마을', 'http://www.hosutown.com', '이기호', '055-758-1518', '경남', '진주시', '농작물경작체험', '감자캐기', '경상남도 진주시 대평면 금성로 422-33', '35.160014', '127.990255',10);
insert into village values(village_id_seq.nextval,'비실연꽃마을', 'http://beesil.co.kr', '김종천', '055-762-1107', '경남', '진주시', '농작물경작체험', '매실따기체험', '경상남도 진주시 명석면 진주대로1706번길 153', '35.230792', '128.030058',10);
insert into village values(village_id_seq.nextval,'따오기품은 세진마을', 'http://www.naver.com', '성기순', '055-532-8161', '경남', '창녕군', '자연생태체험', '따오기체험, 우포늪탐방', '경상남도 창녕군 유어면 세진길 34', '35.536312', '128.416084',10);
insert into village values(village_id_seq.nextval,'성곡오색별빛마을', 'http://www.naver.com', '이상동', '055-532-5578', '경남', '창녕군', '농작물경작체험', '농촌체험', '경상남도 창녕군 성산면 연당대산로 38', '35.636427', '128.521005',10);
insert into village values(village_id_seq.nextval,'우포가시연꽃마을', 'http://www.naver.com', '박동출', '055-532-1165', '경남', '창녕군', '농작물경작체험', '내사랑 질경이', '경상남도 창녕군 대합면 닭계1길 12', '35.574931', '128.437275',10);
insert into village values(village_id_seq.nextval,'양촌여울마을', 'http://www.yangchoncamp.co.kr/', '차정현', '055-271-2012', '경남', '창원시', '만들기체험', '비누공예, 우리밀 쿠키, 팬시우드, 피자', '경상남도 창원시 마산합포구 진전면 의산삼일로 60', '35.136508', '128.375283',10);
insert into village values(village_id_seq.nextval,'다호마을', 'http://www.gobungun.com', '김주관', '000-000-0000', '경남', '창원시', '농작물경작체험', '감자수확체험', '경상남도 창원시 의창구 동읍 동읍로267번다호길 34-19', '35.296068', '128.670582',10);
insert into village values(village_id_seq.nextval,'마산마을', 'http://www.naver.com', '서민호', '000-000-0000', '경남', '창원시', '농작물경작체험', '감나무숲음악교식', '경상남도 창원시 의창구 북면 마산길 51', '35.342339', '128.621743',10);
insert into village values(village_id_seq.nextval,'빗돌배기마을(송등)', 'http://www.sweetvillage.co.kr', '강창국', '055-291-4829', '경남', '창원시', '농작물경작체험', '감자,고구마수확체험', '경상남도 창원시 의창구 대산면 진산대로505번길 51-17', '35.34475969', '128.704577',10);
insert into village values(village_id_seq.nextval,'통영산들해마을', 'http://www.naver.com', '박정권', '055-649-5550', '경남', '통영시', '자연생태체험', '숲탐방, 승마체험, 약용식물 수확', '경상남도 통영시 광도면 전두1길 13-51', '34.906341', '128.404038',10);
insert into village values(village_id_seq.nextval,'국치마을', 'http://www.naver.com', '강이근', '000-000-0000', '경남', '통영시', '어촌생활체험', '갯벌체험', '경상남도 통영시 천대국치길 207', '34.836126', '128.392824',10);
insert into village values(village_id_seq.nextval,'대평마을', 'http://www.naver.com', '김문태', '000-000-0000', '경남', '통영시', '농작물경작체험', '난수태교환', '경상남도 통영시 평인일주로 820', '34.857884', '128.395468',10);
insert into village values(village_id_seq.nextval,'세포마을', 'http://sepovill.com', '신성안', '055-645-1911', '경남', '통영시', '농작물경작체험', '감자수확체험', '경상남도 통영시 산양읍 세포큰길 80-5', '34.81694958', '128.389207',10);
insert into village values(village_id_seq.nextval,'평사드레', 'http://pyeongsadre.co.kr', '이병열', '055-883-6640', '경남', '하동군', '전통문화체험', '다도체험', '경상남도 하동군 악양면 악양서로 92', '35.148856', '127.687655',10);
insert into village values(village_id_seq.nextval,'구재봉자두중서', 'http://www.naver.com', '이영상', '000-000-0000', '경남', '하동군', '자연생태체험', '구재봉 등반 및 생태체험', '경상남도 하동군 적량면 중서길 74-9', '35.125635', '127.754231',10);
insert into village values(village_id_seq.nextval,'의신 베어빌리지', 'http://bearvillage.co.kr', '정봉선', '055-883-3580', '경남', '하동군', '자연생태체험', '반달가슴곰 탐방해설', '경상남도 하동군 화개면 화개로 1405-4', '35.287718', '127.6479996',10);
insert into village values(village_id_seq.nextval,'정티움', 'http://www.naver.com', '장원화', '055-884-5111', '경남', '하동군', '자연생태체험', '다슬기 관찰', '경상남도 하동군 옥종면 고성산동학로 862', '35.174147', '127.918347',10);
insert into village values(village_id_seq.nextval,'모암마을', 'http://www.naver.com', '홍만수', '000-000-0000', '경남', '하동군', '만들기체험', '녹차비누 만들기', '경상남도 하동군 화개면 모암길 29-41', '35.24532968', '127.639241',10);
insert into village values(village_id_seq.nextval,'명사마을', 'http://www.naver.com', '강주맹', '055-882-5608', '경남', '하동군', '농작물경작체험', '매실따기', '경상남도 하동군 청암면 명사길 382-10', '35.142305', '127.776763',10);
insert into village values(village_id_seq.nextval,'북방마을', 'http://okjong.invil.org', '정석주', '000-000-0000', '경남', '하동군', '농작물경작체험', '딸기체험', '경상남도 하동군 옥종면 북방우회길 7-4', '35.164021', '127.9294798',10);
insert into village values(village_id_seq.nextval,'산야초치유휴양마을', 'http://www.naver.com', '이경우', '000-000-0000', '경남', '하동군', '농작물경작체험', '농촌체험', '경상남도 하동군 화개면 부춘길 211', '35.179154', '127.658187',10);
insert into village values(village_id_seq.nextval,'여울목원곡농촌체험휴양마을', 'http://www.naver.com', '김태오', '000-000-0000', '경남', '하동군', '농작물경작체험', '농촌체험', '경상남도 하동군 횡천면 경서대로 953', '35.098398', '127.797557',10);
insert into village values(village_id_seq.nextval,'입석마을', 'http://www.naver.com', '강상수', '055-883-3229', '경남', '하동군', '농작물경작체험', '과실수확', '경상남도 하동군 악양면 악양서로 291', '35.157772', '127.705172',10);
insert into village values(village_id_seq.nextval,'직전마을', 'http://www.naver.com', '문병현', '055-882-9653', '경남', '하동군', '농작물경작체험', '감자삼곳', '경상남도 하동군 북천면 경서대로 2253-21', '35.111016', '127.874166',10);
insert into village values(village_id_seq.nextval,'여항산금계농촌체험휴양마을', 'http://www.naver.com', '안건준', '055-584-1027', '경남', '함안군', '자연생태체험', '야생화, 숲체험, 한방샴푸', '경상남도 함안군 여항면 여항로 201-10', '35.2018397', '128.4279895',10);
insert into village values(village_id_seq.nextval,'별천지마을', 'http://www.motgol.kr', '조방제', '000-000-0000', '경남', '함안군', '만들기체험', '곶감만들기,감말랭이', '경상남도 함안군 여항면 주동2길 136', '35.182709', '128.423957',10);
insert into village values(village_id_seq.nextval,'나무골마을', 'http://www.naver.com', '김승환', '055-583-5450', '경남', '함안군', '농작물경작체험', '감따기 체험', '경상남도 함안군 여항면 주서3길 216', '35.192468', '128.418172',10);
insert into village values(village_id_seq.nextval,'무릉동천체험휴양마을', 'http://www.naver.com', '주영진', '055-586-8899', '경남', '함안군', '농작물경작체험', '농산물 수확 체험', '경상남도 함안군 칠서면 무릉길 67', '35.323625', '128.515383',10);
insert into village values(village_id_seq.nextval,'입곡농촌체험휴양마을', 'http://www.naver.com', '이철균', '000-000-0000', '경남', '함안군', '농작물경작체험', '농산물 수확 체험', '경상남도 함안군 산인면 입곡길 183-4', '35.251913', '128.45796',10);
insert into village values(village_id_seq.nextval,'개평마을', 'http://www.naver.com', '정현영', '070-8199-6325', '경남', '함양군', '만들기체험', '가마솥밥짖기', '경상남도 함양군 지곡면 개평길 35-9', '35.564227', '127.769255',10);
insert into village values(village_id_seq.nextval,'함양물레방아떡마을(안심)', 'http://www.naver.com', '정연근', '055-963-6649', '경남', '함양군', '만들기체험', '가래떡 만들기', '경상남도 함양군 안의면 신안길 53', '35.650736', '127.798332',10);
insert into village values(village_id_seq.nextval,'마평마을', 'http://www.naver.com', '송암종', '000-000-0000', '경남', '함양군', '농작물경작체험', '고추따기체험', '경상남도 함양군 병곡면 병곡지곡로 315', '35.561799', '127.716368',10);
insert into village values(village_id_seq.nextval,'봉전마을', 'http://www.naver.com', '전병경', '000-000-0000', '경남', '함양군', '농작물경작체험', '농산물 수확 체험', '경상남도 함양군 서하면 봉전길 48', '35.626138', '127.740616',10);
insert into village values(village_id_seq.nextval,'송전마을(송전)', 'http://www.naver.com', '김기완', '000-000-0000', '경남', '함양군', '농작물경작체험', '감따기', '경상남도 함양군 휴천면 송전길 198', '35.420393', '127.727213',10);
insert into village values(village_id_seq.nextval,'율림마을', 'http://www.naver.com', '김상수', '000-000-0000', '경남', '함양군', '농작물경작체험', '농산물 수확 체험', '경상남도 함양군 안의면 율림길 72-5', '35.614192', '127.806928',10);
insert into village values(village_id_seq.nextval,'창원마을', 'http://www.naver.com', '김진옥', '055-964-9100', '경남', '함양군', '농작물경작체험', '농사체험', '경상남도 함양군 마천면 창원아랫길 45', '35.423872', '127.677056',10);
insert into village values(village_id_seq.nextval,'추성마을', 'http://www.naver.com', '장석윤', '000-000-0000', '경남', '함양군', '농작물경작체험', '농촌체험', '경상남도 함양군 마천면 칠선로 230', '35.38847967', '127.695427',10);
insert into village values(village_id_seq.nextval,'큰가내마을', 'http://www.naver.com', '서우식', '000-000-0000', '경남', '함양군', '농작물경작체험', '농산물 수확체험', '경상남도 함양군 서상면 대남로 179', '35.693878', '127.700119',10);
insert into village values(village_id_seq.nextval,'각사뽈똥마을', 'https://cafe.naver.com/boldong', '김석환', '055-934-0905', '경남', '합천군', '전통문화체험', '가마솥밥 짓기', '경상남도 합천군 가야면 야천로 101', '35.772978', '128.139582',10);
insert into village values(village_id_seq.nextval,'밤마리권역', 'http://www.naver.com', '서광복', '055-932-9258', '경남', '합천군', '만들기체험', '마늘고추, 오광대탈,캐릭터수제비', '경상남도 합천군 덕곡면 율지2길 13-7', '35.615537', '128.359602',10);
insert into village values(village_id_seq.nextval,'하남농어촌체험휴양마을', 'http://www.naver.com', '성영수', '055-931-7622', '경남', '합천군', '만들기체험', '두부만들기, 떡메치기, 장담기(항아리분양)', '경상남도 합천군 초계면 국사봉로 903', '35.531262', '128.251354',10);
insert into village values(village_id_seq.nextval,'가야권역소리마실마을', 'http://www.sorimasilcamp.com', '도남석', '055-934-2221', '경남', '합천군', '농작물경작체험', '감자 케기', '경상남도 합천군 가야면 가야산로 1267', '35.772468', '128.128843',10);
insert into village values(village_id_seq.nextval,'대기철쭉꽃마을', 'http://gahoe.co.kr', '권덕현', '055-931-1313', '경남', '합천군', '농작물경작체험', '농작물경작,수확체험', '경상남도 합천군 가회면 대기2길 17', '35.462707', '128.002064',10);
insert into village values(village_id_seq.nextval,'합천박물관마을농촌체험휴양마을', 'http://www.naver.com', '정화섭', '000-000-0000', '경남', '합천군', '농작물경작체험', '딸기따먹기체험, 떡(양파,딸기)만들기', '경상남도 합천군 쌍책면 황강옥전로 1620', '35.574935', '128.284802',10);
insert into village values(village_id_seq.nextval,'반곡지마을', 'http://www.naver.com', '송일하', '000-000-0000', '경북', '경산시', '자연생태체험', '복사꽃걷기', '경상북도 경산시 남산면 반곡길 13', '35.784052', '128.806515',10);
insert into village values(village_id_seq.nextval,'육동권역 행복마을 농촌체험휴양마을', 'http://www.naver.com', '박종환', '053-856-1117', '경북', '경산시', '만들기체험', '미나리효소, 포도주담그기', '경상북도 경산시 용성면 육동로 638', '35.764024', '128.914146',10);
insert into village values(village_id_seq.nextval,'세심마을', 'http://sesim.go2vil.org', '이지출', '054-762-6148', '경북', '경주시', '전통문화체험', '고리던지기', '경상북도 경주시 안강읍 세심길 20-9', '36.01527036', '129.161961',10);
insert into village values(village_id_seq.nextval,'다봉마을', 'http://www.naver.com', '김인영', '000-000-0000', '경북', '경주시', '만들기체험', '김치담그기', '경상북도 경주시 산내면 장사길 431', '35.81586978', '129.036493',10);
insert into village values(village_id_seq.nextval,'하범곡마을', 'https://cafe.daum.net/hju8001', '황지운', '000-000-0000', '경북', '경주시', '만들기체험', '금관만들기', '경상북도 경주시 양북면 하범길 199', '35.790435', '129.372637',10);
insert into village values(village_id_seq.nextval,'옥산마을', 'http://www.sesim.kr', '김금조', '000-000-0000', '경북', '경주시', '농작물경작체험', '꽃마차타고 역사탐방', '경상북도 경주시 안강읍 중부2길 14', '36.00198966', '129.171614',10);
insert into village values(village_id_seq.nextval,'가얏고마을', 'http://www.gayatgo.net', '안성호', '054-956-1799', '경북', '고령군', '전통문화체험', '가야금연주체험', '경상북도 고령군 대가야읍 정정골길 55', '35.741761', '128.260928',10);
insert into village values(village_id_seq.nextval,'고령예마을', 'http://www.yegogo.co.kr', '김병환', '054-954-5555', '경북', '고령군', '만들기체험', '넵킨아트(나만의가방만들기)', '경상북도 고령군 덕곡면 덕운로 816', '35.793151', '128.213378',10);
insert into village values(village_id_seq.nextval,'개실마을', 'http://www.gaesil.net', '김민규', '054-956-4022', '경북', '고령군', '농작물경작체험', '감자수확', '경상북도 고령군 쌍림면 개실1길 29', '35.667983', '128.2298199',10);
insert into village values(village_id_seq.nextval,'산주마을', 'http://www.naver.com', '신종윤', '000-000-0000', '경북', '고령군', '농작물경작체험', '고구마수확체', '경상북도 고령군 쌍림면 산주길 50-21', '35.672783', '128.173655',10);
insert into village values(village_id_seq.nextval,'서우재마을', 'http://www.naver.com', '배명호', '000-000-0000', '경북', '고령군', '농작물경작체험', '감자캐기', '경상북도 고령군 덕곡면 노리2길 49', '35.801264', '128.173833',10);
insert into village values(village_id_seq.nextval,'신리마을', 'http://www.naver.com', '문성열', '054-954-6011', '경북', '고령군', '농작물경작체험', '감자수확체험', '경상북도 고령군 대가야읍 낫질로 561-5', '35.749842', '128.219819',10);
insert into village values(village_id_seq.nextval,'모례가정권역', 'http://silla.invil.org', '김상종', '054-472-5318', '경북', '구미시', '만들기체험', '도자기, 두부, 한과, 마을산길걷기', '경상북도 구미시 도개면 도개다곡길 389-7', '36.28952973', '128.360113',10);
insert into village values(village_id_seq.nextval,'춤새마을', 'http://www.chumsae.co.kr', '강성구', '054-481-2123', '경북', '구미시', '농작물경작체험', '농산물 수확 체험', '경상북도 구미시 무을면 안곡지길 11-7', '36.2718896', '128.151385',10);
insert into village values(village_id_seq.nextval,'한듬골', 'http://www.naver.com', '최규성', '054-532-2227', '경북', '구미시', '농작물경작체험', '농촌체험', '경상북도 구미시 옥성면 산촌옥관로 969', '36.343484', '128.274228',10);
insert into village values(village_id_seq.nextval,'고지바위권역 장군마을', 'http://www.naver.com', '사공록', '054-382-5777', '경북', '군위군', '만들기체험', '꽃떡, 석고방향제, 천연비누', '경상북도 군위군 효령면 장군당1길 24-6', '36.123591', '128.574713',10);
insert into village values(village_id_seq.nextval,'삼국유사화본마을', 'http://www.hwabon.kr', '윤진기', '054-382-3361', '경북', '군위군', '만들기체험', '글라이드 만들기', '경상북도 군위군 산성면 산성가음로 722', '36.12777953', '128.6961202',10);
insert into village values(village_id_seq.nextval,'석산약바람산촌생태마을', 'http://seoksanri.kr', '최남섭', '054-383-6866', '경북', '군위군', '농작물경작체험', '고로쇠수액체험', '경상북도 군위군 고로면 석산길 193', '36.190647', '128.863045',10);
insert into village values(village_id_seq.nextval,'옛날솜씨마을', 'http://gimcheonsomsi.modoo.at', '최병술', '054-437-0455', '경북', '김천시', '전통문화체험', '고추장만들기체험', '경상북도 김천시 증산면 평촌3길 25-10', '35.895088', '128.021335',10);
insert into village values(village_id_seq.nextval,'이화만리마을', 'http://www.naver.com', '위현복', '054-436-1213', '경북', '김천시', '만들기체험', '김치담그기', '경상북도 김천시 농소면 벽봉로 1651', '36.071647', '128.1773603',10);
insert into village values(village_id_seq.nextval,'나실마을', 'http://www.nasil.kr', '이경애', '070-8134-0874', '경북', '문경시', '자연생태체험', '다슬기잡기', '경상북도 문경시 마성면 하내1길 32-32', '36.654735', '128.090926',10);
insert into village values(village_id_seq.nextval,'상내권역나실마을', 'http://www.nasil.co.kr/', '김도묵', '054-572-0402', '경북', '문경시', '자연생태체험', '맨손물고기잡기', '경상북도 문경시 마성면 상내1길 99', '36.67516961', '128.0731799',10);
insert into village values(village_id_seq.nextval,'궁터마을', 'http://www.naver.com', '여상일', '054-571-8395', '경북', '문경시', '만들기체험', '두부만들기', '경상북도 문경시 농암면 궁터길 179-8', '36.613594', '127.962483',10);
insert into village values(village_id_seq.nextval,'문경오미자권역마을', 'http://www.naver.com', '한명호', '054-552-5579', '경북', '문경시', '만들기체험', '도예수강', '경상북도 문경시 동로면 노은1길 26', '36.76981012', '128.316725',10);
insert into village values(village_id_seq.nextval,'문경큰사람마을', 'http://www.naver.com', '채희태', '054-552-1035', '경북', '문경시', '만들기체험', '도자기체험', '경상북도 문경시 산북면 거무길 9', '36.722643', '128.241501',10);
insert into village values(village_id_seq.nextval,'하늘오름마실', 'http://www.naver.com', '김정수', '000-000-0000', '경북', '문경시', '만들기체험', '도자기체험', '경상북도 문경시 문경읍 관음길 77', '36.795744', '128.156161',10);
insert into village values(village_id_seq.nextval,'닭실마을', 'http://www.naver.com', '권영조', '000-000-0000', '경북', '봉화군', '전통문화체험', '서당체험', '경상북도 봉화군 봉화읍 충재길 60', '36.905272', '128.742447',10);
insert into village values(village_id_seq.nextval,'문수골가재마을', 'http://www.naver.com', '정해수', '054-672-1199', '경북', '봉화군', '전통문화체험', '가재에술제', '경상북도 봉화군 봉성면 시거리길 196', '36.929751', '128.825654',10);
insert into village values(village_id_seq.nextval,'다슬기마을', 'http://www.naver.com', '황창호', '054-674-3445', '경북', '봉화군', '자연생태체험', '구곡생태체험', '경상북도 봉화군 재산면 재산로 799', '36.839685', '128.972418',10);
insert into village values(village_id_seq.nextval,'청량산비나리마을', 'http://binari.invil.org', '금동윤', '054-673-1927', '경북', '봉화군', '만들기체험', '고추장만들기', '경상북도 봉화군 명호면 비나리길 141', '36.839533', '128.881051',10);
insert into village values(village_id_seq.nextval,'한누리워낭마을', 'http://www.naver.com', '김영기', '000-000-0000', '경북', '봉화군', '만들기체험', '서각체험', '경상북도 봉화군 상운면 하눌로 4', '36.860495', '128.767887',10);
insert into village values(village_id_seq.nextval,'덕산뚜드리마을', 'http://www.naver.com', '박재호', '054-674-2882', '경북', '봉화군', '농작물경작체험', '농산물수확체험', '경상북도 봉화군 재산면 동면로 410', '36.799142', '128.994113',10);
insert into village values(village_id_seq.nextval,'문수골권역마을', 'http://www.naver.com', '김주홍', '054-672-1142', '경북', '봉화군', '농작물경작체험', '농산물 수확 체험', '경상북도 봉화군 봉성면 다덕로 565', '36.912486', '128.795347',10);
insert into village values(village_id_seq.nextval,'오전애마을', 'http://www.naver.com', '김근배', '000-000-0000', '경북', '봉화군', '농작물경작체험', '사과꽃따기 체험', '경상북도 봉화군 물야면 오전길 17-27', '36.993007', '128.720074',10);
insert into village values(village_id_seq.nextval,'하늘휴양마을', 'http://www.naver.com', '홍순광', '000-000-0000', '경북', '봉화군', '농작물경작체험', '농산물 수확 체험', '경상북도 봉화군 상운면 계밑길 9', '36.874526', '128.780192',10);
insert into village values(village_id_seq.nextval,'협곡구비마을', 'http://www.naver.com', '조완희', '000-000-0000', '경북', '봉화군', '농작물경작체험', '농촌체험', '경상북도 봉화군 소천면 풍애길 9-42', '36.927021', '129.053378',10);
insert into village values(village_id_seq.nextval,'우분투 농촌체험휴양마을', 'http://www.naver.com', '문희탁', '000-000-0000', '경북', '상주시', '전통문화체험', '옥동서원 선비체험', '경상북도 상주시 모동면 수봉3길 91-16', '36.293657', '127.937292',10);
insert into village values(village_id_seq.nextval,'우복동마을', 'http://www.naver.com', '박동식', '054-536-9722', '경북', '상주시', '자연생태체험', '곤충채집, 다슬기잡기, 민물고기 잡기', '경상북도 상주시 화북면 청화로 148', '36.571185', '127.929245',10);
insert into village values(village_id_seq.nextval,'노류2리마을', 'http://noryu.kr', '김연균', '054-533-7447', '경북', '상주시', '만들기체험', '누에고치체험', '경상북도 상주시 내서면 배골길 505', '36.35695985', '128.040691',10);
insert into village values(village_id_seq.nextval,'밤원농촌체험휴양마을', 'http://www.bamwon.org', '강휘석', '070-4259-3654', '경북', '상주시', '만들기체험', 'EM효소천연비누만들기', '경상북도 상주시 내서면 서원3길 29-80', '36.441828', '128.007588',10);
insert into village values(village_id_seq.nextval,'버들뱅이마을', 'https://cafe.daum.net/menemiakdmf', '정일영', '000-000-0000', '경북', '상주시', '만들기체험', '곶감만들기', '경상북도 상주시 모서면 득수1길 186-13', '36.335989', '127.879368',10);
insert into village values(village_id_seq.nextval,'오봉산마을', 'http://www.naver.com', '고화옥', '054-541-1700', '경북', '상주시', '만들기체험', '산나물장이찌만들기', '경상북도 상주시 함창읍 신흥3길 1', '36.542795', '128.192421',10);
insert into village values(village_id_seq.nextval,'은자골마을', 'http://www.eunjagol.kr', '박기석', '054-541-6182', '경북', '상주시', '만들기체험', '강정만들기', '경상북도 상주시 은척면 황령길 9', '36.531201', '128.003098',10);
insert into village values(village_id_seq.nextval,'구마이곶감정보화마을', 'http://gam.invil.org', '이상진', '054-533-0952', '경북', '상주시', '농작물경작체험', '감깎기체험', '경상북도 상주시 내서면 서만4길 50', '36.452216', '128.062584',10);
insert into village values(village_id_seq.nextval,'버드니마을', 'http://www.naver.com', '신석봉', '054-531-0118', '경북', '상주시', '농작물경작체험', '감자,옥수수 따기', '경상북도 상주시 화동면 중화로 1324', '36.37555982', '127.953524',10);
insert into village values(village_id_seq.nextval,'승곡마을', 'http://www.gosg.or.kr', '조원희', '054-531-0154', '경북', '상주시', '농작물경작체험', '4계절농사체험(벼,땅콩,감자,고구마등)', '경상북도 상주시 낙동면 승곡1길 34', '36.365884', '128.210106',10);
insert into village values(village_id_seq.nextval,'초록별마을', 'http://www.naver.com', '이상범', '000-000-0000', '경북', '상주시', '농작물경작체험', '농촌체험', '경상북도 상주시 공검면 비재로 693-3', '36.521707', '128.111945',10);
insert into village values(village_id_seq.nextval,'한농마을', 'https://hannongmall.kr', '한원석', '054-536-0406', '경북', '상주시', '건강', '꽃차체험', '경상북도 상주시 외서면 송죽동2길 15', '36.523956', '127.957755',10);
insert into village values(village_id_seq.nextval,'윤동마을', 'http://www.naver.com', '김기홍', '054-933-3537', '경북', '성주군', '전통문화체험', '다도체험', '경상북도 성주군 수륜면 수륜길 53', '35.827857', '128.214989',10);
insert into village values(village_id_seq.nextval,'가람마을', 'http://www.naver.com', '이훈식', '000-000-0000', '경북', '성주군', '만들기체험', '가래떡만들기, 고구마땅콩캐기, 메기잡이체험, 메뚜기 잡기', '경상북도 성주군 수륜면 참별로 1276-14', '35.860008', '128.185465',10);
insert into village values(village_id_seq.nextval,'금수강산권역', 'http://gangsan.org', '이범석', '054-931-7701', '경북', '성주군', '만들기체험', '레진공예', '경상북도 성주군 금수면 성주로 1903', '35.91891008', '128.177384',10);
insert into village values(village_id_seq.nextval,'남작골권역', 'http://www.naver.com', '이돈석', '000-000-0000', '경북', '성주군', '만들기체험', '감잘 삼굿구이체험', '경상북도 성주군 수륜면 보월로 8-23', '35.803636', '128.270566',10);
insert into village values(village_id_seq.nextval,'장학전통체험휴양마을', 'http://www.naver.com', '유성용', '000-000-0000', '경북', '성주군', '만들기체험', '전통 두부만들기 체험', '경상북도 성주군 선남면 장학1길 161', '35.886176', '128.293938',10);
insert into village values(village_id_seq.nextval,'가야산칠불봉야생화마을', 'http://www.naver.com', '김광수', '000-000-0000', '경북', '성주군', '농작물경작체험', '고로쇠및거자수수액체취체험', '경상북도 성주군 가천면 신계1길 4-12', '35.857628', '128.101636',10);
insert into village values(village_id_seq.nextval,'안동포길쌈마을', 'http://www.naver.com', '임대식', '054-822-6464', '경북', '안동시', '전통문화체험', '고택체험', '경상북도 안동시 임하면 금소길 348', '36.505312', '128.850741',10);
insert into village values(village_id_seq.nextval,'저우리마을', 'http://www.juwury.com', '류근우', '000-000-0000', '경북', '안동시', '전통문화체험', '고택체험', '경상북도 안동시 풍천면 장수길 70', '36.547419', '128.508233',10);
insert into village values(village_id_seq.nextval,'안동백조마을', 'http://www.adswanvill.com', '장준범', '054-856-7005', '경북', '안동시', '자연생태체험', '백조관람', '경상북도 안동시 남후면 무릉1길 20-13', '36.518911', '128.677995',10);
insert into village values(village_id_seq.nextval,'몽실마을', 'http://www.naver.com', '이성수', '000-000-0000', '경북', '안동시', '만들기체험', '계절별 수확체험', '경상북도 안동시 일직면 일직점곡로 34', '36.46440039', '128.666684',10);
insert into village values(village_id_seq.nextval,'천지갑산마을', 'http://www.yessong.co.kr', '임영섭', '054-822-8833', '경북', '안동시', '만들기체험', '사과 파이만들기', '경상북도 안동시 길안면 송사시장길 102', '36.368424', '128.929117',10);
insert into village values(village_id_seq.nextval,'가송마을', 'http://www.naver.com', '남효경', '054-859-6660', '경북', '안동시', '농작물경작체험', '농사체험둘러보기', '경상북도 안동시 도산면 퇴계로 3443', '36.770748', '128.889534',10);
insert into village values(village_id_seq.nextval,'달사과마을', 'http://www.naver.com', '김동열', '054-842-0117', '경북', '안동시', '농작물경작체험', '사과따기', '경상북도 안동시 북후면 월전큰마길 116-82', '36.68569015', '128.665379',10);
insert into village values(village_id_seq.nextval,'봉정사국화마을', 'http://www.naver.com', '조영호', '054-859-8600', '경북', '안동시', '농작물경작체험', '영농체험', '경상북도 안동시 서후면 봉정사길 163-4', '36.645722', '128.666161',10);
insert into village values(village_id_seq.nextval,'산매골마을', 'http://sanmaegol.com', '권대석', '054-853-0577', '경북', '안동시', '농작물경작체험', '농산물 수확체험', '경상북도 안동시 와룡면 이하오산로 388', '36.610935', '128.738073',10);
insert into village values(village_id_seq.nextval,'암산마을', 'http://www.naver.com', '정중선', '054-858-4433', '경북', '안동시', '농작물경작체험', '농사체험', '경상북도 안동시 남후면 암산1길 61', '36.506696', '128.678724',10);
insert into village values(village_id_seq.nextval,'온혜농부들마을', 'http://www.naver.com', '박성호', '000-000-0000', '경북', '안동시', '농작물경작체험', '감자/고구마 수확 체험', '경상북도 안동시 도산면 퇴계로 2642-8', '36.74914966', '128.833243',10);
insert into village values(village_id_seq.nextval,'속곡산촌생태마을', 'http://www.naver.com', '차해동', '000-000-0000', '경북', '영덕군', '자연생태체험', '고로수 수액채취', '경상북도 영덕군 지품면 속곡길 501', '36.476982', '129.254499',10);
insert into village values(village_id_seq.nextval,'옥계권역마을', 'http://www.naver.com', '김정호', '000-000-0000', '경북', '영덕군', '자연생태체험', '생태놀이', '경상북도 영덕군 달산면 팔각산로 1143', '36.35765982', '129.282146',10);
insert into village values(village_id_seq.nextval,'고래불권역마을', 'http://www.naver.com', '배영기', '054-732-0540', '경북', '영덕군', '농작물경작체험', '농산물 수확 체험', '경상북도 영덕군 병곡면 동해대로 7272-28', '36.589878', '129.4055995',10);
insert into village values(village_id_seq.nextval,'고래산마을', 'http://www.naver.com', '전병길', '054-733-5558', '경북', '영덕군', '농작물경작체험', '농산물 수확 체험', '경상북도 영덕군 축산면 영축로 963', '36.509293', '129.404916',10);
insert into village values(village_id_seq.nextval,'아리별마을', 'http://www.naver.com', '김광명', '054-512-7510', '경북', '영덕군', '농작물경작체험', '농산물 수확 체험', '경상북도 영덕군 축산면 칠성2길 132', '36.502513', '129.352388',10);
insert into village values(village_id_seq.nextval,'예주고을', 'http://www.naver.com', '백운상', '054-733-4321', '경북', '영덕군', '농작물경작체험', '농산물 수확 체험', '경상북도 영덕군 영해면 예주8길 14-7', '36.539062', '129.413478',10);
insert into village values(village_id_seq.nextval,'인량전통테마마을', 'http://hdk3031.wixsite.com/inryang', '권용걸', '054-734-0301', '경북', '영덕군', '농작물경작체험', '고구마/감자구워먹기', '경상북도 영덕군 창수면 인량길 178', '36.55220951', '129.371283',10);
insert into village values(village_id_seq.nextval,'쇠똥구리 마을', 'http://cheongnam.co.kr', '안해득', '000-000-0000', '경북', '영양군', '전통문화체험', '검산성 탐방', '경상북도 영양군 청기면 청기로 559', '36.635962', '129.064509',10);
insert into village values(village_id_seq.nextval,'사래마을', 'http://www.naver.com', '백영수', '054-682-4430', '경북', '영양군', '어촌생활체험', '메기잡기', '경상북도 영양군 입암면 선바위로 160-8', '36.606224', '129.061942',10);
insert into village values(village_id_seq.nextval,'두메송하마을', 'http://www.dumesongha.co.kr', '이옥용', '000-000-0000', '경북', '영양군', '만들기체험', '꽃차만들기 체험', '경상북도 영양군 수비면 가천로 614', '36.700799', '129.192123',10);
insert into village values(village_id_seq.nextval,'문바우마을', 'http://www.naver.com', '김성도', '054-683-8899', '경북', '영양군', '만들기체험', '가마솥햅쌀밥과 김장김치 한접시', '경상북도 영양군 일월면 영양로 3315', '36.757165', '129.156388',10);
insert into village values(village_id_seq.nextval,'대티골마을', 'http://www.naver.com', '김창훈', '054-682-7903', '경북', '영양군', '농작물경작체험', '고추장만들기', '경상북도 영양군 일월면 영양로 4159', '36.812336', '129.129934',10);
insert into village values(village_id_seq.nextval,'수하1리반디마을', 'http://www.naver.com', '정종대', '000-000-0000', '경북', '영양군', '농작물경작체험', '농촌체험', '경상북도 영양군 수비면 낙동정맥로 2875', '36.789602', '129.230554',10);
insert into village values(village_id_seq.nextval,'새내역사체험마을', 'http://www.naver.com', '서중일', '054-637-8225', '경북', '영주시', '전통문화체험', '부엌사용료', '경상북도 영주시 단산면 단산로112번길 29', '36.889363', '128.598729',10);
insert into village values(village_id_seq.nextval,'효마루마을', 'http://www.naver.com', '안우석', '054-632-6697', '경북', '영주시', '전통문화체험', '도자기체험(고급)', '경상북도 영주시 안정면 용주로 932', '36.813536', '128.545641',10);
insert into village values(village_id_seq.nextval,'한밤실마을', 'http://www.hanbamsil.com', '김중한', '000-000-0000', '경북', '영주시', '자연생태체험', '개울가 고동줍기', '경상북도 영주시 부석면 영부로120번길 3', '37.00183965', '128.6609803',10);
insert into village values(village_id_seq.nextval,'금대마을', 'http://gdmaul.com', '황재덕', '054-638-2752', '경북', '영주시', '만들기체험', '고추장만들기', '경상북도 영주시 단산면 소백로 3371-64', '36.964399', '128.623401',10);
insert into village values(village_id_seq.nextval,'남대리마을', 'http://www.naver.com', '임수경', '000-000-0000', '경북', '영주시', '만들기체험', '남대힐링식당', '경상북도 영주시 부석면 영부로890번길 30', '37.041213', '128.667847',10);
insert into village values(village_id_seq.nextval,'녹색농심인삼마을', 'http://www.naver.com', '임율', '054-637-7080', '경북', '영주시', '만들기체험', '고추장만들기체험', '경상북도 영주시 안정면 대평로71번길 110-20', '36.879641', '128.569787',10);
insert into village values(village_id_seq.nextval,'솔향기마을', 'http://www.naver.com', '홍성완', '054-636-1331', '경북', '영주시', '만들기체험', '두부만들기', '경상북도 영주시 봉현면 소백로1623번길 268', '36.841342', '128.498583',10);
insert into village values(village_id_seq.nextval,'꽃피는산골 농촌체험휴양마을', 'http://www.naver.com', '이호영', '054-635-0850', '경북', '영주시', '농작물경작체험', '농촌체험', '경상북도 영주시 봉현면 소백로 1132', '36.808348', '128.506833',10);
insert into village values(village_id_seq.nextval,'이산 옹고집 농어촌 체험휴양마을', 'http://www.naver.com', '김사운', '054-632-9292', '경북', '영주시', '농작물경작체험', '농촌체험', '경상북도 영주시 이산면 이산로 631', '36.834439', '128.695585',10);
insert into village values(village_id_seq.nextval,'장생이마을', 'http://www.jangsaengi.com', '권오성', '054-633-6461', '경북', '영주시', '농작물경작체험', '고구마캐기체험', '경상북도 영주시 풍기읍 금계로246번길 36', '36.895687', '128.530029',10);
insert into village values(village_id_seq.nextval,'피끝마을', 'http://www.naver.com', '안우준', '054-633-1232', '경북', '영주시', '농작물경작체험', '김장체험', '경상북도 영주시 안정면 안정로 490-32', '36.872932', '128.590923',10);
insert into village values(village_id_seq.nextval,'보현산권역정각마을', 'http://www.bohyeonsanvil.com', '최영수', '000-000-0000', '경북', '영천시', '만들기체험', '가죽공예', '경상북도 영천시 화북면 정각길 71-39', '36.14427966', '128.993353',10);
insert into village values(village_id_seq.nextval,'영천포롱마을', 'http://www.naver.com', '원종만', '000-000-0000', '경북', '영천시', '농작물경작체험', '농촌체험', '경상북도 영천시 금호읍 대동마을길 60', '35.950779', '128.882335',10);
insert into village values(village_id_seq.nextval,'은해로운휴양마을', 'http://www.naver.com', '정선득', '054-336-8083', '경북', '영천시', '농작물경작체험', '간식 (국수) 무료제공', '경상북도 영천시 청통면 대동로 423', '35.990776', '128.8003099',10);
insert into village values(village_id_seq.nextval,'치산돌담모과마을', 'http://www.naver.com', '심경수', '000-000-0000', '경북', '영천시', '농작물경작체험', '농촌체험', '경상북도 영천시 신녕면 치산안길 70-13', '36.055509', '128.712391',10);
insert into village values(village_id_seq.nextval,'삼강주막마을', 'http://www.3gang.co.kr', '정재충', '054-655-3132', '경북', '예천군', '전통문화체험', '과거길체험', '경상북도 예천군 풍양면 삼강리길 91', '36.55957027', '128.301123',10);
insert into village values(village_id_seq.nextval,'회룡포여울마을', 'http://www.naver.com', '박융길', '054-655-7120', '경북', '예천군', '자연생태체험', '회룡포여울마을 탐방', '경상북도 예천군 용궁면 용개로 357', '36.589927', '128.311435',10);
insert into village values(village_id_seq.nextval,'흰돌마을', 'http://www.naver.com', '이두현', '054-652-8005', '경북', '예천군', '자연생태체험', '곤충체험', '경상북도 예천군 효자면 제촌길 96', '36.805093', '128.4543399',10);
insert into village values(village_id_seq.nextval,'출렁다리마을', 'http://www.naver.com', '허회국', '054-652-7676', '경북', '예천군', '만들기체험', '김장체험', '경상북도 예천군 용문면 용문경천로 826', '36.702489', '128.374957',10);
insert into village values(village_id_seq.nextval,'금당실전통마을', 'http://ycgds.kr', '지원하', '054-655-0225', '경북', '예천군', '농작물경작체험', '농산물 수확 체험', '경상북도 예천군 용문면 금당실길 118-32', '36.693475', '128.410329',10);
insert into village values(village_id_seq.nextval,'유천국사골마을', 'http://ycgsg.kr', '엄봉흠', '054-655-9455', '경북', '예천군', '농작물경작체험', '농작물체험', '경상북도 예천군 유천면 죽안길 136', '36.668411', '128.346719',10);
insert into village values(village_id_seq.nextval,'회룡포마을', 'http://www.naver.com', '박재선', '054-654-6906', '경북', '예천군', '농작물경작체험', '농산물수확체험', '경상북도 예천군 용궁면 회룡길 197', '36.580428', '128.328802',10);
insert into village values(village_id_seq.nextval,'장흥권역농촌체험마을', 'http://www.naver.com', '박춘환', '000-000-0000', '경북', '울릉군', '농작물경작체험', '농산물 수확', '경상북도 울릉군 울릉읍 울릉순환로 584', '37.474162', '130.889747',10);
insert into village values(village_id_seq.nextval,'굴구지마을', 'http://www.gulgugi.co.kr', '김억년', '054-782-3737', '경북', '울진군', '자연생태체험', '송이체험', '경상북도 울진군 근남면 왕피천로 634', '36.92288014', '129.342681',10);
insert into village values(village_id_seq.nextval,'백암온천마을', 'http://www.naver.com', '신길용', '054-788-4490', '경북', '울진군', '농작물경작체험', '각종농산물수확체험', '경상북도 울진군 온정면 온정1길 119', '36.708628', '129.340875',10);
insert into village values(village_id_seq.nextval,'십이령마을', 'http://www.12goge.com', '강성국', '054-781-3036', '경북', '울진군', '농작물경작체험', '감자캐기', '경상북도 울진군 북면 두천길 293', '37.04007014', '129.321614',10);
insert into village values(village_id_seq.nextval,'방하디딜방아', 'https://blog.naver.com/rlaguseo1985', '김진호', '000-000-0000', '경북', '의성군', '전통문화체험', '디딜방아체험', '경상북도 의성군 단촌면 방하1길 226-15', '36.390486', '128.661907',10);
insert into village values(village_id_seq.nextval,'태양마을', 'http://www.naver.com', '김동윤', '000-000-0000', '경북', '의성군', '전통문화체험', '국궁', '경상북도 의성군 안계면 양곡1길 221-5', '36.425871', '128.438954',10);
insert into village values(village_id_seq.nextval,'만경촌마을', 'http://www.mkchon.com', '남유승', '054-862-8868', '경북', '의성군', '자연생태체험', '강변꽃게씨름대회', '경상북도 의성군 단밀면 구단길 182-10', '36.362007', '128.389114',10);
insert into village values(village_id_seq.nextval,'교촌마을', 'https://cafe.daum.net/kc7755', '우동추', '054-862-7755', '경북', '의성군', '농작물경작체험', '농사수확체험', '경상북도 의성군 안계면 교화길 59', '36.369722', '128.470518',10);
insert into village values(village_id_seq.nextval,'금마늘마을', 'http://www.naver.com', '김선환', '054-833-0777', '경북', '의성군', '농작물경작체험', '마늘수확체험', '경상북도 의성군 금성면 탑운길 584-7', '36.289265', '128.715529',10);
insert into village values(village_id_seq.nextval,'일산자두골마을', 'http://www.jadugol.co.kr', '이광훈', '000-000-0000', '경북', '의성군', '농작물경작체험', '농산물 수확 체험', '경상북도 의성군 봉양면 조문로 357', '36.287134', '128.622056',10);
insert into village values(village_id_seq.nextval,'백연지녹색농촌체험휴양마을', 'http://www.naver.com', '손태남', '000-000-0000', '경북', '청도군', '만들기체험', '연잎차덖기체험', '경상북도 청도군 이서면 덕령길 131-26', '35.67325998', '128.656066',10);
insert into village values(village_id_seq.nextval,'섶마리농촌체험휴양마을', 'http://seommari.wizweb.kr', '박상철', '000-000-0000', '경북', '청도군', '만들기체험', '떡, 한과, 조청만들기', '경상북도 청도군 금천면 선암로 455-25', '35.67676037', '128.892449',10);
insert into village values(village_id_seq.nextval,'송금녹색농촌휴양마을', 'http://sgmaul.modoo.at', '김대호', '000-000-0000', '경북', '청도군', '농작물경작체험', '감따기체험', '경상북도 청도군 화양읍 송금길 17', '35.708429', '128.722162',10);
insert into village values(village_id_seq.nextval,'청도성수월마을', 'http://sungsuwolvillage.modoo.at', '최희영', '054-371-1170', '경북', '청도군', '농작물경작체험', '계절 수확체험', '경상북도 청도군 풍각면 장기길 7', '35.660673', '128.584196',10);
insert into village values(village_id_seq.nextval,'덕천마을(참소슬마을)', 'http://www.naver.com', '심상법', '000-000-0000', '경북', '청송군', '전통문화체험', '가훈쓰기', '경상북도 청송군 파천면 덕천길 56', '36.437652', '129.0282598',10);
insert into village values(village_id_seq.nextval,'신촌약수꽃돌체험휴양마을', 'http://www.naver.com', '이동국', '054-872-5850', '경북', '청송군', '만들기체험', '꽃차 소믈리에 체험', '경상북도 청송군 진보면 신촌1길 4', '36.505371', '129.118117',10);
insert into village values(village_id_seq.nextval,'괴정꽃돌마을', 'http://www.naver.com', '지장하', '054-874-1033', '경북', '청송군', '농작물경작체험', '농산물 수확 체험', '경상북도 청송군 진보면 신촌갈평길 454', '36.472477', '129.131513',10);
insert into village values(village_id_seq.nextval,'달기샘마을', 'http://www.naver.com', '윤남도', '054-874-3232', '경북', '청송군', '농작물경작체험', '각종 농사 체험', '경상북도 청송군 청송읍 부곡길 32', '36.444183', '129.0800805',10);
insert into village values(village_id_seq.nextval,'얼음골마을', 'http://www.naver.com', '이호운', '054-872-7411', '경북', '청송군', '농작물경작체험', '농산물수확체험', '경상북도 청송군 주왕산면 용강길 72', '36.3136498', '129.199953',10);
insert into village values(village_id_seq.nextval,'금남오이꽃동산마을', 'http://kumnam.invil.org', '이은수', '000-000-0000', '경북', '칠곡군', '만들기체험', '꽃바구니만들기', '경상북도 칠곡군 왜관읍 금남1길 67', '35.923971', '128.406257',10);
insert into village values(village_id_seq.nextval,'학수고대마을', 'http://www.naver.com', '이순옥', '000-000-0000', '경북', '칠곡군', '만들기체험', '농산물 수확 체험', '경상북도 칠곡군 가산면 학상6길 35', '36.095618', '128.502935',10);
insert into village values(village_id_seq.nextval,'가산산성마을', 'http://www.sansungvil.co.kr', '우창길', '054-972-6635', '경북', '칠곡군', '농작물경작체험', '감자캐기체험', '경상북도 칠곡군 가산면 가산로 891', '36.049999', '128.597782',10);
insert into village values(village_id_seq.nextval,'말하는은행나무', 'http://www.naver.com', '장광원', '054-975-8600', '경북', '칠곡군', '농작물경작체험', '농산물 수확 체험', '경상북도 칠곡군 기산면 지산로 331', '35.996701', '128.323433',10);
insert into village values(village_id_seq.nextval,'용산리마을', 'http://www.naver.com', '차순규', '000-000-0000', '경북', '칠곡군', '농작물경작체험', '농산물 수확 체험', '경상북도 칠곡군 지천면 용산로 79-4', '35.904893', '128.499461',10);
insert into village values(village_id_seq.nextval,'봉좌마을', 'http://www.bjmul.kr', '김재종', '054-243-2372', '경북', '포항시', '농작물경작체험', '감자캐기 체험', '경상북도 포항시 북구 기계면 봉계길 46', '36.077795', '129.1700701',10);
insert into village values(village_id_seq.nextval,'죽장두마마을', 'http://www.naver.com', '구창모', '054-261-0660', '경북', '포항시', '농작물경작체험', '고로쇠 순따기 체험', '경상북도 포항시 북구 죽장면 면봉산길 828', '36.169019', '129.024689',10);
insert into village values(village_id_seq.nextval,'창지봉산마을', 'http://www.bongsan.kr', '정만돌', '054-274-3066', '경북', '포항시', '농작물경작체험', '고구마캐기체험', '경상북도 포항시 남구 장기면 장기로 795', '35.930173', '129.482154',10);
insert into village values(village_id_seq.nextval,'탑정마을', 'http://www.naver.com', '이형원', '000-000-0000', '경북', '포항시', '기타', '고향체험', '경상북도 포항시 북구 기북면 비학산길 67', '36.155755', '129.192249',10);
insert into village values(village_id_seq.nextval,'평촌명품마을', 'http://bandivill.net', '정태원', '000-000-0000', '전남', '광주 광역시 북구', '전통문화체험', '떡메치기, 솟대체험, 도예체험', '광주광역시 북구 평촌길 15', '35.17561045', '127.010546',10);
insert into village values(village_id_seq.nextval,'대청호두메마을', 'http://www.naver.com', '황부월', '000-000-0000', '충북', '대전광역시 대덕구', '만들기체험', '김장담그기체험', '대전광역시 대덕구 대청호수로1326번길 97', '36.414609', '127.4666903',10);
insert into village values(village_id_seq.nextval,'장동계족산농촌체험휴양마을', 'http://www.naver.com', '장경화', '070-8832-5959', '충북', '대전광역시 대덕구', '만들기체험', '한과체험', '대전광역시 대덕구 장동로278번안길 47-21', '36.414865', '127.4471402',10);
insert into village values(village_id_seq.nextval,'찬샘마을', 'http://www.chansaem.com', '변대섭', '042-274-3399', '충북', '대전광역시 동구', '만들기체험', '가면만들기', '대전광역시 동구 냉천로 703', '36.417889', '127.479748',10);
insert into village values(village_id_seq.nextval,'선창마을', 'http://www.naver.com', '이선덕', '000-000-0000', '충북', '대전광역시 유성구', '만들기체험', '김장체험', '대전광역시 유성구 계백로93번길 111', '36.280058', '127.265534',10);
insert into village values(village_id_seq.nextval,'세동마을', 'http://www.sedong.or.kr', '김영현', '042-825-7881', '충북', '대전광역시 유성구', '농작물경작체험', '방울토마토따기', '대전광역시 유성구 세동로 488', '36.311771', '127.268896',10);
insert into village values(village_id_seq.nextval,'무수천하마을', 'http://www.naver.com', '권용제', '042-285-5557', '충북', '대전광역시 중구', '농작물경작체험', '가지수확체험', '대전광역시 중구 운남로85번길 5', '36.277273', '127.406966',10);
insert into village values(village_id_seq.nextval,'아람달마을', 'http://www.dongrim.net/', '정규호', '044-868-1055', '경기', '세종특별자치시 세종시', '만들기체험', '계절음식체험', '세종특별자치시 전동면 운주산로 606', '36.665948', '127.244945',10);
insert into village values(village_id_seq.nextval,'청솔농촌체험휴양마을', 'http://www.chungsolvillage.co.kr', '권구호', '044-866-9977', '경기', '세종특별자치시 세종시', '만들기체험', '두부, 메주, 여치집, 인절미, 짚풀공예', '세종특별자치시 전동면 배일길 124', '36.674558', '127.256797',10);
insert into village values(village_id_seq.nextval,'향이랑청이랑', 'http://www.naver.com', '이정열', '044-863-0454', '경기', '세종특별자치시 세종시', '만들기체험', '과일파르페, 두부만들기', '세종특별자치시 연서면 도신고복로 429', '36.595239', '127.214391',10);
insert into village values(village_id_seq.nextval,'한울타리마을', 'http://www.naver.com', '고성택', '052-295-2533', '경남', '울산광역시 북구', '농작물경작체험', '감자캐기', '울산광역시 북구 중보길 10', '35.6604901', '129.335912',10);
insert into village values(village_id_seq.nextval,'소호마을', 'http://www.naver.com', '김득용', '052-254-0220', '경남', '울산광역시 울주군', '전통문화체험', '밧줄놀이', '울산광역시 울주군 상북면 소호당리길 6-1', '35.669833', '129.086612',10);
insert into village values(village_id_seq.nextval,'금곡마을', 'https://blog.daum.net/gnbioland', '선찬원', '052-264-6384', '경남', '울산광역시 울주군', '만들기체험', '강정만들기', '울산광역시 울주군 삼동면 금곡길 43', '35.507951', '129.1496604',10);
insert into village values(village_id_seq.nextval,'중리마을', 'http://www.naver.com', '김종환', '000-000-0000', '경남', '울산광역시 울주군', '만들기체험', '딱다구리 만들기', '울산광역시 울주군 삼동면 삼동로 1098', '35.520966', '129.178124',10);
insert into village values(village_id_seq.nextval,'행정마을', 'http://www.naver.com', '맹종익', '052-264-5885', '경남', '울산광역시 울주군', '만들기체험', '가족가훈 만들기', '울산광역시 울주군 상북면 덕현행정길 22', '35.614901', '129.045706',10);
insert into village values(village_id_seq.nextval,'못안마을', 'http://www.naver.com', '정장모', '052-298-8883', '경남', '울산광역시 울주군', '농작물경작체험', '감수학체험', '울산광역시 울주군 상북면 지내신리길 20', '35.597726', '129.109202',10);
insert into village values(village_id_seq.nextval,'치술령농어촌체험휴양마을', 'http://www.ddasiri.kr', '서우규', '052-254-8846', '경남', '울산광역시 울주군', '농작물경작체험', '감따기체험', '울산광역시 울주군 두동면 만화로 331', '35.652585', '129.232368',10);
insert into village values(village_id_seq.nextval,'볼음도저어새생태마을', 'http://www.naver.com', '채기철', '000-000-0000', '경기', '인천광역시 강화군', '자연생태체험', '갯벌체험', '인천광역시 강화군 서도면 볼음도길 224', '37.670909', '126.192225',10);
insert into village values(village_id_seq.nextval,'국화리팜랜드', 'http://www.naver.com', '김낙원', '000-000-0000', '경기', '인천광역시 강화군', '만들기체험', '강화도 쑥개떡체험', '인천광역시 강화군 강화읍 국화길 168', '37.742153', '126.458081',10);
insert into village values(village_id_seq.nextval,'석모도해미지영농조합법인', 'http://www.naver.com', '장의재', '000-000-0000', '경기', '인천광역시 강화군', '만들기체험', '순무김치, 보리수제비, 쑥개떡 만들기', '인천광역시 강화군 삼산면 삼산남로 109-25', '37.685344', '126.366667',10);
insert into village values(village_id_seq.nextval,'화문석마을', 'http://www.naver.com', '이만호', '032-934-2290', '경기', '인천광역시 강화군', '만들기체험', '고구마 묵 만들기', '인천광역시 강화군 송해면 전망대로 452', '37.79988006', '126.458514',10);
insert into village values(village_id_seq.nextval,'달빛동화마을', 'http://www.naver.com', '윤종완', '032-937-9960', '경기', '인천광역시 강화군', '농작물경작체험', '감자수확체험', '인천광역시 강화군 양도면 강화남로921번길 10-6', '37.68029963', '126.4165399',10);
insert into village values(village_id_seq.nextval,'도래미마을', 'http://www.doraemi.kr', '구정회', '032-934-4994', '경기', '인천광역시 강화군', '농작물경작체험', '감따기체험', '인천광역시 강화군 선원면 해안동로 1129-19', '37.715204', '126.509146',10);
insert into village values(village_id_seq.nextval,'용두레농어촌체험휴양마을', 'http://yongdure.co.kr', '배광혁', '032-933-5711', '경기', '인천광역시 강화군', '농작물경작체험', '감자수확체험', '인천광역시 강화군 내가면 황청포구로385번길 8', '37.718523', '126.360429',10);
insert into village values(village_id_seq.nextval,'행복나드리불은마을', 'http://www.naver.com', '황의영', '032-937-0482', '경기', '인천광역시 강화군', '농작물경작체험', '감자수확체험', '인천광역시 강화군 불은면 강화동로 416', '37.67521006', '126.487989',10);
insert into village values(village_id_seq.nextval,'금까내 농어촌체험휴양마을', 'https://blog.naver.com/youngs6654', '우종대', '061-433-6654', '전남', '강진군', '만들기체험', '꽃사탕, 와플만들기', '전라남도 강진군 작천면 까치내로 765', '34.700028', '126.777546',10);
insert into village values(village_id_seq.nextval,'녹향월촌마을', 'http://www.naver.com', '정인태', '061-432-3535', '전남', '강진군', '만들기체험', '감말랭이 만들기', '전라남도 강진군 성전면 백운로 95-5', '34.741463', '126.708908',10);
insert into village values(village_id_seq.nextval,'안풍마을', 'http://www.naver.com', '김영숙', '000-000-0000', '전남', '강진군', '만들기체험', '민화, 손바느질, 잼만들기', '전라남도 강진군 군동면 군동금강길 115', '34.647138', '126.834597',10);
insert into village values(village_id_seq.nextval,'다산초당권역', 'http://www.naver.com', '윤정인', '000-000-0000', '전남', '강진군', '농작물경작체험', '농산물수확체험', '전라남도 강진군 도암면 다산초당길 30', '34.576948', '126.748897',10);
insert into village values(village_id_seq.nextval,'달마지마을', 'http://www.naver.com', '조홍경', '061-432-2475', '전남', '강진군', '농작물경작체험', '감따기', '전라남도 강진군 성전면 달마지길 2', '34.705598', '126.698924',10);
insert into village values(village_id_seq.nextval,'도룡마을', 'http://www.naver.com', '류권수', '061-433-9497', '전남', '강진군', '농작물경작체험', '감따기', '전라남도 강진군 병영면 도룡길 2', '34.698869', '126.827891',10);
insert into village values(village_id_seq.nextval,'신기녹색농촌체험마을', 'http://www.gangjinjang.co.kr', '윤성우', '061-434-1616', '전남', '강진군', '농작물경작체험', '감자캐기', '전라남도 강진군 군동면 신기2길 2', '34.654041', '126.846084',10);
insert into village values(village_id_seq.nextval,'엄지마을', 'http://www.naver.com', '김감순', '061-434-0770', '전남', '강진군', '농작물경작체험', '고구마 구워먹기', '전라남도 강진군 옴천면 옴천로 760-23', '34.760043', '126.773118',10);
insert into village values(village_id_seq.nextval,'탐진사인마을', 'http://www.naver.com', '전운재', '061-433-4244', '전남', '강진군', '농작물경작체험', '모시송편만들기', '전라남도 강진군 군동면 풍동1길 5-1', '34.651054', '126.854364',10);
insert into village values(village_id_seq.nextval,'사포희망마을', 'http://www.naver.com', '김상택', '000-000-0000', '전남', '고흥군', '자연생태체험', '고사리체험', '전라남도 고흥군 영남면 팔영로 1103', '34.60398965', '127.4583202',10);
insert into village values(village_id_seq.nextval,'선정은하수꼬막마을', 'http://www.naver.com', '전종태', '000-000-0000', '전남', '고흥군', '자연생태체험', '갯벌체험', '전라남도 고흥군 남양면 선정새샘길 3', '34.753537', '127.385797',10);
insert into village values(village_id_seq.nextval,'섬너울 오마', 'http://www.naver.com', '이종억', '061-844-9391', '전남', '고흥군', '자연생태체험', '갯벌체험', '전라남도 고흥군 도덕면 오마안길 11-7', '34.536725', '127.199999',10);
insert into village values(village_id_seq.nextval,'안뜰거북이마을', 'http://www.naver.com', '송성모', '000-000-0000', '전남', '고흥군', '자연생태체험', '별자리 관측', '전라남도 고흥군 대서면 동서로 1029', '34.73247034', '127.264462',10);
insert into village values(village_id_seq.nextval,'푸르내로마을', 'http://naero.modoo.at', '정병문', '000-000-0000', '전남', '고흥군', '자연생태체험', '개막이훌치기', '전라남도 고흥군 과역면 과역로 402-50', '34.682907', '127.319678',10);
insert into village values(village_id_seq.nextval,'명천체험마을', 'http://www.naver.com', '이승열', '000-000-0000', '전남', '고흥군', '어촌생활체험', '갯벌체험', '전라남도 고흥군 금산면 거금일주로 2067-37', '34.467572', '127.220368',10);
insert into village values(village_id_seq.nextval,'별나로마을', 'http://www.naver.com', '송종근', '000-000-0000', '전남', '고흥군', '어촌생활체험', '갯벌체험', '전라남도 고흥군 포두면 상오길 65', '34.574231', '127.404518',10);
insert into village values(village_id_seq.nextval,'고흥해창만바닷깨비마을', 'http://www.naver.com', '최순휴', '000-000-0000', '전남', '고흥군', '농작물경작체험', '농산물 수확 체험', '전라남도 고흥군 포두면 팔영로 385', '34.581041', '127.393387',10);
insert into village values(village_id_seq.nextval,'금사사도마을', 'http://www.naver.com', '지기호', '000-000-0000', '전남', '고흥군', '농작물경작체험', '농산물 수확 체험', '전라남도 고흥군 영남면 사도진해안길 131-1', '34.583028', '127.418931',10);
insert into village values(village_id_seq.nextval,'신평해울림농어촌체험휴양마을', 'http://www.naver.com', '추부행', '000-000-0000', '전남', '고흥군', '농작물경작체험', '농산물 수확 체험', '전라남도 고흥군 금산면 평산길 94', '34.490596', '127.176889',10);
insert into village values(village_id_seq.nextval,'평촌명품마을', 'http://bandivill.net', '손영준', '061-830-6239', '전남', '고흥군', '농작물경작체험', '농산물 수확 체험', '전라남도 고흥군 점암면 팔봉길 11-3', '34.641016', '127.414122',10);
insert into village values(village_id_seq.nextval,'참살이조가비촌', 'http://www.naver.com', '신태균', '000-000-0000', '전남', '고흥군', '기타', '핸드드립커피체험', '전라남도 고흥군 과역면 과역로 832', '34.678689', '127.359826',10);
insert into village values(village_id_seq.nextval,'창동마을', 'http://www.changdong.kr/', '주기택', '000-000-0000', '전남', '곡성군', '전통문화체험', '전통한복, 투호놀이체험', '전라남도 곡성군 오곡면 기차마을로 235-9', '35.276385', '127.306702',10);
insert into village values(village_id_seq.nextval,'곡성안개마을', 'http://www.naver.com', '정재근', '061-363-3231', '전남', '곡성군', '만들기체험', '나도 요리사', '전라남도 곡성군 고달면 고산로 39-18', '35.290521', '127.341982',10);
insert into village values(village_id_seq.nextval,'봉정마을', 'http://baksagol.kr', '조기봉', '000-000-0000', '전남', '곡성군', '만들기체험', '김치만들기', '전라남도 곡성군 죽곡면 봉정길 43-137', '35.193947', '127.310781',10);
insert into village values(village_id_seq.nextval,'송전권역농촌체험휴양마을', 'http://www.naver.com', '양은식', '061-363-8131', '전남', '곡성군', '만들기체험', '솔향기디퓨져, 비누, 부엉이', '전라남도 곡성군 입면 입면로 497', '35.305778', '127.188659',10);
insert into village values(village_id_seq.nextval,'칠봉목화체험농촌휴양마을', 'http://www.cottonvill.co.kr', '심우진', '061-363-7381', '전남', '곡성군', '만들기체험', '감따기체험', '전라남도 곡성군 겸면 칠봉길 87', '35.246365', '127.1798696',10);
insert into village values(village_id_seq.nextval,'가정농촌체험휴양마을', 'http://www.naver.com', '박성규', '061-363-1637', '전남', '곡성군', '농작물경작체험', '감 따기', '전라남도 곡성군 고달면 가정마을길 69', '35.226981', '127.370544',10);
insert into village values(village_id_seq.nextval,'두계외갓집마을', 'http://www.dugye.co.kr', '김종현', '070-7724-5587', '전남', '곡성군', '농작물경작체험', '감자캐기', '전라남도 곡성군 고달면 두계길 100', '35.242002', '127.377925',10);
insert into village values(village_id_seq.nextval,'무창마을', 'http://mcfarm.co.kr', '김종길', '070-8826-5832', '전남', '곡성군', '농작물경작체험', '고구마캐기', '전라남도 곡성군 옥과면 금의길 59', '35.286463', '127.152096',10);
insert into village values(village_id_seq.nextval,'봉조마을', 'http://www.bongjori.com', '심재운', '061-362-5268', '전남', '곡성군', '농작물경작체험', '계절별농사체험', '전라남도 곡성군 오곡면 봉조길 114', '35.214965', '127.360466',10);
insert into village values(village_id_seq.nextval,'오지봉권역농촌체험휴양마을', 'http://www.naver.com', '정환주', '061-362-1303', '전남', '곡성군', '농작물경작체험', '고구마캐기, 메뚜기잡기 등', '전라남도 곡성군 오산면 오산로 663-17', '35.241275', '127.115932',10);
insert into village values(village_id_seq.nextval,'용암마을', 'http://www.naver.com', '신종국', '061-362-0990', '전남', '곡성군', '농작물경작체험', '감따기', '전라남도 곡성군 목사동면 용사용암길 14-1', '35.129087', '127.312886',10);
insert into village values(village_id_seq.nextval,'죽산마을', 'http://www.naver.com', '박환주', '061-363-2090', '전남', '곡성군', '농작물경작체험', '고구마캐기체험', '전라남도 곡성군 겸면 죽산하늘재길 42', '35.233523', '127.175228',10);
insert into village values(village_id_seq.nextval,'하늘나리농촌체험마을', 'http://www.naver.com', '최규완', '000-000-0000', '전남', '곡성군', '농작물경작체험', '감따기, 농가민박, 매실따기, 물고기잡기, 밀납초만들기, 밤줍기, 봄나물캐기', '전라남도 곡성군 죽곡면 상한길 240', '35.161057', '127.398758',10);
insert into village values(village_id_seq.nextval,'고사마을', 'https://cafe.daum.net/jngygosa', '이갑규', '000-000-0000', '전남', '광양시', '만들기체험', '고무신의 재탄생', '전라남도 광양시 다압면 고시내길 162-7', '35.113531', '127.687333',10);
insert into village values(village_id_seq.nextval,'메아리마을', 'http://www.naver.com', '위영근', '061-772-3236', '전남', '광양시', '만들기체험', '떡만들기 체험', '전라남도 광양시 다압면 대청길 40', '35.154267', '127.651549',10);
insert into village values(village_id_seq.nextval,'백운산마을', 'http://www.wangguem.com', '박종윤', '061-763-2622', '전남', '광양시', '만들기체험', '광양매실청, 매실장아찌 만들기', '전라남도 광양시 옥룡면 신재로 826', '35.033215', '127.6177403',10);
insert into village values(village_id_seq.nextval,'봉강햇살촌마을', 'http://www.naver.com', '허용호', '061-762-7977', '전남', '광양시', '만들기체험', '도자기체험', '전라남도 광양시 봉강면 성불로 821', '35.052222', '127.565515',10);
insert into village values(village_id_seq.nextval,'섬진강끝들마을', 'http://ggeutdeul.modoo.at', '김선주', '000-000-0000', '전남', '광양시', '만들기체험', '목공, 세라믹, 염색, 제첩캔들', '전라남도 광양시 진월면 사평1길 23', '35.011244', '127.781683',10);
insert into village values(village_id_seq.nextval,'하조 산달뱅이 마을', 'http://hajo.co.kr', '서재현', '000-000-0000', '전남', '광양시', '만들기체험', '두부, 악세서리(매화, 무당벌레, 동백꽃)', '전라남도 광양시 봉강면 하조길 42-19', '35.074927', '127.560081',10);
insert into village values(village_id_seq.nextval,'도선국사체험마을영농조합법인', 'http://www.naver.com', '이은호', '000-000-0000', '전남', '광양시', '농작물경작체험', '감따기', '전라남도 광양시 옥룡면 상산길 31', '35.0440396', '127.592828',10);
insert into village values(village_id_seq.nextval,'백학동권역', 'http://baekhakdong.invil.org', '김재철', '061-772-8820', '전남', '광양시', '농작물경작체험', '감따기', '전라남도 광양시 진상면 성지로 2', '35.049952', '127.691429',10);
insert into village values(village_id_seq.nextval,'형제의병장마을', 'http://www.naver.com', '오후근', '061-763-8277', '전남', '광양시', '농작물경작체험', '감자수확체험', '전라남도 광양시 봉강면 신촌길 26-1', '35.059097', '127.563217',10);
insert into village values(village_id_seq.nextval,'상사마을', 'https://cafe.daum.net/jngrsangsa', '오철수', '000-000-0000', '전남', '구례군', '전통문화체험', '고택탐방', '전라남도 구례군 마산면 장수길 22', '35.21567031', '127.499971',10);
insert into village values(village_id_seq.nextval,'잔수농어촌체험휴양마을', 'http://www.naver.com', '김봉진', '000-000-0000', '전남', '구례군', '전통문화체험', '구례잔수농악', '전라남도 구례군 구례읍 신촌길 30', '35.166109', '127.458205',10);
insert into village values(village_id_seq.nextval,'섬진강수달권역 농촌체험휴양마을', 'http://www.naver.com', '김용길', '061-781-1140', '전남', '구례군', '만들기체험', '도토리묵만들기', '전라남도 구례군 간전면 간전중앙로 122', '35.180971', '127.542211',10);
insert into village values(village_id_seq.nextval,'오미마을', 'http://omi.invil.org', '이병주', '061-781-5225', '전남', '구례군', '만들기체험', '나물비빔밥체험', '전라남도 구례군 토지면 운조루길 49-1', '35.206188', '127.514211',10);
insert into village values(village_id_seq.nextval,'마산리농촌체험휴양마을', 'http://www.naver.com', '강두희', '061-783-7779', '전남', '구례군', '농작물경작체험', '농산물수확체험', '전라남도 구례군 마산면 마산길 20-1', '35.222521', '127.485571',10);
insert into village values(village_id_seq.nextval,'섬진강다무락마을', 'http://www.naver.com', '천명준', '000-000-0000', '전남', '구례군', '농작물경작체험', '과수수확체험', '전라남도 구례군 구례읍 하유길 3', '35.190532', '127.407438',10);
insert into village values(village_id_seq.nextval,'오섬권역마을', 'https://cafe.daum.net/osumvillage', '류기표', '061-781-0036', '전남', '구례군', '농작물경작체험', '감 따기 체험', '전라남도 구례군 문척면 죽연1길 67', '35.183087', '127.470099',10);
insert into village values(village_id_seq.nextval,'용냇골농촌체험휴양마을', 'http://www.naver.com', '양재현', '000-000-0000', '전남', '구례군', '농작물경작체험', '농산물수확체험', '전라남도 구례군 용방면 용방로 499-9', '35.25255035', '127.429784',10);
insert into village values(village_id_seq.nextval,'효장수마을', 'https://blog.naver.com/moraemaeul', '김형구', '000-000-0000', '전남', '구례군', '농작물경작체험', '농산물 수확 체험', '전라남도 구례군 마산면 광평1길 59', '35.214368', '127.493568',10);
insert into village values(village_id_seq.nextval,'금안한글', 'http://geumanhangeul.modoo.at', '김태진', '061-336-1121', '전남', '나주시', '만들기체험', '모시쿠키, 단팥빵, 수제커피', '전라남도 나주시 노안면 금안1길 26', '35.074849', '126.700511',10);
insert into village values(village_id_seq.nextval,'에코왕곡마을', 'http://www.naver.com', '이신재', '061-335-8101', '전남', '나주시', '만들기체험', '가을소풍체험', '전라남도 나주시 왕곡면 나주서부로 371-13', '34.968036', '126.672929',10);
insert into village values(village_id_seq.nextval,'노안이슬촌', 'http://www.eslfarm.com', '김종관', '061-335-0123', '전남', '나주시', '농작물경작체험', '감자캐기', '전라남도 나주시 노안면 이슬촌길 119', '35.103075', '126.675948',10);
insert into village values(village_id_seq.nextval,'문평명하쪽빛마을', 'http://www.naver.com', '정만식', '000-000-0000', '전남', '나주시', '농작물경작체험', '농사체험', '전라남도 나주시 문평면 명하길 13-9', '35.085866', '126.598383',10);
insert into village values(village_id_seq.nextval,'산포홍련마을', 'http://www.redvil.co.kr', '강원철', '070-8802-4639', '전남', '나주시', '농작물경작체험', '고구마체험', '전라남도 나주시 산포면 화지길 28-7', '35.016541', '126.814432',10);
insert into village values(village_id_seq.nextval,'왕곡덕실마을', 'http://www.doeksil.co.kr', '이연심', '061-335-8289', '전남', '나주시', '농작물경작체험', '고구마 캐기', '전라남도 나주시 왕곡면 덕실길 45', '34.967108', '126.6769499',10);
insert into village values(village_id_seq.nextval,'세지화탑마을', 'http://www.hwatop.co.kr', '김종구', '000-000-0000', '전남', '나주시', '기타', '과학실험체험', '전라남도 나주시 세지면 화탑길 61', '34.931297', '126.704602',10);
insert into village values(village_id_seq.nextval,'방축마을', 'http://www.naver.com', '서용숙', '000-000-0000', '전남', '담양군', '전통문화체험', '한옥민박체험', '전라남도 담양군 봉산면 방축길 10', '35.274588', '126.962186',10);
insert into village values(village_id_seq.nextval,'담양꽃차마을', 'https://cafe.daum.net/jndysingye', '김경숙', '000-000-0000', '전남', '담양군', '만들기체험', '꽃따기체험', '전라남도 담양군 월산면 박산길 41', '35.373393', '126.921842',10);
insert into village values(village_id_seq.nextval,'월산 물구십리권역', 'http://mulgusimni.modoo.at/', '조권호', '061-383-6999', '전남', '담양군', '만들기체험', '디퓨저만들기', '전라남도 담양군 월산면 도개길 195', '35.339179', '126.949629',10);
insert into village values(village_id_seq.nextval,'홍암마을', 'http://www.naver.com', '이성범', '000-000-0000', '전남', '담양군', '만들기체험', '새끼꼬기, 염색체험, 천연비누', '전라남도 담양군 월산면 홍암길 2', '35.376019', '126.926203',10);
insert into village values(village_id_seq.nextval,'달빛무월마을', 'http://www.moowol.kr', '송희두', '000-000-0000', '전남', '담양군', '농작물경작체험', '감자캐기', '전라남도 담양군 대덕면 무월길 42', '35.266482', '127.0398704',10);
insert into village values(village_id_seq.nextval,'담양가라실농촌체험휴양마을', 'http://www.naver.com', '황인영', '000-000-0000', '전남', '담양군', '농작물경작체험', '농산물 수확', '전라남도 담양군 금성면 가라실길 21', '35.311086', '127.046917',10);
insert into village values(village_id_seq.nextval,'담양도래수마을', 'http://www.naver.com', '강성만', '061-383-0694', '전남', '담양군', '농작물경작체험', '감자캐기', '전라남도 담양군 용면 분통길 27', '35.423246', '127.028214',10);
insert into village values(village_id_seq.nextval,'시목마을', 'http://www.naver.com', '김기회', '061-383-9463', '전남', '담양군', '농작물경작체험', '감자수확', '전라남도 담양군 대덕면 시목길 29', '35.267731', '127.035335',10);
insert into village values(village_id_seq.nextval,'용오름마을', 'http://www.naver.com', '김형준', '061-383-1111', '전남', '담양군', '농작물경작체험', '감 따기', '전라남도 담양군 월산면 용흥사길 224', '35.355199', '126.899454',10);
insert into village values(village_id_seq.nextval,'운수대통마을', 'http://www.naver.com', '한성국', '061-382-2626', '전남', '담양군', '농작물경작체험', '고구마수확체험', '전라남도 담양군 대덕면 운산2길 216', '35.188483', '127.073379',10);
insert into village values(village_id_seq.nextval,'창평권역농촌체험휴양마을', 'http://www.naver.com', '고영근', '061-383-5624', '전남', '담양군', '농작물경작체험', '농산물 수확', '전라남도 담양군 창평면 돌담길 56-24', '35.235225', '127.0178498',10);
insert into village values(village_id_seq.nextval,'학동마을', 'http://www.naver.com', '장해숙', '000-000-0000', '전남', '담양군', '농작물경작체험', '농산물 수확 체험', '전라남도 담양군 담양읍 학동길 29-10', '35.324996', '127.015168',10);
insert into village values(village_id_seq.nextval,'황금마을', 'http://www.naver.com', '신현호', '061-383-1144', '전남', '담양군', '농작물경작체험', '고구마캐기', '전라남도 담양군 수북면 황덕길 145-4', '35.262939', '126.926891',10);
insert into village values(village_id_seq.nextval,'약초골한옥마을', 'http://www.naver.com', '이갑순', '061-454-5500', '전남', '무안군', '만들기체험', '3색수제비만들기체험', '전라남도 무안군 몽탄면 약곡길 179-6', '34.908384', '126.491378',10);
insert into village values(village_id_seq.nextval,'백련한옥마을', 'http://www.naver.com', '박창석', '000-000-0000', '전남', '무안군', '농작물경작체험', '고구마캐기', '전라남도 무안군 일로읍 백련로 676', '34.873209', '126.524123',10);
insert into village values(village_id_seq.nextval,'월선권역', 'http://www.worlsun.co.kr', '김형부', '061-452-5556', '전남', '무안군', '농작물경작체험', '고사리', '전라남도 무안군 청계면 예술촌길 148', '34.892001', '126.456309',10);
insert into village values(village_id_seq.nextval,'보성 예당 체험휴양마을', 'http://www.naver.com', '조익성', '061-853-9009', '전남', '보성군', '전통문화체험', '차훈명상, 한지공예', '전라남도 보성군 득량면 예당길 165-1', '34.779677', '127.198722',10);
insert into village values(village_id_seq.nextval,'득량청암마을', 'https://blog.naver.com/kito1975', '박신순', '061-853-5885', '전남', '보성군', '자연생태체험', '갯벌체험', '전라남도 보성군 득량면 청암길 22-7', '34.717939', '127.1991897',10);
insert into village values(village_id_seq.nextval,'삼정마을', 'http://www.naver.com', '이호성', '000-000-0000', '전남', '보성군', '만들기체험', '참다래농장체험', '전라남도 보성군 조성면 삼정한옥길 74', '34.82565', '127.2401304',10);
insert into village values(village_id_seq.nextval,'용추마을', 'http://www.naver.com', '백승재', '061-853-5115', '전남', '보성군', '만들기체험', '올벼쌀막걸리만들기', '전라남도 보성군 웅치면 용추덕림길 89-34', '34.698525', '127.012016',10);
insert into village values(village_id_seq.nextval,'농부와바다', 'http://www.naver.com', '정남호', '000-000-0000', '전남', '보성군', '농작물경작체험', '농촌체험', '전라남도 보성군 회천면 회천군지길 29', '34.682303', '127.105727',10);
insert into village values(village_id_seq.nextval,'다향울림촌', 'http://www.naver.com', '김영희', '061-852-9855', '전남', '보성군', '농작물경작체험', '감자 캐기', '전라남도 보성군 회천면 남부관광로 2248', '34.66557022', '127.081428',10);
insert into village values(village_id_seq.nextval,'마동마을', 'http://www.naver.com', '박은자', '000-000-0000', '전남', '보성군', '농작물경작체험', '농촌체험', '전라남도 보성군 벌교읍 벌교마동길 226', '34.823198', '127.295809',10);
insert into village values(village_id_seq.nextval,'문덕내동마을', 'http://www.naver.com', '염승연', '000-000-0000', '전남', '보성군', '농작물경작체험', '농촌체험', '전라남도 보성군 문덕면 문덕내동길 67', '34.915395', '127.191403',10);
insert into village values(village_id_seq.nextval,'보성생거복내체험휴양마을', 'http://www.naver.com', '안규홍', '061-853-5512', '전남', '보성군', '농작물경작체험', '농산물 수확', '전라남도 보성군 복내면 송재로 1837-27', '34.894769', '127.131536',10);
insert into village values(village_id_seq.nextval,'봉천마을', 'http://www.naver.com', '이종경', '061-853-5896', '전남', '보성군', '농작물경작체험', '두부 만들기', '전라남도 보성군 복내면 당촌길 8', '34.900431', '127.14027',10);
insert into village values(village_id_seq.nextval,'살래 체험휴양마을', 'http://www.naver.com', '문경백', '061-853-2999', '전남', '보성군', '농작물경작체험', '농산물수확체험', '전라남도 보성군 미력면 보성강로 356-30', '34.811419', '127.116044',10);
insert into village values(village_id_seq.nextval,'웅치타운', 'http://www.naver.com', '안규갑', '061-853-5383', '전남', '보성군', '농작물경작체험', '농촌체험', '전라남도 보성군 웅치면 일림로 976', '34.713778', '127.019203',10);
insert into village values(village_id_seq.nextval,'청정가내농촌체험휴양마을', 'http://www.ganai.kr', '이상채', '061-853-4989', '전남', '보성군', '농작물경작체험', '농산물 수확', '전라남도 보성군 문덕면 가내길 18-37', '34.948418', '127.204101',10);
insert into village values(village_id_seq.nextval,'안산골농촌체험휴양마을', 'http://www.naver.com', '장원중', '000-000-0000', '전남', '순천시', '전통음식체험', '시골밥상, 염색체험', '전라남도 순천시 서면 신기비월길 69', '35.014795', '127.452141',10);
insert into village values(village_id_seq.nextval,'순천만짱둥어마을', 'http://www.naver.com', '이도연', '061-744-7473', '전남', '순천시', '자연생태체험', '갈대둘레길걷기', '전라남도 순천시 별량면 장산길 34', '34.865514', '127.488846',10);
insert into village values(village_id_seq.nextval,'개랭이고들빼기마을', 'http://www.gerenge.com', '유성진', '061-745-4040', '전남', '순천시', '만들기체험', '고들빼기 김치 담그기', '전라남도 순천시 별량면 흑가길 6', '34.886177', '127.385031',10);
insert into village values(village_id_seq.nextval,'순천생태마을', 'http://www.naver.com', '임채수', '061-755-0141', '전남', '순천시', '만들기체험', '4색만두만들기', '전라남도 순천시 승주읍 고산도목길 9', '35.066487', '127.3602702',10);
insert into village values(village_id_seq.nextval,'순천용오름마을', 'http://www.naver.com', '강순구', '061-754-2416', '전남', '순천시', '만들기체험', '감자빈대떡만들기', '전라남도 순천시 주암면 운룡2길 17', '35.092117', '127.202057',10);
insert into village values(village_id_seq.nextval,'지역사랑농촌체험휴양마을', 'http://www.naver.com', '조병철', '061-755-3726', '전남', '순천시', '만들기체험', '쌍화차, 쿠키, 피자', '전라남도 순천시 승주읍 내상로 353', '35.040469', '127.373177',10);
insert into village values(village_id_seq.nextval,'순천꽃마차마을', 'http://www.naver.com', '김옥균', '070-7795-7064', '전남', '순천시', '농작물경작체험', '감따기 체험', '전라남도 순천시 낙안면 금산길 64', '34.939181', '127.354451',10);
insert into village values(village_id_seq.nextval,'순천향매실마을', 'http://www.naver.com', '이재회', '061-754-2337', '전남', '순천시', '농작물경작체험', '감따기 및 곶감만들기', '전라남도 순천시 월등면 계월길 138', '35.062223', '127.404555',10);
insert into village values(village_id_seq.nextval,'임자만났네마을', 'http://www.naver.com', '정창일', '061-261-0153', '전남', '신안군', '전통문화체험', '강강술래 체험', '전라남도 신안군 임자면 진리길 44', '35.087097', '126.112728',10);
insert into village values(village_id_seq.nextval,'둔장농촌체험휴양마을', 'http://www.seantour.com/village/doonjang/main/', '강정원', '000-000-0000', '전남', '신안군', '자연생태체험', '낚시체험', '전라남도 신안군 자은면 둔장길 2', '34.913326', '126.065634',10);
insert into village values(village_id_seq.nextval,'압해도용마을', 'http://www.naver.com', '전세식', '061-271-3270', '전남', '신안군', '자연생태체험', '갯펄생태체험', '전라남도 신안군 압해읍 중촌길 8', '34.897655', '126.336295',10);
insert into village values(village_id_seq.nextval,'우전 설레미농촌체험휴양마을', 'http://www.naver.com', '박충근', '000-000-0000', '전남', '신안군', '자연생태체험', '후리질, 염전체험', '전라남도 신안군 증도면 우전길 21', '34.96089003', '126.1370298',10);
insert into village values(village_id_seq.nextval,'영산도명품마을', 'http://yeongsando.co.kr/', '최성광', '061-261-1003', '전남', '신안군', '기타', '나만의 셀카 체헙', '전라남도 신안군 흑산면 영산길 21', '34.65198006', '125.466578',10);
insert into village values(village_id_seq.nextval,'내양마을', 'http://oeyang.co.kr', '김국진', '061-261-2629', '전남', '신안군', '건강', '개똥쑥체험', '전라남도 신안군 지도읍 원내양길 61', '35.089837', '126.224759',10);
insert into village values(village_id_seq.nextval,'사곡마을(갯벌노을마을)', 'http://jangcheok.go2vil.org', '김장현', '061-691-8777', '전남', '여수시', '전통문화체험', '강강술래', '전라남도 여수시 소라면 서부로 785-24', '34.790252', '127.567975',10);
insert into village values(village_id_seq.nextval,'금오도버들인', 'http://www.naver.com', '박재성', '000-000-0000', '전남', '여수시', '자연생태체험', '금오도 테마투어', '전라남도 여수시 남면 대유길 36-2', '34.535009', '127.761382',10);
insert into village values(village_id_seq.nextval,'신흥마을', 'http://www.naver.com', '박근철', '000-000-0000', '전남', '여수시', '어촌생활체험', '가두리낚시 및 전복양식장 체험', '전라남도 여수시 화정면 신흥길 68', '34.566433', '127.671518',10);
insert into village values(village_id_seq.nextval,'돌산갓장터마을', 'http://www.naver.com', '김홍민', '061-644-8722', '전남', '여수시', '만들기체험', '갓김치담그기체험', '전라남도 여수시 돌산읍 향일암로 359', '34.604996', '127.787666',10);
insert into village values(village_id_seq.nextval,'안포씨마을', 'http://www.ahnpo.com', '박문식', '061-692-9005', '전남', '여수시', '만들기체험', '두부만들기', '전라남도 여수시 화양면 화양로 922-13', '34.678887', '127.6187403',10);
insert into village values(village_id_seq.nextval,'여자만마을', 'https://blog.naver.com/ouriagi0923', '박판규', '061-685-1404', '전남', '여수시', '만들기체험', '또띠아피자, 인절미', '전라남도 여수시 율촌면 서부로 1188', '34.824122', '127.556973',10);
insert into village values(village_id_seq.nextval,'갓고을마을', 'http://www.gatgoeul.com', '전숙룡', '061-644-6100', '전남', '여수시', '농작물경작체험', '감자캐기', '전라남도 여수시 돌산읍 향일암로 913', '34.639881', '127.786801',10);
insert into village values(village_id_seq.nextval,'길용마을', 'http://www.naver.com', '김세웅', '000-000-0000', '전남', '영광군', '어촌생활체험', '민물고기잡기체험', '전라남도 영광군 백수읍 성지로 1184', '35.317723', '126.435687',10);
insert into village values(village_id_seq.nextval,'산하치마을', 'http://www.naver.com', '홍성태', '000-000-0000', '전남', '영광군', '어촌생활체험', '갯벌체험', '전라남도 영광군 법성면 용성월산로6길 112', '35.355564', '126.506245',10);
insert into village values(village_id_seq.nextval,'행복한체험마을', 'http://www.naver.com', '오영심', '061-353-0045', '전남', '영광군', '어촌생활체험', '갯뻘생태체험', '전라남도 영광군 백수읍 대신길 124-18', '35.35128984', '126.3985604',10);
insert into village values(village_id_seq.nextval,'동촌마을', 'http://www.bongrandae.com', '정복환', '061-353-9212', '전남', '영광군', '만들기체험', '강정만들기', '전라남도 영광군 염산면 칠산로 78', '35.218005', '126.371153',10);
insert into village values(village_id_seq.nextval,'상사화피는마을', 'http://www.naver.com', '강기현', '061-353-2288', '전남', '영광군', '만들기체험', '공예수강', '전라남도 영광군 불갑면 불갑사로 167', '35.217451', '126.5289497',10);
insert into village values(village_id_seq.nextval,'육창반딧불마을', 'http://www.naver.com', '이석규', '061-351-9770', '전남', '영광군', '만들기체험', '김장김치 담그기', '전라남도 영광군 군남면 육창로 526', '35.219662', '126.4422402',10);
insert into village values(village_id_seq.nextval,'백수놀마을', 'http://backsu.modoo.at', '김재곤', '000-000-0000', '전남', '영광군', '농작물경작체험', '고구마캐기, 농작물체험, 다도체험, 모기퇴치제만들기, 천연바디워시만들기', '전라남도 영광군 백수읍 백수로 835', '35.283059', '126.4014203',10);
insert into village values(village_id_seq.nextval,'용암마을', 'http://www.naver.com', '배동선', '061-351-0878', '전남', '영광군', '농작물경작체험', '고구마캐기 체험', '전라남도 영광군 군남면 육창로1길 50-1', '35.196579', '126.434435',10);
insert into village values(village_id_seq.nextval,'송내외 농촌체험휴양마을', 'http://www.yongsaem.kr', '신용재', '061-472-2113', '전남', '영암군', '전통음식체험', '농축산물음식체험', '전라남도 영암군 덕진면 영보로 273', '34.826971', '126.729074',10);
insert into village values(village_id_seq.nextval,'왕인박사마을', 'http://www.naver.com', '최남호', '061-472-0939', '전남', '영암군', '전통문화체험', '떡메치기체험', '전라남도 영암군 군서면 구림로 43-14', '34.760797', '126.6275702',10);
insert into village values(village_id_seq.nextval,'대봉농촌체험휴양마을', 'http://www.naver.com', '유재종', '000-000-0000', '전남', '영암군', '만들기체험', '감물염색, 곶감, 꽃차,매듭공예', '전라남도 영암군 금정면 용천길 42', '34.85673045', '126.772452',10);
insert into village values(village_id_seq.nextval,'신유토마을', 'http://www.naver.com', '박말녀', '061-471-9309', '전남', '영암군', '만들기체험', '가바떡 만들기체험', '전라남도 영암군 금정면 유토길 115', '34.819661', '126.801468',10);
insert into village values(village_id_seq.nextval,'망호정마을', 'http://www.naver.com', '이경호', '070-4419-0004', '전남', '영암군', '농작물경작체험', '감자캐기', '전라남도 영암군 영암읍 월출로 159', '34.808971', '126.685369',10);
insert into village values(village_id_seq.nextval,'황금들애도포농촌체험휴양마을', 'http://www.naver.com', '조만성', '061-471-1239', '전남', '영암군', '농작물경작체험', '고구마수확, 딸기수확, 방울토마토수확, 식혜만들기, 천연염색체험', '전라남도 영암군 도포면 영가척길 22', '34.842811', '126.625222',10);
insert into village values(village_id_seq.nextval,'효동마을', 'http://www.남해포권역.kr', '박복용', '061-471-0774', '전남', '영암군', '농작물경작체험', '고구마수확하기', '전라남도 영암군 시종면 남해당로 65', '34.895394', '126.585919',10);
insert into village values(village_id_seq.nextval,'달코미 농촌체험휴양마을', 'http://www.naver.com', '박인환', '061-472-8116', '전남', '영암군', '건강', '효소체험', '전라남도 영암군 미암면 마봉길 69', '34.691093', '126.581168',10);
insert into village values(village_id_seq.nextval,'한곤메마을', 'http://hangonme.kr', '최희동', '061-473-0112', '전남', '영암군', '건강', '선애마을 체험교육', '전라남도 영암군 신북면 하정길 19', '34.89032979', '126.704354',10);
insert into village values(village_id_seq.nextval,'상서돌담마을', 'http://www.naver.com', '박근호', '000-000-0000', '전남', '완도군', '전통문화체험', '구들장논 체험', '전라남도 완도군 청산면 상동길 76-4', '34.176679', '126.905482',10);
insert into village values(village_id_seq.nextval,'청학동참살이마을', 'http://www.naver.com', '김행수', '061-555-4545', '전남', '완도군', '전통문화체험', '개매기체험', '전라남도 완도군 고금면 청학동길 193-1', '34.425668', '126.793316',10);
insert into village values(village_id_seq.nextval,'명사십리마을', 'http://www.naver.com', '문종채', '061-555-2550', '전남', '완도군', '자연생태체험', '모래고동 잡기체험', '전라남도 완도군 신지면 명사십리61번길 83', '34.330684', '126.8144301',10);
insert into village values(village_id_seq.nextval,'울모래마을', 'http://www.naver.com', '이일근', '061-553-0304', '전남', '완도군', '자연생태체험', '명사갯길 체험', '전라남도 완도군 신지면 신지로582번길 84', '34.326859', '126.830375',10);
insert into village values(village_id_seq.nextval,'청산도느림보마을', 'http://www.naver.com', '유성종', '061-554-6962', '전남', '완도군', '만들기체험', '슬로푸드만들기체험', '전라남도 완도군 청산면 청산로 603', '34.181691', '126.900484',10);
insert into village values(village_id_seq.nextval,'신학마을', 'http://www.naver.com', '김대', '061-555-0340', '전남', '완도군', '건강', '노르딕워킹', '전라남도 완도군 군외면 원동1길 8', '34.385682', '126.6463696',10);
insert into village values(village_id_seq.nextval,'모암마을', 'http://www.naver.com', '김형권', '000-000-0000', '전남', '장성군', '만들기체험', '압화체험', '전라남도 장성군 서삼면 모암길 45-2', '35.374133', '126.760507',10);
insert into village values(village_id_seq.nextval,'별내리마을', 'http://www.jsstar.or.kr', '정숙락', '000-000-0000', '전남', '장성군', '만들기체험', '도예체험', '전라남도 장성군 북하면 남창로 351', '35.455126', '126.843359',10);
insert into village values(village_id_seq.nextval,'달돋이마을', 'http://www.naver.com', '양종진', '000-000-0000', '전남', '장성군', '농작물경작체험', '농산물수확체험', '전라남도 장성군 북이면 오작로 384', '35.412805', '126.821132',10);
insert into village values(village_id_seq.nextval,'비나리마을', 'http://www.naver.com', '이창희', '000-000-0000', '전남', '장성군', '농작물경작체험', '감따기', '전라남도 장성군 남면 자풍길 23', '35.251998', '126.770532',10);
insert into village values(village_id_seq.nextval,'아치실마을', 'http://www.naver.com', '조빈래', '000-000-0000', '전남', '장성군', '농작물경작체험', '농산물 수확 체험', '전라남도 장성군 황룡면 홍길동로 442', '35.31909044', '126.7287801',10);
insert into village values(village_id_seq.nextval,'자라뫼마을', 'http://www.naver.com', '김삼곤', '000-000-0000', '전남', '장성군', '농작물경작체험', '감따기', '전라남도 장성군 북이면 오현길 20', '35.419637', '126.822041',10);
insert into village values(village_id_seq.nextval,'증암마을', 'http://www.naver.com', '최영희', '000-000-0000', '전남', '장성군', '농작물경작체험', '농산물 수확 체험', '전라남도 장성군 서삼면 편백로 225', '35.339483', '126.740578',10);
insert into village values(village_id_seq.nextval,'홍길동숲마을', 'http://www.naver.com', '임영순', '061-393-7001', '전남', '장성군', '농작물경작체험', '농사체험', '전라남도 장성군 서삼면 추암로 489', '35.353018', '126.7296198',10);
insert into village values(village_id_seq.nextval,'금곡영화민속촌', 'http://www.naver.com', '황원일', '061-393-2205', '전남', '장성군', '기타', '영화마을탐방', '전라남도 장성군 북일면 영화마을길 254-7', '35.395151', '126.734163',10);
insert into village values(village_id_seq.nextval,'대곡마을', 'http://www.jsdaedeok.co.kr', '김종연', '061-395-2728', '전남', '장성군', '건강', '편백나무 숲 걷기체험', '전라남도 장성군 서삼면 대덕한실길 89-109', '35.360924', '126.745955',10);
insert into village values(village_id_seq.nextval,'신덕마을', 'https://cafe.naver.com/hannongchon/', '이인석', '061-863-0775', '전남', '장흥군', '전통문화체험', '사랑의 효체험', '전라남도 장흥군 유치면 봉덕신덕길 512-31', '34.838984', '126.858824',10);
insert into village values(village_id_seq.nextval,'장수풍뎅이마을', 'http://www.naver.com', '김홍순', '000-000-0000', '전남', '장흥군', '만들기체험', '나무곤충 모형 만들기', '전라남도 장흥군 유치면 반월길 134', '34.808641', '126.824823',10);
insert into village values(village_id_seq.nextval,'소포마을', 'http://sopoli.invil.org', '김병철', '061-543-0505', '전남', '진도군', '전통문화체험', '남도 소리체험', '전라남도 진도군 지산면 지산민속로 795', '34.483304', '126.205202',10);
insert into village values(village_id_seq.nextval,'신전마을', 'http://jodo.invil.org', '문동희', '061-542-4600', '전남', '진도군', '전통문화체험', '한옥민박체험', '전라남도 진도군 조도면 신전길 14-1', '34.285922', '126.082012',10);
insert into village values(village_id_seq.nextval,'의신사천마을', 'http://www.naver.com', '박창선', '000-000-0000', '전남', '진도군', '전통문화체험', '국악체험', '전라남도 진도군 의신면 의신사천길 26', '34.46576005', '126.297805',10);
insert into village values(village_id_seq.nextval,'인지마을', 'http://www.naver.com', '최동기', '061-543-1313', '전남', '진도군', '전통문화체험', '만가, 북춤, 남도노래, 강강술래', '전라남도 진도군 지산면 인지독치1길 4', '34.424286', '126.166571',10);
insert into village values(village_id_seq.nextval,'동녘마루마을', 'http://www.eastridge.co.kr', '박재인', '000-000-0000', '전남', '진도군', '자연생태체험', '갯벌체험', '전라남도 진도군 고군면 원포길 72-33', '34.484185', '126.358437',10);
insert into village values(village_id_seq.nextval,'죽림농어촌체험휴양마을', 'http://www.naver.com', '김철암', '000-000-0000', '전남', '진도군', '어촌생활체험', '갯벌체험', '전라남도 진도군 임회면 헌복동길 14-19', '34.39028966', '126.257895',10);
insert into village values(village_id_seq.nextval,'금골마루', 'http://www.naver.com', '박만섭', '061-542-0755', '전남', '진도군', '만들기체험', '두부, 천연감미료 만들기', '전라남도 진도군 군내면 연산길 1', '34.53525969', '126.297908',10);
insert into village values(village_id_seq.nextval,'관매마을', 'http://www.gwanmaedo.co.kr', '박길석', '000-000-0000', '전남', '진도군', '레포츠', '자전거체험 프로그램', '전라남도 진도군 조도면 관매도길 37-1', '34.238919', '126.049287',10);
insert into village values(village_id_seq.nextval,'길은마을', 'https://cafe.daum.net/kepurmi', '이재병', '061-543-9942', '전남', '진도군', '농작물경작체험', '무화과쨈만들기', '전라남도 진도군 지산면 길은길 66', '34.470211', '126.187569',10);
insert into village values(village_id_seq.nextval,'돈지백구마을', 'http://www.naver.com', '박병언', '000-000-0000', '전남', '진도군', '농작물경작체험', '농산물 수확 체험', '전라남도 진도군 의신면 돈지2길 28', '34.437503', '126.283086',10);
insert into village values(village_id_seq.nextval,'해당화마을', 'http://www.naver.com', '박래길', '061-324-9711', '전남', '함평군', '만들기체험', '꽃차 만들기', '전라남도 함평군 손불면 안악길 42-67', '35.14161031', '126.395974',10);
insert into village values(village_id_seq.nextval,'가덕마을', 'http://www.naver.com', '서훙식', '061-322-5056', '전남', '함평군', '농작물경작체험', '농산물 수확 체험', '전라남도 함평군 신광면 동백길 31', '35.133018', '126.494817',10);
insert into village values(village_id_seq.nextval,'상모마을', 'http://www.naver.com', '우순애', '000-000-0000', '전남', '함평군', '농작물경작체험', '고구마체험', '전라남도 함평군 해보면 상모길 55-17', '35.160352', '126.5964002',10);
insert into village values(village_id_seq.nextval,'원산마을', 'http://www.naver.com', '이광년', '000-000-0000', '전남', '함평군', '농작물경작체험', '고구마캐기체험', '전라남도 함평군 해보면 산내길 55-63', '35.175736', '126.554258',10);
insert into village values(village_id_seq.nextval,'철성마을', 'http://www.naver.com', '윤전중', '000-000-0000', '전남', '함평군', '농작물경작체험', '농산물 수확 체험', '전라남도 함평군 대동면 대동길 497', '35.077496', '126.575359',10);
insert into village values(village_id_seq.nextval,'매정마을', 'http://www.naver.com', '이인식', '000-000-0000', '전남', '해남군', '만들기체험', '도자기체험', '전라남도 해남군 삼산면 매정길 16', '34.50715958', '126.612082',10);
insert into village values(village_id_seq.nextval,'해남김치마을', 'http://kimchi.invil.org', '양금종', '061-534-1743', '전남', '해남군', '만들기체험', '김치담그기체험', '전라남도 해남군 북평면 동해길 97', '34.436434', '126.635765',10);
insert into village values(village_id_seq.nextval,'땅끝서제골권역 농촌체험휴양마을', 'http://www.naver.com', '서정현', '000-000-0000', '전남', '해남군', '농작물경작체험', '농촌체험', '전라남도 해남군 마산면 간척지1길 446', '34.650766', '126.526536',10);
insert into village values(village_id_seq.nextval,'사평풍류마을', 'http://purezone.kr', '선영숙', '061-373-4853', '전남', '화순군', '전통문화체험', '국악분야, 다례분야, 무용분야, 미술분야, 소리분야, 연희분야', '전라남도 화순군 사평면 사호로 236-40', '35.004131', '127.094736',10);
insert into village values(village_id_seq.nextval,'모산고인돌마을', 'http://www.naver.com', '구제훈', '000-000-0000', '전남', '화순군', '자연생태체험', '고인돌유적지체험', '전라남도 화순군 도곡면 효산모산길 2', '34.99106019', '126.9185097',10);
insert into village values(village_id_seq.nextval,'들국화(만수)마을', 'http://www.sumanri.com', '이진구', '061-373-2193', '전남', '화순군', '만들기체험', '꽃차체험', '전라남도 화순군 화순읍 만수길 42', '35.098388', '127.003531',10);
insert into village values(village_id_seq.nextval,'백아산노치산촌생태마을', 'http://baegasan.modoo.at', '서연수', '000-000-0000', '전남', '화순군', '만들기체험', '고로쇄체험', '전라남도 화순군 백아면 수양로 384', '35.144051', '127.171414',10);
insert into village values(village_id_seq.nextval,'봉하마을', 'http://www.naver.com', '박병교', '061-375-3258', '전남', '화순군', '만들기체험', '가마솥 밥짖기', '전라남도 화순군 도암면 봉수길 25', '34.889695', '126.870062',10);
insert into village values(village_id_seq.nextval,'양정달마루마을', 'http://yangjeong.my114.co.kr', '양동', '061-374-7717', '전남', '화순군', '만들기체험', '고구마캐기', '전라남도 화순군 도곡면 양정길 48', '34.988957', '126.908449',10);
insert into village values(village_id_seq.nextval,'도장밭노래마을', 'http://www.naver.com', '김범순', '000-000-0000', '전남', '화순군', '농작물경작체험', '계절별농사체험', '전라남도 화순군 도암면 아내미길 7', '34.964377', '126.888936',10);
insert into village values(village_id_seq.nextval,'안심녹색농촌체험마을', 'http://ansimvillage.co.kr/', '최창옥', '061-371-0201', '전남', '화순군', '농작물경작체험', '농사체험', '전라남도 화순군 이서면 사마길 17', '35.108269', '127.046275',10);
insert into village values(village_id_seq.nextval,'영신마을(뽕모실마을)', 'http://www.naver.com', '오병식', '000-000-0000', '전남', '화순군', '농작물경작체험', '농촌체험', '전라남도 화순군 이서면 유평길 97', '35.120218', '127.0324205',10);
insert into village values(village_id_seq.nextval,'잠업권역야사마을', 'http://www.naver.com', '오병식', '061-371-0200', '전남', '화순군', '농작물경작체험', '농산물 수확 체험', '전라남도 화순군 이서면 백아로 3114', '35.110749', '127.079422',10);
insert into village values(village_id_seq.nextval,'백운마을', 'http://www.naver.com', '정회갑', '000-000-0000', '전남', '화순군', '기타', '대나무장대타고 걷기', '전라남도 화순군 청풍면 백운길 207-1', '34.881722', '126.947927',10);
insert into village values(village_id_seq.nextval,'한천농촌체험휴양마을', 'http://www.naver.com', '강정권', '061-373-3601', '전남', '화순군', '기타', '감성캠핑체험, 드립커피체험', '전라남도 화순군 동복면 한천2길 19-1', '35.057158', '127.129884',10);
insert into village values(village_id_seq.nextval,'고산돌맹마을', 'http://www.naver.com', '김준용', '070-4112-9634', '전북', '고창군', '전통문화체험', '다듬이 돌 난타교', '전라북도 고창군 대산면 상금길 52-22', '35.324141', '126.630803',10);
insert into village values(village_id_seq.nextval,'사등마을', 'http://www.naver.com', '박성진', '000-000-0000', '전북', '고창군', '자연생태체험', '갯벌체험', '전라북도 고창군 심원면 사등길 28', '35.534118', '126.556037',10);
insert into village values(village_id_seq.nextval,'강선달마을', 'http://gangsundal.com', '방세혁', '063-563-6337', '전북', '고창군', '농작물경작체험', '복분자따기체험', '전라북도 고창군 상하면 진암구시포로 495', '35.442926', '126.440197',10);
insert into village values(village_id_seq.nextval,'구암학춤마을', 'http://www.naver.com', '조기환', '000-000-0000', '전북', '고창군', '농작물경작체험', '농산물 수확 체험', '전라북도 고창군 아산면 인천강서길 418-7', '35.479297', '126.602094',10);
insert into village values(village_id_seq.nextval,'책마을해리', 'http://www.naver.com', '이대건', '000-000-0000', '전북', '고창군', '농작물경작체험', '농산물 수확 체험', '전라북도 고창군 해리면 월봉성산길 88', '35.470048', '126.483277',10);
insert into village values(village_id_seq.nextval,'발산권역농촌체험휴양마을', 'http://www.naver.com', '강성우', '000-000-0000', '전북', '군산시', '농작물경작체험', '농산물 수확 체험', '전라북도 군산시 개정면 바르메길 114-6', '35.963899', '126.798906',10);
insert into village values(village_id_seq.nextval,'사동농촌체험휴양마을(사동마을)', 'http://www.naver.com', '송용석', '000-000-0000', '전북', '김제시', '자연생태체험', '숲체험', '전라북도 김제시 금구면 청운3길 55', '35.813161', '126.976957',10);
insert into village values(village_id_seq.nextval,'김제수류산골마을', 'http://www.naver.com', '김용운', '000-000-0000', '전북', '김제시', '만들기체험', '곶감쿠키, 매실쿠키만들기', '전라북도 김제시 금산면 수류로 604-26', '35.686813', '127.044107',10);
insert into village values(village_id_seq.nextval,'남포마을(지평선)', 'http://nampo.invil.org', '윤병길', '063-545-8858', '전북', '김제시', '만들기체험', '두부 만들기 체험', '전라북도 김제시 성덕면 지평선로 124', '35.81117038', '126.788393',10);
insert into village values(village_id_seq.nextval,'사방외갓집마을', 'http://mother.invil.org', '최승일', '063-547-0087', '전북', '김제시', '만들기체험', '가래떡볶이 만들기', '전라북도 김제시 금구면 사방길 110-5', '35.810261', '126.986571',10);
insert into village values(village_id_seq.nextval,'알콩쌀콩 등대마을', 'http://ssalkong.co.kr', '한재원', '063-543-5006', '전북', '김제시', '만들기체험', '송편, 강정, 주먹밥만들기', '전라북도 김제시 죽산면 서포5길 185', '35.76642977', '126.779515',10);
insert into village values(village_id_seq.nextval,'광활권역마을', 'http://www.gwanghwal.net/', '강오길', '063-543-6555', '전북', '김제시', '농작물경작체험', '농산물수확체험', '전라북도 김제시 광활면 지평선로 638', '35.835796', '126.740498',10);
insert into village values(village_id_seq.nextval,'내촌아리랑마을', 'http://www.naver.com', '박형진', '063-542-6411', '전북', '김제시', '농작물경작체험', '농산물수확체험', '전라북도 김제시 죽산면 홍산로 328-21', '35.773596', '126.841407',10);
insert into village values(village_id_seq.nextval,'백산조수골마을', 'http://josugol.kr', '강철', '063-548-8885', '전북', '김제시', '농작물경작체험', '감자수확', '전라북도 김제시 백산면 조종로 92-16', '35.862673', '126.888899',10);
insert into village values(village_id_seq.nextval,'벽골제마을', 'http://www.naver.com', '김형문', '000-000-0000', '전북', '김제시', '농작물경작체험', '고구마 수확 및 요리교실', '전라북도 김제시 부량면 벽골제로 379', '35.748962', '126.849117',10);
insert into village values(village_id_seq.nextval,'산성메마을(당월)', 'http://www.naver.com', '경수명', '000-000-0000', '전북', '김제시', '농작물경작체험', '가을소풍', '전라북도 김제시 금구면 월전4길 16-4', '35.77614003', '127.034319',10);
insert into village values(village_id_seq.nextval,'진봉심포드리마을', 'http://www.simpodri.kr', '강공숙', '063-544-9008', '전북', '김제시', '농작물경작체험', '감따기 체험', '전라북도 김제시 진봉면 지평선로 1170-5', '35.852562', '126.708897',10);
insert into village values(village_id_seq.nextval,'황토', 'http://hot.invil.org', '이철용', '063-545-8750', '전북', '김제시', '농작물경작체험', '감자캐기체험', '전라북도 김제시 용지면 용지로 659-8', '35.859985', '126.973803',10);
insert into village values(village_id_seq.nextval,'벌촌천황봉마을', 'http://www.naver.com', '유재륜', '063-626-4771', '전북', '남원시', '전통문화체험', '도예체험', '전라북도 남원시 보절면 벌촌길 28', '35.526362', '127.400255',10);
insert into village values(village_id_seq.nextval,'지리산나들락농촌체험휴양마을', 'http://www.naver.com', '노욱환', '063-634-6655', '전북', '남원시', '전통문화체험', '다도체험', '전라북도 남원시 주천면 정령치로 101-16', '35.392391', '127.446776',10);
insert into village values(village_id_seq.nextval,'솔바람권역마을', 'http://www.naver.com', '소영호', '063-632-9078', '전북', '남원시', '만들기체험', '다도와 다식만들기, 솔향초만들기', '전라북도 남원시 덕과면 비촌길 92', '35.507531', '127.386737',10);
insert into village values(village_id_seq.nextval,'요천다슬기마을', 'http://www.naver.com', '안효길', '063-636-7048', '전북', '남원시', '만들기체험', '떡메치기', '전라북도 남원시 이백면 황산로 89', '35.457975', '127.443785',10);
insert into village values(village_id_seq.nextval,'원천마을', 'http://www.jirisanchon.com', '최이헌', '063-636-2032', '전북', '남원시', '만들기체험', '두부제조판매', '전라북도 남원시 산내면 산내원천길 33', '35.412059', '127.616141',10);
insert into village values(village_id_seq.nextval,'하주발효마을회', 'http://www.naver.com', '한충문', '000-000-0000', '전북', '남원시', '만들기체험', '우리밀빵, 치즈, 효소담그기', '전라북도 남원시 주천면 고주로 1274', '35.379995', '127.405285',10);
insert into village values(village_id_seq.nextval,'노봉혼불문학마을', 'http://www.naver.com', '김용익', '000-000-0000', '전북', '남원시', '농작물경작체험', '고구마 감자캐기 체험', '전라북도 남원시 사매면 노봉길 84', '35.485013', '127.322644',10);
insert into village values(village_id_seq.nextval,'달오름마을', 'http://dalorum.go2vil.org', '황태상', '063-635-2231', '전북', '남원시', '농작물경작체험', '농사체험(감자,토마토)', '전라북도 남원시 인월면 인월서길 42', '35.456911', '127.592601',10);
insert into village values(village_id_seq.nextval,'란두리 덕동마을', 'http://www.naver.com', '신병용', '063-625-2211', '전북', '남원시', '농작물경작체험', '고구마수확체험', '전라북도 남원시 덕과면 덕과덕동안길 10-4', '35.543915', '127.373167',10);
insert into village values(village_id_seq.nextval,'만행산상신마을', 'http://www.naver.com', '김재윤', '063-625-1030', '전북', '남원시', '농작물경작체험', '농가체험', '전라북도 남원시 산동면 만행산길 109', '35.529046', '127.471896',10);
insert into village values(village_id_seq.nextval,'산덕마을', 'http://www.naver.com', '서영복', '063-625-9428', '전북', '남원시', '농작물경작체험', '농경문화체험', '전라북도 남원시 운봉읍 산덕길 15', '35.422963', '127.539175',10);
insert into village values(village_id_seq.nextval,'선돌촌마을', 'http://www.jirisundol.com', '서영현', '063-626-9981', '전북', '남원시', '농작물경작체험', '감자수확체험', '전라북도 남원시 산내면 입석길 49-3', '35.415813', '127.627369',10);
insert into village values(village_id_seq.nextval,'전촌(동편제)마을', 'http://dongpyeonje.co.kr', '오인숙', '063-625-3183', '전북', '남원시', '농작물경작체험', '농사체험', '전라북도 남원시 운봉읍 가산화수길 51-2', '35.455044', '127.561003',10);
insert into village values(village_id_seq.nextval,'추어마을', 'http://www.naver.com', '안태원', '063-634-4640', '전북', '남원시', '농작물경작체험', '고구마캐기', '전라북도 남원시 보절면 용동길 28', '35.531701', '127.423294',10);
insert into village values(village_id_seq.nextval,'흥부마을', 'https://cafe.naver.com/heungbumaeul', '이영석', '063-625-2932', '전북', '남원시', '농작물경작체험', '농산물수확체험', '전라북도 남원시 아영면 흥부로 275', '35.520463', '127.587991',10);
insert into village values(village_id_seq.nextval,'치목삼베마을', 'http://www.naver.com', '송연호', '063-324-3649', '전북', '무주군', '자연생태체험', '꽃차만들기', '전라북도 무주군 적상면 치목길 83', '35.931002', '127.709625',10);
insert into village values(village_id_seq.nextval,'대문바위권역', 'http://m.demun.net/', '정용환', '000-000-0000', '전북', '무주군', '만들기체험', '아로니아차만들기, 아로니아천연염색', '전라북도 무주군 부남면 부남로 195-23', '35.921166', '127.577767',10);
insert into village values(village_id_seq.nextval,'두문마을', 'http://www.naver.com', '성영석', '063-323-2271', '전북', '무주군', '만들기체험', '곤충액자만들기', '전라북도 무주군 안성면 덕유산로 876', '35.877733', '127.694806',10);
insert into village values(village_id_seq.nextval,'무릉도원후도인성학교', 'http://www.naver.com', '송영식', '063-324-8806', '전북', '무주군', '만들기체험', '무드등, 방패연, 인절미, 텀블러, 희망시계', '전라북도 무주군 무주읍 내도로 356', '36.029764', '127.646157',10);
insert into village values(village_id_seq.nextval,'앞섬마을', 'https://cafe.naver.com/abseom', '이종대', '000-000-0000', '전북', '무주군', '만들기체험', '디퓨저만들기체험', '전라북도 무주군 무주읍 앞섬1길 7', '36.020126', '127.645091',10);
insert into village values(village_id_seq.nextval,'죽장마을(솔다박마을)', 'http://www.naver.com', '이광노', '063-323-2234', '전북', '무주군', '만들기체험', '대나무한지부채만들기', '전라북도 무주군 안성면 장무로 1637', '35.834633', '127.643935',10);
insert into village values(village_id_seq.nextval,'진원반디길', 'http://www.bandigil.co.kr', '김강엽', '063-323-0300', '전북', '무주군', '만들기체험', '고추장 만들기 체험12', '전라북도 무주군 안성면 진성로 2416-4', '35.864163', '127.629718',10);
insert into village values(village_id_seq.nextval,'초리넝쿨마을', 'http://www.naver.com', '이경환', '000-000-0000', '전북', '무주군', '만들기체험', '머그컵만들기', '전라북도 무주군 적상면 초리길 6', '35.981503', '127.700746',10);
insert into village values(village_id_seq.nextval,'休무풍승지(철목)', 'http://www.hyumupung.co.kr', '김원수', '063-324-5129', '전북', '무주군', '농작물경작체험', '감따기체험', '전라북도 무주군 무풍면 철목길 61', '35.960063', '127.839773',10);
insert into village values(village_id_seq.nextval,'물숲(명천)', 'http://www.naver.com', '박대식', '063-323-1132', '전북', '무주군', '농작물경작체험', '감자 수확체험', '전라북도 무주군 안성면 원통사로 294', '35.836171', '127.672431',10);
insert into village values(village_id_seq.nextval,'삼도봉권역', 'http://www.naver.com', '박종윤', '063-324-3738', '전북', '무주군', '농작물경작체험', '농산물 수확 체험', '전라북도 무주군 설천면 삼도봉로 468', '36.006774', '127.823656',10);
insert into village values(village_id_seq.nextval,'서면마을', 'http://www.naver.com', '신동표', '000-000-0000', '전북', '무주군', '농작물경작체험', '농산물 수확 체험', '전라북도 무주군 무주읍 서면강변로 76', '36.00732016', '127.6205601',10);
insert into village values(village_id_seq.nextval,'신무마을', 'http://m.blog.naver.com/kyl0353', '박래곤', '000-000-0000', '전북', '무주군', '농작물경작체험', '오미자청 담그기, 참마캐기', '전라북도 무주군 안성면 덕유산로 161-8', '35.8394199', '127.665596',10);
insert into village values(village_id_seq.nextval,'오방색권역', 'http://www.naver.com', '이세진', '063-324-3649', '전북', '무주군', '농작물경작체험', '농촌체험', '전라북도 무주군 적상면 산성로 20', '35.985907', '127.694415',10);
insert into village values(village_id_seq.nextval,'중산마을', 'http://www.naver.com', '정홍완', '000-000-0000', '전북', '무주군', '농작물경작체험', '들고튀어라', '전라북도 무주군 안성면 중산길 28', '35.859544', '127.664509',10);
insert into village values(village_id_seq.nextval,'추동체험휴양마을', 'http://www.naver.com', '강순식', '000-000-0000', '전북', '무주군', '농작물경작체험', '농촌체험', '전라북도 무주군 무주읍 삼방로 934', '35.989202', '127.620474',10);
insert into village values(village_id_seq.nextval,'호롱불마을', 'http://www.naver.com', '박희축', '063-322-8001', '전북', '무주군', '농작물경작체험', '고사리체험', '전라북도 무주군 설천면 무설로 700', '36.016228', '127.716359',10);
insert into village values(village_id_seq.nextval,'각동마을', 'http://www.naver.com', '김중배', '063-582-3120', '전북', '부안군', '전통문화체험', '연날리기체험, 줄포갈대숲체험', '전라북도 부안군 줄포면 선돌로 1235-39', '35.605582', '126.681194',10);
insert into village values(village_id_seq.nextval,'계화섬마을', 'http://www.계화도.com', '김상진', '063-581-7137', '전북', '부안군', '전통문화체험', '야구휴양체험', '전라북도 부안군 계화면 계화로 590-5', '35.793551', '126.640454',10);
insert into village values(village_id_seq.nextval,'청호수마을', 'http://buangoodvill.com/', '김진호', '063-581-5077', '전북', '부안군', '자연생태체험', '숲해설, 천연염색, 화훼', '전라북도 부안군 하서면 영성로 258', '35.72893967', '126.655107',10);
insert into village values(village_id_seq.nextval,'사랑감(용사만회)마을', 'http://www.naver.com', '김병옥', '063-583-5777', '전북', '부안군', '만들기체험', '곶감만들기', '전라북도 부안군 보안면 사창길 125', '35.642217', '126.658576',10);
insert into village values(village_id_seq.nextval,'산들바다마을', 'http://www.bsdb.kr', '장정종', '000-000-0000', '전북', '부안군', '만들기체험', '김치담기', '전라북도 부안군 진서면 내소사로 126', '35.607635', '126.5863304',10);
insert into village values(village_id_seq.nextval,'구름호수마을(운호마을)', 'http://unho.invil.org', '김성구', '063-584-7366', '전북', '부안군', '농작물경작체험', '돼지감자수확', '전라북도 부안군 진서면 운호길 137', '35.60245979', '126.553757',10);
insert into village values(village_id_seq.nextval,'용동마을', 'http://www.naver.com', '박병우', '000-000-0000', '전북', '부안군', '농작물경작체험', '물놀이, 수확체험', '전라북도 부안군 진서면 구룡댐길 65', '35.607942', '126.587781',10);
insert into village values(village_id_seq.nextval,'우동우리밀마을', 'http://www.naver.com', '홍기표', '063-581-9445', '전북', '부안군', '농작물경작체험', '계절농작물수확체험', '전라북도 부안군 보안면 반계로 14', '35.611717', '126.632938',10);
insert into village values(village_id_seq.nextval,'유유홍잠체험휴양마을', 'http://www.naver.com', '손기홍', '063-584-0074', '전북', '부안군', '농작물경작체험', '나의농업유산탐험기, 누에고치공예, 동네한바퀴체험, 뽕잎소금만들기, 오디수확체험', '전라북도 부안군 변산면 유유누에길 3', '35.630036', '126.510784',10);
insert into village values(village_id_seq.nextval,'후촌갈대숲마을', 'http://hc.invil.org', '황복이', '063-583-3099', '전북', '부안군', '농작물경작체험', '감자캐기체험', '전라북도 부안군 줄포면 후촌길 67', '35.594208', '126.673776',10);
insert into village values(village_id_seq.nextval,'황토열매마을', 'http://www.naver.com', '김진상', '000-000-0000', '전북', '순창군', '전통문화체험', '개성있는허수아비만들기', '전라북도 순창군 금과면 목동1길 19', '35.318303', '127.053504',10);
insert into village values(village_id_seq.nextval,'구미(거북장수)마을', 'http://www.naver.com', '양순섭', '063-653-9289', '전북', '순창군', '자연생태체험', '다슬기 채취', '전라북도 순창군 동계면 귀미로 290', '35.443862', '127.211446',10);
insert into village values(village_id_seq.nextval,'금돼지권역 농촌체험휴양마을', 'http://www.naver.com', '권영만', '063-652-0777', '전북', '순창군', '만들기체험', '떠먹는고구마피자, 바람떡, 아이스크림설기', '전라북도 순창군 적성면 담순로 2128-80', '35.39615019', '127.212157',10);
insert into village values(village_id_seq.nextval,'도라지마을', 'https://blog.naver.com/azmool', '박영훈', '063-653-5015', '전북', '순창군', '만들기체험', '꽃 디삭만들기', '전라북도 순창군 팔덕면 평창길 4', '35.381474', '127.069586',10);
insert into village values(village_id_seq.nextval,'물통골마을', 'http://www.naver.com', '설성환', '063-653-9325', '전북', '순창군', '만들기체험', '두부만들기체험', '전라북도 순창군 구림면 구산로 122', '35.427565', '127.117885',10);
insert into village values(village_id_seq.nextval,'순창 고추장익는 마을', 'http://www.gochujangvillage.com', '최광식', '063-653-7117', '전북', '순창군', '만들기체험', '고추장불고기', '전라북도 순창군 구림면 산내길 38', '35.483787', '127.1166503',10);
insert into village values(village_id_seq.nextval,'방화마을', 'http://www.naver.com', '김용운', '000-000-0000', '전북', '순창군', '농작물경작체험', '농산물수확체험', '전라북도 순창군 구림면 방화1길 30', '35.461477', '127.090365',10);
insert into village values(village_id_seq.nextval,'버들나루터마을', 'http://www.naver.com', '서상철', '063-652-8157', '전북', '순창군', '농작물경작체험', '농촌체험', '전라북도 순창군 유등면 유등로 621', '35.374206', '127.197952',10);
insert into village values(village_id_seq.nextval,'쌍치오룡마을', 'http://www.naver.com', '이철성', '000-000-0000', '전북', '순창군', '농작물경작체험', '농산물 수확', '전라북도 순창군 쌍치면 국사봉로 516', '35.539261', '126.967721',10);
insert into village values(village_id_seq.nextval,'종곡마을', 'http://www.naver.com', '김필수', '000-000-0000', '전북', '순창군', '농작물경작체험', '계절별 농사체험', '전라북도 순창군 쌍치면 순정로 1253', '35.508641', '126.944662',10);
insert into village values(village_id_seq.nextval,'종암마을', 'http://www.naver.com', '장진섭', '000-000-0000', '전북', '순창군', '농작물경작체험', '감따기체험', '전라북도 순창군 쌍치면 국사봉로 308-16', '35.523493', '126.9770797',10);
insert into village values(village_id_seq.nextval,'총댕이마을', 'http://www.naver.com', '김상곤', '000-000-0000', '전북', '순창군', '농작물경작체험', '농촌체험', '전라북도 순창군 쌍치면 피노길 23-1', '35.524554', '127.014172',10);
insert into village values(village_id_seq.nextval,'두억행복드림마을', 'https://cafe.daum.net/happybongse', '박종배', '063-247-0050', '전북', '완주군', '전통문화체험', '과거시험 체험', '전라북도 완주군 용진읍 두억길 13-12', '35.895641', '127.191313',10);
insert into village values(village_id_seq.nextval,'창포마을', 'http://www.changpovil.com', '노재석', '063-261-7373', '전북', '완주군', '자연생태체험', '감따서곶감만들기', '전라북도 완주군 고산면 대아저수로 385', '35.987374', '127.259025',10);
insert into village values(village_id_seq.nextval,'서두생강골', 'http://seodoo.invil.org', '김주완', '063-261-6833', '전북', '완주군', '만들기체험', '생강청, 비누, 생강도너츠', '전라북도 완주군 봉동읍 서정길 90', '35.941982', '127.148731',10);
insert into village values(village_id_seq.nextval,'오성한옥마을', 'http://www.osvillage.net', '조정형', '000-000-0000', '전북', '완주군', '만들기체험', '음식체험, 한옥체험', '전라북도 완주군 소양면 오도길 73', '35.906952', '127.236757',10);
insert into village values(village_id_seq.nextval,'원용복마을', 'http://www.naver.com', '양승학', '063-262-1717', '전북', '완주군', '만들기체험', '두부달걀찐빵만들기', '전라북도 완주군 경천면 대둔산로 512', '36.041994', '127.261803',10);
insert into village values(village_id_seq.nextval,'인덕마을', 'http://www.naver.com', '유철환', '063-241-7887', '전북', '완주군', '만들기체험', '고구마쿠키', '전라북도 완주군 소양면 인덕길 245-17', '35.88010004', '127.233797',10);
insert into village values(village_id_seq.nextval,'경천애인마을', 'http://www.naver.com', '김종촌', '063-263-5555', '전북', '완주군', '농작물경작체험', '감자캐기, 고구마캐기, 곶감만들기, 땅콩캐기', '전라북도 완주군 경천면 오복대석길 45', '36.018126', '127.2537404',10);
insert into village values(village_id_seq.nextval,'고산촌마을', 'http://www.naver.com', '이기열', '000-000-0000', '전북', '완주군', '농작물경작체험', '농산물수확체험', '전라북도 완주군 운주면 대둔산로 1858-78', '36.092174', '127.325764',10);
insert into village values(village_id_seq.nextval,'도계마을', 'http://bongseogol.invil.org', '이일구', '063-244-0684', '전북', '완주군', '농작물경작체험', '고구마케기', '전라북도 완주군 용진읍 봉서로 198', '35.890443', '127.1776898',10);
insert into village values(village_id_seq.nextval,'안덕마을', 'http://www.poweranduk.com', '임옥섭', '063-227-1000', '전북', '완주군', '농작물경작체험', '감자캐기', '전라북도 완주군 구이면 장파길 72', '35.695131', '127.099782',10);
insert into village values(village_id_seq.nextval,'오복마을', 'http://www.naver.com', '정택', '063-263-5555', '전북', '완주군', '농작물경작체험', '감자캐기', '전라북도 완주군 경천면 오복대석길 45', '36.018126', '127.2537404',10);
insert into village values(village_id_seq.nextval,'위봉산성마을', 'http://www.naver.com', '송영복', '063-241-0950', '전북', '완주군', '농작물경작체험', '농산물수확체험', '전라북도 완주군 소양면 송광수만로 762-10', '35.905738', '127.258115',10);
insert into village values(village_id_seq.nextval,'용머리고을', 'http://www.naver.com', '이길영', '063-861-9908', '전북', '익산시', '자연생태체험', '꽃마차', '전라북도 익산시 용안면 강변로 1087-12', '36.128557', '126.931516',10);
insert into village values(village_id_seq.nextval,'산들강웅포마을', 'http://www.naver.com', '백현기', '063-861-6627', '전북', '익산시', '만들기체험', '감 효소 만들기', '전라북도 익산시 웅포면 강변로 284', '36.087877', '126.884305',10);
insert into village values(village_id_seq.nextval,'풀빛향기송정마을', 'http://www.naver.com', '박중근', '063-858-5511', '전북', '익산시', '만들기체험', 'MP천연비누만들기(칼라)', '전라북도 익산시 삼기면 검지1길 13', '36.033991', '126.988647',10);
insert into village values(village_id_seq.nextval,'죽청대파니마을', 'http://www.naver.com', '임우섭', '063-841-7008', '전북', '익산시', '레포츠', '놀이 체험', '전라북도 익산시 삼기면 죽청길 46-50', '36.033021', '127.017699',10);
insert into village values(village_id_seq.nextval,'두동편백', 'http://dd.invil.org', '김지호', '063-862-8600', '전북', '익산시', '농작물경작체험', '감자캐기체험', '전라북도 익산시 성당면 두동길 88', '36.109097', '126.918067',10);
insert into village values(village_id_seq.nextval,'성당포구마을', 'https://blog.naver.com/sungdangpogu', '이용준', '063-862-3918', '전북', '익산시', '농작물경작체험', '농사체험', '전라북도 익산시 성당면 성당로 762', '36.130718', '126.921351',10);
insert into village values(village_id_seq.nextval,'수은마을', 'http://www.naver.com', '정인환', '063-835-5550', '전북', '익산시', '농작물경작체험', '감자캐기', '전라북도 익산시 여산면 수은길 91', '36.082286', '127.067248',10);
insert into village values(village_id_seq.nextval,'강변사리마을', 'http://gang42.com', '신일섭', '000-000-0000', '전북', '임실군', '전통문화체험', '마당극 관람', '전라북도 임실군 덕치면 강동로 865-20', '35.495201', '127.190011',10);
insert into village values(village_id_seq.nextval,'꽃심지 둔데기마을', 'http://꽃심지둔데기마을.com/', '이운재', '063-642-8254', '전북', '임실군', '전통문화체험', '식생활예절학습체험', '전라북도 임실군 오수면 둔덕2길 36', '35.503781', '127.3177599',10);
insert into village values(village_id_seq.nextval,'방길마을', 'http://www.naver.com', '김용대', '000-000-0000', '전북', '임실군', '전통문화체험', '전통놀이체험', '전라북도 임실군 신덕면 삼길1길 177-80', '35.686244', '127.139993',10);
insert into village values(village_id_seq.nextval,'십이연주권역', 'http://www.naver.com', '김명식', '063-644-8103', '전북', '임실군', '전통문화체험', '시골밥상. 아궁이불집히기. 소여물주기', '전라북도 임실군 지사면 영천3길 40-5', '35.574499', '127.374796',10);
insert into village values(village_id_seq.nextval,'구담마을', 'http://www.naver.com', '이인규', '063-644-9051', '전북', '임실군', '만들기체험', '간편고추장담그기', '전라북도 임실군 덕치면 천담2길 287-4', '35.475424', '127.175055',10);
insert into village values(village_id_seq.nextval,'수풍마을', 'https://blog.naver.com/kungolvil', '박병삼', '000-000-0000', '전북', '임실군', '만들기체험', '쌀강정만들기', '전라북도 임실군 청웅면 향교로 124-3', '35.581578', '127.207632',10);
insert into village values(village_id_seq.nextval,'안하마을', 'http://www.naver.com', '최맹식', '070-7755-4033', '전북', '임실군', '만들기체험', '두부만들기', '전라북도 임실군 지사면 안하4길 40', '35.589216', '127.347612',10);
insert into village values(village_id_seq.nextval,'왕방힐링마을', 'http://www.naver.com', '홍성현', '000-000-0000', '전북', '임실군', '만들기체험', '전통발효액담그기', '전라북도 임실군 성수면 왕방길 360', '35.624226', '127.399679',10);
insert into village values(village_id_seq.nextval,'후촌마을', 'http://www.naver.com', '김병학', '063-643-0919', '전북', '임실군', '만들기체험', '블루베리 쿠키, 아이스크림', '전라북도 임실군 성수면 도인4길 3', '35.643208', '127.321657',10);
insert into village values(village_id_seq.nextval,'대리만족힐리지', 'http://www.naver.com', '김주현', '063-644-0905', '전북', '임실군', '농작물경작체험', '농촌체험', '전라북도 임실군 신평면 가덕로 707', '35.657886', '127.2292997',10);
insert into village values(village_id_seq.nextval,'박사골권역', 'http://www.naver.com', '오흥섭', '063-642-7077', '전북', '임실군', '농작물경작체험', '감자캐기', '전라북도 임실군 삼계면 세심길 26', '35.492745', '127.2500198',10);
insert into village values(village_id_seq.nextval,'신전마을(다락골)', 'http://www.naver.com', '최의범', '063-644-1331', '전북', '임실군', '농작물경작체험', '감자캐기', '전라북도 임실군 관촌면 상월로 478', '35.719855', '127.268649',10);
insert into village values(village_id_seq.nextval,'치즈마을', 'http://cheese.invil.org', '송기봉', '063-643-3700', '전북', '임실군', '농작물경작체험', '6가지체험', '전라북도 임실군 임실읍 치즈마을1길 4', '35.636281', '127.294816',10);
insert into village values(village_id_seq.nextval,'학정마을', 'http://hjgreen.com', '신승철', '063-644-8821', '전북', '임실군', '농작물경작체험', '감자분양.체험', '전라북도 임실군 삼계면 학정3길 43', '35.49218994', '127.223717',10);
insert into village values(village_id_seq.nextval,'용계(당그래)', 'http://www.dangure.com', '전옥기', '063-351-0128', '전북', '장수군', '전통문화체험', '대보름, 달집놀이', '전라북도 장수군 장수읍 용계길 6', '35.616649', '127.499722',10);
insert into village values(village_id_seq.nextval,'매산청풍마을', 'http://www.ddyang.co.kr', '최학부', '063-351-3355', '전북', '장수군', '자연생태체험', '다슬기잡기', '전라북도 장수군 계북면 월현로 323-23', '35.783157', '127.58121',10);
insert into village values(village_id_seq.nextval,'유정담', 'http://www.naver.com', '백병화', '063-353-9961', '전북', '장수군', '자연생태체험', '별자리관측, 사과수확체험', '전라북도 장수군 번암면 남양길 12', '35.493268', '127.535331',10);
insert into village values(village_id_seq.nextval,'논개생가(주촌)마을', 'http://www.naver.com', '김생진', '000-000-0000', '전북', '장수군', '만들기체험', '댕댕이소쿠리만들기', '전라북도 장수군 장계면 논개생가길 21-5', '35.678303', '127.620449',10);
insert into village values(village_id_seq.nextval,'용바우농촌체험휴양마을', 'http://www.naver.com', '서창성', '000-000-0000', '전북', '장수군', '만들기체험', '도자기체험, 온실체험', '전라북도 장수군 천천면 진장로 1433', '35.744532', '127.537272',10);
insert into village values(village_id_seq.nextval,'광산마을', 'http://www.naver.com', '고현정', '063-532-0177', '전북', '장수군', '농작물경작체험', '농산물 수확 체험', '전라북도 장수군 천천면 천천북로 79', '35.757184', '127.540232',10);
insert into village values(village_id_seq.nextval,'무병장수(양악)마을', 'http://www.naver.com', '홍원표', '063-352-3313', '전북', '장수군', '농작물경작체험', '감자케기체험', '전라북도 장수군 계북면 토옥동로 114', '35.806482', '127.6396101',10);
insert into village values(village_id_seq.nextval,'문성생태 농촌체험휴양마을', 'http://www.naver.com', '이장우', '000-000-0000', '전북', '장수군', '농작물경작체험', '농촌체험', '전라북도 장수군 계북면 문성길 182-11', '35.781142', '127.629398',10);
insert into village values(village_id_seq.nextval,'육십령권역마을', 'http://www.naver.com', '한규병', '063-351-1904', '전북', '장수군', '농작물경작체험', '감자캐기', '전라북도 장수군 장계면 동명길 31', '35.748144', '127.633927',10);
insert into village values(village_id_seq.nextval,'섶밭들마을', 'http://www.naver.com', '하영택', '063-351-8300', '전북', '장수군', '기타', '경운기타기', '전라북도 장수군 천천면 천향로 35', '35.79329977', '127.545672',10);
insert into village values(village_id_seq.nextval,'원색명화마을', 'http://www.wsvill.com', '김종기', '063-284-3232', '전북', '전주시', '만들기체험', '쿠키, 메주, 된장만들기', '전라북도 전주시 완산구 바람쐬는길 330', '35.800405', '127.189193',10);
insert into village values(village_id_seq.nextval,'대흥리마을', 'http://www.naver.com', '신용근', '000-000-0000', '전북', '정읍시', '전통음식체험', '새알깨강정 만들기', '전라북도 정읍시 입암면 접지중앙길 55', '35.524973', '126.810454',10);
insert into village values(village_id_seq.nextval,'송죽마을', 'https://blog.naver.com/solti012', '유연필', '000-000-0000', '전북', '정읍시', '전통문화체험', '마을역사테마체험', '전라북도 정읍시 송죽길 25', '35.509675', '126.892091',10);
insert into village values(village_id_seq.nextval,'태산선비마을', 'https://blog.naver.com/moo1000g', '윤연희', '063-536-7742', '전북', '정읍시', '전통문화체험', '국궁(활)체험', '전라북도 정읍시 칠보면 칠보산로 1507', '35.602912', '126.988578',10);
insert into village values(village_id_seq.nextval,'달고운청정사교마을', 'http://www.naver.com', '진금식', '063-537-3366', '전북', '정읍시', '만들기체험', '모시개떡, 모시송편, 인절미', '전라북도 정읍시 산내면 사교2길 12-10', '35.57606029', '127.064463',10);
insert into village values(village_id_seq.nextval,'매당마을', 'http://www.naver.com', '양봉광', '063-535-8815', '전북', '정읍시', '만들기체험', '블랙베리 효소만들기', '전라북도 정읍시 옹동면 정동길 66', '35.636351', '126.959098',10);
insert into village values(village_id_seq.nextval,'정문마을', 'https://blog.naver.com/cmmusic', '김연식', '063-536-0199', '전북', '정읍시', '만들기체험', '두부도넛 만들기', '전라북도 정읍시 정문들목길 63-1', '35.591424', '126.817485',10);
insert into village values(village_id_seq.nextval,'백연마을', 'http://www.naver.com', '강기수', '063-571-9088', '전북', '정읍시', '레포츠', '야구경기연습체험', '전라북도 정읍시 신태인읍 백산감산로 105', '35.691729', '126.909785',10);
insert into village values(village_id_seq.nextval,'꽃두레행복마을', 'http://www.flordure.co.kr', '김만수', '063-535-0304', '전북', '정읍시', '농작물경작체험', '딸기 수확', '전라북도 정읍시 소성면 입고로 524', '35.55383958', '126.777134',10);
insert into village values(village_id_seq.nextval,'민하마을', 'http://www.naver.com', '홍석철', '063-635-0125', '전북', '정읍시', '농작물경작체험', '농산물수확체험', '전라북도 정읍시 산외면 민하길 45', '35.614558', '127.061535',10);
insert into village values(village_id_seq.nextval,'신기마을(십장생마을)', 'http://www.naver.com', '이민규', '000-000-0000', '전북', '정읍시', '기타', '감투봉해맞이행사체험', '전라북도 정읍시 산내면 능교신기길 14', '35.569514', '127.021764',10);
insert into village values(village_id_seq.nextval,'황토현 녹두랑 시루랑 마을', 'http://www.loessvillage.com', '김호인', '000-000-0000', '전북', '정읍시', '기타', '캠프파이어, 우유아이스크림', '전라북도 정읍시 덕천면 동학로 794-173', '35.627762', '126.834168',10);
insert into village values(village_id_seq.nextval,'상가막골', 'http://www.naver.com', '이기태', '000-000-0000', '전북', '진안군', '전통문화체험', '새총만들기 및 놀이, 전통놀이, 제기만들기', '전라북도 진안군 진안읍 상가막길 6', '35.795607', '127.509542',10);
insert into village values(village_id_seq.nextval,'씨없는곶감마을', 'http://jinanhakdong.modoo.at', '최명근', '063-432-3337', '전북', '진안군', '전통문화체험', '감자삼굿, 체험', '전라북도 진안군 정천면 봉학로 419-12', '35.888829', '127.396339',10);
insert into village values(village_id_seq.nextval,'봉황골(봉곡)농촌체험휴양마을', 'http://www.bonggok.com', '이재철', '000-000-0000', '전북', '진안군', '자연생태체험', '마을생태체험', '전라북도 진안군 동향면 봉곡길 7-17', '35.841811', '127.6134197',10);
insert into village values(village_id_seq.nextval,'포동마을', 'https://cafe.daum.net/podongwin', '강신오', '063-432-4540', '전북', '진안군', '자연생태체험', '용오름 물놀이', '전라북도 진안군 성수면 포동길 7', '35.710675', '127.294776',10);
insert into village values(village_id_seq.nextval,'구봉산마을', 'http://www.naver.com', '조성섭', '063-432-8230', '전북', '진안군', '만들기체험', '야생화체험', '전라북도 진안군 주천면 정주천로 513-7', '35.915502', '127.436593',10);
insert into village values(village_id_seq.nextval,'두원마을', 'http://duwon001.modoo.at/', '최근우', '063-432-9992', '전북', '진안군', '만들기체험', '김치체험', '전라북도 진안군 백운면 두원길 50', '35.663759', '127.4025503',10);
insert into village values(village_id_seq.nextval,'마조  농촌체험휴양마을', 'http://www.naver.com', '장수일', '000-000-0000', '전북', '진안군', '만들기체험', '곶감만들기, 바베큐체험', '전라북도 진안군 정천면 봉학로 640', '35.891581', '127.377131',10);
insert into village values(village_id_seq.nextval,'외사양 체험휴양마을', 'http://www.ecotw.co.kr', '김동한', '063-432-1500', '전북', '진안군', '만들기체험', '커피체험', '전라북도 진안군 진안읍 내사양길 24-7', '35.771155', '127.417347',10);
insert into village values(village_id_seq.nextval,'원연장마을', 'http://www.naver.com', '박명진', '063-433-2022', '전북', '진안군', '만들기체험', '두부체험', '전라북도 진안군 진안읍 원연장1길 21-1', '35.779691', '127.392675',10);
insert into village values(village_id_seq.nextval,'하가막마을', 'http://www.naver.com', '정대원', '000-000-0000', '전북', '진안군', '만들기체험', '계란꾸러미 만들기(짚공예)', '전라북도 진안군 진안읍 오가로 581-10', '35.801944', '127.515527',10);
insert into village values(village_id_seq.nextval,'감동마을', 'http://www.naver.com', '김기섭', '063-433-8433', '전북', '진안군', '농작물경작체험', '고구마캐기', '전라북도 진안군 용담면 감동길 51-9', '35.966129', '127.536084',10);
insert into village values(village_id_seq.nextval,'황금마을', 'http://www.naver.com', '최흥만', '070-4177-0202', '전북', '진안군', '농작물경작체험', '산촌농산물체험', '전라북도 진안군 부귀면 노래재로 2', '35.855842', '127.393962',10);
insert into village values(village_id_seq.nextval,'화순리마을', 'http://www.hwasunri.com', '강경보', '064-794-9008', '제주', '서귀포시', '자연생태체험', '놀이숲곶자왈', '제주특별자치도 서귀포시 안덕면 화순로 121-5', '33.245985', '126.333532',10);
insert into village values(village_id_seq.nextval,'가시리마을', 'http://www.naver.com', '정윤수', '064-787-1305', '제주', '서귀포시', '만들기체험', '쿠키,천연스킨,야생차', '제주특별자치도 서귀포시 표선면 가시로565번길 20', '33.353609', '126.770882',10);
insert into village values(village_id_seq.nextval,'신흥2리마을', 'http://www.jejudongbaektown.com', '오병협', '064-764-8756', '제주', '서귀포시', '만들기체험', '동박생이집만들기', '제주특별자치도 서귀포시 남원읍 중산간동로 5807', '33.321137', '126.745605',10);
insert into village values(village_id_seq.nextval,'혼인지마을', 'https://cafe.daum.net/honij', '고영욱', '064-784-5552', '제주', '서귀포시', '만들기체험', '감귤체험(감귤주스,감귤쨈만들기)', '제주특별자치도 서귀포시 성산읍 온평애향로23번길 6', '33.408123', '126.900174',10);
insert into village values(village_id_seq.nextval,'고성마을', 'http://www.naver.com', '정경수', '064-784-2378', '제주', '서귀포시', '농작물경작체험', '농산물 수확 체험', '제주특별자치도 서귀포시 성산읍 서성일로1222번길 36', '33.444839', '126.912022',10);
insert into village values(village_id_seq.nextval,'무릉도원마을', 'http://utopia.invil.org', '고희창', '064-792-1732', '제주', '서귀포시', '농작물경작체험', '효소만들기', '제주특별자치도 서귀포시 대정읍 중산간서로 2868', '33.274848', '126.235265',10);
insert into village values(village_id_seq.nextval,'신천리농촌체험휴양마을', 'http://www.naver.com', '최창열', '064-787-0157', '제주', '서귀포시', '농작물경작체험', '농산물 수확', '제주특별자치도 서귀포시 성산읍 신천서로 5', '33.344184', '126.849794',10);
insert into village values(village_id_seq.nextval,'신풍리마을', 'http://www.naver.com', '강덕호', '064-782-7445', '제주', '서귀포시', '농작물경작체험', '감귤따기', '제주특별자치도 서귀포시 성산읍 신풍하동로 39', '33.361888', '126.840549',10);
insert into village values(village_id_seq.nextval,'토산1리농촌체험휴양마을', 'http://www.naver.com', '김승희', '064-787-2835', '제주', '서귀포시', '농작물경작체험', '마을체험', '제주특별자치도 서귀포시 표선면 중산간동로 5468', '33.33284991', '126.768771',10);
insert into village values(village_id_seq.nextval,'하례1리 농어촌체험휴양마을', 'http://www.naver.com', '허은석', '064-767-0144', '제주', '서귀포시', '농작물경작체험', '마을체험', '제주특별자치도 서귀포시 남원읍 하례중앙로 95', '33.26916976', '126.625351',10);
insert into village values(village_id_seq.nextval,'하례2리 농촌체험휴양마을', 'http://www.naver.com', '허승필', '064-733-4189', '제주', '서귀포시', '농작물경작체험', '마을체험', '제주특별자치도 서귀포시 남원읍 하례돈야로 83', '33.297204', '126.6088599',10);
insert into village values(village_id_seq.nextval,'동광마을', 'https://blog.naver.com/kfcchanjp81', '안홍범', '064-794-2298', '제주', '서귀포시', '기타', '올래길 역사문화탐방', '제주특별자치도 서귀포시 안덕면 동광로 107', '33.306623', '126.337602',10);
insert into village values(village_id_seq.nextval,'의귀리마을', 'http://www.naver.com', '김기창', '064-764-7208', '제주', '서귀포시', '건강', '4.3길 걷기', '제주특별자치도 서귀포시 남원읍 한신로 207', '33.310444', '126.713422',10);
insert into village values(village_id_seq.nextval,'명도암참살이체험휴양마을', 'http://www.naver.com', '조재홍', '064-723-0261', '제주', '제주시', '전통음식체험', '간장판매, 고추장만들기, 고추장비빔밥체험, 귤따기체험, 김치만들기', '제주특별자치도 제주시 명림로 268-71', '33.462506', '126.606299',10);
insert into village values(village_id_seq.nextval,'조수1리농어촌체험휴양마을', 'http://www.naver.com', '윤관철', '064-772-5558', '제주', '제주시', '전통문화체험', '맷돌체험', '제주특별자치도 제주시 한경면 용금로 449', '33.335816', '126.227891',10);
insert into village values(village_id_seq.nextval,'청수농촌체험휴양마을', 'http://www.naver.com', '이종권', '064-772-1303', '제주', '제주시', '자연생태체험', '곶자왈, 반딧불이, 석부작 체험', '제주특별자치도 제주시 한경면 대한로 1034', '33.317925', '126.247265',10);
insert into village values(village_id_seq.nextval,'월령리 농어촌체험휴양마을', 'http://www.naver.com', '강한철', '064-796-2589', '제주', '제주시', '만들기체험', '백년초비누만들기', '제주특별자치도 제주시 한림읍 월령1길 11', '33.375981', '126.215649',10);
insert into village values(village_id_seq.nextval,'풋감마을', 'http://gamvillage.com', '이재섭', '064-799-8778', '제주', '제주시', '만들기체험', '각종공예체험', '제주특별자치도 제주시 애월읍 소길1길 15', '33.440069', '126.379868',10);
insert into village values(village_id_seq.nextval,'아홉굿마을', 'http://www.naver.com', '조성식', '064-773-1946', '제주', '제주시', '농작물경작체험', '농산물수확체험', '제주특별자치도 제주시 한경면 낙수로 97', '33.327903', '126.226255',10);
insert into village values(village_id_seq.nextval,'어음2리마을', 'http://www.naver.com', '양권범', '070-4548-1678', '제주', '제주시', '농작물경작체험', '농산물수확체험', '제주특별자치도 제주시 애월읍 어음10길 34', '33.400959', '126.336403',10);
insert into village values(village_id_seq.nextval,'와흘메밀마을', 'http://www.naver.com', '김두환', '064-783-1688', '제주', '제주시', '농작물경작체험', '농산물수확체험', '제주특별자치도 제주시 조천읍 남조로 2455', '33.482783', '126.650069',10);
insert into village values(village_id_seq.nextval,'유수암마을', 'http://www.naver.com', '문상봉', '064-799-2201', '제주', '제주시', '농작물경작체험', '감귤따기', '제주특별자치도 제주시 애월읍 유수암평화길 14', '33.441363', '126.402755',10);
insert into village values(village_id_seq.nextval,'저지마을', 'http://jeoji.invil.org', '김동철', '064-772-7700', '제주', '제주시', '농작물경작체험', '고구마수확체험', '제주특별자치도 제주시 한경면 중산간서로 3687', '33.333691', '126.255967',10);
insert into village values(village_id_seq.nextval,'계룡넓은돌마을', 'http://pm.invil.org/', '송무선', '042-841-0074', '충남', '계룡시', '만들기체험', '강정만들기 체험', '충청남도 계룡시 엄사면 나분들길 16', '36.266039', '127.224243',10);
insert into village values(village_id_seq.nextval,'밤톨이마을', 'http://jeonganbam.invil.org', '복명규', '041-854-7770', '충남', '공주시', '전통음식체험', '밤을 넣어 만든음식', '충청남도 공주시 정안면 북계새뜸길 61', '36.560983', '127.123216',10);
insert into village values(village_id_seq.nextval,'천탑마을', 'http://www.naver.com', '김달수', '041-841-6521', '충남', '공주시', '전통문화체험', '돌탑쌓기체험', '충청남도 공주시 사곡면 부곡산성로 139', '36.589961', '127.019511',10);
insert into village values(village_id_seq.nextval,'계룡산상신농촌체험휴양마을', 'http://amenity.modoo.at/', '최영복', '041-853-1479', '충남', '공주시', '만들기체험', '도자기체험', '충청남도 공주시 반포면 상하신길 396', '36.384491', '127.220108',10);
insert into village values(village_id_seq.nextval,'구난이약나무마을', 'http://www.naver.com', '최동진', '000-000-0000', '충남', '공주시', '만들기체험', '두부 만들기', '충청남도 공주시 이인면 강삿골길 25', '36.372982', '127.054807',10);
insert into village values(village_id_seq.nextval,'꽃내미풀꽃이랑마을', 'http://www.naver.com', '임재두', '041-852-1255', '충남', '공주시', '만들기체험', '천연서시옥용산비누만들기', '충청남도 공주시 정안면 고성1길 250-34', '36.591557', '127.086973',10);
insert into village values(village_id_seq.nextval,'소랭이마을', 'http://www.naver.com', '임동영', '041-852-8250', '충남', '공주시', '만들기체험', '군밤체험', '충청남도 공주시 정안면 정안마곡사로 396', '36.627293', '127.082996',10);
insert into village values(village_id_seq.nextval,'예울림물레방아마을', 'http://www.naver.com', '김영일', '041-852-5530', '충남', '공주시', '만들기체험', '꽃 짚신만들기', '충청남도 공주시 우성면 무재길 23-6', '36.466563', '126.986748',10);
insert into village values(village_id_seq.nextval,'자연애 밤토랑마을', 'http://www.naver.com', '정지영', '000-000-0000', '충남', '공주시', '만들기체험', '두부만들기체험', '충청남도 공주시 정안면 허수아비길 257-8', '36.645628', '127.0457599',10);
insert into village values(village_id_seq.nextval,'달빛영근마을', 'http://www.naver.com', '김표상', '000-000-0000', '충남', '공주시', '농작물경작체험', '벼의일생', '충청남도 공주시 정안면 쌍달길 160', '36.575977', '127.091651',10);
insert into village values(village_id_seq.nextval,'도담골호반마을', 'http://www.naver.com', '강연식', '000-000-0000', '충남', '공주시', '농작물경작체험', '강백년 권역 체험', '충청남도 공주시 의당면 강백년길 29', '36.58227977', '127.1699103',10);
insert into village values(village_id_seq.nextval,'보리감자마을', 'http://www.naver.com', '윤정섭', '041-841-8869', '충남', '공주시', '농작물경작체험', '감자심기', '충청남도 공주시 유구읍 안동해동길 5', '36.613039', '127.01966',10);
insert into village values(village_id_seq.nextval,'어무실구정승마을', 'http://www.naver.com', '최상규', '000-000-0000', '충남', '공주시', '농작물경작체험', '음식체험', '충청남도 공주시 정안면 어물음지말길 1', '36.601878', '127.144494',10);
insert into village values(village_id_seq.nextval,'예하지마을', 'http://yehazi.com', '김남용', '000-000-0000', '충남', '공주시', '농작물경작체험', '감자,옥수수', '충청남도 공주시 의당면 서당길 72', '36.549698', '127.140576',10);
insert into village values(village_id_seq.nextval,'장익는마을', 'http://www.naver.com', '이인희', '000-000-0000', '충남', '공주시', '농작물경작체험', '감자캐기', '충청남도 공주시 이인면 선근리1길 34', '36.379643', '127.069403',10);
insert into village values(village_id_seq.nextval,'한방웰니스마을', 'http://www.naver.com', '김승태', '000-000-0000', '충남', '공주시', '농작물경작체험', '농산물 수확', '충청남도 공주시 우성면 무성산로 296', '36.501215', '127.088538',10);
insert into village values(village_id_seq.nextval,'적벽강마을', 'http://www.naver.com', '길중계', '041-751-7142', '충남', '금산군', '자연생태체험', '곤충만들기, 도자기, 들꽃캘리, 리스만들기', '충청남도 금산군 부리면 수통1길 17', '36.050637', '127.591441',10);
insert into village values(village_id_seq.nextval,'두곡마을', 'http://www.naver.com', '박성춘', '041-753-2608', '충남', '금산군', '만들기체험', '글라이더만들어날리기', '충청남도 금산군 부리면 무금로 1650', '36.064239', '127.551766',10);
insert into village values(village_id_seq.nextval,'조팝꽃피는마을', 'http://www.naver.com', '배순철', '041-753-5382', '충남', '금산군', '만들기체험', '각종떡만들기체험', '충청남도 금산군 제원면 길곡길 8', '36.159007', '127.564183',10);
insert into village values(village_id_seq.nextval,'닥실마을', 'http://www.naver.com', '고선환', '041-751-2416', '충남', '금산군', '농작물경작체험', '감자체험', '충청남도 금산군 제원면 닥실길 27', '36.104301', '127.5691601',10);
insert into village values(village_id_seq.nextval,'바리실마을', 'http://www.naver.com', '박인호', '000-000-0000', '충남', '금산군', '농작물경작체험', '농수산물 직거래', '충청남도 금산군 제원면 바리실길 187', '36.132919', '127.524996',10);
insert into village values(village_id_seq.nextval,'진산애행복누리마을', 'http://www.naver.com', '강세기', '000-000-0000', '충남', '금산군', '농작물경작체험', '농촌체험', '충청남도 금산군 진산면 대둔산로 322', '36.139575', '127.364581',10);
insert into village values(village_id_seq.nextval,'막현리마을', 'http://www.naver.com', '강기주', '041-752-9772', '충남', '금산군', '기타', '깡통열차및 동네탐방', '충청남도 금산군 진산면 하막현길 77', '36.204044', '127.368045',10);
insert into village values(village_id_seq.nextval,'산안2리마을', 'http://www.naver.com', '한기재', '000-000-0000', '충남', '금산군', '건강', '숙박체험', '충청남도 금산군 군북면 자진뱅이길 165', '36.192032', '127.577484',10);
insert into village values(village_id_seq.nextval,'삼태미마을', 'http://www.naver.com', '윤성로', '000-000-0000', '충남', '논산시', '전통문화체험', '도예체험', '충청남도 논산시 노성면 호월로 387-3', '36.322246', '127.10414',10);
insert into village values(village_id_seq.nextval,'평매마을', 'http://www.naver.com', '정태하', '000-000-0000', '충남', '논산시', '자연생태체험', '꽃길체험', '충청남도 논산시 가야곡면 산노3길 45-25', '36.167584', '127.180294',10);
insert into village values(village_id_seq.nextval,'햇빛촌바랑산마을', 'http://barang.invil.org', '이동신', '041-741-2900', '충남', '논산시', '만들기체험', '감말랭이쵸크릿만들기', '충청남도 논산시 양촌면 바랑산2길 51', '36.129978', '127.274741',10);
insert into village values(village_id_seq.nextval,'황산벌둥지마을', 'http://www.hsb.modoo.at', '이기복', '041-735-0700', '충남', '논산시', '만들기체험', '떡메치기(인절미)', '충청남도 논산시 연산면 신양길 167-8', '36.193359', '127.228155',10);
insert into village values(village_id_seq.nextval,'덕곡마을', 'http://www.naver.com', '안병선', '000-000-0000', '충남', '논산시', '농작물경작체험', '농산물수확체험', '충청남도 논산시 벌곡면 수락로237번길 20', '36.170897', '127.29596',10);
insert into village values(village_id_seq.nextval,'덕바위마을', 'http://deokbawi.co.kr', '안상모', '041-733-2063', '충남', '논산시', '농작물경작체험', '군밤', '충청남도 논산시 연산면 선비로604번길 46-20', '36.237694', '127.184417',10);
insert into village values(village_id_seq.nextval,'도정마을', 'http://www.naver.com', '서정호', '041-741-5454', '충남', '논산시', '농작물경작체험', '고구마체험', '충청남도 논산시 양촌면 황산벌로380번길 15', '36.134516', '127.2439003',10);
insert into village values(village_id_seq.nextval,'둥구리마을', 'http://www.naver.com', '최낙원', '000-000-0000', '충남', '논산시', '농작물경작체험', '감자캐기', '충청남도 논산시 양촌면 중산길 35', '36.119906', '127.204049',10);
insert into village values(village_id_seq.nextval,'딸기마을', 'http://www.naver.com', '남기순', '000-000-0000', '충남', '논산시', '농작물경작체험', '감자캐기', '충청남도 논산시 광석면 논산평야로1119번길 125', '36.257469', '127.1023996',10);
insert into village values(village_id_seq.nextval,'사월1리마을', 'http://swrr.cafe24.com/', '박인범', '000-000-0000', '충남', '논산시', '농작물경작체험', '고구마 캐기 체험', '충청남도 논산시 광석면 논산평야로 1080', '36.248401', '127.109807',10);
insert into village values(village_id_seq.nextval,'시골애마을', 'http://www.naver.com', '윤주보', '000-000-0000', '충남', '논산시', '농작물경작체험', '딸리체험', '충청남도 논산시 광석면 장마루로516번길 18-3', '36.261406', '127.080385',10);
insert into village values(village_id_seq.nextval,'포전마을', 'http://www.naver.com', '김승권', '041-732-5508', '충남', '논산시', '농작물경작체험', '고구마수확체험', '충청남도 논산시 성동면 우곤1길 69', '36.198175', '126.996266',10);
insert into village values(village_id_seq.nextval,'황산벌참살이마을', 'http://www.naver.com', '김완순', '000-000-0000', '충남', '논산시', '농작물경작체험', '감자', '충청남도 논산시 연산면 고정1길 34-15', '36.198276', '127.186241',10);
insert into village values(village_id_seq.nextval,'푸레기마을', 'http://www.naver.com', '김철유', '041-353-5008', '충남', '당진시', '자연생태체험', '갯벌체험', '충청남도 당진시 석문면 초락1로 147', '36.992942', '126.502481',10);
insert into village values(village_id_seq.nextval,'백석올미마을', 'http://www.allmeone.com', '김금순', '041-353-7541', '충남', '당진시', '만들기체험', '3색송편만들기', '충청남도 당진시 순성면 매실로 246', '36.822709', '126.700534',10);
insert into village values(village_id_seq.nextval,'왕매실마을', 'https://blog.naver.com/3521446', '이호식', '041-352-1446', '충남', '당진시', '만들기체험', '고추장담기 체험', '충청남도 당진시 순성면 매실로 394', '36.830565', '126.707164',10);
insert into village values(village_id_seq.nextval,'당나루물꽃마을', 'http://www.naver.com', '이유호', '041-355-0220', '충남', '당진시', '농작물경작체험', '고구마수확체험', '충청남도 당진시 고대면 해창길 79', '36.972986', '126.520518',10);
insert into village values(village_id_seq.nextval,'버그내성소마을', 'http://www.naver.com', '고종진', '041-362-5918', '충남', '당진시', '농작물경작체험', '농산물수확체험', '충청남도 당진시 합덕읍 신촌로 6', '36.794111', '126.787579',10);
insert into village values(village_id_seq.nextval,'머드농수산체험마을', 'http://www.naver.com', '최정숙', '041-641-9940', '충남', '보령시', '자연생태체험', '바다체험, 굴구이', '충청남도 보령시 천북면 사호장은로 563-5', '36.500143', '126.491174',10);
insert into village values(village_id_seq.nextval,'미친서각마을', 'http://www.naver.com', '정지완', '041-934-2203', '충남', '보령시', '만들기체험', '핸드드립커피체험', '충청남도 보령시 남포면 원제길 37', '36.318257', '126.558112',10);
insert into village values(village_id_seq.nextval,'신현(쌈지돈)마을', 'http://ssamjime.invil.org', '박동규', '041-641-7744', '충남', '보령시', '만들기체험', 'EM비누만들기', '충청남도 보령시 천북면 삼산농현길 147-17', '36.48283039', '126.595905',10);
insert into village values(village_id_seq.nextval,'토정마을', 'http://www.naver.com', '권녕일', '041-935-3033', '충남', '보령시', '만들기체험', '눈꽃송이만들기', '충청남도 보령시 청라면 윗장골길 113', '36.402099', '126.655503',10);
insert into village values(village_id_seq.nextval,'그리고마을', 'http://www.naver.com', '임일구', '041-935-1005', '충남', '보령시', '농작물경작체험', '농산물 수확 체험', '충청남도 보령시 미산면 내평봉성길 342', '36.227328', '126.694263',10);
insert into village values(village_id_seq.nextval,'빙도마을', 'http://www.naver.com', '김문희', '000-000-0000', '충남', '보령시', '농작물경작체험', '농산물 수확 체험', '충청남도 보령시 천북면 빙도길 170', '36.463799', '126.555915',10);
insert into village values(village_id_seq.nextval,'성주4리먹방마을', 'http://www.naver.com', '서광수', '000-000-0000', '충남', '보령시', '농작물경작체험', '농산물 수확', '충청남도 보령시 성주면 먹방길 33', '36.34867014', '126.660006',10);
insert into village values(village_id_seq.nextval,'오서산산촌생태마을', 'http://oseosan.modoo.at/', '송재성', '041-933-6882', '충남', '보령시', '농작물경작체험', '고추따기 체험', '충청남도 보령시 청소면 넙티로 513-6', '36.446144', '126.641031',10);
insert into village values(village_id_seq.nextval,'은행마을', 'http://www.naver.com', '조구형', '070-7845-5060', '충남', '보령시', '농작물경작체험', '감 따기 체험', '충청남도 보령시 청라면 오서산길 150-65', '36.42719993', '126.675581',10);
insert into village values(village_id_seq.nextval,'부여양송이마을', 'http://www.naver.com', '이기태', '000-000-0000', '충남', '부여군', '자연생태체험', '나만의 화분심기', '충청남도 부여군 석성면 금백로 425', '36.244466', '126.992256',10);
insert into village values(village_id_seq.nextval,'구레울체험마을', 'https://cafe.daum.net/chunbo12', '장운길', '041-834-5900', '충남', '부여군', '만들기체험', '각종체소 화분만들기', '충청남도 부여군 내산면 홍내로천보길 149', '36.246236', '126.763873',10);
insert into village values(village_id_seq.nextval,'백제인동마을', 'http://www.naver.com', '이길용', '041-833-7564', '충남', '부여군', '만들기체험', '계절별 두부만들기 체험', '충청남도 부여군 은산면 지천로 539-3', '36.360794', '126.842796',10);
insert into village values(village_id_seq.nextval,'부여기와마을', 'http://www.naver.com', '정하진', '041-834-8253', '충남', '부여군', '만들기체험', '꽃사탕만들기', '충청남도 부여군 부여읍 월함로 277', '36.304009', '126.937102',10);
insert into village values(village_id_seq.nextval,'송죽마을', 'http://www.songjook.co.kr', '백성열', '041-837-1151', '충남', '부여군', '만들기체험', '김장체험', '충청남도 부여군 장암면 원문로 53-6', '36.235348', '126.881152',10);
insert into village values(village_id_seq.nextval,'친환경까치마을', 'http://www.naver.com', '홍주영', '042-832-5003', '충남', '부여군', '만들기체험', '석고 방향제만들기', '충청남도 부여군 초촌면 진호로 2', '36.275573', '127.048361',10);
insert into village values(village_id_seq.nextval,'고추골솔바람마을', 'https://cafe.naver.com/chuyangri', '이흥열', '000-000-0000', '충남', '부여군', '농작물경작체험', '감자캐기', '충청남도 부여군 초촌면 응추로 110-9', '36.25657041', '127.022348',10);
insert into village values(village_id_seq.nextval,'신암전통테마마을', 'http://www.naver.com', '강경선', '041-830-2818', '충남', '부여군', '농작물경작체험', '딸기 따기 체험', '충청남도 부여군 초촌면 신암로 178', '36.279195', '126.986939',10);
insert into village values(village_id_seq.nextval,'한다리마을', 'http://handari.weebly.com', '문기안', '000-000-0000', '충남', '서산시', '전통문화체험', '한다리전통체험', '충청남도 서산시 음암면 한다리길 34', '36.739861', '126.519292',10);
insert into village values(village_id_seq.nextval,'꽃송아리마을', 'http://www.naver.com', '최기환', '041-662-5783', '충남', '서산시', '만들기체험', '감자수제비만들기', '충청남도 서산시 팔봉면 한월당로 704', '36.808525', '126.398554',10);
insert into village values(village_id_seq.nextval,'별마을', 'http://www.naver.com', '장태일', '041-688-0961', '충남', '서산시', '만들기체험', '감자샐러드,샌드위치', '충청남도 서산시 해미면 오학별마을길 30-2', '36.719445', '126.553065',10);
insert into village values(village_id_seq.nextval,'방길동마을', 'http://www.naver.com', '지선하', '041-669-0111', '충남', '서산시', '농작물경작체험', '감자캐기체험', '충청남도 서산시 팔봉면 팔봉산로 122', '36.819501', '126.366783',10);
insert into village values(village_id_seq.nextval,'빛들마을', 'http://www.naver.com', '김정희', '041-664-8606', '충남', '서산시', '농작물경작체험', '고구마 캐기', '충청남도 서산시 부석면 마룡심포길 77-7', '36.655666', '126.375114',10);
insert into village values(village_id_seq.nextval,'솔마당마을', 'https://cafe.daum.net/sij091', '이종구', '041-668-0063', '충남', '서산시', '농작물경작체험', '농사체험', '충청남도 서산시 인지면 성리동산길 73', '36.783804', '126.400368',10);
insert into village values(village_id_seq.nextval,'초록꿈틀마을', 'http://www.naver.com', '전양배', '041-668-9900', '충남', '서산시', '농작물경작체험', '농사체험', '충청남도 서산시 음암면 두치로 366-1', '36.819461', '126.487852',10);
insert into village values(village_id_seq.nextval,'회포마을', 'http://hoepo.invil.org', '최근명', '070-8802-6635', '충남', '서산시', '농작물경작체험', '감자캐기', '충청남도 서산시 대산읍 운산나루터길 37-16', '36.931174', '126.465444',10);
insert into village values(village_id_seq.nextval,'물버들마을', 'http://www.naver.com', '황의신', '041-953-1024', '충남', '서천군', '전통문화체험', '규방공예 목걸이,브로치 만들기', '충청남도 서천군 마산면 한마로 677', '36.13345023', '126.782861',10);
insert into village values(village_id_seq.nextval,'봉하마을', 'http://www.naver.com', '김애경', '000-000-0000', '충남', '서천군', '자연생태체험', '갯펄생태체험', '충청남도 서천군 서면 서인로 1044-13', '36.150646', '126.576492',10);
insert into village values(village_id_seq.nextval,'갈숲마을', 'http://galsup.co.kr', '김영환', '041-951-2077', '충남', '서천군', '만들기체험', '갈대 발만들기', '충청남도 서천군 한산면 신성로 283', '36.075779', '126.838272',10);
insert into village values(village_id_seq.nextval,'고살메갈꽃체험마을', 'https://blog.daum.net/foreverorlove', '현종규', '000-000-0000', '충남', '서천군', '만들기체험', '모시 초콜릿 쇼콜라티에 체험', '충청남도 서천군 서천읍 삼산남길 66', '36.063535', '126.721653',10);
insert into village values(village_id_seq.nextval,'동자북문화역사마을', 'http://www.dongjabuk.com/', '박창순', '041-951-7743', '충남', '서천군', '만들기체험', '모시송편빗기체험', '충청남도 서천군 한산면 신성로 36-16', '36.084456', '126.813768',10);
insert into village values(village_id_seq.nextval,'이색체험마을', 'http://www.onsef.co.kr', '이선규', '041-951-8891', '충남', '서천군', '만들기체험', '기능성 소금, 청, 모시송편', '충청남도 서천군 기산면 화출길42번길 2-10', '36.075827', '126.768296',10);
insert into village values(village_id_seq.nextval,'행복마을', 'http://www.naver.com', '김진택', '041-952-0536', '충남', '서천군', '만들기체험', '고구마캐기', '충청남도 서천군 비인면 남당길63번길 23-6', '36.171289', '126.615876',10);
insert into village values(village_id_seq.nextval,'황새마을', 'http://www.naver.com', '구남윤', '070-4113-3563', '충남', '서천군', '만들기체험', '솟대만들기', '충청남도 서천군 마서면 계동길46번길 36', '36.063743', '126.699921',10);
insert into village values(village_id_seq.nextval,'달고개모시마을', 'http://www.naver.com', '김영택', '000-000-0000', '충남', '서천군', '농작물경작체험', '농사체험', '충청남도 서천군 화양면 화한로504번길 5', '36.065734', '126.821348',10);
insert into village values(village_id_seq.nextval,'동백꽃마을', 'http://camellia.invil.org', '김오현', '041-952-6737', '충남', '서천군', '농작물경작체험', '감자캐기', '충청남도 서천군 마서면 합전길 77', '36.048616', '126.668679',10);
insert into village values(village_id_seq.nextval,'봉선부엉이체험마을', 'http://www.naver.com', '최규훈', '000-000-0000', '충남', '서천군', '농작물경작체험', '농산물 수확', '충청남도 서천군 시초면 시초동로 269-15', '36.130375', '126.767305',10);
insert into village values(village_id_seq.nextval,'장선리마을공동체', 'http://www.naver.com', '구태창', '041-953-6971', '충남', '서천군', '농작물경작체험', '농산물 수확 체험', '충청남도 서천군 마서면 옥도로498번길 27', '36.045782', '126.718374',10);
insert into village values(village_id_seq.nextval,'외암마을', 'http://www.oeam.co.kr', '이규정', '041-541-0848', '충남', '아산시', '전통문화체험', '가야금연주체험', '충청남도 아산시 송악면 외암민속길9번길 13-2', '36.730992', '127.0144302',10);
insert into village values(village_id_seq.nextval,'내이랑마을', 'http://www.naver.com', '김규태', '041-544-4633', '충남', '아산시', '만들기체험', '가마솥두부만들기', '충청남도 아산시 영인면 신봉길 248', '36.899697', '126.996275',10);
insert into village values(village_id_seq.nextval,'다라미자운영마을', 'http://www.naver.com', '안복규', '000-000-0000', '충남', '아산시', '만들기체험', '가로리연 만들기', '충청남도 아산시 송악면 평촌길 107-9', '36.734523', '127.0010205',10);
insert into village values(village_id_seq.nextval,'오돌개마을', 'http://www.naver.com', '장석철', '041-544-6837', '충남', '아산시', '만들기체험', '다육및 반력식물키우기2', '충청남도 아산시 송악면 송악로 112', '36.710063', '126.956666',10);
insert into village values(village_id_seq.nextval,'일대마을', 'http://www.naver.com', '한경희', '041-547-2688', '충남', '아산시', '만들기체험', '고추장, 열무김치만들기', '충청남도 아산시 선장면 죽산안길 26', '36.781874', '126.9184704',10);
insert into village values(village_id_seq.nextval,'꽃가꾸는대통령마을', 'http://www.naver.com', '방병주', '000-000-0000', '충남', '아산시', '레포츠', 'ATV(4륜오토바이)', '충청남도 아산시 음봉면 충무로604번길 106-20', '36.834438', '127.022954',10);
insert into village values(village_id_seq.nextval,'강당골마을', 'http://www.naver.com', '유원봉', '041-545-7433', '충남', '아산시', '농작물경작체험', '감, 밤, 고구마 캐기', '충청남도 아산시 송악면 강당로 187-8', '36.716931', '127.015455',10);
insert into village values(village_id_seq.nextval,'기쁨두배마을', 'http://asan.invil.org/', '김용구', '041-532-6754', '충남', '아산시', '농작물경작체험', '감자캐기', '충청남도 아산시 둔포면 석곡길 101', '36.912144', '127.056328',10);
insert into village values(village_id_seq.nextval,'꾀꼴성마을', 'https://blog.naver.com/kkoekkolseong', '김영원', '041-546-2019', '충남', '아산시', '농작물경작체험', '감자캐기체험', '충청남도 아산시 음봉면 음봉로337번길 7-115', '36.850284', '127.045731',10);
insert into village values(village_id_seq.nextval,'신수리체험휴양마을', 'http://www.naver.com', '신광균', '041-533-7577', '충남', '아산시', '농작물경작체험', '농산물 수확 체험', '충청남도 아산시 음봉면 아산온천로 217-10', '36.854108', '126.981261',10);
insert into village values(village_id_seq.nextval,'황새권역마을', 'http://www.naver.com', '김승근', '041-335-9970', '충남', '예산군', '자연생태체험', '가을 메뚜기체험', '충청남도 예산군 광시면 시목대리길 2', '36.544844', '126.791546',10);
insert into village values(village_id_seq.nextval,'농리산촌생태마을', 'http://www.naver.com', '박우학', '041-332-2015', '충남', '예산군', '농작물경작체험', '농산물 수확 체험', '충청남도 예산군 대술면 원농리길 173-25', '36.660919', '126.897093',10);
insert into village values(village_id_seq.nextval,'또오실마을', 'http://www.naver.com', '윤성기', '000-000-0000', '충남', '예산군', '농작물경작체험', '농산물 수확 체험', '충청남도 예산군 광시면 가덕2길 3', '36.540093', '126.780959',10);
insert into village values(village_id_seq.nextval,'신장리사과체험마을', 'http://www.naver.com', '유재형', '000-000-0000', '충남', '예산군', '농작물경작체험', '사과따기', '충청남도 예산군 오가면 국사봉로 442', '36.670379', '126.7908102',10);
insert into village values(village_id_seq.nextval,'알토란사과마을', 'http://www.naver.com', '김영주', '041-331-7200', '충남', '예산군', '농작물경작체험', '내가 만들어 더 맛있는 사과파이', '충청남도 예산군 응봉면 운곡길 81', '36.652199', '126.779123',10);
insert into village values(village_id_seq.nextval,'남창마을', 'http://www.naver.com', '이재영', '000-000-0000', '충남', '천안시', '자연생태체험', '밤수확, 솔향기걷기', '충청남도 천안시 서북구 성거읍 보명사길 27-1', '36.863809', '127.195828',10);
insert into village values(village_id_seq.nextval,'솟대마을', 'http://www.naver.com', '김승진', '041-553-2580', '충남', '천안시', '자연생태체험', '나무목걸이만들기', '충청남도 천안시 동남구 북면 양곡2길 3', '36.85138039', '127.281322',10);
insert into village values(village_id_seq.nextval,'대동마을', 'http://www.naver.com', '이상우', '000-000-0000', '충남', '천안시', '만들기체험', '전통장 만들기', '충청남도 천안시 동남구 동면 장송죽계길 189', '36.789643', '127.380671',10);
insert into village values(village_id_seq.nextval,'용경마을', 'http://www.naver.com', '이종관', '000-000-0000', '충남', '천안시', '만들기체험', '호두와플만들기', '충청남도 천안시 동남구 광덕면 외보2길 67', '36.6860104', '127.085508',10);
insert into village values(village_id_seq.nextval,'탑골마을', 'http://www.naver.com', '정태영', '000-000-0000', '충남', '천안시', '농작물경작체험', '농산물 수확 체험', '충청남도 천안시 서북구 성거읍 천흥4길 109-8', '36.872908', '127.212864',10);
insert into village values(village_id_seq.nextval,'사자산농촌체험휴양마을', 'http://sindai.kr', '이남훈', '041-943-0089', '충남', '청양군', '자연생태체험', '가재잡기', '충청남도 청양군 운곡면 배미길 29', '36.521278', '126.876731',10);
insert into village values(village_id_seq.nextval,'칠갑사니마을', 'https://blog.naver.com/chilgapsani', '최무락', '000-000-0000', '충남', '청양군', '자연생태체험', '거위, 잉어, 말 먹이', '충청남도 청양군 대치면 판동길 260', '36.423789', '126.868609',10);
insert into village values(village_id_seq.nextval,'까치내마을', 'http://www.naver.com', '강오식', '041-943-9794', '충남', '청양군', '만들기체험', '고깔모자만들기', '충청남도 청양군 장평면 지천로 1241-8', '36.388498', '126.860154',10);
insert into village values(village_id_seq.nextval,'꽃뫼마을', 'http://www.kkotmoe.co.kr', '이춘복', '041-943-8002', '충남', '청양군', '만들기체험', '구기자효소체험', '충청남도 청양군 장평면 상지길 39', '36.359271', '126.859574',10);
insert into village values(village_id_seq.nextval,'동막골', 'http://www.naver.com', '정희택', '041-943-9922', '충남', '청양군', '만들기체험', '영화의상체험, 영화만들기', '충청남도 청양군 목면 본의길 341', '36.434356', '126.976141',10);
insert into village values(village_id_seq.nextval,'물여울마을', 'http://www.naver.com', '이선호', '041-942-9100', '충남', '청양군', '만들기체험', '감자전 만들기', '충청남도 청양군 화성면 산당로 441', '36.45873049', '126.703928',10);
insert into village values(village_id_seq.nextval,'용꿈꾸는마을', 'http://www.naver.com', '이미숙', '041-943-9300', '충남', '청양군', '만들기체험', '강정만들기', '충청남도 청양군 남양면 돌보길 72', '36.396612', '126.789943',10);
insert into village values(village_id_seq.nextval,'장곡마을', 'http://www.naver.com', '복진순', '041-943-8866', '충남', '청양군', '만들기체험', '공예품체험', '충청남도 청양군 대치면 장곡길 103-7', '36.409778', '126.8489505',10);
insert into village values(village_id_seq.nextval,'칠갑산산꽃마을', 'http://www.naver.com', '장광석', '041-944-2007', '충남', '청양군', '만들기체험', '떡메치기 체험', '충청남도 청양군 대치면 까치내로 1063-1', '36.409453', '126.835956',10);
insert into village values(village_id_seq.nextval,'가파마을', 'http://gapa.invil.org', '임광빈', '041-940-2401', '충남', '청양군', '농작물경작체험', '감따기', '충청남도 청양군 대치면 가파로 506-8', '36.497758', '126.880034',10);
insert into village values(village_id_seq.nextval,'고인돌마을', 'http://gogood.kr', '명형철', '000-000-0000', '충남', '청양군', '농작물경작체험', '감자캐기', '충청남도 청양군 운곡면 고인돌길 37', '36.506949', '126.830314',10);
insert into village values(village_id_seq.nextval,'바둑골마을', 'http://www.cync.kr/', '표승하', '041-943-3663', '충남', '청양군', '농작물경작체험', '농산물수확체험', '충청남도 청양군 정산면 면암로 288-184', '36.454036', '126.98393',10);
insert into village values(village_id_seq.nextval,'백곡리마을', 'http://www.naver.com', '윤상기', '041-942-4003', '충남', '청양군', '농작물경작체험', '농산물 수확 체험', '충청남도 청양군 정산면 백곡길 154', '36.416646', '126.969732',10);
insert into village values(village_id_seq.nextval,'은골구기자마을', 'http://www.naver.com', '장재규', '000-000-0000', '충남', '청양군', '농작물경작체험', '고사리 꺽기', '충청남도 청양군 비봉면 은골길 119', '36.520731', '126.798484',10);
insert into village values(village_id_seq.nextval,'알프스마을', 'http://www.alpsvill.com', '황준환', '041-942-0797', '충남', '청양군', '기타', '얼음축제', '충청남도 청양군 정산면 천장호길 223-35', '36.40971983', '126.914231',10);
insert into village values(village_id_seq.nextval,'칠갑뜨락농촌체험휴양마을', 'http://www.naver.com', '조정상', '041-944-1414', '충남', '청양군', '건강', '둘레길걷기', '충청남도 청양군 대치면 판동길 260', '36.423789', '126.868609',10);
insert into village values(village_id_seq.nextval,'태안별주부마을', 'http://byuljubu.invil.org', '최진우', '041-672-3359', '충남', '태안군', '자연생태체험', '갯벌체험(맛조개잡이)', '충청남도 태안군 남면 별주부길 102', '36.632731', '126.303533',10);
insert into village values(village_id_seq.nextval,'노을지는갯마을', 'http://www.seavillage.net', '박정수', '041-674-5842', '충남', '태안군', '어촌생활체험', '갯벌체험', '충청남도 태안군 소원면 법산길 274-7', '36.741672', '126.195602',10);
insert into village values(village_id_seq.nextval,'조개부리마을', 'http://www.naver.com', '이형우', '000-000-0000', '충남', '태안군', '어촌생활체험', '갯벌체험', '충청남도 태안군 고남면 옷점길 122-13', '36.415075', '126.399097',10);
insert into village values(village_id_seq.nextval,'갈두천권역', 'http://www.galduchun.com', '박원철', '041-675-4848', '충남', '태안군', '만들기체험', '가래떡만들기 체험', '충청남도 태안군 원북면 대기길 12-20', '36.798849', '126.257467',10);
insert into village values(village_id_seq.nextval,'길우지마을', 'http://www.naver.com', '허진우', '000-000-0000', '충남', '태안군', '만들기체험', '강정만들기체험', '충청남도 태안군 안면읍 길우지길 332-46', '36.466612', '126.374935',10);
insert into village values(village_id_seq.nextval,'만대마을', 'http://www.naver.com', '김정선', '000-000-0000', '충남', '태안군', '농작물경작체험', '농산물 수확 체험', '충청남도 태안군 이원면 원이로 2571-10', '36.947905', '126.301282',10);
insert into village values(village_id_seq.nextval,'매화둠벙마을', 'http://www.naver.com', '이순옥', '041-672-0109', '충남', '태안군', '농작물경작체험', '감자캐기', '충청남도 태안군 원북면 동해길 301-41', '36.812067', '126.226815',10);
insert into village values(village_id_seq.nextval,'법산연꽃마을', 'http://www.naver.com', '이영희', '000-000-0000', '충남', '태안군', '농작물경작체험', '감자.양파,고구마', '충청남도 태안군 소원면 마금로 255-114', '36.750339', '126.218142',10);
insert into village values(village_id_seq.nextval,'볏가리마을', 'http://www.naver.com', '손영철', '041-672-7296', '충남', '태안군', '농작물경작체험', '감자 수확', '충청남도 태안군 이원면 볏가리길 62', '36.898398', '126.293999',10);
insert into village values(village_id_seq.nextval,'해비알마을', 'http://www.naver.com', '서동철', '000-000-0000', '충남', '태안군', '건강', '올레길 트래킹', '충청남도 태안군 안면읍 해안관광로 44-13', '36.508315', '126.338443',10);
insert into village values(village_id_seq.nextval,'하리철새마을', 'http://hanwoolmaru.com', '박봉래', '041-634-6867', '충남', '홍성군', '자연생태체험', '갯벌체험', '충청남도 홍성군 서부면 남당항로 849', '36.588644', '126.457727',10);
insert into village values(village_id_seq.nextval,'봉암마을', 'http://www.naver.com', '복갑순', '000-000-0000', '충남', '홍성군', '만들기체험', '낙엽으로 액자 꾸미기', '충청남도 홍성군 금마면 봉수산로418번길 91', '36.59597006', '126.756347',10);
insert into village values(village_id_seq.nextval,'상리마을', 'http://www.naver.com', '임광석', '000-000-0000', '충남', '홍성군', '만들기체험', '감따기및곶감만들기', '충청남도 홍성군 홍북읍 매죽헌길 423', '36.644421', '126.732841',10);
insert into village values(village_id_seq.nextval,'오서산상담마을', 'http://osesan999.modoo.at', '박정배', '041-642-0709', '충남', '홍성군', '만들기체험', '봄꽃천연비누만들기체험', '충청남도 홍성군 광천읍 오서길351번길 16', '36.481501', '126.638813',10);
insert into village values(village_id_seq.nextval,'왕대골마을', 'https://blog.naver.com/world4660', '소정식', '000-000-0000', '충남', '홍성군', '만들기체험', '대나무공작체험', '충청남도 홍성군 구항면 구항길240번길 21', '36.583016', '126.624026',10);
insert into village values(village_id_seq.nextval,'용봉산돌바위마을', 'http://www.naver.com', '양주명', '041-635-1470', '충남', '홍성군', '만들기체험', '고구마맛탕만들기체험', '충청남도 홍성군 홍북읍 이응노로 307', '36.631419', '126.653511',10);
insert into village values(village_id_seq.nextval,'거북이마을', 'http://www.turtlevill.com', '전병환', '041-631-0402', '충남', '홍성군', '농작물경작체험', '감자캐기', '충청남도 홍성군 구항면 거북로 422-41', '36.57248008', '126.612052',10);
insert into village values(village_id_seq.nextval,'고미당마을', 'http://www.naver.com', '김도연', '000-000-0000', '충남', '홍성군', '농작물경작체험', '고추체험', '충청남도 홍성군 장곡면 무한로 987', '36.497229', '126.7444298',10);
insert into village values(village_id_seq.nextval,'느리실마을', 'https://blog.naver.com/dbrudtnr6168', '이형자', '000-000-0000', '충남', '홍성군', '농작물경작체험', '각종수확체험', '충청남도 홍성군 서부면 서부서길 621', '36.582808', '126.475348',10);
insert into village values(village_id_seq.nextval,'문당환경농업마을', 'http://mundang.invil.org', '이규재', '041-631-3538', '충남', '홍성군', '농작물경작체험', '감자캐기', '충청남도 홍성군 홍동면 문당길 141', '36.535428', '126.702154',10);
insert into village values(village_id_seq.nextval,'오누이마을', 'http://www.naver.com', '임응철', '041-642-9990', '충남', '홍성군', '농작물경작체험', '농사체험', '충청남도 홍성군 장곡면 홍장남로101번길 48', '36.509535', '126.698643',10);
insert into village values(village_id_seq.nextval,'하누리마을', 'http://www.naver.com', '박분이', '041-642-0262', '충남', '홍성군', '농작물경작체험', '고추/감자심기(주말농장)', '충청남도 홍성군 광천읍 매현1길 2', '36.522268', '126.633643',10);
insert into village values(village_id_seq.nextval,'산막이옛길농촌체험휴양마을', 'http://www.bbvill.com', '김영언', '043-832-3527', '충북', '괴산군', '자연생태체험', '옛길 숲 체험, 버섯따기, 목공체험', '충청북도 괴산군 칠성면 명태재로외사4길 1', '36.770035', '127.840192',10);
insert into village values(village_id_seq.nextval,'미선나무농촌체험휴양마을', 'http://www.naver.com', '우종태', '000-000-0000', '충북', '괴산군', '만들기체험', '미스트, 비누만들기', '충청북도 괴산군 칠성면 연풍로 61', '36.776993', '127.887076',10);
insert into village values(village_id_seq.nextval,'백마권역마을', 'http://ok100ma.kr', '김종화', '043-836-9911', '충북', '괴산군', '만들기체험', '고추장만들기 체험', '충청북도 괴산군 사리면 사리로 517', '36.838808', '127.651041',10);
insert into village values(village_id_seq.nextval,'사기막리마을', 'https://cafe.daum.net/sagimakecovil', '박갑연', '000-000-0000', '충북', '괴산군', '만들기체험', '오곡강정', '충청북도 괴산군 청천면 사기막길 44-29', '36.70232022', '127.840338',10);
insert into village values(village_id_seq.nextval,'대학찰옥수수권역마을', 'http://www.naver.com', '김교채', '043-832-7344', '충북', '괴산군', '농작물경작체험', '농산물 수확 체험', '충청북도 괴산군 장연면 충민로 1675', '36.871229', '127.930477',10);
insert into village values(village_id_seq.nextval,'둔율올갱이마을', 'http://seven.invil.org/', '박종영', '043-830-3903', '충북', '괴산군', '농작물경작체험', '감자캐기체험', '충청북도 괴산군 칠성면 둔율길 142', '36.783038', '127.848779',10);
insert into village values(village_id_seq.nextval,'사오랑마을', 'http://www.naver.com', '전재식', '043-830-3904', '충북', '괴산군', '농작물경작체험', '감자캐기체험', '충청북도 괴산군 칠성면 명태재로사은1길 59-39', '36.764739', '127.835314',10);
insert into village values(village_id_seq.nextval,'오가마을농촌체험휴양마을', 'http://www.naver.com', '최복만', '043-832-5585', '충북', '괴산군', '농작물경작체험', '농산물 수확 체험', '충청북도 괴산군 장연면 미선로오가2길 29', '36.820829', '127.952623',10);
insert into village values(village_id_seq.nextval,'단양 설마동 농촌체험·휴양마을', 'http://www.seolmadong.com/', '이종현', '043-421-8949', '충북', '단양군', '만들기체험', '두부만들기, 마을 하루체험', '충청북도 단양군 단성면 고평1길 5-6', '36.919026', '128.246464',10);
insert into village values(village_id_seq.nextval,'한드미마을', 'http://handemy.org', '정문찬', '043-422-2831', '충북', '단양군', '만들기체험', '대나무피리만들기', '충청북도 단양군 가곡면 한드미길 30-12', '36.989391', '128.4390303',10);
insert into village values(village_id_seq.nextval,'도담행복마을', 'http://www.dodamsambong.com', '이명휘', '000-000-0000', '충북', '단양군', '레포츠', '사륜바이크체험, 목공예체험', '충청북도 단양군 단양읍 도담삼봉2길 6', '37.001094', '128.347137',10);
insert into village values(village_id_seq.nextval,'네덜란드풍차농촌체험휴양마을', 'http://www.naver.com', '김원열', '000-000-0000', '충북', '단양군', '농작물경작체험', '농촌체험', '충청북도 단양군 어상천면 덕문곡5길 3-7', '37.059003', '128.345564',10);
insert into village values(village_id_seq.nextval,'방곡도깨비마을', 'http://www.bgri.kr', '지일환', '000-000-0000', '충북', '단양군', '농작물경작체험', '계절 요리 체험', '충청북도 단양군 대강면 도락산로 137', '36.83940971', '128.316477',10);
insert into village values(village_id_seq.nextval,'삼둥지권역마을', 'http://samdungji.com', '김만진', '043-423-6767', '충북', '단양군', '농작물경작체험', '마늘캐기', '충청북도 단양군 단양읍 단양노동길 8', '36.956318', '128.373007',10);
insert into village values(village_id_seq.nextval,'삼태산농촌체험휴양마을', 'http://www.naver.com', '우성용', '043-421-6063', '충북', '단양군', '농작물경작체험', '농산물 수확 체험', '충청북도 단양군 어상천면 어상천로 974-27', '37.104007', '128.352863',10);
insert into village values(village_id_seq.nextval,'샘양지마을', 'http://www.naver.com', '김용학', '043-423-6200', '충북', '단양군', '농작물경작체험', '감자캐기', '충청북도 단양군 대강면 신구무수천길 21', '36.843914', '128.395659',10);
insert into village values(village_id_seq.nextval,'하일한드미마을', 'http://hailhandemy.net', '백낙훈', '043-421-5551', '충북', '단양군', '농작물경작체험', '가을걷이 체험', '충청북도 단양군 가곡면 새밭로 443', '36.998823', '128.421144',10);
insert into village values(village_id_seq.nextval,'흰여울마을', 'http://dhyu.kr', '장일수', '043-421-9600', '충북', '단양군', '농작물경작체험', '감자심기체험', '충청북도 단양군 적성면 금수산로 3', '37.021036', '128.286397',10);
insert into village values(village_id_seq.nextval,'기대리선애빌', 'http://www.naver.com', '이재권', '070-7845-3090', '충북', '보은군', '전통문화체험', '꿈연 날리기', '충청북도 보은군 마로면 세중기대로 261-129', '36.39938042', '127.807316',10);
insert into village values(village_id_seq.nextval,'두메마을', 'http://www.naver.com', '성석현', '000-000-0000', '충북', '보은군', '산촌생활체험', '고로쇠채취', '충청북도 보은군 산외면 대원길 28', '36.592466', '127.783891',10);
insert into village values(village_id_seq.nextval,'구병마을', 'http://www.naver.com', '박희정', '000-000-0000', '충북', '보은군', '만들기체험', '떡메치기', '충청북도 보은군 속리산면 구병길 8', '36.480395', '127.871315',10);
insert into village values(village_id_seq.nextval,'북실마을', 'http://www.boeunbuksil.co.kr', '김홍석', '043-543-2299', '충북', '보은군', '만들기체험', '김장담그기', '충청북도 보은군 보은읍 종곡길 101', '36.522061', '127.750199',10);
insert into village values(village_id_seq.nextval,'분저실마을', 'http://www.naver.com', '이병근', '070-7723-8592', '충북', '보은군', '만들기체험', '김장김치담', '충청북도 보은군 회남면 군막길 8', '36.423624', '127.574671',10);
insert into village values(village_id_seq.nextval,'잘산대대박마을', 'http://www.jalsandae.com', '유재면', '043-543-6570', '충북', '보은군', '만들기체험', '계란꾸러미만들기', '충청북도 보은군 산외면 내북산외로 661', '36.577788', '127.716204',10);
insert into village values(village_id_seq.nextval,'법수리마을', 'http://www.oubudong.kr', '오은택', '000-000-0000', '충북', '보은군', '농작물경작체험', '고구마 수확체험', '충청북도 보은군 회남면 연꽃마을길 18-7', '36.431484', '127.537647',10);
insert into village values(village_id_seq.nextval,'우진송죽마을', 'http://www.naver.com', '김필제', '000-000-0000', '충북', '보은군', '농작물경작체험', '대추 따기 체험', '충청북도 보은군 삼승면 천남송죽로 383', '36.436645', '127.740355',10);
insert into village values(village_id_seq.nextval,'하얀민들레마을', 'http://www.busuri.com', '안충기', '000-000-0000', '충북', '보은군', '농작물경작체험', '계절별 농산물수확체험', '충청북도 보은군 회인면 부수길 111-2', '36.492008', '127.609648',10);
insert into village values(village_id_seq.nextval,'시항골마을', 'http://www.naver.com', '이준호', '043-744-5900', '충북', '영동군', '자연생태체험', '곤충관찰체험', '충청북도 영동군 학산면 용화양강로 1359', '36.083063', '127.723949',10);
insert into village values(village_id_seq.nextval,'금강모치마을', 'http://mochi.go2vil.org', '한영기', '000-000-0000', '충북', '영동군', '만들기체험', '한지공예,국궁,짚풀공예,풍등', '충청북도 영동군 학산면 모리1길 38', '36.1118496', '127.647619',10);
insert into village values(village_id_seq.nextval,'달빛머무는마을', 'http://www.naver.com', '이해숙', '000-000-0000', '충북', '영동군', '만들기체험', '국화주만들기', '충청북도 영동군 황간면 원촌동1길 27', '36.234019', '127.894132',10);
insert into village values(village_id_seq.nextval,'황금을따는마을', 'http://www.naver.com', '김용문', '000-000-0000', '충북', '영동군', '만들기체험', '곶감만들기', '충청북도 영동군 영동읍 임계길 249', '36.167885', '127.848014',10);
insert into village values(village_id_seq.nextval,'흙진주포도체험마을', 'http://www.no1podo.kr', '김청자', '000-000-0000', '충북', '영동군', '만들기체험', '각종 짱아지 담기', '충청북도 영동군 영동읍 주곡1길 5', '36.174128', '127.823718',10);
insert into village values(village_id_seq.nextval,'비단강숲마을', 'http://www.naver.com', '김명섭', '043-745-5432', '충북', '영동군', '레포츠', '자전거하이킹', '충청북도 영동군 양산면 수두1길 20-42', '36.132176', '127.658407',10);
insert into village values(village_id_seq.nextval,'금도끼은도끼', 'http://www.naver.com', '이병호', '000-000-0000', '충북', '영동군', '농작물경작체험', '농산물 수확 체험', '충청북도 영동군 심천면 국악로1길 4', '36.210799', '127.705115',10);
insert into village values(village_id_seq.nextval,'해평산뜰애마을', 'http://www.naver.com', '김광동', '000-000-0000', '충북', '영동군', '농작물경작체험', '농사체험', '충청북도 영동군 매곡면 해평길 82', '36.159613', '127.948185',10);
insert into village values(village_id_seq.nextval,'달빛마을', 'http://www.naver.com', '이준설', '043-731-1881', '충북', '옥천군', '만들기체험', '떡, 두부, 메주, 보리빵 만들기', '충청북도 옥천군 군북면 환산로 315-1', '36.342712', '127.551104',10);
insert into village values(village_id_seq.nextval,'덕실마을', 'http://www.naver.com', '이예섭', '000-000-0000', '충북', '옥천군', '만들기체험', '가마솥두부만들기', '충청북도 옥천군 안남면 도덕1길 82', '36.351759', '127.684587',10);
insert into village values(village_id_seq.nextval,'시골살이마을', 'http://www.naver.com', '박효서', '000-000-0000', '충북', '옥천군', '만들기체험', '석고방향제, 에코백만들기', '충청북도 옥천군 동이면 청마1길 38-47', '36.30909033', '127.663557',10);
insert into village values(village_id_seq.nextval,'장수마을', 'http://www.naver.com', '박상헌', '043-733-9453', '충북', '옥천군', '만들기체험', '감자 컵케이크 만들기', '충청북도 옥천군 청성면 장수로1길 79-1', '36.315801', '127.743547',10);
insert into village values(village_id_seq.nextval,'한두레마을', 'http://handure.net', '이한구', '043-733-7620', '충북', '옥천군', '만들기체험', '감말랭이 장아찌 만들기', '충청북도 옥천군 청성면 한두레로 387', '36.325658', '127.728999',10);
insert into village values(village_id_seq.nextval,'햇다래마을', 'http://www.haetdarae.kr/', '주도완', '043-731-8883', '충북', '옥천군', '만들기체험', '건강한송편만들기', '충청북도 옥천군 안내면 안내수한로 239-7', '36.404718', '127.638821',10);
insert into village values(village_id_seq.nextval,'향수뜰마을', 'http://hyangsutteul.modoo.at', '김우태', '000-000-0000', '충북', '옥천군', '만들기체험', '나무열쇠고리, 두부만들기', '충청북도 옥천군 군북면 비야대정로 733', '36.384421', '127.540902',10);
insert into village values(village_id_seq.nextval,'배바우마을', 'http://www.naver.com', '송윤섭', '043-733-1135', '충북', '옥천군', '농작물경작체험', '감자캐기', '충청북도 옥천군 안남면 안남로 509', '36.355621', '127.676662',10);
insert into village values(village_id_seq.nextval,'팔음산마을', 'https://blog.naver.com/paleum812', '김태중', '043-731-4193', '충북', '옥천군', '농작물경작체험', '감자, 고구마, 된장, 김장체험', '충청북도 옥천군 청산면 예곡2길 8-12', '36.355517', '127.831911',10);
insert into village values(village_id_seq.nextval,'체리마을', 'http://www.naver.com', '어대룡', '000-000-0000', '충북', '음성군', '자연생태체험', '계곡물놀이', '충청북도 음성군 소이면 갑산로252번길 17', '36.892416', '127.754015',10);
insert into village values(village_id_seq.nextval,'대실마을', 'http://www.naver.com', '박남홍', '070-8861-6857', '충북', '음성군', '만들기체험', '계란꾸러미 만들기', '충청북도 음성군 삼성면 대야길 46-5', '37.037446', '127.500436',10);
insert into village values(village_id_seq.nextval,'수레울힐링마을', 'https://cafe.daum.net/s3333', '김춘태', '043-882-7168', '충북', '음성군', '만들기체험', '압화, 앙금플라워, 우드아트', '충청북도 음성군 생극면 오신로 221-3', '37.015992', '127.634875',10);
insert into village values(village_id_seq.nextval,'슬로시티수산마을', 'http://www.naver.com', '박완석', '000-000-0000', '충북', '제천시', '전통문화체험', '국궁', '충청북도 제천시 수산면 월악로26길 36', '36.932394', '128.180169',10);
insert into village values(village_id_seq.nextval,'산채건강마을', 'http://www.naver.com', '최영락', '043-653-7788', '충북', '제천시', '자연생태체험', '산나물,약초체험', '충청북도 제천시 봉양읍 명암로 574', '37.190656', '128.143739',10);
insert into village values(village_id_seq.nextval,'초록꿈체험마을', 'http://www.naver.com', '정재몽', '043-651-1233', '충북', '제천시', '만들기체험', '굽는건강찰떡', '충청북도 제천시 백운면 구학산로 736', '37.18952045', '127.994913',10);
insert into village values(village_id_seq.nextval,'학현마을', 'http://www.naver.com', '김동춘', '043-647-7080', '충북', '제천시', '만들기체험', '가마솥손두부', '충청북도 제천시 청풍면 학현소야로 299', '37.010832', '128.214676',10);
insert into village values(village_id_seq.nextval,'골뫼골명품마을', 'http://www.naver.com', '정종호', '000-000-0000', '충북', '제천시', '농작물경작체험', '대추털기체험', '충청북도 제천시 한수면 미륵송계로1길 272-42', '36.861075', '128.056187',10);
insert into village values(village_id_seq.nextval,'도화리마을', 'http://www.naver.com', '정선욱', '000-000-0000', '충북', '제천시', '농작물경작체험', '농산물수확체험', '충청북도 제천시 청풍면 옥순봉로 1455', '36.991965', '128.186212',10);
insert into village values(village_id_seq.nextval,'산야초마을', 'http://www.naver.com', '김남수', '043-651-3336', '충북', '제천시', '농작물경작체험', '농사체험', '충청북도 제천시 수산면 옥순봉로6길 3', '36.970201', '128.226665',10);
insert into village values(village_id_seq.nextval,'삼거리마을', 'http://www.naver.com', '진상권', '000-000-0000', '충북', '제천시', '농작물경작체험', '농산물 수확 체험', '충청북도 제천시 봉양읍 세거리로 479', '37.095897', '128.147958',10);
insert into village values(village_id_seq.nextval,'삼보산골 마을', 'http://www.naver.com', '김웅회', '000-000-0000', '충북', '증평군', '만들기체험', '소시지만들기체험', '충청북도 증평군 증평읍 죽리2길 23', '36.751535', '127.610909',10);
insert into village values(village_id_seq.nextval,'장이익어가는마을', 'http://jang.invil.org', '이금노', '043-835-3894', '충북', '증평군', '만들기체험', '가마솥삼계탕만들기', '충청북도 증평군 증평읍 송티로 76-12', '36.80046031', '127.577952',10);
insert into village values(village_id_seq.nextval,'정안마을', 'http://www.jungangol.co.kr', '강윤자', '043-838-8228', '충북', '증평군', '농작물경작체험', '감자캐기체험', '충청북도 증평군 증평읍 증안2길 22', '36.771354', '127.573874',10);
insert into village values(village_id_seq.nextval,'삼기조아유마을', 'http://www.samgijoayu.co.kr', '신진교', '043-836-5771', '충북', '증평군', '건강', '건강레포츠 체험', '충청북도 증평군 증평읍 율리휴양로 100', '36.723778', '127.621542',10);
insert into village values(village_id_seq.nextval,'명심체험마을', 'http://myeongsim.invil.org', '정동일', '043-532-8811', '충북', '진천군', '농작물경작체험', '감자캐기체험', '충청북도 진천군 백곡면 명심길 8', '36.904352', '127.393923',10);
insert into village values(village_id_seq.nextval,'물안뜰마을', 'http://www.baekgok.co.kr/', '조기환', '043-536-0411', '충북', '진천군', '농작물경작체험', '감자캐기체험', '충청북도 진천군 백곡면 백곡로 964', '36.880438', '127.381523',10);
insert into village values(village_id_seq.nextval,'보련마을', 'http://www.naver.com', '변상열', '000-000-0000', '충북', '진천군', '농작물경작체험', '농사체험', '충청북도 진천군 진천읍 보련골길 40-4', '36.845629', '127.3530395',10);
insert into village values(village_id_seq.nextval,'강내연꽃마을', 'http://www.naver.com', '최은철', '043-232-8400', '충북', '청주시', '만들기체험', '가죽공예소품만들기', '충청북도 청주시 흥덕구 강내면 궁현연꽃2길 33-6', '36.58133965', '127.367792',10);
insert into village values(village_id_seq.nextval,'초록감투마을', 'http://www.naver.com', '신일인', '043-253-7999', '충북', '청주시', '만들기체험', '두부만들기', '충청북도 청주시 상당구 문의면 산덕1길 3-13', '36.489618', '127.512998',10);
insert into village values(village_id_seq.nextval,'도로줌마을', 'http://www.dorojum.com', '박기섭', '043-222-9391', '충북', '청주시', '농작물경작체험', '고구마캐기', '충청북도 청주시 상당구 미원면 용곡구방로 472', '36.69861037', '127.678586',10);
insert into village values(village_id_seq.nextval,'말미장터마을', 'http://malmi.cheongju.go.kr', '최경애', '000-000-0000', '충북', '청주시', '농작물경작체험', '감자캐기및 감자요리', '충청북도 청주시 상당구 가덕면 계산1길 49', '36.552252', '127.560247',10);
insert into village values(village_id_seq.nextval,'벌랏한지마을', 'http://www.naver.com', '김필수', '043-221-4680', '충북', '청주시', '농작물경작체험', '감 따기', '충청북도 청주시 상당구 문의면 염티소전로 708', '36.457606', '127.546999',10);
insert into village values(village_id_seq.nextval,'오박사마을', 'http://www.naver.com', '오노균', '043-269-0123', '충북', '청주시', '농작물경작체험', '감자캐기', '충청북도 청주시 서원구 현도면 시목2길 39-17', '36.488342', '127.416075',10);
insert into village values(village_id_seq.nextval,'청원사과마을', 'http://eoam.cheongju.go.kr', '윤창한', '000-000-0000', '충북', '청주시', '농작물경작체험', '사과수확체험', '충청북도 청주시 상당구 미원면 어암2길 17-39', '36.614648', '127.753632',10);
insert into village values(village_id_seq.nextval,'개천안체험마을', 'http://www.naver.com', '이수종', '000-000-0000', '충북', '충주시', '자연생태체험', '낚시체험', '충청북도 충주시 동량면 호반로 757', '37.031348', '128.045032',10);
insert into village values(village_id_seq.nextval,'내포긴들체험마을', 'http://happynaepo.com', '손병용', '000-000-0000', '충북', '충주시', '자연생태체험', '곤충 체험', '충청북도 충주시 신니면 내포길 37', '37.004273', '127.721148',10);
insert into village values(village_id_seq.nextval,'재오개산촌마을', 'http://www.naver.com', '최경숙', '000-000-0000', '충북', '충주시', '만들기체험', '인절미만들기', '충청북도 충주시 살미면 충주호수로 2114', '36.946516', '127.990231',10);
insert into village values(village_id_seq.nextval,'탄방마을', 'http://www.naver.com', '이종성', '043-852-2577', '충북', '충주시', '만들기체험', '감자전,부침만들기', '충청북도 충주시 엄정면 세고개로 140', '37.092783', '127.944592',10);
insert into village values(village_id_seq.nextval,'상대촌마을', 'http://www.naver.com', '어성관', '043-855-8898', '충북', '충주시', '농작물경작체험', '감자캐기', '충청북도 충주시 앙성면 둔터로 558', '37.097623', '127.7155899',10);
insert into village values(village_id_seq.nextval,'인다락마을', 'https://cafe.daum.net/greeninda', '김현덕', '043-844-8745', '충북', '충주시', '농작물경작체험', '땅콩캐기', '충청북도 충주시 소태면 복탄1길 47', '37.120097', '127.822611',10);
insert into village values(village_id_seq.nextval,'추평호산뜰애마을', 'https://cusanddeulae.modoo.at/', '이정석', '043-848-2202', '충북', '충주시', '농작물경작체험', '짚 계란꾸러미만들기', '충청북도 충주시 엄정면 투수골길 2', '37.13527045', '127.943723',10);

commit;





--명소 테이블 생성
create table attraction(
  attractionNum NUMBER(10),
  attractionName VARCHAR2(48) not null,
  attractionRdnmadr VARCHAR2(70) not null,
  lnmadr VARCHAR2(70),
  attractionLatitude VARCHAR2(20) not null,
  attractionLongitude VARCHAR2(20) not null,
  constraint attraction_attractionNum_pk primary key(attractionNum)
);

--명소 번호(attractionNum) 시퀀스 생성
create SEQUENCE attraction_attractionNum_seq
increment by 1 --증감치
start with 1 --시작값
maxvalue 9999999999; --최대값

--명소 샘플 데이터 삽입
insert into attraction values(ATTRACTION_ATTRACTIONNUM_SEQ.nextval,'광화문', '서울 종로구 효자로 12 국립고궁박물관','세종로 1-57 국립고궁박물관','37.575983583321566','126.97689184432832');
insert into attraction values(ATTRACTION_ATTRACTIONNUM_SEQ.nextval,'소양강스카이워크', '강원도 춘천시 근화동 영서로 2675','강원 춘천시 근화동 8-1 소양강스카이워크','37.89381148478998', '127.72361966585704');
insert into attraction values(ATTRACTION_ATTRACTIONNUM_SEQ.nextval,'공지천 벚꽃길', '강원도 춘천시 근화동 692','','37.875573148567916', '127.70895007046889');






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
create SEQUENCE bookmark_bookmarkNum_seq
increment by 1 --증감치
start with 1 --시작값
maxvalue 9999999999; --최대값

--관심리스트 샘플 데이터 삽입
insert into bookmark values(bookmark_bookmarkNum_seq.nextval,'test1',1);
insert into bookmark values(bookmark_bookmarkNum_seq.nextval,'test1',2);
insert into bookmark values(bookmark_bookmarkNum_seq.nextval,'test1',3);
insert into bookmark values(bookmark_bookmarkNum_seq.nextval,'test1',4);
insert into bookmark values(bookmark_bookmarkNum_seq.nextval,'test1',5);
insert into bookmark values(bookmark_bookmarkNum_seq.nextval,'test2',6);
insert into bookmark values(bookmark_bookmarkNum_seq.nextval,'test3',7);
insert into bookmark values(bookmark_bookmarkNum_seq.nextval,'test4',8);
insert into bookmark values(bookmark_bookmarkNum_seq.nextval,'test5',9);
commit;





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
  ctprvnNm VARCHAR2(60) , --시도명
  signguNm VARCHAR2(60) , --시군구명
  exprnSe VARCHAR2(30), --체험프로그램구분

  
  constraint reservation_reservationNum_pk PRIMARY KEY(reservationNum),
  foreign key(memberId) references member(memberId) ON DELETE CASCADE,
  foreign key(id) references village(id) ON DELETE CASCADE
);
--예약번호 생성
create SEQUENCE reservation_reservationNum_seq
increment by 1 --증감치
start with 1 --시작값
maxvalue 9999999999; --최대값

--예약 샘플 데이터 삽입
insert into reservation values(reservation_reservationNum_seq.nextval, 'test1', 2, '2021/08/22', '14:00',10,'윷놀이','예약자1','01085696846','강원','강릉시','전통문화체험');
insert into reservation values(reservation_reservationNum_seq.nextval, 'test2', '3','2021/08/22','14:00',3,'목공예체험','예약자2','01059475545','강원','강릉시','만들기체험');
insert into reservation values(reservation_reservationNum_seq.nextval, 'test3', '4','2021/08/23','13:00',3,'감자 쿠키 만들기','예약자3','01088756369','강원','강릉시','만들기체험');
insert into reservation values(reservation_reservationNum_seq.nextval, 'test3', '4','2021/08/23','13:00',3,'감자 쿠키 만들기','예약자3','01088756369','강원','강릉시','만들기체험');
insert into reservation values(reservation_reservationNum_seq.nextval, 'test3', '4','2021/08/23','13:00',3,'감자 쿠키 만들기','예약자3','01088756369','강원','강릉시','만들기체험');

commit;





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



--리뷰 샘플 데이터 삽입
insert into review(reviewNum,reviewTitle,memberId,RCDATE,reviewContent,score,id) values(
  review_reviewNum_seq.nextval,'제목1','test1',systimestamp,'내용1',5,42);
insert into review(reviewNum,reviewTitle,memberId,RCDATE,reviewContent,score,id) values(
  review_reviewNum_seq.nextval,'제목2','test2',systimestamp,'내용2',5,32);
insert into review(reviewNum,reviewTitle,memberId,RCDATE,reviewContent,score,id) values(
  review_reviewNum_seq.nextval,'제목3','test3',systimestamp,'내용3',4,41);
insert into review(reviewNum,reviewTitle,memberId,RCDATE,reviewContent,score,id) values(
  review_reviewNum_seq.nextval,'제목4','test4',systimestamp,'내용4',3,15);
insert into review(reviewNum,reviewTitle,memberId,RCDATE,reviewContent,score,id) values(
  review_reviewNum_seq.nextval,'제목5','test5',systimestamp,'내용5',4,56);
commit;



--댓글 테이블 생성
create table reviewComment(
  commentNum NUMBER(10),
  reviewNum NUMBER(10),
  memberId VARCHAR2(20),
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
insert into reviewComment(commentNum,reviewNum,memberId,commentContent) values(reviewComment_reviewCommentNum_seq.nextval,1,'test1','내용1');  
insert into reviewComment(commentNum,reviewNum,memberId,commentContent) values(reviewComment_reviewCommentNum_seq.nextval,2,'test2','내용2');
insert into reviewComment(commentNum,reviewNum,memberId,commentContent) values(reviewComment_reviewCommentNum_seq.nextval,3,'test3','내용3');
insert into reviewComment(commentNum,reviewNum,memberId,commentContent) values(reviewComment_reviewCommentNum_seq.nextval,4,'test4','내용4');
insert into reviewComment(commentNum,reviewNum,memberId,commentContent) values(reviewComment_reviewCommentNum_seq.nextval,5,'test5','내용5');
commit;



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
insert into inquiry(inquiryNum,inquiryType,inquiryTitle,memberId,iCDATE,inquiryContent) values (inquiry_inquiryNum_seq.nextval,'2','문의 제목4','test4',systimestamp,'게시글신고의 문의 본문4');
insert into inquiry(inquiryNum,inquiryType,inquiryTitle,memberId,iCDATE,inquiryContent) values (inquiry_inquiryNum_seq.nextval,'1','문의 제목5','test5',systimestamp,'예약문의의 문의 본문5');
commit;




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
insert into inquiryComment values(inquiryComment_inquiryCommentNum_seq.nextval, 2, 'test2','문의 답변 제목2', systimestamp, '문의 답변 내용2');
insert into inquiryComment values(inquiryComment_inquiryCommentNum_seq.nextval, 3, 'test3','문의 답변 제목3', systimestamp, '문의 답변 내용3');
insert into inquiryComment values(inquiryComment_inquiryCommentNum_seq.nextval, 4, 'test3','문의 답변 제목4', systimestamp, '문의 답변 내용4');
insert into inquiryComment values(inquiryComment_inquiryCommentNum_seq.nextval, 5, 'test3','문의 답변 제목5', systimestamp, '문의 답변 내용5');




--파일 테이블 생성
create table uploadFile(
  fileNum NUMBER(10),
  reviewNum NUMBER(10),
  uploadFileName VARCHAR2(50) not null,
  storeFileName VARCHAR2(50) not null,
  fileSize VARCHAR2(45) not null,
  fileType VARCHAR2(100) not null,
  cDate timestamp default systimestamp not null,
  uDate timestamp,
  
  constraint uploadFile_fileNum_pk primary key(fileNum),
  FOREIGN key(reviewNum) references review ON DELETE CASCADE
);

--파일 번호 생성
create SEQUENCE uploadFile_fileNum_seq
increment by 1 --증감치
start with 1 --시작값
maxvalue 9999999999; --최대값





--코드 테이블 생성
create table code(
  code VARCHAR2(11),        --코드
  decode varchar2(33),      --코드명
  pcode varchar2(11),       --상위코드
  use_yn char(1),           --사용여부
  constraint code_code_pk primary key(code),
  constraint code_pcode_fk foreign key(code) references code,
  constraint code_decode_uk unique (decode),
  constraint code_use_yn_ck check(use_yn in('Y','N'))
);

--코드 샘플 데이터 삽입

insert into code(code,decode,pcode,use_yn) values ('A01','강원도','','Y');
insert into code(code,decode,pcode,use_yn) values ('A02','경기도','','Y');
insert into code(code,decode,pcode,use_yn) values ('A03','경상남도','','Y');
insert into code(code,decode,pcode,use_yn) values ('A04','경상북도','','Y');
insert into code(code,decode,pcode,use_yn) values ('A05','전라남도','','Y');
insert into code(code,decode,pcode,use_yn) values ('A06','전라북도','','Y');
insert into code(code,decode,pcode,use_yn) values ('A07','제주특별자치도','','Y');
insert into code(code,decode,pcode,use_yn) values ('A08','충청남도','','Y');
insert into code(code,decode,pcode,use_yn) values ('A09','충청북도','','Y');




--강원도
insert into code(code,decode,pcode,use_yn) values ('A0101','강릉시','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0102','고성군','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0103','동해시','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0104','삼척시','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0105','속초시','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0106','양구군','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0107','영월군','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0108','원주시','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0109','인제군','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0110','정선군','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0111','철원군','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0112','춘천시','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0113','태백시','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0114','평창군','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0115','홍천군','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0116','화천군','A01','Y');
insert into code(code,decode,pcode,use_yn) values ('A0117','횡성군','A01','Y');

--경기도
insert into code(code,decode,pcode,use_yn) values ('A0201','가평군','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0202','고양시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0203','광주시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0204','김포시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0205','남양주시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0206','안성시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0207','양평군','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0208','여주시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0209','연천군','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0210','오산시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0211','용인시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0212','이천시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0213','파주시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0214','평택시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0215','포천시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0216','화성시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0217','세종특별자치시 세종시','A02','Y');
insert into code(code,decode,pcode,use_yn) values ('A0218','인천광역시 강화군','A02','Y');

--경상남도
insert into code(code,decode,pcode,use_yn) values ('A0301','거제시','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0302','거창군','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0303','김해시','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0304','남해군','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0305','밀양시','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0306','사천시','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0307','산청군','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0308','양산시','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0309','의령군','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0310','진주시','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0311','창녕군','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0312','창원시','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0313','통영시','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0314','하동군','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0315','함안군','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0316','합천군','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0317','울산광역시 북구','A03','Y');
insert into code(code,decode,pcode,use_yn) values ('A0318','울산광역시 울주군','A03','Y');

--경상북도
insert into code(code,decode,pcode,use_yn) values ('A0401','경산시','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0402','경주시','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0403','고령군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0404','구미시','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0405','군위군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0406','김천시','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0407','문경시','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0408','봉화군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0409','상주시','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0410','성주군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0411','안동시','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0412','영덕군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0413','영주시','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0414','영천군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0415','예천군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0416','울릉군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0417','울진군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0418','의성군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0419','청도군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0420','청송군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0421','칠곡군','A04','Y');
insert into code(code,decode,pcode,use_yn) values ('A0422','포항시','A04','Y');


--전라남도
insert into code(code,decode,pcode,use_yn) values ('A0501','강진군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0502','고흥군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0503','곡성군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0504','광양시','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0505','구례군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0506','나주시','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0507','담양군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0508','무안군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0509','보성군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0510','순천시','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0511','신안군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0512','여수시','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0513','영관군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0514','영암군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0515','완도군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0516','장성군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0517','장흥군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0518','진도군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0519','함평군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0520','해남군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0521','화순군','A05','Y');
insert into code(code,decode,pcode,use_yn) values ('A0522','광주광역시 북구','A05','Y');

--전라북도
insert into code(code,decode,pcode,use_yn) values ('A0601','군산시','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0602','김제시','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0603','남원시','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0604','무주군','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0605','부안군','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0606','순창군','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0607','완주군','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0608','익산시','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0609','임실군','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0610','장수군','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0611','전주시','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0612','정읍시','A06','Y');
insert into code(code,decode,pcode,use_yn) values ('A0613','진안군','A06','Y');

--제주도
insert into code(code,decode,pcode,use_yn) values ('A0701','서귀포시','A07','Y');
insert into code(code,decode,pcode,use_yn) values ('A0702','제주시','A07','Y');

--충청남도
insert into code(code,decode,pcode,use_yn) values ('A0801','공주시','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0802','금산군','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0803','논산시','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0804','당진시','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0805','보령시','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0806','부여군','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0807','서산시','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0808','서천군','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0809','아산시','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0810','예산군','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0811','천안시','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0812','청양군','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0813','태안군','A08','Y');
insert into code(code,decode,pcode,use_yn) values ('A0814','홍성군','A08','Y');

--충청북도
insert into code(code,decode,pcode,use_yn) values ('A0901','괴산군','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0902','단양군','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0903','보은군','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0904','영동군','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0905','옥천군','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0906','음성순','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0907','제천시','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0908','증평군','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0909','진천군','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0910','청주시','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0911','충주시','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0912','대전광역시 동구','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0913','대전광역시 중구','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0914','대전광역시 대덕구','A09','Y');
insert into code(code,decode,pcode,use_yn) values ('A0915','대전광역시 유성구','A09','Y');


--체험 종류
insert into code(code,decode,pcode,use_yn) values ('B01','건강','','Y');
insert into code(code,decode,pcode,use_yn) values ('B02','기타','','Y');
insert into code(code,decode,pcode,use_yn) values ('B03','농작물경작체험','','Y');
insert into code(code,decode,pcode,use_yn) values ('B04','레포츠','','Y');
insert into code(code,decode,pcode,use_yn) values ('B05','만들기체험','','Y');
insert into code(code,decode,pcode,use_yn) values ('B06','산촌생활체험','','Y');
insert into code(code,decode,pcode,use_yn) values ('B07','어촌생활체험','','Y');
insert into code(code,decode,pcode,use_yn) values ('B08','자연생태체험','','Y');
insert into code(code,decode,pcode,use_yn) values ('B09','전통문화체험','','Y');
insert into code(code,decode,pcode,use_yn) values ('B10','전통음식체험','','Y');
commit;
