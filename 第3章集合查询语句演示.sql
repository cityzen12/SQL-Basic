--第3章集合查询语句演示
--[例3.64]  查询计算机科学系的学生及年龄不大于19岁的学生。
	SELECT *
	FROM Student
	WHERE Sdept= 'CS'
	UNION
	SELECT *
	FROM Student
	WHERE Sage<=19;




--[例 3.65]  查询选修了课程1或者选修了课程2的学生。
	SELECT Sno
	FROM SC
	WHERE Cno='1'
	UNION
	SELECT Sno
	FROM SC
	WHERE Cno='2';


--[例3.66]  查询计算机科学系的学生与年龄不大于19岁的学生的交集。
	SELECT *
	FROM Student
	WHERE Sdept='CS' 
	INTERSECT
	SELECT *
	FROM Student
	WHERE Sage<=19;

	SELECT *
	FROM Student
	WHERE Sdept= 'CS' AND  Sage<=19;




--[例 3.67]查询既选修了课程1又选修了课程2的学生。
	SELECT Sno
	FROM SC
	WHERE Cno=' 1 ' 
	INTERSECT
	SELECT Sno
	FROM SC
	WHERE Cno='2 ';

	SELECT Sno
	FROM    SC
	WHERE Cno='1' AND 
		  Sno IN (SELECT Sno
                  FROM SC
                  WHERE Cno='2');




--[例 3.68]查询计算机科学系的学生与年龄不大于19岁的学生的差集。
	SELECT *
	FROM Student
	WHERE Sdept='CS'
	EXCEPT
	SELECT  *
	FROM Student
	WHERE Sage <=19;

	SELECT *
	FROM Student
	WHERE Sdept= 'CS' AND  Sage>19;


--[例] 查询没选修2号课程的学生学号
	--查询结果有误
	SELECT Sno FROM SC Where Cno <> '2';

	--正确操作：从所有学生选课学生中减掉学过2号课的学生
	SELECT DISTINCT Sno FROM SC
	EXCEPT
	SELECT Sno FROM SC Where Cno = '2';
	--正确操作：对于某个学生来说，不存在其选修2号课的记录
	SELECT DISTINCT Sno 
	FROM SC SC1
	Where not exists (SELECT * 
					  FROM SC
					  Where Cno= '2' 
					        AND
							Sno = SC1.Sno) ;


--[例]
	SELECT Sno
	FROM SC
	WHERE Cno= '1' 
	INTERSECT
	SELECT Sno
	FROM SC