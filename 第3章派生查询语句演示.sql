--第3章派生查询语句演示
--[例3.57] 找出每个学生超过他自己选修课程平均成绩的课程号
    SELECT Sno, Cno
    FROM SC, (SELECT Sno, Avg(Grade) 
              FROM SC
    	      GROUP BY Sno)  AS   Avg_sc(avg_sno,avg_grade)
    WHERE SC.Sno = Avg_sc.avg_sno
          AND 
		  SC.Grade >=Avg_sc.avg_grade


--[例3.60] 查询所有选修了1号课程的学生姓名
    SELECT Sname
    FROM  Student, (SELECT Sno FROM SC WHERE Cno='1') AS SC1
    WHERE  Student.Sno=SC1.Sno;
