select min(midterm)
from course c, enrol e
where c.cno = e.cno
and cname = '데이터베이스';
