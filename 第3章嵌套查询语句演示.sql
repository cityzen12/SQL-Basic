--第3章嵌套查询语句演示
--[例 3.55]  查询与“刘晨”在同一个系学习的学生。
	SELECT Sno, Sname, Sdept
	FROM Student
	WHERE Sdept  IN (SELECT Sdept
	                 FROM Student
	                 WHERE Sname= '刘晨');
	SELECT * FROM student;
	SELECT  S1.Sno, S1.Sname,S1.Sdept
	FROM     Student S1,Student S2
	WHERE  S1.Sdept = S2.Sdept  
			AND S2.Sname = '刘晨';




--[例] 查询选修了1号课程的学生的学号、姓名
	SELECT Sno,Sname
	FROM Student
	WHERE Sno IN (SELECT Sno 
				  FROM SC
				  WHERE Cno='1');
	select * FROM sc;




--[例] 查询既选修了1号又选修了2号课程的学生学号
	SELECT Sno
	FROM SC
	WHERE Sno IN (SELECT Sno FROM SC WHERE Cno='2' )
		  AND 
		  Cno='1';




--[例 3.56]查询选修了课程名为“信息系统”的学生学号和姓名
 	SELECT Sno,Sname                 --③ 最后在Student关系中取出Sno和Sname
  	FROM   Student                          
 	WHERE Sno IN (SELECT Sno                   --② 然后在SC关系中找出选修了3号课程的学生学号
                  FROM    SC                         
                  WHERE  Cno IN  (SELECT Cno   --① 首先在Course关系中找出“信息系统”的课程号，为3号
                                  FROM Course           
                                  WHERE Cname= '信息系统' ));
	select * FROM sc;
	select * FROM course;
	SELECT Student.Sno,Sname
	FROM  Student,SC,Course
	WHERE Student.Sno = SC.Sno  
	      AND
		  SC.Cno = Course.Cno 
		  AND
		  Course.Cname='信息系统';




--[例3.39’] 查询没有选修3号课程的学生的学号、成绩。
	SELECT Sno, Grade
	FROM   SC
	WHERE  Cno<> '3' ;
	select * FROM sc;
	SELECT Sno, Grade
	FROM   SC
	WHERE  Sno NOT IN(SELECT Sno
				      FROM   SC
					  WHERE  Cno='3' );




--[例 3.55] 查询与“刘晨”在同一个系学习的学生。使用比较运算符。
     SELECT Sno,Sname,Sdept
     FROM   Student
     WHERE Sdept = (SELECT Sdept
                    FROM  Student
                    WHERE Sname= '刘晨');




--[例3.57]  找出每个学生超过他自己选修课程平均成绩的课程号。
	SELECT Sno, Cno
	FROM   SC  x
	WHERE Grade >=(SELECT AVG(Grade)
			   	   FROM  SC y
				   WHERE y.Sno=x.Sno);
	select * FROM sc;
	select cast(avg(cast(grade as numeric(4,1))) as numeric(4,1)) FROM sc group by sno;




--[例] 找出每个学生超过他所选修那门课程的平均成绩的课程号。
	SELECT Sno, Cno,Grade
	FROM   SC  x
	WHERE Grade >=(SELECT AVG(Grade) 
			 	   FROM  SC y
				   WHERE y.Cno=x.Cno); 
    select Cno,avg(Grade) FROM SC group by Cno;





--[例3.58]  查询非计算机科学系中比计算机科学系任意一个学生年龄小的学生姓名和年龄
	SELECT Sname,Sage
	FROM   Student
	WHERE Sage < ANY (SELECT  Sage
					  FROM    Student
					  WHERE Sdept= 'CS')
		  AND 
		  Sdept <> 'CS'; /*父查询块中的条件 */
	SELECT Sname,Sage
	FROM   Student
	WHERE Sage < SOME (SELECT  Sage  --在SQL Server中，SOME和ANY是等效的
					   FROM    Student
					   WHERE Sdept= 'CS')
		  AND 
		  Sdept <> 'CS'; /*父查询块中的条件 */
--用聚集函数实现[例 3.58] 
	SELECT Sname,Sage
	FROM   Student
	WHERE Sage <(SELECT MAX(Sage)
                 FROM Student
                 WHERE Sdept= 'CS')
		  AND 
		  Sdept <> 'CS';




--[例 3.59]  查询非计算机科学系中比计算机科学系所有学生年龄都小的学生姓名及年龄。
--方法一：用ALL谓词
	SELECT Sname,Sage
	FROM Student
	WHERE Sage < ALL(SELECT Sage
                     FROM Student
                     WHERE Sdept= 'CS')
		  AND 
		  Sdept <> 'CS' ;

--方法二：用聚集函数
    SELECT Sname,Sage
    FROM Student
    WHERE Sage < (SELECT MIN(Sage)
                  FROM Student
                  WHERE Sdept= 'CS')
		  AND 
		  Sdept <>'CS';




--[例 3.60]查询所有选修了1号课程的学生姓名。
     SELECT Sname
     FROM Student
     WHERE EXISTS (SELECT *
				   FROM SC
				   WHERE Sno=Student.Sno 
				         AND 
						 Cno= '1');
     SELECT Sname
     FROM Student
     WHERE Sno IN (SELECT Sno
				   FROM SC
				   WHERE Cno= '1');
	 
	 SELECT Sname
     FROM Student
     WHERE EXISTS (SELECT *
				   FROM SC
				   WHERE Cno= '1');
--与前两个查询结果是否一致？为什么？



--[例 3.61]  查询没有选修1号课程的学生姓名。
	SELECT Sname
	FROM   Student
	WHERE NOT EXISTS(SELECT *
					 FROM SC
					 WHERE Sno= Student.Sno 
					       AND 
						   Cno='1');
	SELECT Sname
	FROM   Student
	WHERE NOT EXISTS(SELECT *
					 FROM SC
					 WHERE Cno='1');
--为什么两个查询语句的结果不相同？



--[例 3.55]查询与“刘晨”在同一个系学习的学生。可以用带EXISTS谓词的子查询替换：
	SELECT Sno,Sname,Sdept
	FROM Student S1
	WHERE EXISTS(SELECT *
				 FROM Student S2
				 WHERE S2.Sdept = S1.Sdept 
				       AND
				       S2.Sname = '刘晨');




--[例 3.62] 查询选修了全部课程的学生姓名。
--是否选修了course中全部课程
	SELECT Sname
	FROM Student
	WHERE NOT EXISTS (SELECT *
					  FROM Course
					  WHERE NOT EXISTS (SELECT *
									    FROM SC
									    WHERE Sno= Student.Sno
										      AND 
											  Cno= Course.Cno));
    select * FROM course;
--是否选修了sc中全部课程
	SELECT Sno,Sname
	FROM Student
	WHERE NOT EXISTS (SELECT *
					  FROM SC x
					  WHERE NOT EXISTS (SELECT *
									    FROM SC
									    WHERE Sno= Student.Sno
										      AND 
											  Cno= x.Cno));
    select * FROM sc;


 --[例 3.63]查询至少选修了学生201215122选修的全部课程的学生号码。用NOT EXISTS谓词表示：     
       SELECT DISTINCT Sno
       FROM SC SCX
       WHERE sno<> '201215122' 
	         AND 
			 NOT EXISTS (SELECT *
                         FROM SC SCY
                         WHERE SCY.Sno = '201215122'  
						       AND
                               NOT EXISTS (SELECT *
                                           FROM SC SCZ
                                           WHERE SCZ.Sno=SCX.Sno 
										         AND
                                                 SCZ.Cno=SCY.Cno));
       select * FROM sc;