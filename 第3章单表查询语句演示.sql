--可通过查询sys.check_constraint、 sys.default_constraints、 sys.key_constraints 
--和 sys.foreign_keys 目录视图来确定约束的用户定义名称或系统提供的名称。

select * from sys.check_constraints
select * from sys.default_constraints
select * from sys.key_constraints
select * from sys.foreign_keys 

exec sys.sp_table_constraints_rowset student













--[例3.16]  查询全体学生的学号与姓名。
    SELECT Sno,Sname
    FROM Student; 

--[例3.17]  查询全体学生的姓名、学号、所在系。
    SELECT Sname,Sno,Sdept
    FROM Student;

--[例3.18]  查询全体学生的详细记录
    SELECT  Sno,Sname,Ssex,Sage,Sdept 
    FROM Student; 
--或
    SELECT  *
    FROM Student; 

--[例3.19]  查全体学生的姓名及其出生年份（只有学生年龄）。
    SELECT Sname, 2014-Sage          /*假设查询时为2014年*/
    FROM Student;

--[例3.20] 查询全体学生的姓名、出生年份和所在的院系，要求用小写字母表示系名。
    SELECT Sname,'Year of Birth: ',2014-Sage,LOWER(Sdept)
    FROM Student;
	
    SELECT Sname as NAME,'Year of Birth:'  as BIRTH,
       2014-Sage  as BIRTHDAY,LOWER(Sdept) as DEPARTMENT
    FROM Student;

--[例3.21]  查询选修了课程的学生学号。
    SELECT Sno   
    FROM SC;
--等价于：
    SELECT ALL  Sno  
    FROM SC;

    SELECT DISTINCT Sno    
    FROM SC; 
	select * from student;
--[例3.22] 查询计算机科学系全体学生的名单。
    SELECT Sname
    FROM     Student
    WHERE  Sdept='CS'; 

--[例3.23] 查询所有年龄在20岁以下的学生姓名及其年龄。
    SELECT Sname,Sage 
    FROM     Student    
    WHERE  Sage <= 20;

--[例3.24] 查询所有通过考试的学生的学号。
    SELECT DISTINCT Sno
    FROM  SC
    WHERE Grade>=91; 
	select * from sc;
--[例3.25] 查询年龄在20~23岁（包括20岁和23岁）之间的学生的姓名、系别和年龄
    SELECT  Sname, Sdept, Sage
    FROM     Student
    WHERE  Sage BETWEEN 20 AND 23; --Sage<=23 and Sage>=20

--[例3.26] 查询年龄不在20~23岁之间的学生姓名、系别和年龄
	SELECT Sname, Sdept, Sage
	FROM     Student
	WHERE  Sage NOT BETWEEN 20 AND 23; 

--[例3.27] 查询计算机科学系（CS）、数学系（MA）和信息系（IS）学生的姓名和性别。
	SELECT Sname, Ssex
	FROM  Student
	WHERE Sdept  IN ('CS','MA','IS' );

--[例3.28] 查询既不是计算机科学系、数学系，也不是信息系的学生的姓名和性别。
	SELECT Sname, Ssex
	FROM Student
	WHERE Sdept NOT IN ('IS','MA','CS' );

--[例3.29]  查询学号为201215121的学生的详细情况。
    SELECT *    
    FROM  Student  
    WHERE  Sno LIKE '201215121';
--等价于: 
    SELECT  * 
    FROM  Student 
	WHERE Sno = '201215121';





--[例3.30]  查询所有刘姓学生的姓名、学号和性别。
    SELECT Sname, Sno, Ssex
    FROM Student
    WHERE  Sname like '刘%';








--[例3.31]  查询姓"欧阳"且全名为三个汉字的学生的姓名。
    SELECT Sname
    FROM   Student
    WHERE  Sname LIKE '李__';
	select * from student;






	select * from student;

--[例3.32]  查询名字中第2个字为"阳"字的学生的姓名和学号。
    SELECT Sname,Sno
    FROM   Student
    WHERE  Sname LIKE '__勇%';






--[例3.33]  查询所有不姓刘的学生姓名、学号和性别。
    SELECT Sname, Sno, Ssex
    FROM     Student
    WHERE  Sname NOT LIKE '刘%';

--[例3.34]  查询DB_Design课程的课程号和学分。
    SELECT Cno, Cname,Ccredit
    FROM   Course
    WHERE  Cname LIKE 'DB*_Design' ESCAPE '*' ;

	select * from course;


--[例3.35]  查询以"DB_"开头，且倒数第3个字符为 i的课程的详细情况。
    SELECT  *
    FROM    Course
    WHERE  Cname LIKE  'DB\_%i_' ESCAPE '\' ;


	--'DB_%i__'


--[例3.36] 查询缺少成绩的学生的学号和相应的课程号。
    SELECT Sno,Cno
    FROM    SC
    WHERE  Grade is NULL;

