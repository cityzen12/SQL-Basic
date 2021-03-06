USE [班级选课管理系统]
GO
/****** Object:  Table [dbo].[class]    Script Date: 2021/4/8 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[班级编号] [char](6) NOT NULL,
	[班级名称] [varchar](20) NOT NULL,
	[班级专业] [varchar](20) NOT NULL,
	[班级人数] [int] NULL,
 CONSTRAINT [pk_class_bjbh] PRIMARY KEY CLUSTERED 
(
	[班级编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 2021/4/8 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[课程编号] [char](8) NOT NULL,
	[课程名称] [varchar](40) NOT NULL,
	[考核方式] [char](4) NOT NULL,
	[学时] [int] NOT NULL,
	[学分] [numeric](2, 1) NOT NULL,
	[先修课] [char](8) NULL,
 CONSTRAINT [pk_course_kcbh] PRIMARY KEY CLUSTERED 
(
	[课程编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[score]    Script Date: 2021/4/8 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[score](
	[学号] [char](10) NOT NULL,
	[课程编号] [char](8) NOT NULL,
	[成绩] [numeric](4, 1) NULL,
	[学期] [char](9) NOT NULL,
 CONSTRAINT [pk_score_xhkcbh] PRIMARY KEY CLUSTERED 
(
	[学号] ASC,
	[课程编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 2021/4/8 15:33:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[学号] [char](10) NOT NULL,
	[姓名] [varchar](8) NOT NULL,
	[性别] [char](2) NOT NULL,
	[入学成绩] [numeric](4, 1) NOT NULL,
	[出生日期] [date] NOT NULL,
	[党员否] [bit] NOT NULL,
	[简历] [text] NULL,
	[照片] [image] NULL,
	[班级编号] [char](6) NOT NULL,
 CONSTRAINT [pk_student_xh] PRIMARY KEY CLUSTERED 
(
	[学号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[class] ([班级编号], [班级名称], [班级专业], [班级人数]) VALUES (N'201501', N'国际贸易081', N'国际贸易', 30)
INSERT [dbo].[class] ([班级编号], [班级名称], [班级专业], [班级人数]) VALUES (N'201502', N'财管管理082', N'财务管理', 35)
INSERT [dbo].[class] ([班级编号], [班级名称], [班级专业], [班级人数]) VALUES (N'201503', N'信息管理083', N'信息管理', 31)
INSERT [dbo].[course] ([课程编号], [课程名称], [考核方式], [学时], [学分], [先修课]) VALUES (N'04010101', N'管理学', N'考试', 64, CAST(4.0 AS Numeric(2, 1)), NULL)
INSERT [dbo].[course] ([课程编号], [课程名称], [考核方式], [学时], [学分], [先修课]) VALUES (N'04010102', N'数据库系统及应用', N'考试', 48, CAST(3.0 AS Numeric(2, 1)), N'04010103')
INSERT [dbo].[course] ([课程编号], [课程名称], [考核方式], [学时], [学分], [先修课]) VALUES (N'04010103', N'计算机文化基础', N'考察', 45, CAST(2.5 AS Numeric(2, 1)), NULL)
INSERT [dbo].[course] ([课程编号], [课程名称], [考核方式], [学时], [学分], [先修课]) VALUES (N'04010104', N'管理信息系统', N'考试', 32, CAST(2.0 AS Numeric(2, 1)), N'04010102')
INSERT [dbo].[course] ([课程编号], [课程名称], [考核方式], [学时], [学分], [先修课]) VALUES (N'04010105', N'工业企业经营管理', N'考察', 48, CAST(3.0 AS Numeric(2, 1)), NULL)
INSERT [dbo].[score] ([学号], [课程编号], [成绩], [学期]) VALUES (N'2015094001', N'04010101', CAST(75.0 AS Numeric(4, 1)), N'201520161')
INSERT [dbo].[score] ([学号], [课程编号], [成绩], [学期]) VALUES (N'2015094001', N'04010102', CAST(84.0 AS Numeric(4, 1)), N'201520162')
INSERT [dbo].[score] ([学号], [课程编号], [成绩], [学期]) VALUES (N'2015094001', N'04010103', CAST(68.0 AS Numeric(4, 1)), N'201520162')
INSERT [dbo].[score] ([学号], [课程编号], [成绩], [学期]) VALUES (N'2015094001', N'04010104', NULL, N'201520162')
INSERT [dbo].[score] ([学号], [课程编号], [成绩], [学期]) VALUES (N'2015094002', N'04010101', CAST(86.0 AS Numeric(4, 1)), N'201520161')
INSERT [dbo].[score] ([学号], [课程编号], [成绩], [学期]) VALUES (N'2015094002', N'04010102', CAST(90.0 AS Numeric(4, 1)), N'201520162')
INSERT [dbo].[score] ([学号], [课程编号], [成绩], [学期]) VALUES (N'2015094002', N'04010103', CAST(67.0 AS Numeric(4, 1)), N'201520162')
INSERT [dbo].[score] ([学号], [课程编号], [成绩], [学期]) VALUES (N'2015094003', N'04010101', CAST(74.0 AS Numeric(4, 1)), N'201520161')
INSERT [dbo].[score] ([学号], [课程编号], [成绩], [学期]) VALUES (N'2015094003', N'04010102', CAST(45.0 AS Numeric(4, 1)), N'201520162')
INSERT [dbo].[score] ([学号], [课程编号], [成绩], [学期]) VALUES (N'2015094004', N'04010101', CAST(72.0 AS Numeric(4, 1)), N'201520161')
INSERT [dbo].[score] ([学号], [课程编号], [成绩], [学期]) VALUES (N'2015094005', N'04010101', CAST(56.0 AS Numeric(4, 1)), N'201520161')
INSERT [dbo].[student] ([学号], [姓名], [性别], [入学成绩], [出生日期], [党员否], [简历], [照片], [班级编号]) VALUES (N'2015094001', N'张楚', N'男', CAST(540.0 AS Numeric(4, 1)), CAST(N'1998-01-15' AS Date), 1, NULL, NULL, N'201501')
INSERT [dbo].[student] ([学号], [姓名], [性别], [入学成绩], [出生日期], [党员否], [简历], [照片], [班级编号]) VALUES (N'2015094002', N'田亮', N'女', CAST(516.0 AS Numeric(4, 1)), CAST(N'1999-10-12' AS Date), 0, NULL, NULL, N'201501')
INSERT [dbo].[student] ([学号], [姓名], [性别], [入学成绩], [出生日期], [党员否], [简历], [照片], [班级编号]) VALUES (N'2015094003', N'方健', N'男', CAST(526.0 AS Numeric(4, 1)), CAST(N'1998-05-21' AS Date), 1, NULL, NULL, N'201501')
INSERT [dbo].[student] ([学号], [姓名], [性别], [入学成绩], [出生日期], [党员否], [简历], [照片], [班级编号]) VALUES (N'2015094004', N'薛小飞  ', N'男', CAST(530.0 AS Numeric(4, 1)), CAST(N'1999-04-28' AS Date), 0, NULL, NULL, N'201501')
INSERT [dbo].[student] ([学号], [姓名], [性别], [入学成绩], [出生日期], [党员否], [简历], [照片], [班级编号]) VALUES (N'2015094005', N'曹百慧', N'女', CAST(545.0 AS Numeric(4, 1)), CAST(N'1998-06-26' AS Date), 1, NULL, NULL, N'201501')
INSERT [dbo].[student] ([学号], [姓名], [性别], [入学成绩], [出生日期], [党员否], [简历], [照片], [班级编号]) VALUES (N'2015094006', N'张婷', N'女', CAST(512.0 AS Numeric(4, 1)), CAST(N'1999-08-16' AS Date), 1, NULL, NULL, N'201502')
INSERT [dbo].[student] ([学号], [姓名], [性别], [入学成绩], [出生日期], [党员否], [简历], [照片], [班级编号]) VALUES (N'2015094007', N'李超伦', N'男', CAST(500.0 AS Numeric(4, 1)), CAST(N'1999-03-15' AS Date), 0, NULL, NULL, N'201502')
INSERT [dbo].[student] ([学号], [姓名], [性别], [入学成绩], [出生日期], [党员否], [简历], [照片], [班级编号]) VALUES (N'2015094008', N'程超楠', N'女', CAST(550.0 AS Numeric(4, 1)), CAST(N'1997-09-28' AS Date), 1, NULL, NULL, N'201502')
INSERT [dbo].[student] ([学号], [姓名], [性别], [入学成绩], [出生日期], [党员否], [简历], [照片], [班级编号]) VALUES (N'2015094009', N'李洋', N'男', CAST(510.0 AS Numeric(4, 1)), CAST(N'1999-12-12' AS Date), 0, NULL, NULL, N'201502')
INSERT [dbo].[student] ([学号], [姓名], [性别], [入学成绩], [出生日期], [党员否], [简历], [照片], [班级编号]) VALUES (N'2015094010', N'连雪飞', N'男', CAST(545.0 AS Numeric(4, 1)), CAST(N'1998-10-10' AS Date), 0, NULL, NULL, N'201502')
ALTER TABLE [dbo].[course] ADD  CONSTRAINT [de_course_khfs]  DEFAULT ('考试') FOR [考核方式]
GO
ALTER TABLE [dbo].[student] ADD  DEFAULT ('男') FOR [性别]
GO
ALTER TABLE [dbo].[score]  WITH CHECK ADD  CONSTRAINT [fk_score_course] FOREIGN KEY([课程编号])
REFERENCES [dbo].[course] ([课程编号])
GO
ALTER TABLE [dbo].[score] CHECK CONSTRAINT [fk_score_course]
GO
ALTER TABLE [dbo].[score]  WITH CHECK ADD  CONSTRAINT [fk_score_student] FOREIGN KEY([学号])
REFERENCES [dbo].[student] ([学号])
GO
ALTER TABLE [dbo].[score] CHECK CONSTRAINT [fk_score_student]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [fk_studet_class] FOREIGN KEY([班级编号])
REFERENCES [dbo].[class] ([班级编号])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [fk_studet_class]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [ck_class_rs] CHECK  (([班级人数]>=(20) AND [班级人数]<=(40)))
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [ck_class_rs]
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD  CONSTRAINT [ck_course_khfs] CHECK  (([考核方式]='考察' OR [考核方式]='考试'))
GO
ALTER TABLE [dbo].[course] CHECK CONSTRAINT [ck_course_khfs]
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD  CONSTRAINT [ck_course_xs] CHECK  (([学时]>=(30) AND [学时]<=(80)))
GO
ALTER TABLE [dbo].[course] CHECK CONSTRAINT [ck_course_xs]
GO
ALTER TABLE [dbo].[score]  WITH CHECK ADD  CONSTRAINT [ck_course_cj] CHECK  (([成绩]>=(0) AND [成绩]<=(100)))
GO
ALTER TABLE [dbo].[score] CHECK CONSTRAINT [ck_course_cj]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [ck_student_rxcj] CHECK  (([入学成绩]>=(350) AND [入学成绩]<=(750)))
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [ck_student_rxcj]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [ck_student_xb] CHECK  (([性别]='女' OR [性别]='男'))
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [ck_student_xb]
GO
