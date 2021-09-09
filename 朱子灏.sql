create database 学生选课管理系统;

create database test;
drop database test;

create table class
(	班级编号 char(6) constraint pk_class_bjbh primary key not null,
	班级名称 varchar(20) not null,
	班级专业 varchar(20) not null,
	班级人数 int constraint ck_class_rs check (班级人数>=20 and 班级人数<=40)
);

create table student
(
	学号 char(10) constraint pk_student_xh primary key not null,
	姓名 varchar(8) not null,
	性别 char(2) constraint ck_student_xb check(性别 in ('男','女')) default '男' not null,
	入学成绩 numeric(4,1) constraint ck_student_rxcj check (入学成绩>=350 and 入学成绩<=750) not null,
	出生日期 date not null,
	党员否 bit not null,
	简历 text,
	照片 image,
	班级编号 char(6) not null,
	constraint fk_studet_class foreign key(班级编号)references class(班级编号)
);

create unique index ix_student_rxcj on student(入学成绩 ASC);

create table course
(
	课程编号 char(8) constraint pk_course_kcbh primary key not null,
	课程名称 varchar(40) not null,
	考核方式 char(4) constraint ck_course_khfs check(考核方式 in ('考试','考察')) constraint de_course_khfs default '考试' not null,
	学时 int constraint ck_course_xs check (学时>=30 and 学时<=80) not null,
	学分 numeric(2,1) not null,
	先修课 char(8)
);

create unique index ix_course_kcmc on course(课程名称 DESC);

create table score
(
	学号 char(10) not null,
	课程编号 char(8) not null,
	成绩 numeric(4,1) constraint ck_course_cj check(成绩>=0 and 成绩<=100),
	学期 char(9) not null,
	constraint pk_score_xhkcbh primary key(学号,课程编号),
	constraint fk_score_course foreign key(课程编号)references course(课程编号),
	constraint fk_score_student foreign key(学号)references student(学号)
);

alter table student add 年龄 numeric(3,0);
alter table student alter column 年龄 int;
alter table student drop column 年龄;

alter table class drop constraint ck_class_rs;
alter table course drop constraint ck_course_xs;

drop index ix_student_rxcj on student;
drop index ix_course_kcmc on course;