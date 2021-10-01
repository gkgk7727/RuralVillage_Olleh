drop table code;
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

select * from code;