--파일 테이블 삭제
drop table uploadFile;
--파일 번호 삭제
drop SEQUENCE uploadFile_fileNum_seq;
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
--파일 삽입
--insert into uploadFile(fileNum,reviewNum,uploadFileName,storeFileName,fileSize,fileType)
--  values(uploadFile_fileNum_seq.nextval,1,'업로드 파일명1','저장된 파일명1','100','images/jpg');
--insert into uploadFile(fileNum,reviewNum,uploadFileName,storeFileName,fileSize,fileType)
--  values(uploadFile_fileNum_seq.nextval,2,'업로드 파일명2','저장된 파일명2','200','images/jpg');
--insert into uploadFile(fileNum,reviewNum,uploadFileName,storeFileName,fileSize,fileType)
--  values(uploadFile_fileNum_seq.nextval,2,'업로드 파일명3','저장된 파일명3','300','images/jpg');

--파일 조회
--select *
--  from uploadFile, review
-- where review.reviewNum = uploadFile.reviewNum
--   and uploadFile.reviewNum = '1';