--[例3.37] 查所有有成绩的学生学号和课程号。
    SELECT Sno,Cno
    FROM   SC
    WHERE  Grade IS NOT NULL;

--[例3.38]  查询计算机系年龄在20岁以下的学生姓名。
    SELECT Sname
    FROM  Student
    WHERE Sdept= 'CS' AND Sage<20;

--[例]  查询年龄在20岁以上或18岁以下并且是计算机系的学生姓名。
    SELECT Sname
    FROM  Student
    WHERE Sage<=18  OR ( Sage>=20 AND Sdept= 'CS');
	--select * from student;
    SELECT Sname
    FROM  Student
	WHERE (Sage<=18  OR  Sage>=20) AND Sdept= 'CS'; 
	select * from student;



--[例3.27]  查询计算机科学系（CS）、数学系（MA）和信息系（IS）学生的姓名和性别。
    SELECT Sname, Ssex
    FROM     Student
    WHERE  Sdept IN ('CS ','MA ','IS')
--可改写为：
    SELECT Sname, Ssex
    FROM     Student
    WHERE  Sdept= ' CS' OR Sdept= ' MA' OR Sdept= 'IS ';

--[例3.39] 查询选修了3号课程的学生的学号及其成绩，查询结果按分数降序排列。
    SELECT Sno, Grade
    FROM    SC
	WHERE  Cno= '3'
    ORDER BY Grade DESC;

--[例3.40]查询全体学生情况，查询结果按所在系的系号升序排列，同一系中的学生按年龄降序排列。
    SELECT  *
    FROM  Student
	ORDER BY Sdept, Sage DESC;  

--[例3.41]  查询学生总人数。
    SELECT COUNT(*) 学生总人数
    FROM  Student; 

--[例3.42]  查询选修了课程的学生人数。
     SELECT COUNT( Sno)
     FROM SC;

--[例3.43]  计算1号课程的学生平均成绩。
    SELECT Cno,AVG(Grade)
	FROM    SC
	WHERE Cno= '2';

--[例3.44]  查询选修1号课程的学生最高分数。
    SELECT MAX(Grade)
    FROM SC
    WHERE Cno='1';

--[例3.45 ] 查询学生201215012选修课程的总学分数。（多表查询）
    SELECT SUM(Ccredit)
    FROM  SC,Course
    WHERE Sno='201215012' AND SC.Cno=Course.Cno; 

--[例]  查询每门课程的最高分数。
    SELECT Cno,count(*),AVG(Grade)
    FROM SC
    GROUP BY  Cno;--//按课程号进行分组，即同一门课程的选课记录分到一个组中并求出最大值

--[例]  查询每一个学生的平均成绩。
    SELECT Sno,AVG(Grade)
    FROM  SC
    GROUP BY Sno;--//按学号进行分组，即同一个学生的选修的课程分到一个组中并求平均值

--[例3.46]  求各个课程号及相应的选课人数。
     SELECT Cno,COUNT(Sno)
     FROM    SC
     GROUP BY Cno; 

	 select count(*)
	 from student
	 group by sdept,ssex
	 select *　from student




--[例] 查询不及格课程超过2门的学生学号
    SELECT Sno
    FROM  SC
    WHERE Grade<60  --查询条件有误
    GROUP BY Sno　having  COUNT(*)>2;

--[例3.47]  查询选修了3门以上课程的学生学号。
    SELECT Sno
    FROM  SC
    GROUP BY Sno
    HAVING  COUNT(*)>=3; 
	
--[例] 查询不及格课程超过2门的学生学号
    SELECT Sno
    FROM  SC
    WHERE Grade<60
    GROUP BY Sno
    HAVING COUNT(*) >2;

--[例] 查询有10人以上不及格的课程号
    SELECT Cno
    FROM  SC
    WHERE Grade<60
    GROUP BY Cno HAVING COUNT(*) >10;

--[例3.48 ]查询平均成绩大于等于90分的学生学号和平均成绩
    SELECT Sno, AVG(Grade)
    FROM  SC
    WHERE AVG(Grade)>=90  --WHERE子句中不能用聚集函数作为条件表达式
    GROUP BY Sno;

    SELECT  Sno, AVG(Grade)
    FROM  SC
    GROUP BY Sno
    HAVING AVG(Grade)>=90;
--[例] 查询有两门以上不及格课程的学生学号及其平均成绩
    SELECT Sno,AVG(Grade)
    FROM  SC
    WHERE Grade<60
    GROUP BY Sno
    HAVING COUNT(*) >2;
--查询结果符合要求吗？
--查询出来的是“该同学若干门不及格课程的平均成绩”而不是“该同学所有课程的平均成绩”。
--[例] 查询有两门以上不及格课程的学生学号及其平均成绩
    SELECT Sno,AVG(Grade)
    FROM  SC
    WHERE Sno in (SELECT Sno
                  FROM SC
                  WHERE Grade<60
                  GROUP BY Sno
                  HAVING COUNT(*) >2)
    GROUP BY Sno;