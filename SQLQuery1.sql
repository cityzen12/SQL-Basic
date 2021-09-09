--1
SELECT student.姓名,score.课程编号
FROM student,score
WHERE student.学号=score.学号;

--2
SELECT student.姓名,course.课程名称,score.成绩
FROM student,course,score
WHERE student.学号=score.学号 AND score.课程编号=course.课程编号;

--3
SELECT student.姓名,course.课程名称,score.成绩
FROM student,course LEFT OUTER JOIN score ON(score.课程编号=course.课程编号)

--4
SELECT distinct student.姓名,course.课程名称
FROM student,course,score
WHERE score.学号=student.学号 AND course.课程名称='管理学'

--5
SELECT 学号
FROM score
WHERE score.课程编号=04010101
INTERSECT
SELECT 学号
FROM score
WHERE score.课程编号=04010103

--6
SELECT 学号
FROM score
WHERE score.课程编号=04010101
EXCEPT
SELECT 学号
FROM score
WHERE score.课程编号=04010103

--7
SELECT student.姓名,student.入学成绩
FROM student
WHERE student.入学成绩>=(SELECT AVG(student.入学成绩) FROM student)

--8
SELECT DISTINCT student.学号,score.课程编号
FROM student, score
WHERE (student.学号=score.学号 AND score.课程编号=04010101)

SELECT student.学号,党员否
FROM student
WHERE student.党员否=1

--9
SELECT student.姓名
FROM student
WHERE student.性别='女' AND student.入学成绩>
(SELECT MAX(student.入学成绩)
FROM student
WHERE student.性别='男')

--10
SELECT student.姓名
FROM student
WHERE student.性别='男' AND student.入学成绩>
any(SELECT student.入学成绩
FROM student
WHERE student.性别='女')

--11
SELECT course.课程名称,先修课
FROM course
WHERE course.先修课 IS NOT NULL

--12
SELECT score.课程编号
FROM score
WHERE score.学号=2015094002
INTERSECT
SELECT score.课程编号
FROM score
WHERE score.学号=2015094001

--13
SELECT DISTINCT student.姓名
FROM student,score
WHERE score.课程编号 = ANY(
    select score.课程编号
    from score
    where score.学号=2015094001)
EXCEPT
SELECT student.姓名
FROM student
WHERE student.学号=2015094001

--14.
SELECT DISTINCT student.姓名
FROM student,score
WHERE score.学号=student.学号 AND score.课程编号>=ALL(
    SELECT DISTINCT score.课程编号
    FROM score
)


--15
SELECT DISTINCT student.姓名
FROM student,score
WHERE student.学号=score.学号 AND score.课程编号>ANY( 
    SELECT DISTINCT score.课程编号
    FROM student, score
    WHERE score.学号=2015094003)
EXCEPT 
SELECT student.姓名
FROM student
WHERE student.学号=2015094003

--16
SELECT COALESCE(student.性别,'合计') 性别,COUNT(student.性别) 人数
FROM student
GROUP BY student.性别 WITH ROLLUP

--17
SELECT score.课程编号,
COUNT(case when score.成绩>80 then 1 end) as 良好以上,
count(case WHEN score.成绩<=80 then 1 end) as 良好以下,
count(score.课程编号) 合计
from score
GROUP by score.课程编号












/*SELECT
CASE
WHEN score.成绩>80 THEN '良好以上'
WHEN score.成绩<=80 THEN '良好以下'
END AS 分段
FROM score
WHERE score.成绩 IS NOT NULL
SELECT count(score.成绩)
FROM score
GROUP BY
CASE
WHEN score.成绩>80 THEN '良好以上'
WHEN score.成绩<=80 THEN '良好以下'
END*/