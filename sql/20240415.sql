create table student (
    sno     number(3) primary key,
    sname   nvarchar2(20) not null,
    year    number(1),
    dept    nvarchar2(10),
    unique (dept, sname)
);

insert into student values (100, '나수영', 4, '컴퓨터');
insert into student values (300, '나수영', 3, '컴퓨터');
insert into student values (200, '이찬수', 3, '전기');

select * from student;
drop table student;

-- ORA-00001: 무결성 제약 조건(DB202230456.SYS_C0024808)에 위배됩니다
-- 에서 DB202230456.SYS_C0024808 이 unique 제약 조건의 이름이다.



drop table ENROL;
drop table STUDENT;
drop table COURSE;

create table STUDENT (
  sno number(3) primary key,
  sname nvarchar2(4) constraint sname_always_exists not null,
  year number(1) default 1, 
  dept nvarchar2(5),
  unique (dept, sname),
  constraint year_check check (year >= 1 and year <=4 )
);

 insert into STUDENT values (100, '나수영', 4, '컴퓨터');
 insert into STUDENT values (200, '이찬수', 3, '전기');
 insert into STUDENT values (300, '정기태', 1, '컴퓨터');
 insert into STUDENT values (400, '송병길', 4, '컴퓨터');
 insert into STUDENT values (500, '박종화', 2, '산공');
 
 create table COURSE (
  cno char(4),
  cname nvarchar2(10) not null,
  credit number(1) not null,
  dept nvarchar2(4) not null,
  professor nvarchar2(4),
  primary key(cno)
);

insert into COURSE values ('C123', 'C프로그래밍',  3,	'컴퓨터', '김성국');
insert into COURSE values ('C312', '자료구조',	   3,	'컴퓨터', '황수관');
insert into COURSE values ('C324', '화일구조',	   3,	'컴퓨터', '이규찬');
insert into COURSE values ('C413', '데이터베이스', 3,	'컴퓨터', '이일로');
insert into COURSE values ('E412', '반도체',	   3,	'전자',   '홍봉진');


create table ENROL (
  sno number(3) references student(sno) on delete cascade,
  cno char(4),
  grade char(1) not null,
  midterm integer, -- number(3) 이라 해도 됨.
  finterm integer,
  primary key (sno, cno), -- sno, cno 각각에 primary key 를 쓰면 에러가 남
  foreign key (cno) references course(cno)
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

select * from enrol;
select * from student;

delete student where sno = 100; -- foreign key 로 이미 쓰고 있는 부모 tuple 은 지울 수 없음
-- sql을 연습하려거든 이걸 직접 손으로 다 쳐봐라
 
select * from all_tables where owner='DB202230456';
select * from all_tab_columns where owner='DB202230456';
select * from all_constraints where owner='DB202230456'; -- constraint_type 이 P 임 -> Primary key임

alter table student drop column year;

