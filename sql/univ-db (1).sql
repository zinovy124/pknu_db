
drop table STUDENT;
drop table COURSE;
drop table ENROL;

create table STUDENT (
  sno number(3),
  sname nvarchar2(4),
  year number(1),
  dept nvarchar2(5)
);

insert into STUDENT values (100, '나수영', 4, '컴퓨터');
insert into STUDENT values (200, '이찬수', 3, '전기');
insert into STUDENT values (300, '정기태', 1, '컴퓨터');
insert into STUDENT values (400, '송병길', 4, '컴퓨터');
insert into STUDENT values (500, '박종화', 2, '산공');
  
create table COURSE (
  cno char(4),
  cname nvarchar2(10),
  credit number(1),
  dept nvarchar2(4),
  professor nvarchar2(4)
);

insert into COURSE values ('C123', 'C프로그래밍', 3, '컴퓨터', '김성국');
insert into COURSE values ('C312', '자료구조', 3,	'컴퓨터', '황수관');
insert into COURSE values ('C324', '화일구조', 3,	'컴퓨터', '이규찬');
insert into COURSE values ('C413', '데이터베이스', 3, '컴퓨터', '이일로');
insert into COURSE values ('E412', '반도체', 3, '전자', '홍봉진');
  
  
create table ENROL (
  sno number(3),
  cno char(4),
  grade char,
  midterm integer,
  finterm integer
);
  
insert into ENROL values (100, 'C413',	'A',	90,	95);
insert into ENROL values (100, 'E412',	'A',	95,	95);
insert into ENROL values (200, 'C123',	'B',	85,	80);
insert into ENROL values (300, 'C312',	'A',	90,	95);
insert into ENROL values (300, 'C324',	'C',	75,	75);
insert into ENROL values (300, 'C413',	'A',	95,	90);
insert into ENROL values (400, 'C312',	'A',	90,	95);
insert into ENROL values (400, 'C324',	'A',	95,	90);
insert into ENROL values (400, 'C413',	'B',	80,	85);
insert into ENROL values (400, 'E412',	'C',	65,	75);
insert into ENROL values (500, 'C312',	'B',	85,	80);

commit;