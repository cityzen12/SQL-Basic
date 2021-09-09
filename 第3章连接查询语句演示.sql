--第3章连接查询语句演示
--[例 3.49]  查询每个学生及其选修课程的情况
	SELECT  Student.*, Sc.*
	FROM  Student, Sc
	WHERE  Student.Sno = Sc.Sno;

--[例 3.50] 查询每个学生及其选修课程的情况（[例 3.49]）
	SELECT  Student.Sno,Sname,Ssex,Sage,Sdept,Cno,Grade
	FROM  Student,Sc
	WHERE  Student.Sno = Sc.Sno;



--[例 3.51] 查询选修2号课程且成绩在90分以上的所有学生的学号和姓名
	SELECT  Student.Sno,Sname
	FROM  Student,Sc
	WHERE  Student.Sno = Sc.Sno 
	       AND 
		   Sc.Cno='2' 
		   AND 
		   Sc.Grade>90;
	select * FROM sc;


--[例 ] 查询每个学生的选修成绩所对应的等级
create table Grading(Mark char(1) primary key,Lowest numeric(4,1),Highest numeric(4,1));
insert into grading values('A',85,100);
insert into grading values('B',75,84);
insert into grading values('C',65,74);
insert into grading values('D',60,64);
insert into grading values('F',0,59);
	SELECT Sno,Cno,Mark--学号,课程编号,等级
	FROM Sc,Grading
	WHERE Grade BETWEEN Lowest AND Highest
	ORDER BY Sno;
	select * FROM sc;




--[例 3.52] 查询每一门课的间接先修课（即先修课的先修课）
	SELECT  FIRST.Cno, SECOND.Cpno
	FROM  Course  FIRST, Course  SECOND
	WHERE FIRST.Cpno = SECOND.Cno;
	select *　FROM　course;




--[例 ] 查询年龄有差异的任意两位同学的姓名
	SELECT S1.SNAME STUD1,S2.SNAME STUD2
	FROM Student S1,Student S2
	WHERE S1.SAGE >S2.SAGE;
	select * FROM student;




--[例 ] 查询001号课程有成绩差的任意两位同学学号
	SELECT SC1.Sno STU1,SC2.Sno STU2
	FROM Sc SC1,Sc SC2
	WHERE SC1.Grade >SC2.Grade 
		  AND 
		  SC1.Cno='001' 
		  AND 
		  SC2.Cno='001';
	select * FROM sc;



--[例 ] 查询既学过001号课程又学过002号课程的所有学生学号
	SELECT SC1.Sno
	FROM Sc SC1,Sc SC2
	WHERE SC1.Sno=SC2.Sno 
	      AND 
		  SC1.Cno='001'
		  AND
		  SC2.Cno='002';
	select * FROM sc;




--[例 ] 查询001号课程成绩比002号课程成绩高的所有学生的学号                              
	SELECT SC1.Sno
	FROM Sc SC1,Sc SC2
	WHERE SC1.Sno=SC2.Sno 
	      AND 
		  SC1.Cno='001'
	      AND 
		  SC2.Cno='002'  
		  AND 
		  SC1.Grade>SC2.Grade;
	select * FROM sc;




--[例 ] 查询没有学过数据结构课程的所有同学的姓名
	SELECT DISTINCT Sname        --DISTINCT
	FROM Student S,Course C,Sc
	WHERE C.Cname<>'数据结构' 
	--WHERE C.Cname<>'数据库'
		  AND 
		  S.Sno=Sc.Sno
		  AND
		  C.Cno=Sc.Cno;
	select * FROM course;	
	select * FROM sc;
--查询结果正确吗？哪里出了问题？




--[例 3. 53] 改写[例 3.49]查询每个学生及其选修课程的情况
	SELECT Student.Sno,Sname,Ssex,Sage,Sdept,Cno,Grade
	FROM  Student  LEFT OUTER JOIN Sc ON Student.Sno=Sc.Sno; 



--例：
	SELECT　Student.*,Sc.*
	FROM    Student,Sc;
	select * FROM student;
	select * FROM sc;
--或
	SELECT　Student.*,Sc.*
	FROM     Student  CROSS JOIN  Sc;




--[例3.54] 查询每个学生的学号、姓名、选修的课程名及成绩
	SELECT Student.Sno, Sname, Cname, Grade
	FROM   Student, Sc, Course    /*多表连接*/
	WHERE Student.Sno = Sc.Sno 
			AND Sc.Cno = Course.Cno;
