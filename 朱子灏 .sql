select *
from student;

select 课程名称, 考核方式
from course;

select distinct 学号
from score;

select distinct 课程编号
from score;

select 课程编号 , 课程名称
from course
where 学时 between 40 and 60;

select 学号 , 姓名
from student
where 党员否='True';

select 姓名, 性别
from student
where 姓名 like'张%';

select 姓名 姓名, year(getdate())-year(出生日期) 年龄
from student
order by 出生日期 desc;

select top(20)percent 姓名,入学成绩
from student
order by 入学成绩 desc;

select top(3) with ties 姓名, 入学成绩 
from student
order by 入学成绩 desc;

select count(*) 十月出生人数
from student
where DATEPART(m,出生日期)=10

select 课程名称
from course
where 先修课 is NULL;

select 入学成绩
from student

select max(入学成绩) 最高分,min(入学成绩) 最低分
from student

select 课程编号 课程编号,max(成绩)最高分,min(成绩)最低分
from score 
group by(课程编号)

select 性别,avg(入学成绩)平均分
from student
group by(性别)

select 考核方式 课程性质,sum(学分)总学分
from course
group by(考核方式)

select 学号 选修两门及以上学号
from score
group by 学号
having count(*)>=2

select 课程编号
from score
where 学期=201520162
group by 课程编号

select convert(varchar(10),getdate(),120) 日期

select top 3 *
from student
order by NEWID()