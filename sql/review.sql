--init

create table student(
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

-- modify table constraints

alter table student modify year number(1) default 1;
alter table student modify sname constraint sname_always_exists not null;
alter table student modify sno primary key;
alter table enrol modify sno references student(sno);
alter table enrol drop constraint SYS_C0027583; -- foreign key 도 제약조건이라서 시스템 카탈로그에서 이름을 이따구로 찾아야 한다.
alter table enrol modify sno constraint foreign_key references student(sno) on delete cascade; -- 그래서 이름을 지어줬다.
alter table student modify year default 1;
alter table student modify year default 1 constraint year_should_be_between_1_and_4 check(year >= 1 and year <= 4);

-- view system catalog

select * from all_tables where owner='DB202230456';
select * from all_constraints where owner='DB202230456';

-- select practice

select *
from student
where sno=100;

select sname
from student
where year=4;

select * from enrol;

select sno
from enrol
where midterm >= 90 or finterm >= 90;

select sno
from enrol
where finterm > midterm;

select distinct year from student;

select * from student order by year, sno;

select * from course where cname like '%구조%';

select * from student where sname like '나%';

insert into student values (600, '싸이', 4, '실용음악');
select * from student where sname like '싸_';

select * from student where year in (1, 2);
select * from student where year = 1 or year = 2;

select * from student where year between 1 and 3 order by year;

select sno as 학번, sname as 이름 from student;
select sno as 학번, year + 1 as 진급학년 from student;

select sno as 학번,
    case
        when year + 1 >= 5 then '졸업'
        else to_char(year + 1)
    end as 진급학년
from student; -- 5학년은 졸업시키고 싶어서 해봤다.

select max(finterm) from enrol;

select * from enrol;
select min(finterm) from enrol where cno='C413';

select avg(finterm) from enrol;

-- reviewing table
select * from course;
select * from enrol;
select * from student;

select * from enrol order by cno;

-- group by 와 having
select dept as 학과, count(*) as 학생수 from student group by dept;

select dept, count(*) as 과목수 from course group by dept;

select grade, avg(midterm) as A평균 from enrol group by grade having grade = 'A'; -- group by 를 쓸 때 뭘 대상으로 묶을 건지를 정하고 싶을 때 where이 아니라 having 이라고 해라.
-- 일반적인 select의 대상을 조정할 때 where, 집계함수에 조건을 걸고 싶을 때 having을 써라.

select cno, avg(finterm) as 기말평균 from enrol group by cno having count(*) >= 3;
-- count(*) 를 select 바로 뒤에 쓰면 그냥 전체 행의 개수가 나오는데, having 뒤에 썼기 때문에 group by로 묶인 행들의 개수가 되는 거다.

-- advanced select practice

select sname
from student
where sno in (
  select cno
  from enrol
  where cno='c413'
);

select student.sname from student join enrol on student.sno = enrol.sno where cno='C413'; -- 내 생각이 맞을까 해보니 정말 맞았다. 신난다.

select * from student where dept = (
    select dept from student where sno = 100
);

-- Cartition Product
select * from student, enrol;

-- Join
select * from student join enrol on student.sno = enrol.sno;
select * from student s join enrol e on s.sno = e.sno;
select * from student s, enrol e where s.sno = e.sno;
select * from student s join enrol e on e.midterm > 90;

select * from student natural join enrol;

select sname from student natural join enrol where cno='C413';

select avg(midterm) from student natural join enrol where sname = '정기태';

select sname from course natural join enrol natural join student where cname = '데이터베이스';

select * from student natural join enrol;

select * from enrol natural join course;

-- Question

-- 도무지 select * from (student natural join enrol) join course on enrol.cno = course.cno; 와
-- select * from student natural join enrol natural join course; 의 결과가 왜 다른지 모르겠다.

select * from student;
select * from enrol;
select * from course;
select * from student natural join enrol natural join course;
select * from (student natural join enrol) join course on enrol.cno = course.cno;

--

select sname from (student natural join enrol) join course on enrol.cno = course.cno where cname = '데이터베이스';

select min(finterm)
from enrol natural join course
where cname = '데이터베이스';

select * from enrol order by cno;
select * from course;

select cno, avg(finterm)
from student natural join enrol
where dept = '컴퓨터'
group by cno;

select sname as 이름, cname, midterm + finterm as 합계
from (student natural join enrol) join course on enrol.cno = course.cno;

-- outer join 마저 보기

-- View
create view cstudent as select * from student where dept = '컴퓨터';
select * from cstudent;

select * from all_views where owner='DB202230456';

select * from cstudent where year = 4;
-- equals to
select * from (
    select * from student where dept = '컴퓨터'
) where year = 4;

update cstudent set year = 2 where sno = 300;
select * from student;

create view cstudent_with_check
as
select * from student
where dept = '컴퓨터'
with check option;

insert into cstudent_with_check values (600, '홍길동', 1, 'IT');