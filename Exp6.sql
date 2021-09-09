--1
INSERT
INTO course
VALUES(04010106,'数据结构','考试',72,4,NULL);

--2
DELETE 
FROM course
WHERE course.课程编号=04010106;

--3
UPDATE student
SET student.入学成绩=510,student.出生日期='1998-08-28'
WHERE student.姓名='田亮';

--4
UPDATE student
SET student.入学成绩=student.入学成绩+10;

--5
UPDATE course
SET course.学分=
            CASE
                WHEN course.学分=2 THEN course.学分+1
                WHEN course.学分=2.5 THEN course.学分+0.5
                WHEN course.学分=4 THEN course.学分+0.5
                ELSE course.学分+1.5
            END;

--6
UPDATE score
SET score.成绩=NULL
FROM score, student, class
WHERE score.学号=student.学号 
AND student.班级编号=class.班级编号 
AND class.班级名称='国际贸易081';

--7
DELETE
FROM student
WHERE student.姓名='连雪飞';

--8
DELETE
FROM student
WHERE student.姓名='凌晨';

--9
DELETE FROM score
FROM student
WHERE score.学号=student.学号 
AND student.班级编号=201501;

--10
CREATE TABLE avg_age(
    [班级名称][char](15)NOT NULL,
    [平均年龄][smallint]NOT NULL,
);

INSERT INTO avg_age
SELECT class.班级名称,AVG(YEAR(GETDATE())-YEAR(student.出生日期))
FROM class,student
WHERE student.班级编号=class.班级编号
GROUP BY class.班级名称;
