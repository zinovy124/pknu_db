create table student (
    sno     number(3),
    sname   nvarchar2(20),
    year    number(1),
    dept    nvarchar2(10)
);

create table enrol (
    sno		number(3),
    cno		char(4),
    grade	char(1)
);

create table course (
    cno			char(4),
    cname		nvarchar2(10),
    credit		number(1),
    dept		nvarchar2(10),
    professor 	nvarchar2(5)
);

insert into student values (100, '나수영', 4, '컴퓨터');
insert into student(sname, year, sno, dept) values ('이찬수', 3, 200, '전기');
insert into student(sname, year, sno) values ('정기태', 1, 300);
insert into student values (400, '송병길', 4, '컴퓨터');
insert into student values (500, '박종화', 2, '산공');

insert into course values ('C123', 'C프로그래밍', 3, '컴퓨터', '김성국');
insert into course values ('C312', '자료구조', 3, '컴퓨터', '황수관');
insert into course values ('C324', '화일구조', 3, '컴퓨터', '이규찬');
insert into course values ('C413', '데이터베이스', 3, '컴퓨터', '이일로');
insert into course values ('E412', '반도체', 3, '전자', '홍봉진');
    
drop table student;

select * from student;
select * from course;